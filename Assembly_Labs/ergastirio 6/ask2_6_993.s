#ama valoume string mege8ous 5 grammatwn douleuei

.data

	String_name0 : .asciiz "Please give a string: "
	String_name1 : .asciiz "After the swap the string is: "

.align 0

str: .space 16

.text
.globl main 

main:

li $t3,0
li $t4,4

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


#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name1
syscall

#emfanish tou  antestramenou string
li $v0,4
la $a0,str
syscall

exit:

li $v0,10
syscall


reverse:

	#Dhmiourgoume thn stoiba
	addi $sp, $sp, -24
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $t4, 0($sp)
	sw $t3,12($sp)
	sw $t1,16($sp)
	sw $t2,20($sp)
	move $s0, $a0
	move $s1, $a0


beq $t3,$t4,Exit

#Anadromh
#fortwsh grammatwn
lb $t1,str($t3)
lb $t2,str($t4)
#apo8hkeush grammatwn
sb $t1,str($t4)
sb $t2,str($t3)

add $t3,$t3,1
addi $t4,$t4,-1

la $a0,str

jal reverse

Exit:

move $v0, $a0

#Adeiazoume thn stoiba pou dhmiourghsame
lw $ra, 8($sp)
lw $s0, 4($sp)
lw $t4, 0($sp)
lw $t1, 16($sp)
lw $t2, 20($sp)
lw $t3,12($sp)
addi $sp, $sp, 24

jr $ra