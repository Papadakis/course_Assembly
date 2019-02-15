.data 


	String_name0: .asciiz "Please give an integer: "
	String_name1: .asciiz "product zero"
	String_name2: .asciiz "product positive"
	String_name3: .asciiz "product negative"
	String_name4: .asciiz "\n"


.text
.globl main
main:


#emfanish mhnumatos sthn o8onh
add $v0,$zero,4
la $a0,String_name0
syscall

#o xrhsths dinei enan arithmo
addi $v0,$zero,5
syscall
add $s0,$v0,$zero

#emfanish mhnumatos sthn o8onh
add $v0,$zero,4
la $a0,String_name0
syscall

#o xrhsths dinei enan arithmo
addi $v0,$zero,5
syscall
add $s1,$v0,$zero


#sun8hkes(ama estw kai enas arithmos einai mhden tote mpainoume
#	  sto A alliws sunexizoume ama einai o prwtos arnhtikos pame
#	  elegxoume an kai o deuteros einai arnhtikos kai paei sto B alliws 
#	  sunexizei sto D ......



beqz $s0,A
beqz $s1,A

bltz $s0,C
bltz $s1,D


B:

	#emfanish mhnumatos sthn o8onh
	addi $v0,$zero,4
	la $a0,String_name2
	syscall

	#allagh grammhs
	addi $v0,$zero,4
	la $a0,String_name4
	syscall

	j exit

A:

	#emfanish mhnumatos sthn o8onh
	addi $v0,$zero,4
	la $a0,String_name1
	syscall

	#allagh grammhs
	addi $v0,$zero,4
	la $a0,String_name4
	syscall

	j exit

C:

bltz $s1,B

D:

	#emfanish mhnumatos sthn o8onh
	addi $v0,$zero,4
	la $a0,String_name3
	syscall

	#allagh grammhs
	addi $v0,$zero,4
	la $a0,String_name4
	syscall

	j exit

exit:

li $v0,10
syscall


