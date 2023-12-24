%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here

	imul eax, 5 ; fac inmultirea si scaderea lui eax cu 5 ca sa pot
	sub eax, 5  ; accesa ultimul component al lui proc cand fac
				; [edx + eax + proc.prio]

	mov esi, 0 ; instantiez esi cu 0 pentru for
	mov edi, 0 ; instantiez edi cu 0 pentru for

	jmp for_edi ; sar la for_edi

for_esi:
	add esi, 5   ; edi este contorul meu ca sa pot accesa toate
			     ; componentele lui proc
	mov ebx, eax ; fac ebx = eax si ebx - 5 ca sa compar cu
	sub ebx, 5   ; penultima pozitie din vector
	cmp esi, ebx ; daca esi trece de length - 1 (ebx), sar la final
	jg finish

	mov edi, esi ; daca nu sar la final, edi ia valoarea lui esi

for_edi:
	add edi, 5   ; edi este contorul meu ca sa pot accesa toate
				 ; componentele lui proc
	cmp edi, eax ; daca edi trece de length (eax), sar la for_esi
	jg for_esi   

	mov cl, [edx + esi + proc.prio] ; ecx ia valoarea lui prio[i]
	mov bl, [edx + edi + proc.prio] ; ebx ia valoarea lui prio[i+1]

	cmp cl, bl ; compar ecx cu ebx
	je compare_time ; daca este egal sar la compare_time

	cmp cl, bl ; compar inca o data ecx cu ebx
	jg switch ; daca ecx este mai mare decat ebx, sar la switch

	jmp for_edi ; sar la for_edi daca ecx este mai mic decat ebx

compare_time:
	mov cx, [edx + esi + proc.time] ; ecx ia valoarea lui time[i]
	mov bx, [edx + edi + proc.time] ; ebx ia valoarea lui time[i+1]

	cmp cx, bx ; compar ecx cu ebx
	je compare_pid ; daca este egal sar la compare_pid

	cmp cx, bx ; compar inca o data ecx cu ebx
	jg switch ; daca ecx este mai mare decat ebx, sar la switch

	jmp for_edi ; sar la for_edi daca ecx este mai mic decat ebx

compare_pid:
	mov cx, [edx + esi + proc.pid] ; ecx ia valoarea lui pid[i]
	mov bx, [edx + edi + proc.pid] ; ebx ia valoarea lui pid[i+1]

	cmp cx, bx ; compar ecx cu ebx
	jg switch ; daca ecx este mai mare decat ebx, sar la switch
	
	jmp for_edi ; sar la for_edi daca ecx este mai mic sau egal decat ebx

switch:
	mov bl, [edx + esi + proc.prio] ; ebx ia valoarea lui prio[i]
	mov cl, [edx + edi + proc.prio] ; ecx ia valoarea lui prio[i+1]
	mov [edx + esi + proc.prio], cl ; prio[i] ia valoarea lui ecx (prio[i+1])
	mov [edx + edi + proc.prio], bl ; prio[i+1] ia valoarea lui ebx (prio[i])

	mov bx, [edx + esi + proc.time] ; ebx ia valoarea lui time[i]
	mov cx, [edx + edi + proc.time] ; ecx ia valoarea lui time[i+1]
	mov [edx + esi + proc.time], cx ; time[i] ia valoarea lui ecx (time[i+1])
	mov [edx + edi + proc.time], bx ; time[i+1] ia valoarea lui ebx (time[i])

	mov bx, [edx + esi + proc.pid] ; ebx ia valoarea lui pid[i]
	mov cx, [edx + edi + proc.pid] ; ecx ia valoarea lui pid[i+1]
	mov [edx + esi + proc.pid], cx ; pid[i] ia valoarea lui ecx (pid[i+1])
	mov [edx + edi + proc.pid], bx ; pid[i+1] ia valoarea lui ebx (pid[i])
	
	jmp for_edi ; sar la for_edi dupa ce se face switch

finish:


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY