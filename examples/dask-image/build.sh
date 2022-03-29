

export IMAGE_NAME=olg-dask-kernel
export REGION=us-west-1
export ACCOUNT_ID=722321484884
export VERSION=latest

aws --region ${REGION} ecr get-login-password | docker \
    login --username AWS --password-stdin \
    ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${IMAGE_NAME}

docker build . -t ${IMAGE_NAME} -t \
    ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${IMAGE_NAME}:${VERSION}

docker push ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${IMAGE_NAME}:${VERSION}