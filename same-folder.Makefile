bin := logging-test
src := main.cpp
obj := $(src:.cpp=.o)

LDFLAGS :=
CXXFLAGS := -std=c++17

# Linking the binary
$(bin): $(obj)
	$(CXX) -o $@ $^ $(LDFLAGS)

# Include all dependecy files in the makefile
-include $(obj:.o=.d)

# Dependency rules
%.d: %.cpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $< -MM -MT $(@:.d=.o) > $@

# Cleanup of compiled files
.PHONY: clean
clean:
	rm -f $(obj) $(obj:.o=.d) $(bin)

