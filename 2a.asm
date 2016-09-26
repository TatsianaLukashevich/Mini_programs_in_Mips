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

loop:

lb	$t2,($t0)#pierwszy znak
add	$t0,$t0, 1
lb	$t3,($t0)#drugi znak
add	$t0,$t0, 1

#zapisujemy w odwrotnej kolejnosci
beq	$t3,10,exit# jesli zostaje litera i enter, to przechodzimy do exit i zapisujemy ostatnia litere pomijajac enter
sb	$t3,($t1)
add	$t1,$t1, 1
sb	$t2,($t1)
add	$t1,$t1, 1

b loop
#ciag wyjsciowy
exit:
sb	$t2,($t1)
add	$t1,$t1, 1
li	$v0,4
la	$a0,roboczy
syscall


li	$v0,10
syscall
