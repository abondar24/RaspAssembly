@
@ R7 - loop counter
@ R8 - Addr of cur points
@

.global main 
.equ N,3


main: 
  PUSH {R4-R12, LR}
  LDR R8, =points 
  MOV R7, #N @number of loop iterations

loop:
  MOV R0, R8 @move to parameter 1
  BL distance @call distance func
  VMOV S2, R0 @move back to fpu 
  VCVT.F64.F32 D0, S2 @convert single to double  
  VMOV R2, R3, D0 @return double to r2 and r3
  LDR R0, =printStr 
  BL printf
  
  ADD R8, #(4*4)
  SUBS R7, #1 @decrement loop counter
  BNE loop 
  
  MOV R0, #0 
  POP {R4-R12, PC}

.data
points:  .single 0.0, 0.0, 3.0, 4.0
         .single 1.3, 5.4, 3.1, -1.5
         .single 1.323e10, -1.2e-4, 34.55, 5454.234

printStr: .asciz "Distance = %f\n"   
    
