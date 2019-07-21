; HELLO WORLD w petli po jednym znaku
format MZ
stack stk: 256
entry text:main

segment stk use16
	db 256 dup (?)
segment data_16 use16
wart=0
w	db 'Hello World!'
p	db '            ',0dh,0ah,'$'		 ; wartosc dlogosc ustawiana na aktualny offset, czyli po !
dlugosc=1

segment text use16
main:
	mov ax, data_16
	mov ds,ax
	mov si,dlugosc
	mov cx,12
petlaz: mov bx,w
	mov bp,p
	nop
	nop	
	nop
	push cx
       ; add [dlugosc], 1
	mov cx,si
       ; inc [ds:wart]
petla:	mov al,[ds:bx];H
	mov [ds:bp],al
	inc bx
	inc bp
	loop petla
	mov ah,9h
	mov dx,p
	int 21h
	inc si
	nop
	nop
	nop
	pop cx
	loop petlaz1
	jmp ppp
petlaz1: jmp petlaz

ppp:	mov ax,4c00h
	int 21h
	ret
