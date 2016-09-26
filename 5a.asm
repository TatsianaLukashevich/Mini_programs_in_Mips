# >****<


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

#zapisujemy wszystkie znaki/litery przed nawiasem 
loop:

lb	$t2,($t0)
beqz	$t2,exit
beq	$t2,'>',nawias
sb	$t2,($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop
#zamieniamy na * wszystko co jest w nawiasie
nawias:
sb	$t2,($t1)
add 	$t0,$t0,1
addu 	$t1,$t1,1

lb	$t2,($t0)

beq	$t2, 10, exit #mamy enter na koncu, zeby nie wchidzila jeszcze raz na w funkcje nawias

beq	$t2,'<',zapisz

la	$t2, '*'



b nawias

#zapisujemy nawias, przesuwamy sie dalej po cigu roboczym i oryginalnym
zapisz:
sb	$t2,($t1)
add 	$t0,$t0,1
addu 	$t1,$t1,1
b loop
#wyswietlamy roboczy ciag
exit:

li	$v0,4
la	$a0,roboczy
syscall


li	$v0,10
syscall



