CXX=g++
CXXFLAGS=-std=c++17 -Wall -Wextra -Wpedantic -Werror
SOURCES=Shape.cpp Circle.cpp Rectangle.cpp Square.cpp
OBJECTS=$(SOURCES:.cpp=.o)
INCLUDES=includes/*.hpp
INCLUDE_DIRS=-Iincludes
ALL_TARGETS=debug release

.PHONY: all
all: $(ALL_TARGETS)

main.o: main.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

%.o: %.cpp includes/%.hpp
	$(CXX) $(CXXFLAGS) $(INCLUDE_DIRS) -c $< -o $@

debug: main.o $(OBJECTS)
	$(CXX) $^ -g -o $@

release: main.o $(OBJECTS)
	$(CXX) $^ -O3 -o $@

.PHONY: clean
clean:
	rm $(ALL_TARGETS) $(OBJECTS)
