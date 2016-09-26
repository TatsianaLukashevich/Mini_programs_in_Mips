# ****>   <*****


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

#zamien liczby na * od poczatku
loop:

lb	$t2,($t0)
beq	$t2,10,exit	#ostani symbol ,to enter
beq	$t2,'>',nawias
la	$t2, '*'
sb	$t2, ($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop
#zapisz liczby po > 
nawias:
beq	$t2,'<',zapisz
sb	$t2, ($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1
lb	$t2,($t0)

b nawias

#zapisz nawias, przesuwamy sie po roboczym ciagu i oryginalnym
zapisz:
sb	$t2, ($t1)
addu 	$t0,$t0,1
addu 	$t1,$t1,1
b loop
#wyjscie
exit:

li	$v0,4
la	$a0,roboczy
syscall


li	$v0,10
syscall





