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
	.file	"game.c"
	.text
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #250
	sub	sp, sp, #8
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	mov	r2, #254
	ldr	r4, .L16+4
	str	r2, [sp]
	mov	r3, #234
	mov	r2, #2
	mov	r1, #3
	mov	r0, #135
	ldr	r6, .L16+8
	add	r5, r4, #7168
	mov	lr, pc
	bx	r6
	add	r5, r5, #32
	b	.L3
.L2:
	add	r4, r4, #36
	cmp	r4, r5
	beq	.L14
.L3:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L2
	ldrb	ip, [r4, #32]	@ zero_extendqisi2
	add	r2, r4, #16
	ldm	r4, {r0, r1}
	ldm	r2, {r2, r3}
	add	r4, r4, #36
	str	ip, [sp]
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L3
.L14:
	ldr	r0, .L16+12
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bne	.L15
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	ldr	ip, .L16+16
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L16+20
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	fillScreen4
	.word	snake
	.word	drawRect4
	.word	apples
	.word	appleBitmap
	.word	drawImage4
	.size	drawGame, .-drawGame
	.align	2
	.global	drawBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBar, %function
drawBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #254
	push	{r4, lr}
	sub	sp, sp, #8
	str	r2, [sp]
	mov	r3, #234
	mov	r2, #2
	mov	r1, #3
	mov	r0, #135
	ldr	r4, .L20
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	drawRect4
	.size	drawBar, .-drawBar
	.align	2
	.global	initSnake
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSnake, %function
initSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, lr}
	ldr	r5, .L26
	mov	ip, r1
	mov	r3, r5
	mov	r4, #80
	mov	r0, #9
	mvn	lr, #3
.L23:
	ldr	r2, [r3, #20]
	mul	r6, r1, r2
	add	r1, r1, #1
	add	r2, r6, #120
	cmp	r1, #200
	str	r4, [r3]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r0, [r3, #16]
	str	ip, [r3, #28]
	strb	lr, [r3, #32]
	str	ip, [r3, #24]
	str	r2, [r3, #4]
	str	r0, [r3, #20]
	add	r3, r3, #36
	bne	.L23
	mov	r1, #1
	ldr	r2, .L26+4
	ldr	r3, [r2]
	add	r3, r3, r1
	str	r1, [r5, #28]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	snake
	.word	snakeLength
	.size	initSnake, .-initSnake
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	initSnake
	mov	ip, #2
	mov	r4, #0
	mov	r2, #12
	ldr	r3, .L30
	ldr	r5, .L30+4
	ldr	r1, .L30+8
	ldr	r0, .L30+12
	str	ip, [r3, #8]
	ldr	lr, .L30+16
	ldr	ip, .L30+20
	ldr	r6, .L30+24
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #12]
	str	r4, [r3, #24]
	str	r4, [r5]
	str	r4, [r1]
	str	r4, [r0]
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L30+28
	mov	r0, #3
	ldr	r5, .L30+32
	str	r4, [lr]
	str	r4, [ip]
	str	r4, [r6]
	mov	lr, pc
	bx	r5
	mov	lr, #31744
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L30+36
	ldr	r2, .L30+40
	strh	r4, [r3, #244]	@ movhi
	strh	lr, [r3, #246]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	apples
	.word	snakeLength
	.word	direction
	.word	oldDirection
	.word	appleCount
	.word	snakeCount
	.word	score
	.word	applePal
	.word	DMANow
	.word	83886336
	.word	15855
	.size	initGame, .-initGame
	.align	2
	.global	updateSnake
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSnake, %function
updateSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L91
	ldr	r3, [r5]
	cmp	r3, #9
	sub	sp, sp, #16
	beq	.L33
	ldr	r4, .L91+4
	ldr	r0, [r4]
.L34:
	ldr	r3, .L91+8
	ldrh	r3, [r3]
	tst	r3, #32
	beq	.L49
	ldr	r2, .L91+12
	ldrh	r2, [r2]
	tst	r2, #32
	bne	.L49
	ldr	r2, .L91+16
	ldr	r2, [r2]
	cmp	r2, #4
	beq	.L49
	mov	r2, #3
	ldr	r3, .L91+20
	str	r2, [r3]
.L50:
	cmn	r0, #1
	blt	.L55
	ldr	r3, [r4, #4]
	cmp	r3, #0
	blt	.L55
	ldr	r2, [r4, #20]
	add	r3, r3, r2
	cmp	r3, #239
	bgt	.L55
	ldr	r3, [r4, #16]
	add	r0, r0, r3
	cmp	r0, #134
	ble	.L32
.L55:
	mov	r3, #1
	str	r3, [r4, #24]
.L32:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L49:
	tst	r3, #16
	beq	.L51
	ldr	r2, .L91+12
	ldrh	r2, [r2]
	tst	r2, #16
	bne	.L51
	ldr	r2, .L91+16
	ldr	r2, [r2]
	cmp	r2, #3
	movne	r2, #4
	ldrne	r3, .L91+20
	strne	r2, [r3]
	bne	.L50
.L51:
	tst	r3, #64
	beq	.L52
	ldr	r2, .L91+12
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L52
	ldr	r2, .L91+16
	ldr	r2, [r2]
	cmp	r2, #2
	movne	r2, #1
	ldrne	r3, .L91+20
	strne	r2, [r3]
	bne	.L50
.L52:
	tst	r3, #128
	beq	.L50
	ldr	r3, .L91+12
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L50
	ldr	r3, .L91+16
	ldr	r3, [r3]
	cmp	r3, #1
	movne	r2, #2
	ldrne	r3, .L91+20
	strne	r2, [r3]
	b	.L50
.L33:
	ldr	r8, .L91+24
	ldr	r6, [r8]
	cmp	r6, #0
	ldr	r4, .L91+4
	blt	.L35
	add	r7, r6, r6, lsl #3
	add	r7, r4, r7, lsl #2
	mov	r3, r7
	mov	r2, r6
.L37:
	cmp	r2, #0
	sub	r2, r2, #1
	beq	.L36
	sub	r0, r3, #36
	ldm	r0, {r0, r1}
	cmn	r2, #1
	stm	r3, {r0, r1}
	sub	r3, r3, #36
	bne	.L37
.L35:
	ldr	r0, [r4]
.L38:
	mov	r3, #0
	str	r3, [r5]
	b	.L34
.L36:
	ldr	r3, .L91+20
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r0, [r4]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L39
.L41:
	.word	.L40
	.word	.L42
	.word	.L43
	.word	.L44
.L43:
	mov	r1, #3
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #12]
	sub	r3, r3, r2
	ldr	r2, .L91+16
	str	r3, [r4, #4]
	str	r1, [r2]
.L39:
	cmp	r6, #0
	beq	.L38
	mov	r3, r6
	mov	r10, #1
	ldr	r9, .L91+28
	b	.L48
.L90:
	ldr	r3, [r8]
.L48:
	cmp	r3, #1
	ble	.L46
	add	ip, r7, #16
	ldm	ip, {ip, lr}
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	ldr	lr, [r7, #4]
	str	ip, [sp, #8]
	ldr	ip, [r7]
	ldr	r1, [r4, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	strne	r10, [r4, #24]
	ldr	r0, [r4]
.L46:
	subs	r6, r6, #1
	sub	r7, r7, #36
	bne	.L90
	b	.L38
.L42:
	mov	r2, #2
	ldr	r1, [r4, #8]
	ldr	r3, .L91+16
	add	r0, r0, r1
	str	r0, [r4]
	str	r2, [r3]
	b	.L39
.L44:
	mov	r1, #4
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #12]
	add	r3, r3, r2
	ldr	r2, .L91+16
	str	r3, [r4, #4]
	str	r1, [r2]
	b	.L39
.L40:
	mov	r2, #1
	ldr	r1, [r4, #8]
	ldr	r3, .L91+16
	sub	r0, r0, r1
	str	r0, [r4]
	str	r2, [r3]
	b	.L39
.L92:
	.align	2
.L91:
	.word	snakeCount
	.word	snake
	.word	oldButtons
	.word	buttons
	.word	oldDirection
	.word	direction
	.word	snakeLength
	.word	collision
	.size	updateSnake, .-updateSnake
	.align	2
	.global	drawSnake
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSnake, %function
drawSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	mov	ip, r0
	push	{r4, lr}
	ldrb	ip, [ip, #32]	@ zero_extendqisi2
	sub	sp, sp, #8
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L102
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	drawRect4
	.size	drawSnake, .-drawSnake
	.align	2
	.global	initApples
	.syntax unified
	.arm
	.fpu softvfp
	.type	initApples, %function
initApples:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #12
	mov	r0, #2
	ldr	r3, .L105
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r0, [r3, #8]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	bx	lr
.L106:
	.align	2
.L105:
	.word	apples
	.size	initApples, .-initApples
	.align	2
	.global	updateApple
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateApple, %function
updateApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L127
	ldr	r3, [r4]
	cmp	r3, #50
	sub	sp, sp, #20
	mov	r5, r0
	ldr	r6, [r0, #24]
	beq	.L126
	cmp	r6, #0
	bne	.L110
.L107:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L126:
	cmp	r6, #0
	beq	.L111
	mov	r3, #0
	str	r3, [r4]
.L110:
	ldr	r10, .L127+4
	add	r6, r10, #7168
	mov	r4, r10
	ldr	r9, .L127+8
	ldr	r8, .L127+12
	ldr	r7, .L127+16
	add	r6, r6, #32
	b	.L116
.L114:
	add	r4, r4, #36
	cmp	r4, r6
	beq	.L107
.L116:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L114
	add	fp, r4, #16
	ldm	fp, {fp, ip}
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	ldr	lr, [r4, #4]
	str	ip, [sp, #12]
	ldr	ip, [r4]
	str	fp, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L114
	mov	ip, #1
	mov	r0, #0
	ldr	r3, [r7]
	ldr	r2, [r8]
	add	r1, r3, r3, lsl #3
	add	r1, r10, r1, lsl #2
	add	r3, r3, ip
	add	r2, r2, ip
	str	ip, [r1, #28]
	str	r3, [r7]
	str	r2, [r8]
	str	r0, [r5, #24]
	b	.L114
.L111:
	ldr	r7, .L127+20
	mov	lr, pc
	bx	r7
	ldr	r1, .L127+24
	smull	r2, r3, r0, r1
	add	r2, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #4
	sub	r3, r0, r3
	add	r3, r3, #12
	str	r3, [r5]
	mov	lr, pc
	bx	r7
	mov	r2, #1
	ldr	r3, .L127+28
	smull	r8, r9, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r9, asr #6
	add	r3, r3, r3, lsl r2
	add	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #3
	add	r3, r3, #12
	str	r6, [r4]
	str	r3, [r5, #4]
	str	r2, [r5, #24]
	b	.L110
.L128:
	.align	2
.L127:
	.word	appleCount
	.word	snake
	.word	collision
	.word	score
	.word	snakeLength
	.word	rand
	.word	-1818589755
	.word	1272582903
	.size	updateApple, .-updateApple
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateSnake
	ldr	r0, .L131
	bl	updateApple
	ldr	r0, .L131+4
	ldr	r1, .L131+8
	ldr	r2, [r0]
	ldr	r3, [r1]
	add	r2, r2, #1
	add	r3, r3, #1
	str	r2, [r0]
	str	r3, [r1]
	pop	{r4, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	apples
	.word	snakeCount
	.word	appleCount
	.size	updateGame, .-updateGame
	.align	2
	.global	drawApple
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawApple, %function
drawApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldr	ip, .L142
	sub	sp, sp, #8
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L142+4
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L143:
	.align	2
.L142:
	.word	appleBitmap
	.word	drawImage4
	.size	drawApple, .-drawApple
	.comm	oldDirection,4,4
	.comm	direction,4,4
	.comm	score,4,4
	.comm	appleCount,4,4
	.comm	applesRemaining,4,4
	.comm	apples,28,4
	.comm	snakeCount,4,4
	.comm	snakeLength,4,4
	.comm	snake,7200,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
