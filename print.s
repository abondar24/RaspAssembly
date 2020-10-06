@macros to print data from registers and strings

.macro printReg reg
    
   PUSH {R0-R4, LR} @ save regs
   MOV R2, R\reg @ %d
   MOV R3, R\reg @ %x
   MOV R1, #\reg
   ADD R1, #'0' @ %c
   LDR R0, =prtStr @print format for str
   BL  printf
   POP {R0-R4,LR} @restore registers
.endm

.macro printStr str

  PUSH {R0-R4, LR} 
  LDR R0, =1f
  BL printf 
  POP {R0-R4, LR} 
  B 2f @branch around str

1: .asciz  "\str\n"
   .align 4

2: 
   .endm


.data
prtStr: .asciz "R%c = %16d, 0x%08x\n" 
.align 4
.text   
