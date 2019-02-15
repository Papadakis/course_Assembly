.data

.align 0

	Block : .space 21
	String_name0 : .asciiz " Please enter your message.... : "
	String_name1 : .asciiz " After modification........... : " 

.text
.globl main

main:

#Zhtame apo ton xrhsth na mas dwsei ena String
#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name0
syscall

#Dexomaste apo ton xrhsth to String
addi $v0,$zero,8
la  $a0, Block
li  $a1, 20
syscall

#emfanish mhnumatos
addi $v0,$zero,4
la $a0,String_name1
syscall

#arxikopoioume enan kataxwrhth wste gia na mas boh8hsei stis epanalhpseis
li $s0,20
#arxikopoioume ton s2 kataxwrhth gia na pairnoume to swsto gramma ka8e fora 
li $s2,0
#arxikopoioume ton s3 kataxwrhth iso me 97 gia na ulopoihsoume thn sun8hkh
li $s3,97

loop:
	#fortwnoume ta grammata me thn seira kai ta allazoume
	lb $s1,Block($s2)
	#sun8hkh gia na doume ama to gramma einai mikro
	# s1>97 tote kane thn metatroph
	bge $s1,$s3,Modif

Sunexeia:

	#meta thn metatroph apo8hkeuoume to gramma xana ston pinaka
	sb $s1,Block($s2)
	#meiwnoume kata 1 tis epanalhpseis
	addi $s0,$s0,-1
	#auxanoume to s2 kata 1 gia na pame sto epomeno gramma
	addi $s2,$s2,1
	

#sun8hkh s0=<0
bgez $s0,loop

#emfanish mhnumatos
addi $v0,$zero,4
la $a0,Block
syscall

j exit

Modif:

	#metatroph apo mikra se kefalaia
	addi $s1,$s1,-32

j Sunexeia

exit:

li $v0,10
syscall