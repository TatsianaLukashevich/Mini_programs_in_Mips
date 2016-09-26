# wystepuje ! zamienic miejscami


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
la	$t3,oryginal
#szukamy znak ! 
loop:

lb	$t2,($t0)
beqz	$t2,exit
beq	$t2,'!',zamiana

addu 	$t0,$t0,1

b loop
#zapisujemy wszystko po znaku !
zamiana:


sb	$t2,($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1
lb	$t2,($t0)
beq	$t2, 10, zapisz_poczatek

b zamiana
#zapisujemy poczatek
zapisz_poczatek:
#wstawiamy spacje
la	$t2, ' '
sb	$t2,($t1)
addu 	$t1,$t1,1

zapisz_poczatek1:

lb	$t2, ($t3)
beq	$t2,'!', exit
sb	$t2,($t1)
addu 	$t3,$t3,1
addu 	$t1,$t1,1

b zapisz_poczatek1
#ciag wyjsciowy
exit:

li	$v0,4
la	$a0,roboczy
syscall


li	$v0,10
syscall



