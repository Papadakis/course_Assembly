.data

.align 2

	Block: .space 20

	String_name0 : .asciiz "Dwste enan ari8mo: "
	String_name1 : .asciiz "Dwste enan ari8mo pou na einai >=-5 kai <=11\n"
	String_name2 : .asciiz "To a8roisma olwn twn arnhtikwn ari8mwn einai : "


.text
.globl main

main:

#arxikopoioume merikes metablhtes
#gia thn sun8hkh
li $s1,-5
#gia thn sun8hkh
li $s2,11
#gia ton pinaka
li $s3,4
#gia to a8roisma
li $s4,0
#gia tous ari8mous ston pinaka
li $t1,0


loop:

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name0
	syscall

	#dexete apo ton xrhsth enan arithmo
	addi $v0,$zero,5
	syscall
	add $s0,$zero,$v0

#sun8hkh s0>=-5
bge $s0,$s1,Sun8hkes

#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name1
syscall

j loop


Sun8hkes:


	#sun8hkh s0<=11
	ble $s0,$s2,CreateArray

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name1
	syscall

	j loop


CreateArray:
	

	#elegxos gia to s0>0
	bgtz $s0,A
	
	#dhmiourgia tou a8roismatos
	add $s4,$s4,$s0	

A:

	#apo8hkeush twn ari8mwn ston pinaka
	sw $s0,Block($t1)

	#auxhsh tou metrhth
	add $s3,$s3,-1

	#auxhsh tou t1 gia na pame sto epomeno stoixeio tou pinaka
	addi $t1,$t1,4

	

bgez $s3,loop


exit:


#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name2
syscall

#emfanish akeraiou
addi $v0,$zero,1
add $a0,$s4,$zero
syscall

li $v0,10
syscall
