#! /bin/bash
export BUILD_ARCH=riscv64
export DOCKER_PREFIX="127.0.0.1:5000/kubevirt"
export QUAY_REPOSITORY=kubevirt-cdi-bazel-builder
export UNTAGGED_BUILDER_IMAGE=${DOCKER_PREFIX}/${QUAY_REPOSITORY} 
export BUILDER_TAG=riscv64Test01

cd hack/build/docker/riscv64


docker build --platform linux/${BUILD_ARCH} --tag ${UNTAGGED_BUILDER_IMAGE}:${BUILDER_TAG} .
docker images --digests | grep ${UNTAGGED_BUILDER_IMAGE} | grep ${BUILDER_TAG} | awk '{ print $4 }'