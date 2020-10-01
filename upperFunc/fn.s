@
@ R1- output str
@ R0 - input str
@ R4 - strlen
@ R5 - cur char

.global upper

upper: 
    MOV R4,R1

loop: 
   LDRB R5,[R0], #1
   CMP R5, #'z' @ is > z
   BGT cont
   
   CMP R5,#'a' @ is < a
   BLT cont
   
   SUB R5, #('a'-'A')

cont:
    STRB R5,[R1],#1
    CMP R5,#0
    
    BNE loop
    SUB R0,R1,R4 @ get str len
    POP {R4-R5} @restore registers
    BX LR       

