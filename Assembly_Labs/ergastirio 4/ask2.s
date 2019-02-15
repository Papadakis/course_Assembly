.data

.align 0

	str1 : .space 21
	str2 : .space 21
	String_name0 : .asciiz "Please enter the first string... :"
	String_name1 : .asciiz "Please enter the second string.. :"
	String_name2 : .asciiz "The pointer is : "
	String_name3 : .asciiz "NULL"

.text
.globl main

main:

	#Zhtame apo ton xrhsth na dwsei to prwto sting
	#Emfanish munhmatos
	li $v0,4
	la $a0,String_name0
	syscall

	#dexomaste apo ton xrhsth to prwto string
	li $v0,8
	la $a0,str1
	li $a1,20
	syscall

	#Zhtame apo ton xrhsth na dwsei to deutero sting
	#Emfanish munhmatos
	li $v0,4
	la $a0,String_name1
	syscall

	#dexomaste apo ton xrhsth to deutero string
	li $v0,8
	la $a0,str2
	li $a1,20
	syscall

jal strstr

exit:

beqz $t1,Exit
#Emfanish munhmatos
li $v0,4
la $a0,String_name2
syscall

#Emfanish akeraiou(epistrofh ths sunarthshs)
li $v0,1
add $a0,$t1,$zero
syscall

j End


Exit:

#Emfanish munhmatos
li $v0,4
la $a0,String_name2
syscall

#Emfanish munhmatos
li $v0,4
la $a0,String_name3
syscall

End:

li $v0,10
syscall




strstr:

	#Kanoume kapoies arxikopoihseis gia tous elegxous
	#Kataxwrhths s0 einai metrhths
	addi $s0,$s0,20
	#Kataxwrhths s3 boh8aei sthn prospelash tou string
	add $s3,$s3,$zero

	#Prwta elegxoume gia tis akraies periptwseis
	#Ean to str1 einai NULL tote epistrefei NULL
	loop:
	
		#fortwnoume ta grammata me thn seira kai ta elegxoume
		lb $s2,str1($s3) 
		#Auxanoume kata 1 ton s3 gia na pame sto epomeno gramma
		addi $s3,$s3,1
		#Meiwnoume kata 1 ton metrhth s0
		addi $s0,$s0,-1

	#Elegxoume an ena stoixeio tou str1 einai <> tou NULL
	bnez $s2,Continue1

	#Elegxoume an exoume prospelasei olo to str1
	blez $s0,loop

	Null:

	#Epeidh den vrikame kapoio stoixeio pou einai <> tou NULL tote:
	li $t1,0

	j exit


	Continue1:


		#Omoiws kanoume kapoies arxikopoihseis gia tous elegxous
		#Kataxwrhths s0 einai metrhths
		addi $s0,$s0,20
		#Kataxwrhths s3 boh8aei sthn prospelash tou string
		add $s3,$s3,$zero

		#Ean to str2 einai NULL tote epistrefei NULL
		loop1:
	
			#fortwnoume ta grammata me thn seira kai ta elegxoume
			lb $s2,str2($s3) 
			#Auxanoume kata 1 ton s3 gia na pame sto epomeno gramma
			addi $s3,$s3,1
			#Meiwnoume kata 1 ton metrhth s0
			addi $s0,$s0,-1

		#Elegxoume an ena stoixeio tou str2 einai <> tou NULL
		bnez $s2,Continue2

		#Elegxoume an exoume prospelasei olo to str2
		blez $s0,loop1

		#Epeidh den vrikame kapoio stoixeio pou einai <> tou NULL tote:
		la $t1,str1

		j exit


	Continue2:


		#Mhdenizoume olous tous kataxwrhtes pou 8a xrhsimopoihsoume
		li $s0,0
		li $s1,0
		li $s2,0
		li $s3,0
		#Arxikopoioume mia metavlhth gia na boh8hsei ton elegxo
		addi $t1,$t1,20
		addi $t2,$t2,10 

	Elegxos:


		#Fortwnoume ta grammata twn string
		lb $s0,str1($s2)
		lb $s1,str2($s3)
	
		#Elegxoume ama einai idia ta grammata 
		beq $s0,$s1,Substr

		#Epeidh den einai idia ta grammata pame sto epomeno gramma tou str1
		addi $s2,$s2,1

		#Epeidh auxanoume mono ton metrhth s2 vazoume enan elegxo gia to plhthos twn epanalhpsewn
		#Dhladh ama to str2 den einai substring tou sub1 pane sto Null
		bge $s2,$t1,Null

		j Elegxos

		Substr:

			#Afou einai idia ta prwta grammata pame sto epomeno kai twn duo string
			#Auxanoume kata 1 tous metrhtes s2,s3
			addi $s2,$s2,1
			addi $s3,$s3,1
			
			#Fortwnoume ta grammata twn string
			lb $s0,str1($s2)
			lb $s1,str2($s3)
	
			#Ama teleiwse to str2 kai einai substring tou str1 opote exoume:
			beq $s1,$t2,Continue3

			#Elegxoume ama einai idia ta grammata 
			beq $s0,$s1,Substr

			#Ama den einai idia tote exoume 3 periptwseis
			
		
		j Here
	
		Continue3:

				addi $s2,$s2,1
				sub $s3,$s3,$s2
				la $t1,str1($s3)
		j exit
			

		Here:

			#Ama teleiwse to str1 kai den exei to str2 substring opote exoume:	
			beq $s0,$t2,Null

			#Ama prepei na sunexisoume thn anazhthsh kanonika
			li $s3,0
			addi $s2,$s2,1
			j Elegxos
	



