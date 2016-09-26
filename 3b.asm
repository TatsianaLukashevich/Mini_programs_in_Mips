#wszystkie litery do znaku "-" zamienic na duze


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
#szukamy duza litere
loop :
lb	$t2,($t0)
beqz	$t2,exit
beq	$t2,'-',niezamien 
bge	$t2, 97, sprawdz # czy jest wieksza niz
sb	$t2,($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop
#nie zamieniamy po znaku "-" litere
niezamien:
addu 	$t0,$t0,1	#usuwamy "-"
lb	$t2,($t0)	#ladujemy nastepny symbol
sb	$t2,($t1)	#zapisujemy bez zmian

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop

#sprawdzamy gorne ograniczenie malej litery

sprawdz:

ble	$t2, 122, zamien
sb	$t2, ($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop
#zamieniamy mala litere na duza
zamien:

add $t2, $t2, -32 #roznaca miedzy mala i duza litera
sb	$t2, ($t1)#zapisujemy

addu 	$t0,$t0,1#przesuwamy sie
addu 	$t1,$t1,1

b loop
#wyswietlamy ciag roboczy
exit :

li	$v0,4
la	$a0,roboczy
syscall


li	$v0,10
syscall
