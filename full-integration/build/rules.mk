# Create all binaries
.PHONY: all
all: $(bin) | $(PREFIX)
	@echo "\e[32m => Stored all files at: \e[1m$(PREFIX)\e[0m"

# Include all dependecy files in the makefile
-include $(obj:.o=.d)

# Create output directory, if necessary
$(PREFIX):
	@mkdir -p $(PREFIX)

# Cleanup of compiled files
.PHONY: clean
clean:
	@echo
	@echo "\e[33mCleaning all object / binary and dependency files...\e[0m"
	@echo
	@rm -rf $(obj) $(bin) $(obj:.o=.d)

# C++ object rules
$(PREFIX)%.o: %.cpp | $(PREFIX)
	@mkdir -p $(dir $@)
	@echo "\e[33m[cpp] Building \e[1m$<\e[0m"
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -MMD -MF $(@:.o=.d) -c -o $@ $<

$(PREFIX)%.o: %.cc | $(PREFIX)
	@mkdir -p $(dir $@)
	@echo "\e[33m[cpp] Building \e[1m$<\e[0m"
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -MMD -MF $(@:.o=.d) -c -o $@ $<

# C object rules
$(PREFIX)%.o: %.c | $(PREFIX)
	@mkdir -p $(dir $@)
	@echo "\e[33m[c] Building \e[1m$<\e[0m"
	$(CXX) $(CFLAGS) $(CPPFLAGS) -MMD -MF $(@:.o=.d) -c -o $@ $<
