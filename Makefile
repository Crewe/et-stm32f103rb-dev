#Make file for testing
#Tools
TC = arm-none-eabi
CC = $(TC)-gcc
LD = $(TC)-ld

#Includes
STDPL = ./CMSIS/CM3/DeviceSupport/ST/STM32F10x
CM3   = ./CMSIS/CM3/CoreSupport

#Flags
CFLAGS = -I$(STDPL) -I$(CM3) -mcpu=cortex-m3 -mthumb -nostartfiles -Wl,--gc-sections
LDFLAGS = 

test : main.c 
	$(CC) $(CFLAGS) -o test main.c -T stm32f103rb.ld

clean :
	rm -rf test
