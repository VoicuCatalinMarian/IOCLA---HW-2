
section .data

section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

    mov edi, 1 ; instantiez edi cu 1

n_w:
    add al, 1 ; adaug 1 la eax
    sub bl, 1 ; scad 1 de la ebx
    cmp al, 8 ; compar eax cu 8 sa vad daca iese de pe tabla
    jge n_e ; daca iese de pe tabla sar la urmatoarea pozitie
    cmp bl, 0 ; compar ebx cu 0 sa vad daca iese de pe tabla
    jl n_e ; daca iese de pe tabla sar la urmatoarea pozitie

    mov edx, eax ; edx ia valoarea lui eax
    imul edx, 7 ; inmultesc edx cu 7
    add edx, eax ; adaug eax la edx
    add edx, ebx ; adaug edx la ebx
    mov dword [ecx + edx], edi ; pun 1 pe pozitia posibila
   
n_e:
    add bl, 2 ; adaug 2 la ebx
    cmp bl, 8 ; compar ebx cu 8 sa vad daca iese de pe tabla
    jge s_e ; daca iese de pe tabla sar la urmatoarea pozitie

    mov edx, eax ; edx ia valoarea lui eax
    imul edx, 7 ; inmultesc edx cu 7
    add edx, eax ; adaug eax la edx
    add edx, ebx ; adaug edx la ebx
    mov dword [ecx + edx], edi ; pun 1 pe pozitia posibila

s_e:
    sub al, 2 ; scad 2 din eax
    cmp al, 0 ; compar eax cu 0 sa vad daca iese de pe tabla
    jl s_w ; daca iese de pe tabla sar la urmatoarea pozitie

    mov edx, eax ; edx ia valoarea lui eax
    imul edx, 7 ; inmultesc edx cu 7
    add edx, eax ; adaug eax la edx
    add edx, ebx ; adaug edx la ebx
    mov dword [ecx + edx], edi ; pun 1 pe pozitia posibila

s_w:
    sub bl, 2 ; scad 2 din ebx
    cmp bl, 0 ; compar ebx cu 0 sa vad daca iese de pe tabla
    jl finish ; daca iese de pe tabla sar la final

    mov edx, eax ; edx ia valoarea lui eax
    imul edx, 7 ; inmultesc edx cu 7
    add edx, eax ; adaug eax la edx
    add edx, ebx ; adaug edx la ebx
    mov dword [ecx + edx], edi ; pun 1 pe pozitia posibila
    
    add bl, 2 ; adaug 2 la ebx
    cmp bl, 8 ; compar ebx cu 8 sa vad daca iese de pe tabla
    jge finish ; daca iese de pe tabla sar la final

    mov edx, eax ; edx ia valoarea lui eax
    imul edx, 7 ; inmultesc edx cu 7
    add edx, eax ; adaug eax la edx
    add edx, ebx ; adaug edx la ebx
    mov dword [ecx + edx], edi ; pun 1 pe pozitia posibila

finish:

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY