CC = gcc
CFLAGS = -Wall -Wextra -Werror -Wshadow -MMD -MP -lm
DEPFLAGS = -MMD -MP
DEPDIR = deps/
OBJDIR = obj/
BINDIR = bin/
SRCDIR = src/
SRC_FILES := $(wildcard $(SRCDIR)*.c)
OBJ_FILES := $(patsubst $(SRCDIR)%.c,$(OBJDIR)%.o,$(SRC_FILES))
DEP_FILES := $(wildcard $(DEPDIR)*.d)
EXECUTABLE = $(BINDIR)geometry
 
 
.PHONY: all
all: dirs $(EXECUTABLE)
 
$(EXECUTABLE): $(OBJ_FILES)
	$(CC) $(CFLAGS) -o $@ $^
 
$(OBJDIR)%.o : $(SRCDIR)%.c
	$(CC) $(CCFLAGS) $(DEPFLAGS) -lm -c -o $@ $<
	mv -f $(OBJDIR)$*.d $(DEPDIR)$*.d
 
dirs:
	mkdir -p $(OBJDIR) $(BINDIR) $(DEPDIR)
 
.PHONY: clean
//clean:
	//rm -f $(BINDIR)* $(OBJDIR)*.o $(DEPDIR)*.d
   
include $(DEP_FILES)




$(BIN_DIR)/testing: $(OBJ_TEST_DIR)/main.o $(OBJ_TEST_DIR)/parser.o $(OBJ_TEST_DIR)/geometry.o $(OBJ_DIR)/geometry.o
	gcc $(OBJ_TEST_DIR)/main.o  $(OBJ_TEST_DIR)/geometry.o  $(OBJ_TEST_DIR)/parser.o $(OBJ_DIR)/geometry.o -o $(BIN_DIR)/testing -lm $(FLAG)


$(OBJ_TEST_DIR)/main.o: $(TEST_DIR)/main.c
	gcc -c $(TEST_DIR)/main.c -o  $(OBJ_TEST_DIR)/main.o $(FLAG)


$(OBJ_TEST_DIR)/geometry.o: $(TEST_DIR)/geometry.c
	gcc -c $(TEST_DIR)/geometry.c -o  $(OBJ_TEST_DIR)/geometry.o -lm $(FLAG)


$(OBJ_TEST_DIR)/parser.o: $(TEST_DIR)/parser.c
	gcc -c $(TEST_DIR)/parser.c -o  $(OBJ_TEST_DIR)/parser.o $(FLAG)

clean:
	rm -f $(BINDIR)* $(OBJDIR)*.o $(DEPDIR)*.d
	find -name "*.o" -exec rm -rf {} +
	rm -rf ./bin/geometry


run: all
	$(BIN_DIR)/geometry
	$(BIN_DIR)/testing

install:
	sudo cp ./bin/geometry /usr/bin/geometry

uninstall:
	sudo rm -f /usr/bin/geometry
