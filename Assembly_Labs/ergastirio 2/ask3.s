.data

	String_name0: .asciiz "Dwste enan 8etiko arithmo: "
	String_name1: .asciiz "To plhthos einai: "

	


.text
.globl main
main:

#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name0
syscall

#dexete apo ton xrhsth enan arithmo
addi $v0,$zero,5
syscall
add $s0,$zero,$v0

#bohthitikes metavlhtes gia praxeis
addi $s1,$s1,2
addi $s2,$zero,0

div $s0,$s0,$s1
rem $s2,$s0,$s1

beqz $s2,A
	
#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name1
syscall

#emfanish akeraiou
addi $v0,$zero,1
add $a0,$s0,$zero
syscall

j exit

A:

	addi $s0,$s0,-1

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name1
	syscall

	#emfanish akeraiou
	addi $v0,$zero,1
	add $a0,$s0,$zero
	syscall


exit:

li $v0,10
syscall
