#zmiana kolejno?ci w nawiasie
#
#
#
#
#


.data	
orginal: .space 1024
roboczy: .space	1024

.text

li	$v0,8
la	$a0,orginal
li	$a1,1024
syscall
la	$t0,orginal
la	$t1,roboczy

loop:

lb	$t2,($t0)
beqz	$t2,exit
sb	$t2,($t1)
beq	$t2,'(',nawias
#sb	$t2,($t1)
addu 	$t0,$t0,1
addu 	$t1,$t1,1

b 	loop


nawias: #idziemy do nawiasu zamykajacego



addu	$t0,$t0,1
lb	$t2,($t0)
beqz	$t2,exit
beq	$t2,')',zapamietaj
b	nawias
	
zapamietaj:

la	$t3,($t0)
addu	$t0,$t0,1
b	odTylu

odTylu:

subu	$t3,$t3,1
lb	$t2,($t3)
beq	$t2,'(',loop
sb	$t2,($t1)
addu	$t1,$t1,1
b 	odTylu
exit:

li	$v0,4
la	$a0,roboczy
syscall


li	$v0,10
syscall




