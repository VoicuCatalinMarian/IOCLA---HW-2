%include "../include/io.mac"

    ;;
    ;;   TODO: Declare 'avg' struct to match its C counterpart
    ;;

struc avg
    .quo: resw 1
    .remain: resw 1
endstruc

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0
    
section .text
    global run_procs
    extern printf

run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx],  0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    xor edx, edx
    xor esi, esi
    xor edi, edi

    imul ebx, 5 ; fac inmultirea si scaderea lui ebx cu 5 ca sa pot
	sub ebx, 5  ; accesa ultimul component al lui proc cand fac
				; [edx + ebx + proc.prio]

add_time_result:
    xor edx, edx
    xor esi, esi
    xor edi, edi

    jmp add ; sar la dd

for_esi:
    add esi, 5 ; adaug 5 la esi de fiecare daca cand trec prin for
    cmp esi, ebx ; compar esi cu ebx
    jg division ; daca esi este mai mare dacat ebx sar la division

add:
    mov dl, [ecx + esi + proc.prio] ; mut prio[i] in edx
    cmp edx, 1 ; daca edx este 1 sar la add_1
    je add_1
    cmp edx, 2 ; daca edx este 2 sar la add_2
    je add_2
    cmp edx, 3 ; daca edx este 3 sar la add_3
    je add_3
    cmp edx, 4 ; daca edx este 4 sar la add_4
    je add_4
    jmp add_5 ; sar la add_5

add_1:
    mov dx, [ecx + esi + proc.time] ; muttime[i] in edx
    add [time_result], edx ; adaug edx in time_result[1]
    push eax
    xor eax, eax
    mov eax, dword [prio_result]
    inc eax
    mov dword [prio_result], eax
    xor eax, eax
    pop eax
    add edi, 1 ; adaug 1 la edi ca sa numar componentele din proc
    jmp for_esi ; sar la for_esi ca sa continui for-ul

add_2:
    mov dx, [ecx + esi + proc.time] ; mut time[i] in edx
    add [time_result + 4], edx ; adaug edx in time_result[2]
    push eax
    xor eax, eax
    mov eax, dword [prio_result + 4]
    inc eax
    mov dword [prio_result + 4], eax
    xor eax, eax
    pop eax
    add edi, 1 ; adaug 1 la edi ca sa numar componentele din proc
    jmp for_esi ; sar la for_esi ca sa continui for-ul

add_3:
    mov dx, [ecx + esi + proc.time] ; mut time[i] in edx
    add [time_result + 8], edx ; adaug edx in time_result[3]
    push eax
    xor eax, eax
    mov eax, dword [prio_result + 8]
    inc eax
    mov dword [prio_result + 8], eax
    xor eax, eax
    pop eax
    add edi, 1 ; adaug 1 la edi ca sa numar componentele din proc
    jmp for_esi ; sar la for_esi ca sa continui for-ul

add_4:
    mov dx, [ecx + esi + proc.time] ; mut time[i] in edx
    add [time_result + 12], edx ; adaug edx in time_result[4]
    push eax
    xor eax, eax
    mov eax, dword [prio_result + 12]
    inc eax
    mov dword [prio_result + 12], eax
    xor eax, eax
    pop eax
    add edi, 1 ; adaug 1 la edi ca sa numar componentele din proc
    jmp for_esi ; sar la for_esi ca sa continui for-ul

add_5:
    mov dx, [ecx + esi + proc.time] ; mut time[i] in edx
    add [time_result + 16], edx ; adaug edx in time_result[5]
    push eax
    xor eax, eax
    mov eax, dword [prio_result + 16]
    inc eax
    mov dword [prio_result + 16], eax
    xor eax, eax
    pop eax
    add edi, 1 ; adaug 1 la edi ca sa numar componentele din proc
    jmp for_esi ; sar la for_esi ca sa continui for-ul

division:
    xor edx, edx
    xor ecx, ecx
    xor ebx, ebx
    xor esi, esi

    mov bx, word [prio_result]
    cmp bx, word 0
    je division2

    push eax

    mov dx, word [time_result]
    mov ax, dx
    xor edx, edx
    div bx

    xor ebx, ebx
    mov bx, ax
    xor eax, eax
    pop eax
    mov word [eax], bx
    mov word [eax + 2], dx

division2:
    xor edx, edx
    xor ecx, ecx
    xor ebx, ebx
    xor esi, esi

    mov bx, word [prio_result + 4]
    cmp bx, word 0
    je division3

    push eax

    mov dx, word [time_result + 4]
    mov ax, dx
    xor edx, edx
    div bx

    xor ebx, ebx
    mov bx, ax
    xor eax, eax
    pop eax
    mov word [eax + 4], bx
    mov word [eax + 6], dx

division3:
    xor edx, edx
    xor ecx, ecx
    xor ebx, ebx
    xor esi, esi

    mov bx, word [prio_result + 8]
    cmp bx, word 0
    je division4

    push eax

    mov dx, word [time_result + 8]
    mov ax, dx
    xor edx, edx
    div bx

    xor ebx, ebx
    mov bx, ax
    xor eax, eax
    pop eax
    mov word [eax + 8], bx
    mov word [eax + 10], dx

division4:
    xor edx, edx
    xor ecx, ecx
    xor ebx, ebx
    xor esi, esi

    mov bx, word [prio_result + 12]
    cmp bx, word 0
    je division5

    push eax

    mov dx, word [time_result + 12]
    mov ax, dx
    xor edx, edx
    div bx

    xor ebx, ebx
    mov bx, ax
    xor eax, eax
    pop eax
    mov word [eax + 12], bx
    mov word [eax + 14], dx

division5:
    xor edx, edx
    xor ecx, ecx
    xor ebx, ebx
    xor esi, esi

    mov bx, word [prio_result + 16]
    cmp bx, word 0
    je finish

    push eax

    mov dx, word [time_result + 16]
    mov ax, dx
    xor edx, edx
    div bx

    xor ebx, ebx
    mov bx, ax
    xor eax, eax
    pop eax
    mov word [eax + 16], bx
    mov word [eax + 18], dx

finish:
    
    PRINTF32 `%d\n\x0`, ebx
    ;;mov word [eax + avg.quo], bx
    


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY