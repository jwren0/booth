## User configuration ##
AS ?= as
ASFLAGS ?=

LD ?= ld
LDFLAGS ?=

BIN := booth.bin


## Developer configuration ##
SRC_FILES := $(shell find src -name "*.s")
OBJ_FILES := ${SRC_FILES:.s=.o}

ASFLAGS := $(ASFLAGS) -g


## User targets ##
.PHONY: build \
		run_bochs run_qemu \
		clean

build: $(BIN)

run_bochs: build
	bochs -q -f ./configs/bochsrc

run_qemu: build
	qemu-system-x86_64 -drive format=raw,file=./$(BIN)

clean:
	@rm -rf $(BIN) $(OBJ_FILES)


## Developer targets ##
$(BIN): $(OBJ_FILES)
	@printf "LD      $@\n"
	@$(LD) $(LDFLAGS) --script ./configs/linker.ld -o $@ $^

src/%.o: src/%.s
	@printf "AS      $@\n"
	@$(AS) $(ASFLAGS) -o $@ $<
