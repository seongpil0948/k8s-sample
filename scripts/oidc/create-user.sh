SAMPLE_DIR=./sample
USER_NAME=sejin
ORG_NAME=abacus
CA_ROOT=/etc/kubernetes/pki/ca
DUE_DATE=10000
DUE_SECONDS=$(($DUE_DATE * 24 * 60 * 60))
mkdir $SAMPLE_DIR
cd $SAMPLE_DIR

# 1. 사용자의 인증서를 생성합니다.
# client private key
openssl genpkey -out $USER_NAME.key -algorithm Ed25519
# csr for crt
openssl req -new -key $USER_NAME.key -subj "/CN=$USER_NAME/O=$ORG_NAME" -out $USER_NAME.csr
# client cert 파일 생성
openssl x509 -req -in $USER_NAME.csr -CA $CA_ROOT.crt -CAkey $CA_ROOT.key -CAcreateserial -out $USER_NAME.crt -days $DUE_DATE

# 2. CSR을 생성합니다.
REQ_CSR=$(cat $USER_NAME.csr | base64 | tr -d "\n")
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: $USER_NAME
spec:
  request: $REQ_CSR
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: $DUE_SECONDS  # one day
  usages:
  - client auth
EOF

# 3. CSR을 승인합니다.
kubectl certificate approve $USER_NAME

# 4. 인증서를 사용자의 kubeconfig 파일에 추가합니다.
kubectl config set-credentials john --client-key $USER_NAME.key --client-certificate $USER_NAME.csr --embed-certs=true

# 5. 사용자의 kubeconfig 파일을 사용하여 클러스터에 연결합니다.
kubectl  config set-context $USER_NAME --cluster default --user $USER_NAME



