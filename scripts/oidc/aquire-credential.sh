#!/bin/bash
#
# 스크립트 시작 전 필수 변수 입력!!
CLIENT_SECRET="" ## Keycloak client secret 입력
EKS_ENDPOINT=""  ## EKS Endpoing 입력 (e.g: example.eks.amazonaws.com)
CLIENT_ID=""  ## keycloak client id 입력
KEYCLOAK_URL="" ## keycloak 주소 입력 (e.g: keycloak-example.co.kr)
EKS_AUTHORITY_DATA="" ## EKS API 인증 데이터 입력
REALM=""  ## Keycloak Reaml 입력

# 변수 확인 및 검증
if [ -z "$CLIENT_SECRET" ]; then
    echo "CLIENT_SECRET이 설정되어야 합니다."
    exit 1
fi

if [ -z "$EKS_ENDPOINT" ]; then
    echo "EKS_ENDPOINT이 설정되어야 합니다."
    exit 1
fi

if [ -z "$CLIENT_ID" ]; then
    echo "CLIENT_ID가 설정되어야 합니다."
    exit 1
fi

if [ -z "$KEYCLOAK_URL" ]; then
    echo "KEYCLOAK_URL이 설정되어야 합니다."
    exit 1
fi

if [ -z "$EKS_AUTHORITY_DATA" ]; then
    echo "EKS_AUTHORITY_DATA가 설정되어야 합니다."
    exit 1
fi

if [ -z "$REALM" ]; then
    echo "Keycloak Realm이 설정되어야 합니다."
    exit 1
fi

# 스크립트 계속 진행...
echo "모든 필수 변수가 설정되었습니다."

# 사용자 입력 변수 설정
read -p "Enter Keycloak Username: " USERNAME
read -sp "Enter Keycloak Password: " PASSWORD

# 토큰 생성
TOKEN=$(curl -X POST https://${KEYCLOAK_URL}/realms/${REALM}/protocol/openid-connect/token \
        -d grant_type=password \
        -d client_id=${CLIENT_ID} \
        -d username=${USERNAME} \
        -d password="${PASSWORD}" \
        -d scope=openid \
        -d client_secret=${CLIENT_SECRET} | jq -r '.id_token')

# 환경 변수 검증
if [ -z "$TOKEN" ]; then
    echo "TOKEN이 존재하지 않습니다."
    exit 1
fi

# KUBECONFIG 파일 생성
cat <<EOF > kubeconfig.yaml
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${EKS_AUTHORITY_DATA}
    server: https://${EKS_ENDPOINT}
  name: cluster-name
contexts:
- context:
    cluster: cluster-name
    user: test
  name: test-eks
current-context: test-eks
kind: Config
preferences: {}
users:
- name: test
  user:
    token: $TOKEN
EOF

echo "KUBECONFIG 파일이 생성되었습니다."