	.data
;LIST OF SUBROUTINES
;================================================================
	.global start


;PROGRAM DATA
;================================================================


;================================================================
	.text
;LIST OF POINTERS
;================================================================


;LIST OF CONSTANTS
;================================================================


;CODE
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


;----------------------------------------------------------------
;start - The transmitter starts by connecting to the mic and
;sets up a connections to the reciver to send data to it
;----------------------------------------------------------------
start:
	PUSH {r4-r12,lr}
	;Set up Mic


	;Set up Timer 0
	MOV r0, #0x1F40 ;r0 is timer period value
	BL timer_init	;Set to 2000 Hz

EXIT:
	POP {r4-r12,lr}
	MOV pc, lr
;================================================================

;----------------------------------------------------------------
;Timer_Handler0 - Timer 0 interupt handler
;Every interupt we read in data from the microphone and send
;the data to the reciever:
;----------------------------------------------------------------
Timer_Handler0:
	PUSH {r0-r11,lr}
;Clear interupt
	MOV r4, #0x0000
	MOVT r4, #0x4003
	LDRB r6, [r4, #GPTMICR]
	ORR r6,r6, #0x01
	STRB r6, [r4, #GPTMICR]

EXIT_TIMER0:
	POP {r0-r11,lr}
	BX lr
;================================================================

.end
