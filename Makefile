.PHONY: all
all: debug release

debug: *.cpp includes/*.hpp
	g++ *.cpp -std=c++17 -Wall -Wextra -Wpedantic -Werror -g -o debug -Iincludes

release: *.cpp includes/*.hpp
	g++ *.cpp -std=c++17 -Wall -Wextra -Wpedantic -Werror -O3 -o release -Iincludes

.PHONY: clean
clean:
	rm debug release
