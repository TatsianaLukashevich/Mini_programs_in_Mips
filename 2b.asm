# zaminic miejscami pare liczb


.data	
oryginal: .space 1024
roboczy: .space	1024

.text
li	$v0,8
la	$a0,oryginal
li	$a1,1024
syscall
la	$t0,oryginal
la	$t1,roboczy
#idziemy na koniec ciagu oryginalnego
loop:

lb	$t2,($t0)
beq	$t2,10,zapisz
add	$t0,$t0, 1


b loop
#zapisujemy od konca ciagu oryginalnego na poczatek ciagu wyjsciowego
zapisz:
add	$t0,$t0,-1
lb	$t2,($t0)
beq	$t2,0,exit
sb	$t2,($t1)
add	$t1,$t1, 1
b zapisz
#wyswietlamy ciag wyjsciowy
exit:

li	$v0,4
la	$a0,roboczy
syscall


li	$v0,10
syscall

