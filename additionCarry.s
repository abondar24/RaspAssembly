.global _start

_start:
     mov R2, #0x00000003 @ load R2,R3 with number 0x00000003FFFFFFF
     mov R3, #0xFFFFFFFF
     
     mov R4, #0x00000005 @ load R4,R5 with number 0x000000050000001
     mov R5, #0x00000001

     adds R1, R3, R5  @ lower order word (32 bit) + sets carry flag 
     adc  R0, R2, R4  @ higher order word + carry flag

     mov R7, #1
     svc 0
