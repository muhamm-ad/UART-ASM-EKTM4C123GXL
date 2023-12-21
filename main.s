SYSCTRL_BASE		EQU     0x0400FE000
RCGCGPIO_OFFSET		EQU		0x608
SYSCTRL_RCGCGPIO	EQU		SYSCTRL_BASE + RCGCGPIO_OFFSET
RCGCUART_OFFSET		EQU		0x618
SYSCTRL_RCGCUART	EQU     SYSCTRL_BASE + RCGCUART_OFFSET

UART0_BASE          EQU     0x4000C000
UART0_DR_OFFSET		EQU		0x000
UART0_DR			EQU     UART0_BASE + UART0_DR_OFFSET
UART0_FR_OFFSET		EQU		0x018
UART0_FR          	EQU     UART0_BASE + UART0_FR_OFFSET
UART0_IBRD_OFFSET	EQU		0x024
UART0_IBRD        	EQU     UART0_BASE + UART0_IBRD_OFFSET
UART0_FBRD_OFFSET	EQU		0x028
UART0_FBRD        	EQU     UART0_BASE + UART0_FBRD_OFFSET
UART0_LCRH_OFFSET	EQU		0x02C
UART0_LCRH        	EQU     UART0_BASE + UART0_LCRH_OFFSET
UART0_CTL_OFFSET	EQU		0x030
UART0_CTL         	EQU     UART0_BASE + UART0_CTL_OFFSET
UART0_CC_OFFSET		EQU		0xFC8
UART0_CC	      	EQU     UART0_BASE + UART0_CC_OFFSET

GPIOA_BASE			EQU		0x40004000
GPIOA_AFSEL_OFFSET	EQU		0x420
GPIOA_AFSEL			EQU		GPIOA_BASE + GPIOA_AFSEL_OFFSET
GPIOA_DEN_OFFSET	EQU		0x51C
GPIOA_DEN			EQU		GPIOA_BASE + GPIOA_DEN_OFFSET
GPIOA_AMSEL_OFFSET	EQU		0x528
GPIOA_AMSEL			EQU		GPIOA_BASE + GPIOA_AMSEL_OFFSET
GPIOA_PCTL_OFFSET	EQU		0x52C
GPIOA_PCTL			EQU		GPIOA_BASE + GPIOA_PCTL_OFFSET

; Define the memory area for the code
; This specifies that the following section is code, read-only, and should be aligned on a 2-byte boundary
AREA |.text|,CODE,READONLY,ALIGN=2
THUMB ; Direct the assembler to interpret following instructions as Thumb (16-bit) instructions
ENTRY ; Entry point for the program
XPORT	__main ; Export the label __main to make it visible outside this file


__main          ; __main function: Entry point of the program
                NOP

loop            ; loop label: Infinite loop to keep the program running            
                B       loop ; Branch to the same location (loop) - creates an infinite loop

