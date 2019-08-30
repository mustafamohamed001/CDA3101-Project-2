.data

	newLine: 		.asciz "\n"
	string_specifier: 	.asciz "%s"
	line_specifier:		.asciz "%[^\n]"
	char_specifier:		.asciz "%c"
	prompt:			.asciz "Input a string: "
	input:			.space 100
	x:			.asciz "x"
	
.global main

.text

main:
	//prompt
	ldr x0, =prompt
	bl printf
	
	//input
	ldr x0, =line_specifier
	ldr x1, =input
	bl scanf

	//Save String
	ldr x19, =input

	//Save x to register
	ldr x21, =x
	
	b loop	

	b exit	

loop:
	//Load char
	ldrb w20, [x19]

	//Increase index
	add x19, x19, #1
	
	//A
	cmp w20, #65
	beq vowelFound
	
	//E
	cmp w20, #69
	beq vowelFound
	
	//I
	cmp w20, #73
	beq vowelFound
	
	//O
	cmp w20, #79
	beq vowelFound

	//U
	cmp w20, #85
	beq vowelFound

	//a
	cmp w20, #97
	beq vowelFound

	//e
	cmp w20, #101
	beq vowelFound

	//i
	cmp w20, #105
	beq vowelFound

	//o
	cmp w20, #111
	beq vowelFound

	//u
	cmp w20, #117
	beq vowelFound

	//null
	cmp w20, #0
	beq exit

	b print

print: 
	//Move char to position
	mov w1, w20

	ldr x0, =char_specifier
	bl printf

	b loop
	
	
vowelFound:
	ldr x20, [x21, #0]
	b print

exit:
	ldr x0, =newLine
	bl printf
	mov x0, #0
	mov x8, #93
	svc #0
