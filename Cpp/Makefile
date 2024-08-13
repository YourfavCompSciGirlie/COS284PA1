# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall

# Automatically find all .cpp files in the current directory
SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)

# Target executable name
TARGET = Main

# Rules
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile .o files from .cpp files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean command
clean:
	rm -f $(OBJ) $(TARGET)

# Run command
run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run
