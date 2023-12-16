.686
.model flat

extern _malloc		:PROC
extern _free		:PROC
extern _GetEnvironmentVariableW@12	:PROC
extern __write		:PROC

public _rozmiar

.code
_rozmiar PROC
	push ebp
	mov ebp,esp

	push ebx
	push edi
	push esi

	mov esi,[ebp+8]

	xor ecx,ecx
pt1:
	mov ax,[esi][2*ecx]
	inc ecx
	cmp ax,0AH
	jne pt1
	mov [esi][2*ecx-2],word ptr 0

	mov eax,32768*2

	push eax
	call _malloc
	add esp,4
	mov edi,eax

	mov eax,32768*2

	push eax
	push edi
	push esi
	call _GetEnvironmentVariableW@12
	cmp eax,0
	jne koniec

	sub esp,6
	mov eax,esp
	mov [eax+0],byte PTR 'B'
	mov [eax+1],byte PTR 09Dh
	mov [eax+2],byte PTR 0A4h
	mov [eax+3],byte PTR 'D'
	mov [eax+4],byte PTR 0AH
	mov [eax+5],byte PTR 0
	
	
	
	push 5
	push eax
	push 1
	call __write
	add esp,18
	
	mov eax,-1

	
koniec:

	push eax
	push edi
	call _free
	add esp,4
	pop eax

	pop esi
	pop edi
	pop ebx
	pop ebp
	ret
_rozmiar ENDP
END
