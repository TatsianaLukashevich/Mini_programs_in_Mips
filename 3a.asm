#male litery po znaku "-" zamienic na duze


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

#szukamy znak "-"
loop :
lb	$t2,($t0)
beqz	$t2,exit
beq	$t2,'-',sprawdz
sb	$t2,($t1)# jesli nie ma znaku '-' to prepisz do ciagu wyjsciowego

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop
#sprawdzamy dolne ograniczenie malych liter
sprawdz:
addu 	$t0,$t0,1
lb	$t2,($t0)
bge	$t2, 97, ograniczenie
sb	$t2,($t1) #znaki ,ktore mniejsze przepisz do ciagu wyjsciowego

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop
#sprawdzamy gorne ograniczenie
ograniczenie:

ble	$t2, 122, zamien #zamien mala litere na duza
sb	$t2, ($t1) #znaki, ktore wiejksze przepisz do ciagu wyjsciowego

addu 	$t0,$t0,1	#przesuwamy sie
addu 	$t1,$t1,1

b loop

#zamienaimy male litery na duze

zamien:

add $t2, $t2, -32 	#roznica pomiedzy mala litera i duza
sb	$t2, ($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop
#ciag wyjsciowy
exit :

li	$v0,4
la	$a0,roboczy
syscall


li	$v0,10
syscall
