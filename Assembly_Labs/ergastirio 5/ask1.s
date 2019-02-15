.data

.align 2

	Block: .space 32

	String_name0 : .asciiz " Please give the decimal number: "
	String_name1 : .asciiz " Please give again a number>= zero && =< 255: "
	String_name2 : .asciiz " The binary number is: "



.text
.globl main

main:

#Arxikopoioume ton kataxwrhth s0=255 gia na elexoume thn eisodo pou mas dinei o xrhsths
li $s0,255

#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name0
syscall

#dexete apo ton xrhsth enan arithmo
addi $v0,$zero,5
syscall
add $s1,$zero,$v0

bltz $s1,Reask
bgt $s1,$s0,Reask

j Metatroph


Reask :


	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name1
	syscall

	#dexete apo ton xrhsth enan arithmo
	addi $v0,$zero,5
	syscall
	add $s1,$zero,$v0

	bltz $s1,Reask
	bgt $s1,$s0,Reask


Metatroph:

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name2
	syscall

	#Arxikopoioume ton kataxwrhth $s0=8 gia na metrame ta bit
	li $s0,28
	#Arxikopoioume ton kataxwrhth s2=2 gia na kanoume thn diaresh
	li $s2,2

	Binary:


		#Briskoume to upoloipo ths diaireshs
		rem $t1,$s1,$s2

		#Apo8hkeuoume ton ari8mo ston pinaka
		sw $t1,Block($s0)

		#Kanoume olis8hsh pros ta dexia kata 1 bit diairontas etsi ton ari8mo kata 2
		srl $s1,$s1,1

		#Gia na elegxoume tis epanalhpseis
		addi $s0,$s0,-4


	bgez $s0,Binary


#Emfanish tou ari8mou
#Arxikopoioume ton kataxwrhth $s2=7 gia thn epanlhpsh
li $s0,0
li $s2,7

Emfanish:

	#Fortwnoume tous ari8mous apo ton pikana
	lw $s3,Block($s0)
	
	#emfanish akeraiou
	addi $v0,$zero,1
	add $a0,$s3,$zero
	syscall

	#Gia na elegxoume tis emfaniseis
	addi $s0,$s0,4
	#Gia na elegxoume tis epanalhpseis
	addi $s2,$s2,-1

bgez $s2,Emfanish


li $v0,10
syscall
