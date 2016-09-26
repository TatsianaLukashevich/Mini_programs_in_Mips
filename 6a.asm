#policzyc ilosc  grup cyfr w ciagu


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

la	$t3, '0'

add  	$t0,$t0,1

b loop
#sprawdzmy drugie ograniczenie
sprawdz:

ble	$t2, 57, licznik

la	$t3, '0'	#nie znaleziono nowej grupy cyfr

addu 	$t0,$t0,1

b loop

licznik:

beq $t3, 49, nastepna	#jesli znaleziona grupa cyfr, to przejdz do nastepnego znaku
add $t1, $t1, 1		#licznik grup cyfr
la $t3, '1'		#znaleziona grupa cyfr

add $t0, $t0, 1		#przesuwamy sie dalej po oryginalnemu ciagu zankow

b loop
#nastepny znak w oryginalnym ciagu
nastepna:

add $t0, $t0, 1

b loop


#wyscie
exit :

li	$v0, 1
la	$a0, ($t1)
syscall


li	$v0,10
syscall
