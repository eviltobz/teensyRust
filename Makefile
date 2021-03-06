BIN=teensy
OUTDIR=target/thumbv7em-none-eabi/release
HEX=$(OUTDIR)/$(BIN).hex
ELF=$(OUTDIR)/$(BIN)

all:: $(ELF)

.PHONY: $(ELF)
$(ELF):
	~/.cargo/bin/xargo build --target=thumbv7em-none-eabi --release

$(HEX): $(ELF)
	arm-none-eabi-objcopy -O ihex $(ELF) $(HEX)

.PHONY: flash
flash: $(HEX)
	teensy-loader-cli -w -mmcu=mk20dx256 $(HEX) -V
