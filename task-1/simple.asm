%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov bh, 0x5A ; mutam in bh, valoarea in hex a lui "Z"

modify:
	mov ah, [esi] ; bl ia primul termen din vectorul esi
	add ah, dl ; lui ah i se adauga step-ul
	cmp ah, bh ; comparam ah cu "Z"
	jg reset ; daca ah este mai mare decat "Z" trecem la linia 39
	
encrypt:
	mov [edi], ah ; adaugam in vectorul edi, litera criptata
	inc edi ; incrementam cu 1 vectorul edi ca sa putem adauga urmatoarea litera
	inc esi ; incrementam cu 1 vectorul esi ca sa putem lua urmatoarea litera
	
	loop modify ; facem loop ca sa trecem prin tot vectorul esi
	
	jmp finish ; sarim la final cand se termina valorile din vector
	
reset:
	sub ah, 26 ; scadem 26 din ah in cazul in care trece de "Z"
	jmp encrypt ; sarim la linia 30 ca sa putem trece la urmatoarea litera
	
finish:


    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
