# najpierw ustawic liczby z parz pozycji , potem z nieparz


.data	
oryginal: .space 1024
roboczy: .space	1024

.text
li	$v0,8
la	$a0,oryginal
li	$a1,1024
syscall

#zapisujemy znaki o parz 
loop:

lb	$t2,oryginal($t0)
sb	$t2,roboczy($t1)
beq	$t2,0,nieparz
beq	$t2,10,nieparz

add	$t0,$t0, 2
add	$t1,$t1, 1

b loop
#zapisujemy do ciagu wysciowego znaki o nieparz do ciagu wyjsciowego
nieparz:
la	$t0, 1	#ustawiamy licznik

nieparz1:

lb	$t2,oryginal($t0)
sb	$t2,roboczy($t1)
beq	$t2,0,exit

add	$t0,$t0, 2
add	$t1,$t1, 1

b nieparz1
#wypisujemy ciag wyjsciowy
exit:

li	$v0,4
la	$a0,roboczy
syscall


li	$v0,10
syscall

		


