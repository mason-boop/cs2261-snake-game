	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+24
	ldr	r2, .L4+28
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	snakePal
	.word	DMANow
	.word	snakeBitmap
	.word	drawFullscreenImage4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1044
	.size	initialize, .-initialize
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L16
	ldr	r3, [r4]
	ldr	r2, .L16+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L16+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L9
	ldr	r3, .L16+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
.L9:
	pop	{r4, lr}
	bx	lr
.L15:
	ldr	r0, [r4]
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L16+20
	ldr	r3, .L16+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L19
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #254
	ldr	r4, .L23
	ldr	r2, .L23+4
	mov	r1, #99
	mov	r0, #67
	mov	lr, pc
	bx	r4
	mov	r3, #254
	ldr	r2, .L23+8
	mov	r1, #56
	mov	r0, #77
	mov	lr, pc
	bx	r4
	ldr	r2, .L23+12
	mov	r1, #64
	mov	r0, #87
	mov	r3, #254
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+20
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L23+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L37
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L26
	ldr	r2, .L37+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L35
.L26:
	tst	r3, #4
	beq	.L25
	ldr	r3, .L37+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L36
.L25:
	pop	{r4, lr}
	bx	lr
.L35:
	mov	r2, #1
	ldr	r3, .L37+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L36:
	pop	{r4, lr}
	b	goToStart
.L38:
	.align	2
.L37:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L46
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L39
	ldr	r3, .L46+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
.L39:
	pop	{r4, lr}
	bx	lr
.L45:
	pop	{r4, lr}
	b	goToStart
.L47:
	.align	2
.L46:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #254
	ldr	r4, .L50
	ldr	r2, .L50+4
	mov	r1, #85
	mov	r0, #75
	mov	lr, pc
	bx	r4
	ldr	r2, .L50+8
	mov	r1, #51
	mov	r0, #85
	mov	r3, #254
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+16
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L50+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
	.word	drawString4
	.word	.LC3
	.word	.LC4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+8
	ldr	r1, .L61+12
	ldr	r2, [r3]
	ldr	r0, .L61+16
	ldr	r3, .L61+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L61+24
	ldr	r2, .L61+16
	mov	r1, #5
	mov	r0, #145
	mov	r3, #254
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
	ldr	r3, .L61+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
.L53:
	ldr	r3, .L61+44
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L60
	pop	{r4, lr}
	bx	lr
.L60:
	pop	{r4, lr}
	b	goToLose
.L59:
	pop	{r4, lr}
	b	goToPause
.L62:
	.align	2
.L61:
	.word	updateGame
	.word	drawGame
	.word	score
	.word	.LC5
	.word	buffer
	.word	sprintf
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	snake
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L74
	push	{r4, r7, fp, lr}
	ldr	r3, .L74+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L74+8
	ldr	fp, .L74+12
	ldr	r5, .L74+16
	ldr	r10, .L74+20
	ldr	r9, .L74+24
	ldr	r8, .L74+28
	ldr	r7, .L74+32
	ldr	r4, .L74+36
.L64:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L65:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L65
.L67:
	.word	.L66
	.word	.L68
	.word	.L69
	.word	.L70
	.word	.L70
.L70:
	mov	lr, pc
	bx	r7
	b	.L64
.L69:
	mov	lr, pc
	bx	r8
	b	.L64
.L68:
	mov	lr, pc
	bx	r9
	b	.L64
.L66:
	mov	lr, pc
	bx	r10
	b	.L64
.L75:
	.align	2
.L74:
	.word	1044
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Paused\000"
	.space	1
.LC1:
	.ascii	"Continue? Press START\000"
	.space	2
.LC2:
	.ascii	"Quit? Press SELECT\000"
	.space	1
.LC3:
	.ascii	"You lose :(\000"
.LC4:
	.ascii	"Try again? Press START\000"
	.space	1
.LC5:
	.ascii	"Score: %d\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
