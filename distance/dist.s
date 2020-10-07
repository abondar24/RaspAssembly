@
@ function to calculate distance between two points
@  
@ Input: RO - points coordinates
@ Output: R0 - distance

.global distance

distance:
   PUSH {R4-R12, LR}
   VPUSH {S16-S31}

   VLDM R0,{S0-S3} @load all 4 coords at once 
   VSUB.F32 S4, S2, S0 @s4 = x2 - x1
   VSUB.F32 S5, S3, S1 @s5 = y2 - y1
   VMUL.F32 S4, S4 @s4 = (x2-x1)^2
   VMUL.F32 S5, S5 @s5 = (y2-y1)^2 
   VADD.F32 S4, S5 @s4 = s4 + s5
   VSQRT.F32 S4, S4 @sqrt(s4)
   VMOV R0, S4 @return S4
   
   VPOP {S16-S31}
   POP  {R4-R12, PC} 
