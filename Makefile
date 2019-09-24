all: linetool

.PHONY: all linetool

BUILD_TIMESTAMP=`date +%s | base64 | tr -d '\n'`
BUILD_MACHINE=`uname --all | base64 | tr -d '\n'`
GIT_DESCRIBE=`git describe --dirty --always --tags | base64 | tr -d '\n'`
PROGRAM_NAME=`echo linetool | base64 | tr -d '\n'`

LDFLAGS=-ldflags "-X github.com/steinarvk/orclib/lib/versioninfo.BuildTimestampBase64=${BUILD_TIMESTAMP} -X github.com/steinarvk/orclib/lib/versioninfo.BuildMachineBase64=${BUILD_MACHINE} -X github.com/steinarvk/orclib/lib/versioninfo.GitDescribeBase64=${GIT_DESCRIBE} -X github.com/steinarvk/orclib/lib/versioninfo.ProgramNameBase64=${PROGRAM_NAME}"


linetool:
	go build ${LDFLAGS} github.com/steinarvk/linetool
