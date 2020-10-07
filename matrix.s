@
@ Nultiply 3x3 matrixes
@ 
@
@ R1 - row index
@ R2 - column index
@ R4 - row addr
@ R5 - col addr
@ R7 - 64bit acc sum
@ R8 - 64bit acc sum
@ R9 - cell of mat A
@ R10 - cell of mat B
@ R11 - pos in mat C
@ R12 - row in loop
@ R6 - col in loop


.global  main
.equ N,3 @matrix dimension
.equ ELSIZE,2 @ size of element

main:
   PUSH {R4-R12,LR}
   MOV R1, #N
   LDR R4, =A @cur row
   LDR R11, =C @res mat

rowloop:
   LDR R5, =B @ column in B
   MOV R2, #N @ col index 

colloop:
   MOV R7, #0
   MOV R8, #0
   MOV R0, #((N+1)/2) @ dor product loop counter 
   MOV R12, R4 @ row for dot product
   MOV R6, R5 @column for dot product
   
dotloop:
   @ dot product of row A with col of B
   LDR R9, [R12], #(ELSIZE*2) @load A[row,i] and incr
   LDR R10, [R6], #(ELSIZE*2) @load B[i,col]
   SMLAD R7, R9, R10, R7 @ dual mult and accumulate
   SUBS R0, #1 @ decrement loop counter
   BNE dotloop @ if not 0, new iter
   STR R7, [R11], #4  @ C[row,col] = dotprod
   ADD R5, #((N+1)*ELSIZE) @ increment col
   SUBS R2, #1 @dec col loop counter
   BNE colloop @ if not 0 loop
   ADD  R4, #((N+1)*ELSIZE) @ incr to next row
   SUBS R1, #1 @ dec row loop counter
   BNE rowloop @if not 0 loop
   
   @print res matrix C
   MOV R5, #3 @print 3 rows
   LDR R11, =C @addr of res mat

printloop:
   LDR R0, =printstr
   LDR R1, [R11], #4 @first elem in cur row
   LDR R2, [R11], #4 @second elem in cur row
   LDR R3, [R11], #4 @third elem in cur row
   BL printf
   SUBS R5, #1 @dec loop counter
   BNE printloop @ if not 0 loop
   MOV R0, #0 @ return code
   POP {R4-R12,PC} 

.data
A: .short 1,2,3,0
   .short 4,5,6,0
   .short 7,8,9,0

B: .short 9,6,3,0
   .short 8,5,2,0
   .short 7,4,1,0

C: .fill 9,4,0

printstr: .asciz "%3d %3d %3d\n"        
