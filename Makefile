# OpenJazz makefile
include openjazz.mk

# Sane defaults
CXX ?= g++
CXXFLAGS ?= -g -Wall -O2 -marm -march=armv7-a -mtune=cortex-a9 -mfpu=neon-fp16 -mfloat-abi=softfp
CPPFLAGS = -Isrc -DSCALE -Iext/scale2x -Iext/psmplug -Iext/miniz -Iext/argparse

# Network support
CXXFLAGS += -DUSE_SOCKETS
ifeq ($(OS),Windows_NT)
	# Only needed under Windows.
	LIBS += -lws2_32
endif

# SDL
CXXFLAGS += $(shell sdl-config --cflags)
LIBS += $(shell sdl-config --libs)

LIBS += -lm

.PHONY: clean

OpenJazz: $(OBJS)
	@-echo [LD] $@
	@$(CXX) -o OpenJazz $(LDFLAGS) $(OBJS) $(LIBS)

%.o: %.cpp
	@-echo [CXX] $<
	@$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

clean:
	@-echo Cleaning...
	@rm -f OpenJazz $(OBJS)
