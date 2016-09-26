#policzyc ilosc liter w ciagu


.data	
oryginal: .space 1024

.text
li	$v0,8
la	$a0,oryginal
li	$a1,1024
syscall
la	$t0,oryginal
#szukamy litere
loop:

lb	$t2,($t0)
beqz	$t2,exit
bge	$t2, 65, sprawdz # czy jest wieksza niz

addu 	$t0,$t0,1

b loop
#sprawdzamy ograniczenie gorne
sprawdz:

ble	$t2, 122, licznik
addu 	$t0,$t0,1

b loop
#liczymy ilosc liter
licznik:

add 	$t1, $t1, 1	# licznik liter
addu 	$t0,$t0,1	#przesuwamy sie do nastepnego znaku w oryginalnym ciagu

b loop
#wyswietlamy licznik, ktory liczyl ilosc liter w ciagu
exit :

li	$v0, 1
la	$a0, ($t1)
syscall


li	$v0,10
syscall
