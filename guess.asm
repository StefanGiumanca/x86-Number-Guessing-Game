.model small
.stack 100h
.data
    banner1 db '  ________                            .__                 $'
    banner2 db ' /  _____/ __ __   ____   ______ _____|__| ____    ____   $'
    banner3 db '/   \  ___|  |  \_/ __ \ /  ___//  ___/  |/    \  / ___\  $'
    banner4 db '\    \_\  \  |  /\  ___/ \___ \ \___ \|  |   |  \/ /_/  | $'
    banner5 db ' \______  /____/  \___  >____  >____  >__|___|  /\___  /  $'
    banner6 db '        \/            \/     \/     \/        \//_____/   $'
    
      linefeed db 13, 10, '$' 
    prompt1 db 'User 1, input a number (max 2 digits): $'   ; Prompt for User 1
    prompt2 db 'User 2, guess the number: $'  ; Prompt for User 2
    msg_high db 'Too big!$'  ; Message if guess is too high
    msg_low db 'Too small!$'  ; Message if guess is too low
    msg_win db 'Game over, User 2 wins!$'  ; Message if User 2 wins
    
    secret_num db ?   ; Store the units digit of the secret number
    secret_tens db ?  ; Store the tens digit of the secret number
    guess_num db ?    ; Store the units digit of the guess
    guess_tens db ?   ; Store the tens digit of the guess
    
    secret_full dw ?  ; Variable for the secret number as an integer
    guess_full dw ?   ; Variable for the guessed number as an integer

.code
begin:
    mov ax, @data   
    mov ds, ax      

    ; Display ASCII Art (Banner)
    ; Print the GUESSING banner
    mov ah, 09h
    lea dx, banner1  
    int 21h          
    lea dx, linefeed 
    int 21h          

    lea dx, banner2  
    int 21h          
    lea dx, linefeed 
    int 21h          

    lea dx, banner3  
    int 21h          
    lea dx, linefeed 
    int 21h          

    lea dx, banner4  
    int 21h          
    lea dx, linefeed 
    int 21h          

    lea dx, banner5  
    int 21h          
    lea dx, linefeed 
    int 21h          

    lea dx, banner6  
    int 21h          
    lea dx, linefeed 
    int 21h          

    ; Prompt User 1 to input a secret number
    mov ah, 09h
    lea dx, prompt1  
    int 21h          

    ; Read User 1's secret number
    mov ah, 01h
    int 21h           
    sub al, '0'       
    mov secret_tens, al  

    mov ah, 01h
    int 21h           
    sub al, '0'       
    mov secret_num, al  

    ; Combine tens and units to form the secret number
    mov al, secret_tens
    mov ah, 10
    mul ah            
    add al, secret_num
    mov secret_full, ax  

    mov ah, 09h  
    lea dx, linefeed  
    int 21h          

guess_loop: ; Loop for User 2 to guess the number
    ; Prompt User 2 to input a guess
    mov ah, 09h
    lea dx, prompt2   
    int 21h           

    ; Read User 2's guess
    mov ah, 01h
    int 21h           
    sub al, '0'       
    mov guess_tens, al  

    mov ah, 01h
    int 21h           
    sub al, '0'       
    mov guess_num, al  

    ; Combine tens and units to form the guess number
    mov al, guess_tens
    mov ah, 10
    mul ah            
    add al, guess_num
    mov guess_full, ax  

    push ax
    mov ah, 09h
    lea dx, linefeed  
    int 21h           
    pop ax

    ; Compare guess to secret number
    mov ax, guess_full
    cmp ax, secret_full  
    je winner          
    ja too_big         
    jb too_small       

too_big: ; If guess is too big
    mov ah, 09h
    lea dx, msg_high    
    int 21h             
    jmp continue        

too_small: ; If guess is too small
    mov ah, 09h
    lea dx, msg_low     
    int 21h             
    jmp continue        

winner: ; If the guess is correct
    mov ah, 09h
    lea dx, msg_win     
    int 21h             
    jmp exit_game      

continue: ; Continue the game
    mov ah, 09h
    lea dx, linefeed   
    int 21h             
    jmp guess_loop    

exit_game: ; Exit the game
    mov ah, 4Ch  
    int 21h  
end begin 