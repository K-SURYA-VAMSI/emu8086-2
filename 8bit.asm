

org 100h   ;start address of the program
 ;define two 8bit numbers to add
num1 db 24h  ;first number (hexadecimal)
num2 db 29h  ;second number (hexadecimal)

start:  mov al, num1;load the first number into register AL
        add al, num2;Add the second number AL
        ;result is now in AL
        ;convert the result to a printable ASCII value for display
        ;save the result for display
        mov bl, al                
        ;convert the upper nibble(4bits) of AL to a character
        mov ah, al
        and ah,0F0h  ;mask the lower nibble
        shr ah,4     ;shift right by 4 to get the upper nibble
        add ah,30h   ;convert to ASCII digit(0-9)
        cmp ah,39h     
        jle print_first_digit
        add ah, 7 ;convert to ASCII letter (A-F) if necessary
        
        print_first_digit:
          mov dl,ah ;move the first digit to DL for printing
          mov ah, 02h ;BIOS interrupt to display character 
          int 21h
          
          ;convert the lower nibble of AL to a character
          mov ah, bl
          and ah, 0Fh ;mask the upper nibble
          add ah, 30h ;convert to ASCII digit(0-9)
          cmp ah, 39h 
          jle print_second_digit
          add ah, 7 ;convert to ASCII letter (A-F) necessary
          
        print_second_digit:
        mov dl, ah ;move the second digit to DL for printing
        mov ah ,02h ;BIOS interrupt to display character
        int 21h
        
        ; end the program
        mov ah, 4CH ;terminate the program
        int 21h
        
ret 