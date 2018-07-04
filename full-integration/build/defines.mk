# Clean initialize the used global variables
bin ?=
obj ?=
# Flags for C++ compiler
CXXFLAGS ?= -std=c++17
# Flags for C++ and C compiler
CPPFLAGS ?= -Wall -Wshadow -Werror
# Flags for C compiler
CFLAGS ?=

ifeq ($(CROSS_COMPILE),1)
    ARCH := armv4
    CC := arm-linux-gnueabi-gcc
    CXX := arm-linux-gnueabi-g++
else
    ARCH := x86_64
endif

ifeq ($(DEBUG),1)
    RELEASE_TYPE := debug
    CXXFLAGS += -g -O0
else
    RELEASE_TYPE := release
    CXXFLAGS += -O3
endif

PREFIX = output/${RELEASE_TYPE}/$(ARCH)/

##
## Helper functions
##
define prepare_sources_to_objects
    $(addprefix $(PREFIX), $(patsubst %.cpp,%.o,$(patsubst %.c,%.o,$(1))))
endef

