@
@
@ R0-R2 - params for Linux func
@ R1 - output str
@ R0 - input str
@ R5 - cur char
@ R7 - linux func num

.global _start

_start:
    LDR R0, =instr
    LDR R1, =outstr
    BL upper
   
    MOV R2,R0 @ str len 
    MOV R0, #1 @stdout
    LDR R1, =outstr
    MOV R7, #4
    SVC 0 

    MOV R0, #0
    MOV R7, #1
    SVC 0  

.data

instr: .asciz "I am a coder.\n"

outstr: .fill 255,1,0
