#znaki ,oprocz liter, na *


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


#sprawdzmy duze litery


loop :
lb	$t2,($t0)
beqz	$t2,exit
bge	$t2, 65, sprawdz # czy jest wieksza niz
la	$t2, '*'
sb	$t2,($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop

# sprawdzamy mala litera czy nie jest wieksza niz 122


sprawdz:

ble	$t2, 122, zapisz
la	$t2, '*'
sb	$t2, ($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1

b loop
#zapisujemy litere bez zmian
zapisz:


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