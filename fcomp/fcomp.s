@ comapre to numbers with epsilon error
@ Input: R0 - 3 numbers(x1,x2,e)
@ Output: R0 - 1 equal, 0 not equal


.global fcomp

fcomp:
   PUSH {R4-R12, LR}
   VPUSH {S16-S31}
   
   VLDM R0, {S0-S2}
   
   VSUB.F32 S3, S1, S0 @calc x2-x1
   VABS.F32 S3, S3
   VCMP.F32 S3, S2
   VMRS APSR_nzcv, FPSCR
   BLE notequal
   MOV R0, #1
   B done

notequal:
   MOV R0, #0

done:
   VPOP {S16-S31}
   POP {R4-R12, PC}  
