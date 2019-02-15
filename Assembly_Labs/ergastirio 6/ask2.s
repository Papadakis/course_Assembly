.data

	String_name0 : .asciiz "Please give a string: "
	String_name1 : .asciiz "After the swap the string is: "
	#String_name2 : .asciiz "Move disk "

.align 0

str: .space 16
#.byte 0x11 0x22 0x33 0x44 0x55 0x66 0x77 0x88 0x99 0xaa 0xbb 0xcc 0xdd 0xee 0xff 0x0


.text
.globl main 

main:

#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name0
syscall

#Dexete apo ton xrhsth to string
li $v0,8
la $a0,str
li $a1,15
syscall

la $a0, str
jal reverse


li $v0,10
syscall

reverse:

	#Dhmiourgoume thn stoiba
	addi $sp, $sp, -12
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	move $s0, $a0
	move $s1, $a0

jal strlen 

#mege8os tou pinaka
addi $t0, $v0, -1
add $s1, $s1, $t0 

#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name1
syscall

L3: 

#ama to s0>s1 tote j Exit
bge $s0, $s1, Exit

#Kanoume to swap twn grammatwn
#fortwsh grammatwn
lb $t0, 0($s0) #swap
lb $t1, 0($s1)
#apo8hkeush grammatwn
sb $t0, 0($s1)
sb $t1, 0($s0)

#Pros8eseis gia thn swsth prospelash tou pinaka
addi $s0, $s0, 1
addi $s1, $s1, -1

j L3

Exit:

move $v0, $a0

#Adeiazoume thn stoiba pou dhmiourghsame
lw $ra, 8($sp)
lw $s0, 4($sp)
lw $s1, 0($sp)
addi $sp, $sp, 12

#emfanish enos grammatos
li $v0,4
la $a0,str
syscall


jr $ra


strlen:

	#dhmiourgoume kiallh stoiba
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	move $s1, $a0
	move $t0, $zero

L1:
 
	#fortwnoume to gramma
	lb $t1, 0($s1)
	#ama to gramma einai iso me 0 goto L2
	beq $t1, $zero, L2

	#alliws pane sto epomeno gramma
	addi $s1, $s1, 1
	addi $t0, $t0, 1

j L1

L2: 

	#apo8hkeuoume to t0 ston v0
	move $v0, $t0
	#adeiazoume thn stoiba
	lw $s1, 0($sp)
	addi $sp, $sp, 4

jr $ra
