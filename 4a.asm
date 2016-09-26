#policzyc sume wszystkich cyfr



.data	
oryginal: .space 1024

.text
li	$v0,8
la	$a0,oryginal
li	$a1,1024
syscall
la	$t0,oryginal
#szukamy liczbe
loop:

lb	$t2,($t0)
beqz	$t2,exit
bge	$t2, 48, sprawdz # czy jest wieksza niz

addu 	$t0,$t0,1

b loop
#ograniczenie gorne
sprawdz:

ble	$t2, 57, licznik
addu 	$t0,$t0,1

b loop
#liczymy sume cyfr
licznik:
add 	$t2, $t2, -48 #odejmujemy , zeby otrzymac liczbe
add 	$t1, $t1, $t2 #dodajemy do t1
addu 	$t0,$t0,1	#przesuwamy sie po oryginalnemu ciagu

b loop
#wypisujemy sume zawarta w t1
exit :

li	$v0, 1
la	$a0, ($t1)
syscall


li	$v0,10
syscall

