org 100h              ;start address of the program

;define two 16-bit numbers to add
num1 dw 1234h         ;first number <hexadecimal>
num2 dw 5678h         ;second number <hexadecimal>

start:
     mov ax, num1     ;load the first number into the register AX
     add ax, num2     ;add the second number to AX
     
     ;result is now in AX
     ;convert the result to a printable ASCII value for display
     
     ;save the result for display
     mov bx, ax
     
     ;convert the upper byte (16-bit value) to a character
     mov ah, bh       ;move the upper byte to AH
     
     ;convert the upper nibble of AH to a character
     and ah, 0F0h     ;mask the lower nibble
     shr ah, 4        ;shift right by 4 to get the upper nibble
     add ah, 30h      ;convert to ASCII digit (0-9)
     cmp ah, 39h       
     jle print_first_digit
     add ah, 7        ;convert to ASCII letter (A-F) if necessary
     
 print_first_digit:
       mov dl, ah     ;move the first digit to DL for printing
       mov ah, 02h    ;BIOS interrupt to display character
       int 21h
       
      ;convert the lower nibble of BH to a character
      mov ah, bh
      and ah, 0Fh     ;mask the upper nibble
      add ah, 30h     ;convert to ASCII digit (0-9)
      cmp ah, 39h
      jle print_second_digit
      add ah, 7       ;convert to ASCII letter (A-F) if necessary
      
 print_second_digit:
       mov dl, ah     ;move the second digit to DL for printing 
       mov ah, 02h    ;BIOS interrupt to display character
       int 21h
                   
     ;convert the lower byte (16-bit value) to a character
     
     ;convert the upper nibble of AL to a character
     mov ah, bl       ;move the lower byte to AH
     and ah, 0F0h     ;mask the lower nibble
     shr ah, 4        ;shift right by 4 to get the upper nibble
     add ah, 30h      ;convert to ASCII digit (0-9)
     cmp ah, 39h       
     jle print_third_digit
     add ah, 7        ;convert to ASCII letter (A-F) if necessary
     
 print_third_digit:
       mov dl, ah     ;move the first digit to DL for printing
       mov ah, 02h    ;BIOS interrupt to display character
       int 21h
       
      ;convert the lower nibble of AL to a character
      mov ah, bl
      and ah, 0Fh     ;mask the upper nibble
      add ah, 30h     ;convert to ASCII digit (0-9) 
      cmp ah, 39h
      jle print_fourth_digit
      add ah, 7       ;convert to ASCII letter (A-F) if necessary
      
 print_fourth_digit:
       mov dl, ah     ;move the second digit to DL for printing 
       mov ah, 02h    ;BIOS interrupt to display character
       int 21h
                   
       ;End the program
       mov ah, 4Ch     ;terminate the program
       int 21h

ret