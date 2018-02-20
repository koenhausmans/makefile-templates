bin := logging-test
src := main.cpp
obj := $(src:.cpp=.o)

LDFLAGS :=
CXXFLAGS := -std=c++17 -Wall -Wshadow -Werror

ifeq ($(DEBUG),1)
    RELEASE_TYPE := debug
    CXXFLAGS += -g -O0
else
    RELEASE_TYPE := release
    CXXFLAGS += -O3
endif

PREFIX := $(RELEASE_TYPE)

# Create all binaries
.PHONY: all
all: $(PREFIX)/$(bin)

# Create output directory, if necessary
$(PREFIX):
	@mkdir -p $(PREFIX)/

# Linking the binary
$(PREFIX)/$(bin): $(addprefix $(PREFIX)/, $(obj))
	$(CXX) -o $@ $^ $(LDFLAGS)

# Include all dependecy files in the makefile
-include $(addprefix $(PREFIX)/, $(obj:.o=.d))

# Object rules
$(PREFIX)/%.o: %.cpp | $(PREFIX)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -MMD -MF $(@:.o=.d) -c -o $@ $<

# Cleanup of compiled files
.PHONY: clean
clean:
	rm -r $(RELEASE_TYPE)

