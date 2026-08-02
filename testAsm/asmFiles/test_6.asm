section .text
	global _start

_start:
	; Напишу имя 'Zara Ali'
	mov edx, 9
	mov ecx, name
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov [name], dword 'Nuha'
	
	mov edx, 8
	mov ecx, name
	mov ebx, 1
	mov eax, 4
	int 80h

	mov eax, 1
	int 80h

section .data
	name db 'Zara Ali'
