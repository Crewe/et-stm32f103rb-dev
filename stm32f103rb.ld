MEMORY
{
    SRAM (RWX)  : ORIGIN = 0x20000000, LENGTH = 20K
    FLASH (RX)  : ORIGIN = 0x08000000, LENGTH = 128K
}

SECTIONS
{
    .text : {
        *(vectors)
        *(.text)
        *(.rodata)
    } >FLASH

    . = 0x20000000;

    .data : {
        *(.data)
    } >SRAM AT> FLASH

    .bss : {
        /* __bss_start__ = .;*/
        *(.bss)
        *(COMMON)
        /* __bss_end__ = .;*/
    } >SRAM AT> FLASH

   /* __end__ = .;*/
}
