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
	$(CC) $(CCFLAGS) $(DEPFLAGS) -c -o $@ $<
	mv -f $(OBJDIR)$*.d $(DEPDIR)$*.d
 
dirs:
	mkdir -p $(OBJDIR) $(BINDIR) $(DEPDIR)
 
.PHONY: clean
clean:
	rm -f $(BINDIR)* $(OBJDIR)*.o $(DEPDIR)*.d
   
include $(DEP_FILES)
