#
#	Simple Terminal config for aarch64
#

# You can customize these variables in your environment
# Default to standard aarch64 cross-compiler names
CROSS_COMPILE ?= aarch64-linux-gnu-

# compiler and linker
CC = ${CROSS_COMPILE}gcc
SYSROOT = $(shell ${CC} --print-sysroot 2>/dev/null || echo "")

INCS += -DAARCH64
CFLAGS += -mtune=cortex-a53 -mcpu=cortex-a53 