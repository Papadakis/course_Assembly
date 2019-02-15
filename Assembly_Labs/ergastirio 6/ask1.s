.data

	String_name0 : .asciiz "There is nothing to move\n"
	String_name1 : .asciiz "Enter a (logical) number of disks:\n"
	String_name2 : .asciiz "Move disk "
	String_name3 : .asciiz " from peg "
	String_name4 : .asciiz " to peg "
	String_name5 : .asciiz " \n "

.text
.globl main 


Hanoi:

	#Dhmiourgw mia stoiva me 5 kainourgies 8eseis
	addi $sp,$sp,-20

	#H stoiva
	sw $ra,0($sp)

	#$s0=t2=N
	sw $s0,4($sp)
	#Bazoume to periexomeno tou t2(N) sto s0
	move $s0,$t2

	#$s1=From
	sw $s1,8($sp)
	#Bazoume to periexomeno tou a1(from) sto s1
	move $s1,$a1

	#$s2=to
	sw $s2,12($sp)
	#Bazoume to periexomeno tou a2(to) sto s2
	move $s2,$a2

	#$s3=using
	sw $s3,16($sp)
	#Bazoume to periexomeno tou a3(using) sto s3
	move $s3,$a3


beq $s0,1,continue

j here

continue:

	#________Emfanish__________

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name2
	syscall

	#emfanish akeraiou
	addi $v0,$zero,1
	move $a0,$s0
	syscall

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name3
	syscall

	#emfanish akeraiou
	addi $v0,$zero,1
	move $a0,$a1
	syscall

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name4
	syscall

	#emfanish akeraiou
	addi $v0,$zero,1
	move $a0,$a2
	syscall

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name5
	syscall

	#_____Telos emfanishs______

j L1


here:

#Sun8hkh ama to N<0 na emfanisei to antistoixo mnm
bltz $s0,L1



#Kwdikas Hanoi

#Afairoume apo to N,1
addi $t2,$s0,-1
#Bazoume to "from" ston kataxwrhth $a1
move $a1,$s1
#Bazoume to "using" ston kataxwrhth $a2
move $a2,$s3
#Bazoume to "to" ston kataxwrhth $a3
move $a3,$s2

jal Hanoi


#________Emfanish__________


	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name2
	syscall

	#emfanish akeraiou
	addi $v0,$zero,1
	move $a0,$s0
	syscall

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name3
	syscall

	#emfanish akeraiou
	addi $v0,$zero,1
	move $a0,$a1
	syscall

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name4
	syscall

	#emfanish akeraiou
	addi $v0,$zero,1
	move $a0,$a3
	syscall

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name5
	syscall


#_____Telos emfanishs______


#Afairoume apo to N,1
addi $t2,$s0,-1
#Bazoume to "using" ston kataxwrhth $a1
move $a1,$s3
#Bazoume to "to" ston kataxwrhth $a2
move $a2,$s2
#Bazoume to "from" ston kataxwrhth $a3
move $a3,$s1

jal Hanoi



L1:

	#Adeiazoume thn stoiba
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	addi $sp,$sp,20
	
	jr $ra

main:

	#Mia arxikopoihsh gia na exoume logikous ari8mous
	li $t1,9

Loop:

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name1
	syscall

	#dexete apo ton xrhsth enan arithmo
	addi $v0,$zero,5
	syscall
	add $t2,$zero,$v0

#Sun8hkh pou N<0
bltz $t2,Loop
#Sun8hkh N=<6
bge $t2,$t1,Loop

#Arxikopoihseis!
#from=1
li $a1,1
#to=3
li $a2,3
#using=2
li $a3,2

jal Hanoi

Exit:

li $v0,10
syscall




