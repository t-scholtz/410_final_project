       .data

;LIST OF SUBROUTINES
;================================================================
	.global timer_init


;PROGRAM DATA
;================================================================


;================================================================
	.text
;POINTERS TO STRING
;================================================================

;================================================================

;LIST OF CONSTANTS
;================================================================
U0FR: 				.equ 0x18	; UART0 Flag Register
GPIODATA:			.equ 0x3FC 	;data location
GPIODIG:			.equ 0x51C 	;Pin activation location
GPIODIR:			.equ 0x400  ;Pin Direction location
GPIOPUR: 			.equ 0x510	;Pull-Up Resistor
UARTIM: 			.equ 0x038		; UARTIM offset
UARTICR:			.equ 0x044  	;Interrupt clear register
ENO:				.equ 0x100		;Enable pin interupt offset
GPIOIS: 			.equ 0x404		;GPIO Interrupt Sense Register
GPIOIBE:			.equ 0x408 		;GPIO Interrupt Both Edges Register
GPIOIV:				.equ 0x40C		;GPIO Interrupt Event Register
GPIOIM:				.equ 0x410		;GPIO Interrupt Mask Register
GPIOICR:			.equ 0x41C		;GPIO Interrupt Clear Register
;================================================================

;CODE
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

;----------------------------------------------------------------
;timer_init - conencts the timer to the interupt handler
;	r0 - time between interupts
;----------------------------------------------------------------
timer_init:
	PUSH {r4-r12,lr}
	MOV r5,r0 ;save timer period
	MOV r0, #0xE604
	MOVT r0, #0x400F
	LDRB r1, [r0]
	ORR r1,r1,#1
	STRB r1, [r0]

	MOV r0, #0xC
	MOVT r0, #0x4003
	LDRB r1,[r0]
	AND r1, r1,#0xFE
	STRB r1, [r0]

	MOV r0,#0
	MOVT r0, #0x4003
	LDRB r1,[r0]
	AND r1, r1, #0xF8
	STRB r1, [r0]

	MOV r0, #4
	MOVT r0, #0x4003
	LDRB r1, [r0]
	AND r1, r1, #0xFC
	ORR r1, r1, #2
	STRB r1, [r0]
	MOV r0,#0x28
	MOVT r0, #0x4003
	STR r5, [r0]

	MOV r0,#0x18
	MOVT r0, #0x4003
	LDRB r1,[r0]
	ORR r1, r1, #0x01
	STRB r1, [r0]

	MOV r0,#0xE100
	MOVT r0, #0xE000
	LDR r1, [r0]
	MOV r2, #0
	MOVT r2, #0x0008
	ORR r1, r1, r2
	STR r1, [r0]

	MOV r0,#0x18
	MOVT r0, #0x4003
	LDRB r1,[r0]
	ORR r1, r1, #0x01
	STRB r1, [r0]

	MOV r0,#0xC
	MOVT r0, #0x4003
	LDRB r1,[r0]
	ORR r1, r1, #0x01
	STRB r1, [r0]

	MOV r4, #0x0000
	MOVT r4, #0x4003
	LDRB r6, [r4, #0x024]
	ORR r6,r6, #0x01
	STRB r6, [r4, #0x024]

	POP {r4-r12,lr}
	MOV pc, lr
;================================================================

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
