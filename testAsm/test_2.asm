section .text
	global _start	; объявляем начало программы для linkera

_start:
	mov edx, len 	; длина сообщения
	mov ecx, msg 	; сообщение для вывода на экран
	mov ebx, 1 	; файловый дескриптор (stdout)
	mov eax, 4 	; номер системного вызова (sys_write)
	int 0x80   	; вызов ядра

	mov edx, 9 	; длина сообщения
	mov ecx, s2 	; сообщение для написания
	mov ebx, 1 	; файловый дескриптор (stdout)
	mov eax, 4	; номер системного вызова (sys_write)
	int 0x80 	; вызов ядра

	mov eax, 1	; номер системного вызова (sys_exit)
	int 0x80	; вызов ядра

section .data
msg db 'Displaying 9 start', 0xa
len equ $ - msg ; длина нашего сообщения
s2 times 9 db '*'
