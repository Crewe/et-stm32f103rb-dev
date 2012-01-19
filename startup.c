// section bounds defined by linker script
extern unsigned char _text_start;
extern unsigned char _text_end;
extern unsigned char _data_start;
extern unsigned char _data_end;
extern unsigned char _bss_start;
extern unsigned char _bss_end;

extern void main(void);
extern void SystemInit(void);

void boot_entry(void)
{
	register unsigned char *src, *dst;

	//set up PLL
	SystemInit();

	// Copy data from flash to ram
	src = &_text_end;
	dst = &_data_start;
	while(dst < &_data_end) *dst++ = *src++;

	// Initialize bss
	dst = &_bss_start;
	while(dst < &_bss_end) *dst++ = 0;

#ifdef USE_CRT
	crt_init();
	__libc_init_array();
	main();
	//__libc_fini_array();
#else
	main();
#endif
	while(1);
}
