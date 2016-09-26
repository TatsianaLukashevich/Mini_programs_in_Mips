# zapisuje w ciag wyjsciowy najpierw slowa po !, a potem od poczatku

.data
str: .asciiz "Wpisat stroku\n"
str2: .space 1024# przydzielam pamiec do sringa, ktory wpisuje
str3 : .space 1024# przydzielam pamiec do stringa , ktory wypisuje
 .text
 .globl main
main:
 li $v0, 4  #Wypisuje str
 la $a0, str
syscall

li $v0, 8 # Wywolam funkcje print string
la $a0, str2# zapisuje string podany z klawiatury do pamieci przydzielonej w str2
la $a1, 1024# ile miejsca zajmuje moj string
syscall

loop: # pietla

lb 	$t2,str2($t0)
beqz	$t2,exit
beq	$t2,'!',zamiana

addu 	$t0,$t0,1

b loop
#po znaku ! zapisujemy w ciag wyjsciowy
zamiana:


sb	$t2,str3($t1)

addu 	$t0,$t0,1
addu 	$t1,$t1,1
lb	$t2,str2($t0)
beq	$t2, 10, zapisz_poczatek

b zamiana
#zapisujemy poczatek
zapisz_poczatek:
#wstawiamy spacje do ciagu wyjsciowego
la	$t2, ' '
sb	$t2,str3($t1)
addu 	$t1,$t1,1
la	$t0, 0	#zaczynamy od poczatku ustawiajac licznik ciagu oryginalnego na 0
zapisz_poczatek1:

lb	$t2,str2($t0)
beq	$t2,'!', exit
sb	$t2,str3($t1)
addu 	$t0,$t0,1
addu 	$t1,$t1,1

b zapisz_poczatek1

exit:

li	$v0,4
la	$a0,str3
syscall


li	$v0,10
syscall



