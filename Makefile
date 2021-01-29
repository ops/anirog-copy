#
# Makefile for anirog-copy
#

PROGRAM := anirog-copy

AS := ca65
LD := ld65

# Additional assembler flags and options.
ASFLAGS := -t vic20

# Additional linker flags and options.
LDFLAGS := -C c64-asm.cfg

OBJECTS := main.o anirog-load.o

$(PROGRAM): $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ -S 820 $(OBJECTS)

clean:
	$(RM) $(OBJECTS)
	$(RM) $(PROGRAM)
	$(RM) *~
