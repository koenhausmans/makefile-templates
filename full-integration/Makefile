binary1_bin := binary1
binary1_src := binary1_main.cpp
binary1_LDFLAGS :=

binary2_bin := binary2
binary2_src := binary2_main.cpp
binary2_LDFLAGS :=

###
### DO NOT CHANGE BELOW
###

# Retrieve the proper compiler and prefix as output folder

include build/defines.mk

# Setup all objects and binaries properly

binary1_obj := $(call prepare_sources_to_objects,$(binary1_src))
binary2_obj := $(call prepare_sources_to_objects,$(binary2_src))

binary1_bin := $(addprefix $(PREFIX), $(binary1_bin))
binary2_bin := $(addprefix $(PREFIX), $(binary2_bin))

# Should contain all objects files and binaries across all the binaries
obj := $(binary1_obj) $(binary2_obj)
bin := $(binary1_bin) $(binary2_bin)

# Include all the automatic rules
include build/rules.mk

# Linking the binary1 binary
$(binary1_bin): $(binary1_obj)
	@echo "\e[32mLinking \e[1m$(notdir $@)\e[0m"
	$(CXX) -o $@ $^ $(binary1_LDFLAGS)
	@echo

.PHONY: binary1
binary1: $(PREFIX)binary1

# Linking the binary2 binary
$(binary2_bin): $(binary2_obj)
	@echo "\e[32mLinking \e[1m$(notdir $@)\e[0m"
	$(CXX) -o $@ $^ $(binary2_LDFLAGS)
	@echo

.PHONY: binary2
binary2: $(PREFIX)binary2

