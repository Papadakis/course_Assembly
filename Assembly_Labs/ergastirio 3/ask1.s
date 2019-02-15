.data

.align 2

	Wall: .space 20

	String_name0: .asciiz "Dwste enan ari8mo: "
	String_name1: .asciiz "To megalutero stoixeio tou pinaka einai: "
	String_name2: .asciiz "\n"


.text
.globl main
main:

#metrhths gia na voh8hsei sthn epanalhpsh
addi $s1,$zero,5

#metrhths gia na voh8hsei sthn epanalhpsh
addi $s3,$zero,0

#vazoume thn diau8unsh tou pinaka sto s0
la $s0,Wall

CreateArray:


	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name0
	syscall

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name2
	syscall

	#dexete apo ton xrhsth enan arithmo
	addi $v0,$zero,5
	syscall
	add $s2,$zero,$v0

	#sunolo entolwn gia na apo8hkeusoume 
	#ton ka8e arithmo sthn 8esh tou
	sw $s2,Wall($s3)

	addi $s1,$s1,-1
	addi $s3,$s3,4


bgtz $s1,CreateArray


#fortwnei to 1 stoixeio tou pinaka sto s1
#gia na kanoume tis sugkrhseis
addi $s1,$zero,0
lw $s1,Wall($s1)

#arxikopoihsh gia na voh8hsei sthn epanalhpsh
addi $s2,$zero,0

#sun8hkh gia na kanei tis swstes epanalhpseis
#xwris thn xrhsh ki allou kataxwrhth
addi $s0,$zero,0
addi $s0,$zero,16


FindGreater:

#elegxos gia to plh8os twn epanalhpsewn
beq $s2,$s0,exit

	#auxhsh kata 4 tou s2 gia na pame sto epomeno stoixeio
	addi $s2,$s2,4

	#fortwnoume apo to 2 stoixeio kai meta
	#tou pinika gia tis sugkriseis
	lw $s3,Wall($s2)
	
bgt $s1,$s3,FindGreater

	
move $s1,$s3


j FindGreater


exit:


#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name1
syscall

#emfanish akeraiou
addi $v0,$zero,1
add $a0,$s1,$zero
syscall

li $v0,10
syscall

