#afou kanw thn antimeta8esh den apo8hkeuw ta stoixeia ston hdh uparxon pinaka
#giati den gnwriza ma prepei(osous rwthsa den htan sigouroi kai h ekfwnhsh den htan xeka8arh)

.data

.align 2

	Block: .space 40
	
	String_name0 : .asciiz "Dwste enan ari8mo: "
	String_name1 : .asciiz "O kainourgia seira twn stoixeiwn tou pinaka einai: "
	String_name2 : .asciiz "|"


.text
.globl main

main:

#arxikopoiw ton kataxwrhth s0 gia na me boh8hsei stis epanalhpseis
addi $s0,$zero,10

#arxikopoiw to s3 wste na mporw na kinoume mesa ston pinaka
addi $s3,$zero,0


CreateArray:

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name0
	syscall

	#dexete apo ton xrhsth enan arithmo
	addi $v0,$zero,5
	syscall
	add $s1,$zero,$v0
 
	#sunolo entolwn gia na apo8hkeusoume 
	#ton ka8e arithmo sthn 8esh tou
	sw $s1,Block($s3)

	addi $s0,$s0,-1
	addi $s3,$s3,4


bgtz $s0,CreateArray


#arxikopoioume thn s0 kai s1
addi $s0,$zero,0
addi $s1,$zero,4
addi $s4,$zero,5

#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name1
syscall


Antimetathesh:

	#fortwsh twn ari8mwn
	lw $s2,Block($s1) #2,4,6,8,10 8eseis
	lw $s3,Block($s0) #1,3,5,7,9 8eseis


	#emfanish akeraiou
	addi $v0,$zero,1
	add $a0,$s2,$zero
	syscall


	#emfanish akeraiou
	addi $v0,$zero,1
	add $a0,$s3,$zero
	syscall

	#emfanish mhnumatos
	addi $v0,$zero,4
	la $a0,String_name2
	syscall

	add $s0,$s0,8
	add $s1,$s1,8
	addi $s4,$s4,-1


bgtz $s4,Antimetathesh

#exit
li $v0,10
syscall