#policzyc ilosc cyfr w ciagu


.data	
oryginal: .space 1024

.text
li	$v0,8
la	$a0,oryginal
li	$a1,1024
syscall
la	$t0,oryginal
#znajdujemy cyfre
loop:

lb	$t2,($t0)
beqz	$t2,exit
bge	$t2, 48, sprawdz # czy jest wieksza niz

addu 	$t0,$t0,1

b loop
#sprawdzamy ograniczenie z gory
sprawdz:

ble	$t2, 57, licznik
addu 	$t0,$t0,1

b loop
#jesli znajdujemy cyfre,to zwiekszamy licznik
licznik:

add 	$t1, $t1, 1
addu 	$t0,$t0,1

b loop
#wypisujemy licznik
exit :

li	$v0, 1
la	$a0, ($t1)
syscall


li	$v0,10
syscall
