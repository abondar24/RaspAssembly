.global _start

_start: 
        mov R0, #1 @ 1= stdout
        ldr R1, =hello
        mov R2, #13 @ str len
        mov R7, #4 @ write
        svc 0 

        mov R0, #0 @ 0 return code
        mov R7, #1 @ terminate programm
        svc 0

.data
hello: .ascii "Hello World!\n"

