#male litery na *


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


#sprawdzmy male litery


loop :
lb	$t2,($t0)
beqz	$t2,exit
bge	$t2, 97, sprawdz
sb	$t2,($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop

# sprawdzamy mala litera czy nie jest wieksza niz 122


sprawdz:

ble	$t2, 122, zamien
sb	$t2, ($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop
#zamieniamy mala litere na *
zamien:

la	$t2, '*'
sb	$t2, ($t1) #zapisujemy do ciagu wyjsciowego

addu 	$t0,$t0,1	#przesuwamy sie
addu 	$t1,$t1,1

b loop
#wyswietlamy ciag wyjsciowy
exit :

li	$v0,4
la	$a0,roboczy
syscall


li	$v0,10
syscall





