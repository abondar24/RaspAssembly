@
@
@ R0-R2 - params for Linux func
@ R3 - output str
@ R4 - input str
@ R5 - cur char
@ R7 - linux func num

.global _start

_start:
    LDR R4, =instr
    LDR R3, =outstr

loop: 
    LDRB R5,[R4], #1
    CMP R5, #'z' @ is letter >z
    BGT cont      
    CMP R5, #'a' @ is letter <a
    BLT cont
    SUB R5, #('a'-'A')

cont: 
    STRB R5,[R3], #1  @ store char to outstr
    CMP R5, #0
    BNE loop
    
    MOV R0, #1 @stdout
    LDR R1, =outstr
    SUB R2,R3,R1  @calc strlen
    MOV R7, #4
    SVC 0 

    MOV R0, #0
    MOV R7, #1
    SVC 0  

.data

instr: .asciz "I am a coder.\n"

outstr: .fill 255,1,0
