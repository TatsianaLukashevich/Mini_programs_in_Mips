#policzyc ilosc  grup liter w ciagu


.data	
oryginal: .space 1024

.text
li	$v0,8
la	$a0,oryginal
li	$a1,1024
syscall
la	$t0,oryginal

loop:

lb	$t2,($t0)
beqz	$t2,exit
bge	$t2, 65, sprawdz # czy jest wieksza niz

la	$t3, '0' #nie znaleziono nowej grupy liter

add  	$t0,$t0,1

b loop

sprawdz:

ble	$t2, 122, licznik

la	$t3, '0'	#nie znaleziono nowej grupy liter

addu 	$t0,$t0,1

b loop

#liczymy grupy cyfr
licznik:

beq $t3, 49, nastepna	#jesli znaleziona grupa liter, to przejdz do nastepnego znaku
add $t1, $t1, 1		#licznik grup liter
la $t3, '1'		#znaleziona grupa liter

add $t0, $t0, 1		#przesuwamy sie dalej po oryginalnemu ciagu znakow

b loop

#nastepny znak
nastepna:

add $t0, $t0, 1

b loop


#wyjscie
exit :

li	$v0, 1
la	$a0, ($t1)	#wyswietlamy licznik t1 - grupy liter
syscall


li	$v0,10
syscall
