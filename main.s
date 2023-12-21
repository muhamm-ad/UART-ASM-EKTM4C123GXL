; Constant definitions for base addresses and offsets
SYSCTRL_BASE			EQU		0x0400FE000
RCGCGPIO_OFFSET			EQU		0x608
SYSCTRL_RCGCGPIO		EQU		SYSCTRL_BASE + RCGCGPIO_OFFSET
RCGCUART_OFFSET			EQU		0x618
SYSCTRL_RCGCUART		EQU		SYSCTRL_BASE + RCGCUART_OFFSET

UART0_BASE				EQU		0x4000C000
UART0_DR_OFFSET			EQU		0x000
UART0_DR				EQU		UART0_BASE + UART0_DR_OFFSET
UART0_FR_OFFSET			EQU		0x018
UART0_FR				EQU		UART0_BASE + UART0_FR_OFFSET
UART0_IBRD_OFFSET		EQU		0x024
UART0_IBRD 				EQU		UART0_BASE + UART0_IBRD_OFFSET
UART0_FBRD_OFFSET		EQU		0x028
UART0_FBRD 				EQU		UART0_BASE + UART0_FBRD_OFFSET
UART0_LCRH_OFFSET		EQU		0x02C
UART0_LCRH 				EQU		UART0_BASE + UART0_LCRH_OFFSET
UART0_CTL_OFFSET		EQU		0x030
UART0_CTL				EQU		UART0_BASE + UART0_CTL_OFFSET

GPIOA_BASE				EQU		0x40004000
GPIOA_AFSEL_OFFSET		EQU		0x420
GPIOA_AFSEL				EQU		GPIOA_BASE + GPIOA_AFSEL_OFFSET
GPIOA_DEN_OFFSET		EQU		0x51C
GPIOA_DEN				EQU		GPIOA_BASE + GPIOA_DEN_OFFSET
GPIOA_AMSEL_OFFSET		EQU		0x528
GPIOA_AMSEL				EQU		GPIOA_BASE + GPIOA_AMSEL_OFFSET
GPIOA_PCTL_OFFSET		EQU		0x52C
GPIOA_PCTL				EQU		GPIOA_BASE + GPIOA_PCTL_OFFSET

; Additional constants for repeated values
ENABLE_GPIOA			EQU		0x1
ENABLE_UART0			EQU		0x1
GPIOA_AFSEL_CONF		EQU		0x3
GPIOA_DEN_CONF			EQU		0x3		
GPIOA_AMSEL_CONF		EQU		0x0
GPIOA_PCTL_CONF 		EQU		0x00000011
DISABLE_UART			EQU		0x0
BAUD_115200_IBRD    	EQU		0x8
BAUD_115200_FBRD    	EQU		0x36
BAUD_DATA_8BIT			EQU		0x60
ENABLE_UART         	EQU		0x301
TX_B_FULL				EQU		(1 << 5)
RX_B_FULL				EQU		(1 << 4)


; Define the memory area for the code
; This specifies that the following section is code, read-only, and should be aligned on a 2-byte boundary
			AREA |.text|,CODE,READONLY,ALIGN=2
			THUMB ; Direct the assembler to interpret following instructions as Thumb (16-bit) instructions
			ENTRY ; Entry point for the program
			EXPORT	__main ; Export the label __main to make it visible outside this file

__main		; __main function: Entry point of the program
			; Enable clock to PORTE for PA0/Rx and PA1/Tx
			LDR		R1, =SYSCTRL_RCGCGPIO
			LDR		R0, [R1]
			ORR		R0, R0, #ENABLE_GPIOA
			STR		R0, [R1]
			; Enable clock to UART
			LDR		R1, =SYSCTRL_RCGCUART
			LDR		R0, [R1]
			ORR		R0, R0, #ENABLE_UART0
			STR		R0, [R1]

			BL		set_gpio
			BL		set_uart
while
			BL		rx_uart		; get a character from UART0
			BL		tx_uart
            B		while		; Branch to the same location (while)
								; creates an infinite while

set_gpio	; Subroutine to configure GPIO for UART0 (TX0 and RX0)
			; Configures PA0 and PA1 as digital and enables alternate function
			LDR		R1, =GPIOA_AFSEL
			LDR		R0, [R1]
			ORR		R0, R0, #GPIOA_AFSEL_CONF
			STR		R0, [R1]
			; set PA0 and PA1 as digital
            LDR		R1, =GPIOA_DEN
			LDR		R0, [R1]
			ORR		R0, R0, #GPIOA_DEN_CONF
			STR		R0, [R1]
			; Turn off analg function
			LDR		R1, =GPIOA_AMSEL
			LDR		R0, [R1]
			ORR		R0, R0, #GPIOA_AMSEL_CONF
			STR		R0, [R1]
			; configure PA0 and PA1 for UART
            LDR		R1, =GPIOA_PCTL
			LDR		R0, [R1]
			ORR		R0, R0, #GPIOA_PCTL_CONF
			STR		R0, [R1]
			; Return from set_gpio
			BX			LR

set_uart	; Subroutine for UART0 initialization
			; disable UART0 module, Rx and Tx
			LDR		R1, =UART0_CTL
			LDR		R0, [R1]
			ORR		R0, R0, #DISABLE_UART
			STR		R0, [R1]
			; for 115200 baud rate
            LDR		R1, =UART0_IBRD
			LDR		R0, [R1]
			ORR		R0, R0, #BAUD_115200_IBRD
			STR		R0, [R1]
            LDR		R1, =UART0_FBRD
			LDR		R0, [R1]
			ORR		R0, R0, #BAUD_115200_FBRD
			STR		R0, [R1]
			; data lenght 8-bit, not parity bit, no FIFO
			LDR		R1, =UART0_LCRH
				LDR		R0, [R1]
			ORR		R0, R0, #BAUD_DATA_8BIT
			STR		R0, [R1]
			; enable UART0 module, Rx and Tx
			LDR		R1, =UART0_CTL
			MOV		R0, #ENABLE_UART
            STR		R0, [R1]
			; Return from set_uart
            BX		LR

tx_uart
            LDR		R1, =UART0_FR			; Load UART0 Flag Register address
			LDR		R0, [R1]				; Load UART0 Flag Register value
            ANDS	R0, R0, #TX_B_FULL		; Check if Tx buffer is not full
            BNE		tx_uart					; If Tx buffer is full, wait
			LDR		R1, =UART0_DR
            STRB	R2, [R1]				; Write the data back to UART0 Data Register
            BX		LR						; Return from the function

rx_uart
			LDR		R1, =UART0_FR			; Load UART0 Flag Register address
		LDR		R0, [R1]				; Load UART0 Flag Register value
            ANDS	R0, R0, #RX_B_FULL		; Check if Rx buffer is not full
            BNE		rx_uart					; If Rx buffer is full, wait
			LDR		R1, =UART0_DR
            LDRB	R2, [R1]				; Read the received data
			BX		LR						; Return from the function

			ALIGN
			END
