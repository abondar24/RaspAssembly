@ R7 - loop counter
@ R8 - cur set of points

.global main
.equ N, 100

main:
   PUSH {R4-R12, LR}
   
   MOV R7, #N @number of loop iterations
   
   LDR R0, =cent @load cents ,running sum and real sum to FPU
   VLDM R0, {S0-S2}

loop:
   @add cent to running sum
   VADD.F32 S1, S0
   SUBS R7, #1 @decrement counter
   BNE loop @loop if more points
   
   VCMP.F32 S1, S2 @compare running sum to real sum
   VMRS APSR_nzcv, FPSCR
   
   @print if numbers equality
   BEQ equal
   LDR R0,  =notequalstr
   BL printf
   B next

equal:  
   LDR R0, =equalstr
   BL printf

next:
   @load pointer to running sum, real sum and epsilon
   LDR R0, =runsum
   VLDM R0, {S0-S2}
   BL fcomp 
   CMP R0, #1
   BEQ equal2
   LDR R0, =notequalstr
   BL printf
   B done

equal2:
   LDR R0, =equalstr
   BL printf

done:
   MOV R0, #0
   POP {R4-R12, PC}

.data
cent: .single 0.01
runsum: .single 0.0
sum: .single 1.00
epsilon: .single 0.00001
equalstr: .asciz "equal\n" 
notequalstr: .asciz "not equal\n"
    
