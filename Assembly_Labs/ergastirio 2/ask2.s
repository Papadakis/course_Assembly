.data

	String_name1: .asciiz "Please give an integer<0:  "
	String_name2: .asciiz "\n"
	String_name3: .asciiz "sum="


.text
.globl main
main:


Negative:

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name1
	syscall
	
	#dinete apo ton xrhsth enas arithmos(s0)
	addi $v0,$zero,5
	syscall
	add $s0,$v0,$zero	

bgez $s0,Negative


#h sun8hkh einai h metablhth s1
addi $s1,$zero,-1	

#to a8roisma tha ginete me ton kataxwrhth s2
add $s2,$zero,$zero	



loop:

	#upologismos a8roismatos
	add $s2,$s0,$s2
	
	#emfanish akeraiou
	addi $v0,$zero,1
	add $a0,$s0,$zero
	syscall

	#allagh grammhs
	addi $v0,$zero,4
	la $a0,String_name2
	syscall

	#meiwsh kata 1 tou dwthenta arithmou
	addi $s0,$s0,1

ble $s0,$s1,loop


#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name3
syscall

#emfanish akeraiou
addi $v0,$zero,1
add $a0,$s2,$zero
syscall


li $v0,10
syscall

