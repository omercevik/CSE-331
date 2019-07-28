#	CSE 331 COMPUTER ORGANIZATION   HOMEWORK 01
#		ÖMER ÇEVÝK   161044004
	.data
print: .asciiz "Enter the file name with .txt: "
file:  .asciiz ""
input: .space 256

	.text
	.globl main
	.globl filereader
main: 
	jal    filereader	# file reader procedure
	move   $s7, $zero	# it is for to check first character is digit
	la     $a1, input	# load input
	
LineLoop:			# main loop
	lb     $t1, 0($a1)	# loading character
	beq    $t1, $zero, Exit # if it is end of the line then exit
	
	bge    $t1, 48, GreaterThanZero	# checking as a digit
	
Continue:
	move   $a0, $t1		# printing
	li     $v0, 11
	syscall
Continue2:			# keeping on next character
	addi   $a1, $a1, 1
	addi   $s7, $s7, 1
	j      LineLoop

GreaterThanZero:		# checks if it is digit
	ble    $t1, 57, LesserThanNine
	j      Continue

LesserThanNine:			# checks which digit
	beq    $t1, 48, EqualZero
	beq    $t1, 49, EqualOne
	beq    $t1, 50, EqualTwo
	beq    $t1, 51, EqualThree
	beq    $t1, 52, EqualFour
	beq    $t1, 53, EqualFive
	beq    $t1, 54, EqualSix
	beq    $t1, 55, EqualSeven
	beq    $t1, 56, EqualEight
	beq    $t1, 57, EqualNine
	
EqualZero:			# if the digit is zero we jump here
	lb     $s1, 1($a1)
	lb     $s2, -1($a1)
	lb     $s3, -2($a1)
	
	beqz   $s7, FirstDigitZero	# checks first digit
	
	seq    $t4, $s1, 32
	seq    $t5, $s2, 32
	seq    $t6, $s3, 46
	
	and    $s4, $t6, $t5
	bnez   $s4, GreaterZero		# checks first digit of sentences
	and    $t7, $t4, $t5
	
	sge    $t2, $s1, 48
	sle    $t3, $s1, 57
	and    $s2, $t2, $t3		# checks second character is digit or not

	bnez   $t7, LowerZero		# checks if digit is in the sentence
	beqz   $t7, Continue		# if it is not digit then we check it
	beq    $s1, 46, Continue        # checks point
	
	or     $t5, $s2, $t4
	bnez   $t5, Continue		# checks next character is digit and space
	
	j     GreaterZero
	
FirstDigitZero:			# checks first digit is zero
	beq    $s1, 32, GreaterZero
	j      Continue
	
GreaterZero:			# prints if it is greater zero
	li    $v0, 11
	li    $a0, 90
	syscall
	j     LowerPartZero
LowerZero:			# prints if it is lower zero
	li    $a0, 122
	syscall

LowerPartZero:
	li    $a0, 101
	syscall
	li    $a0, 114
	syscall
	li    $a0, 111
	syscall
	j     Continue2

EqualOne:			# if the digit is one we jump here
	lb     $s1, 1($a1)
	lb     $s2, -1($a1)
	lb     $s3, -2($a1)
	
	beqz   $s7, FirstDigitOne	# checks first digit
	
	seq    $t4, $s1, 32
	seq    $t5, $s2, 32
	seq    $t6, $s3, 46
	
	and    $s4, $t6, $t5
	bnez   $s4, GreaterOne		# checks first digit of sentences
	and    $t7, $t4, $t5
	
	sge    $t2, $s1, 48
	sle    $t3, $s1, 57
	and    $s2, $t2, $t3		# checks second character is digit or not

	bnez   $t7, LowerOne		# checks if digit is in the sentence
	beqz   $t7, Continue		# if it is not digit then we check it
	beq    $s1, 46, Continue        # checks point
	
	or     $t5, $s2, $t4
	bnez   $t5, Continue		# checks next character is digit and space
	
	j     GreaterOne
	
FirstDigitOne:			# checks first digit is one
	beq    $s1, 32, GreaterOne
	j      Continue
	
GreaterOne:			# prints if it is greater one
	li    $v0, 11
	li    $a0, 79
	syscall
	j     LowerPartOne
LowerOne:			# prints if it is lower one
	li    $a0, 111
	syscall

LowerPartOne:
	li    $a0, 110
	syscall
	li    $a0, 101
	syscall
	j     Continue2

EqualTwo:			# if the digit is two we jump here
	lb     $s1, 1($a1)
	lb     $s2, -1($a1)
	lb     $s3, -2($a1)
	
	beqz   $s7, FirstDigitTwo	# checks first digit
	
	seq    $t4, $s1, 32
	seq    $t5, $s2, 32
	seq    $t6, $s3, 46
	
	and    $s4, $t6, $t5
	bnez   $s4, GreaterTwo		# checks first digit of sentences
	and    $t7, $t4, $t5
	
	sge    $t2, $s1, 48
	sle    $t3, $s1, 57
	and    $s2, $t2, $t3		# checks second character is digit or not

	bnez   $t7, LowerTwo		# checks if digit is in the sentence
	beqz   $t7, Continue		# if it is not digit then we check it
	beq    $s1, 46, Continue        # checks point
	
	or     $t5, $s2, $t4
	bnez   $t5, Continue		# checks next character is digit and space
	
	j     GreaterTwo
	
FirstDigitTwo:			# checks first digit is two
	beq    $s1, 32, GreaterTwo
	j      Continue
	
GreaterTwo:			# prints if it is greater two
	li    $v0, 11
	li    $a0, 84
	syscall
	j     LowerPartTwo
LowerTwo:			# prints if it is lower two
	li    $a0, 116
	syscall

LowerPartTwo:
	li    $a0, 119
	syscall
	li    $a0, 111
	syscall
	j     Continue2

EqualThree:			# if the digit is three we jump here
	lb     $s1, 1($a1)
	lb     $s2, -1($a1)
	lb     $s3, -2($a1)
	
	beqz   $s7, FirstDigitThree	# checks first digit
	
	seq    $t4, $s1, 32
	seq    $t5, $s2, 32
	seq    $t6, $s3, 46
	
	and    $s4, $t6, $t5
	bnez   $s4, GreaterThree	# checks first digit of sentences
	and    $t7, $t4, $t5
	
	sge    $t2, $s1, 48
	sle    $t3, $s1, 57
	and    $s2, $t2, $t3		# checks second character is digit or not

	bnez   $t7, LowerThree		# checks if digit is in the sentence
	beqz   $t7, Continue		# if it is not digit then we check it
	beq    $s1, 46, Continue        # checks point
	
	or     $t5, $s2, $t4
	bnez   $t5, Continue		# checks next character is digit and space
	
	j     GreaterThree
	
FirstDigitThree:		# checks first digit is three
	beq    $s1, 32, GreaterThree
	j      Continue
	
GreaterThree:			# prints if it is greater three
	li    $v0, 11
	li    $a0, 84
	syscall
	j     LowerPartThree
LowerThree:			# prints if it is lower three
	li    $a0, 116
	syscall

LowerPartThree:
	li    $a0, 104
	syscall
	li    $a0, 114
	syscall
	li    $a0, 101
	syscall
	li    $a0, 101
	syscall
	j     Continue2

EqualFour:			# if the digit is four we jump here
	lb     $s1, 1($a1)
	lb     $s2, -1($a1)
	lb     $s3, -2($a1)
	
	beqz   $s7, FirstDigitFour	# checks first digit
	
	seq    $t4, $s1, 32
	seq    $t5, $s2, 32
	seq    $t6, $s3, 46
	
	and    $s4, $t6, $t5
	bnez   $s4, GreaterFour		# checks first digit of sentences
	and    $t7, $t4, $t5
	
	sge    $t2, $s1, 48
	sle    $t3, $s1, 57
	and    $s2, $t2, $t3		# checks second character is digit or not

	bnez   $t7, LowerFour		# checks if digit is in the sentence
	beqz   $t7, Continue		# if it is not digit then we check it
	beq    $s1, 46, Continue        # checks point
	
	or     $t5, $s2, $t4
	bnez   $t5, Continue		# checks next character is digit and space
	
	j     GreaterFour
	
FirstDigitFour:			# checks first digit is four
	beq    $s1, 32, GreaterFour
	j      Continue
	
GreaterFour:			# prints if it is greater four
	li    $v0, 11
	li    $a0, 70
	syscall
	j     LowerPartFour
LowerFour:			# prints if it is lower four
	li    $a0, 102
	syscall

LowerPartFour:
	li    $a0, 111
	syscall
	li    $a0, 117
	syscall
	li    $a0, 114
	syscall
	j     Continue2
	
EqualFive:			# if the digit is five we jump here
	lb     $s1, 1($a1)
	lb     $s2, -1($a1)
	lb     $s3, -2($a1)
	
	beqz   $s7, FirstDigitFive	# checks first digit
	
	seq    $t4, $s1, 32
	seq    $t5, $s2, 32
	seq    $t6, $s3, 46
	
	and    $s4, $t6, $t5
	bnez   $s4, GreaterFive		# checks first digit of sentences
	and    $t7, $t4, $t5
	
	sge    $t2, $s1, 48
	sle    $t3, $s1, 57
	and    $s2, $t2, $t3		# checks second character is digit or not

	bnez   $t7, LowerFive		# checks if digit is in the sentence
	beqz   $t7, Continue		# if it is not digit then we check it
	beq    $s1, 46, Continue        # checks point
	
	or     $t5, $s2, $t4
	bnez   $t5, Continue		# checks next character is digit and space
	
	j     GreaterFive
	
FirstDigitFive:			# checks first digit is five
	beq    $s1, 32, GreaterFive
	j      Continue

GreaterFive:			# prints if it is greater five
	li    $v0, 11
	li    $a0, 70
	syscall
	j     LowerPartFive
LowerFive:			# prints if it is lower five
	li    $a0, 102
	syscall

LowerPartFive:
	li    $a0, 105
	syscall
	li    $a0, 118
	syscall
	li    $a0, 101
	syscall
	j     Continue2
	
EqualSix:			# if the digit is six we jump here
	lb     $s1, 1($a1)
	lb     $s2, -1($a1)
	lb     $s3, -2($a1)
	
	beqz   $s7, FirstDigitSix	# checks first digit
	
	seq    $t4, $s1, 32
	seq    $t5, $s2, 32
	seq    $t6, $s3, 46
	
	and    $s4, $t6, $t5
	bnez   $s4, GreaterSix		# checks first digit of sentences
	and    $t7, $t4, $t5
	
	sge    $t2, $s1, 48
	sle    $t3, $s1, 57
	and    $s2, $t2, $t3		# checks second character is digit or not

	bnez   $t7, LowerSix		# checks if digit is in the sentence
	beqz   $t7, Continue		# if it is not digit then we check it
	beq    $s1, 46, Continue        # checks point
	
	or     $t5, $s2, $t4
	bnez   $t5, Continue		# checks next character is digit and space
	
	j     GreaterSix
	
FirstDigitSix:			# checks first digit is six
	beq    $s1, 32, GreaterSix
	j      Continue

GreaterSix:			# prints if it is greater six
	li    $v0, 11
	li    $a0, 83
	syscall
	j     LowerPartSix
LowerSix:			# prints if it is lower six
	li    $a0, 115
	syscall

LowerPartSix:
	li    $a0, 105
	syscall
	li    $a0, 120
	syscall
	j     Continue2
	
EqualSeven:			# if the digit is seven we jump here
	lb     $s1, 1($a1)
	lb     $s2, -1($a1)
	lb     $s3, -2($a1)
	
	beqz   $s7, FirstDigitSeven	# checks first digit
	
	seq    $t4, $s1, 32
	seq    $t5, $s2, 32
	seq    $t6, $s3, 46
	
	and    $s4, $t6, $t5
	bnez   $s4, GreaterSeven	# checks first digit of sentences
	and    $t7, $t4, $t5
	
	sge    $t2, $s1, 48
	sle    $t3, $s1, 57
	and    $s2, $t2, $t3		# checks second character is digit or not

	bnez   $t7, LowerSeven		# checks if digit is in the sentence
	beqz   $t7, Continue		# if it is not digit then we check it
	beq    $s1, 46, Continue        # checks point
	
	or     $t5, $s2, $t4
	bnez   $t5, Continue		# checks next character is digit and space
	
	j     GreaterSeven
	
FirstDigitSeven:		# checks first digit is seven
	beq    $s1, 32, GreaterSeven
	j      Continue

GreaterSeven:			# prints if it is greater seven
	li    $v0, 11
	li    $a0, 83
	syscall
	j     LowerPartSeven
LowerSeven:			# prints if it is lower seven
	li    $a0, 115
	syscall

LowerPartSeven:
	li    $a0, 101
	syscall
	li    $a0, 118
	syscall
	li    $a0, 101
	syscall
	li    $a0, 110
	syscall
	j     Continue2
	
EqualEight:			# if the digit is eight we jump here
	lb     $s1, 1($a1)
	lb     $s2, -1($a1)
	lb     $s3, -2($a1)
	
	beqz   $s7, FirstDigitEight	# checks first digit
	
	seq    $t4, $s1, 32
	seq    $t5, $s2, 32
	seq    $t6, $s3, 46
	
	and    $s4, $t6, $t5
	bnez   $s4, GreaterEight	# checks first digit of sentences
	and    $t7, $t4, $t5
	
	sge    $t2, $s1, 48
	sle    $t3, $s1, 57
	and    $s2, $t2, $t3		# checks second character is digit or not

	bnez   $t7, LowerEight		# checks if digit is in the sentence
	beqz   $t7, Continue		# if it is not digit then we check it
	beq    $s1, 46, Continue        # checks point
	
	or     $t5, $s2, $t4
	bnez   $t5, Continue		# checks next character is digit and space
	
	j     GreaterEight
	
FirstDigitEight:		# checks first digit is eight
	beq    $s1, 32, GreaterEight
	j      Continue
	
GreaterEight:			# prints if it is greater eight
	li    $v0, 11
	li    $a0, 69
	syscall
	j     LowerPartEight
LowerEight:			# prints if it is lower eight
	li    $a0, 101
	syscall

LowerPartEight:
	li    $a0, 105
	syscall
	li    $a0, 103
	syscall
	li    $a0, 104
	syscall
	li    $a0, 116
	syscall
	j     Continue2
	
EqualNine:			# if the digit is nine we jump here
	lb     $s1, 1($a1)
	lb     $s2, -1($a1)
	lb     $s3, -2($a1)
	
	beqz   $s7, FirstDigitNine	# checks first digit
	
	seq    $t4, $s1, 32
	seq    $t5, $s2, 32
	seq    $t6, $s3, 46
	
	and    $s4, $t6, $t5
	bnez   $s4, GreaterNine		# checks first digit of sentences
	and    $t7, $t4, $t5
	
	sge    $t2, $s1, 48
	sle    $t3, $s1, 57
	and    $s2, $t2, $t3		# checks second character is digit or not

	bnez   $t7, LowerNine		# checks if digit is in the sentence
	beqz   $t7, Continue		# if it is not digit then we check it
	beq    $s1, 46, Continue        # checks point
	
	or     $t5, $s2, $t4
	bnez   $t5, Continue		# checks next character is digit and space
	
	j     GreaterNine
	
FirstDigitNine:			# checks first digit is nine
	beq    $s1, 32, GreaterNine
	j      Continue
	
GreaterNine:			# prints if it is greater nine
	li    $v0, 11
	li    $a0, 78
	syscall
	j     LowerPartNine
LowerNine:			# prints if it is lower nine
	li    $a0, 110
	syscall

LowerPartNine:
	li    $a0, 105
	syscall
	li    $a0, 110
	syscall
	li    $a0, 101
	syscall
	j     Continue2
	
filereader:			# it gets input name and reads file
	la     $a0, print
	li     $v0, 4
	syscall
	
	la     $a0, file	# reads file name
	li     $a1, 150
	li     $v0, 8
	syscall
	
	la     $t1, file
NewLineDestructor:		# searches new line character
	lb     $t0, 0($t1)
	beq    $t0, 10, Destruct
	addi   $t1, $t1, 1
	j      NewLineDestructor
Destructed:
	
	li     $v0, 13	     # open file
	la     $a0, file    
	li     $a1, 0
	li     $a2, 0
	syscall
	move   $t6, $v0

	li     $v0, 14       # read file
	move   $a0, $t6
	la     $a1, input
	li     $a2, 256      # read byte size
	syscall

	li     $v0, 16       # system call for close file
	move   $a0, $t6      # file descriptor to close
	syscall              # close file
	
	la     $v0, input
	jr     $ra

Destruct:		     # destroys new line character
	sb     $zero, 0($t1) 
	j      Destructed
Exit:			# finish programme
	li     $v0, 10
	syscall