MEMORY
{
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 256K
	RAM  (rwx) : ORIGIN = 0x1FFF8000, LENGTH = 64K
}

SECTIONS
{
	.text : {
		. = 0;
		KEEP(*(.vectors))
		. = 400;
		KEEP(*(.flashconfig))
		. = ALIGN(4);
		*(.text*)
	} > FLASH = 0xFF

	_stack_top = ORIGIN(RAM) + LENGTH(RAM);

	/DISCARD/ : {
		*(.ARM.*)
	}
}

