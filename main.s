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
