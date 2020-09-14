.global _start

_start:
        mvn R0, #2
        add R0, #1
        
        mov R7, #1
        svc 0
