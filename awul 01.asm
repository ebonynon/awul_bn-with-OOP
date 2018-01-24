
_main:

;awul 01.c,8 :: 		void main() {
;awul 01.c,10 :: 		TRISB = 0b11111000; // portB set inputs (front sener panal)
	MOVLW      248
	MOVWF      TRISB+0
;awul 01.c,11 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;awul 01.c,12 :: 		TRISC = 0x00;       // portC set outputs (pwm)
	CLRF       TRISC+0
;awul 01.c,13 :: 		PORTC = 0b00000110;
	MOVLW      6
	MOVWF      PORTC+0
;awul 01.c,14 :: 		TRISD = 0x00;       // portD set outputs (moter controller)
	CLRF       TRISD+0
;awul 01.c,15 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;awul 01.c,16 :: 		TRISE = 0b011;      // portE set inputs (back senser panel)
	MOVLW      3
	MOVWF      TRISE+0
;awul 01.c,17 :: 		PORTE = 0b000;
	CLRF       PORTE+0
;awul 01.c,19 :: 		ADCON0 = 0b11010001;            // set analog
	MOVLW      209
	MOVWF      ADCON0+0
;awul 01.c,20 :: 		ADCON1 = 0b10000000;
	MOVLW      128
	MOVWF      ADCON1+0
;awul 01.c,21 :: 		TRISA =  0b00001111;
	MOVLW      15
	MOVWF      TRISA+0
;awul 01.c,23 :: 		PR2 = 0X7C;    // PWM s are on
	MOVLW      124
	MOVWF      PR2+0
;awul 01.c,24 :: 		T2CON = 0X05;                                     // aduma wm rate aka = 110
	MOVLW      5
	MOVWF      T2CON+0
;awul 01.c,25 :: 		CCP1CON = 0X0C;
	MOVLW      12
	MOVWF      CCP1CON+0
;awul 01.c,26 :: 		CCP2CON = 0X3C;
	MOVLW      60
	MOVWF      CCP2CON+0
;awul 01.c,28 :: 		while(1)
L_main0:
;awul 01.c,30 :: 		line_following();
	CALL       _line_following+0
;awul 01.c,31 :: 		obs_detec();
	CALL       _obs_detec+0
;awul 01.c,35 :: 		}
	GOTO       L_main0
;awul 01.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_line_following:

;awul 01.c,38 :: 		void line_following(){
;awul 01.c,41 :: 		while(1){
L_line_following2:
;awul 01.c,43 :: 		if(PORTB==0b00000000){  //
	MOVF       PORTB+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_line_following4
;awul 01.c,44 :: 		PORTD = 0b11110000;
	MOVLW      240
	MOVWF      PORTD+0
;awul 01.c,45 :: 		CCPR1L = 130;
	MOVLW      130
	MOVWF      CCPR1L+0
;awul 01.c,46 :: 		CCPR2L = 160;
	MOVLW      160
	MOVWF      CCPR2L+0
;awul 01.c,47 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_line_following5:
	DECFSZ     R13+0, 1
	GOTO       L_line_following5
	DECFSZ     R12+0, 1
	GOTO       L_line_following5
	DECFSZ     R11+0, 1
	GOTO       L_line_following5
	NOP
;awul 01.c,50 :: 		PORTD = 0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,51 :: 		CCPR1L = 130;
	MOVLW      130
	MOVWF      CCPR1L+0
;awul 01.c,52 :: 		CCPR2L = 160;
	MOVLW      160
	MOVWF      CCPR2L+0
;awul 01.c,53 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_line_following6:
	DECFSZ     R13+0, 1
	GOTO       L_line_following6
	DECFSZ     R12+0, 1
	GOTO       L_line_following6
	DECFSZ     R11+0, 1
	GOTO       L_line_following6
;awul 01.c,55 :: 		PORTD = 0b11110000;
	MOVLW      240
	MOVWF      PORTD+0
;awul 01.c,56 :: 		CCPR1L = 130;
	MOVLW      130
	MOVWF      CCPR1L+0
;awul 01.c,57 :: 		CCPR2L = 160;
	MOVLW      160
	MOVWF      CCPR2L+0
;awul 01.c,58 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_line_following7:
	DECFSZ     R13+0, 1
	GOTO       L_line_following7
	DECFSZ     R12+0, 1
	GOTO       L_line_following7
	DECFSZ     R11+0, 1
	GOTO       L_line_following7
	NOP
;awul 01.c,59 :: 		if(PORTB==0b00000000){   // go to obs....
	MOVF       PORTB+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_line_following8
;awul 01.c,61 :: 		break;
	GOTO       L_line_following3
;awul 01.c,63 :: 		}
L_line_following8:
;awul 01.c,64 :: 		}
	GOTO       L_line_following9
L_line_following4:
;awul 01.c,67 :: 		else if(PORTB==0b11011000){  //go ahead
	MOVF       PORTB+0, 0
	XORLW      216
	BTFSS      STATUS+0, 2
	GOTO       L_line_following10
;awul 01.c,68 :: 		PORTD = 0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,69 :: 		CCPR1L = 255;
	MOVLW      255
	MOVWF      CCPR1L+0
;awul 01.c,70 :: 		CCPR2L = 255;
	MOVLW      255
	MOVWF      CCPR2L+0
;awul 01.c,72 :: 		}
	GOTO       L_line_following11
L_line_following10:
;awul 01.c,74 :: 		else if(PORTB==0b10011000){  //smooth left 1
	MOVF       PORTB+0, 0
	XORLW      152
	BTFSS      STATUS+0, 2
	GOTO       L_line_following12
;awul 01.c,75 :: 		PORTD = 0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,76 :: 		CCPR1L = 140;
	MOVLW      140
	MOVWF      CCPR1L+0
;awul 01.c,77 :: 		CCPR2L = 250;
	MOVLW      250
	MOVWF      CCPR2L+0
;awul 01.c,81 :: 		}
	GOTO       L_line_following13
L_line_following12:
;awul 01.c,83 :: 		else if(PORTB==0b11001000){  //smooth right 1
	MOVF       PORTB+0, 0
	XORLW      200
	BTFSS      STATUS+0, 2
	GOTO       L_line_following14
;awul 01.c,84 :: 		PORTD = 0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,85 :: 		CCPR1L = 250;
	MOVLW      250
	MOVWF      CCPR1L+0
;awul 01.c,86 :: 		CCPR2L = 140;
	MOVLW      140
	MOVWF      CCPR2L+0
;awul 01.c,89 :: 		}
	GOTO       L_line_following15
L_line_following14:
;awul 01.c,91 :: 		else if(PORTB==0b10111000){  //smooth left 2
	MOVF       PORTB+0, 0
	XORLW      184
	BTFSS      STATUS+0, 2
	GOTO       L_line_following16
;awul 01.c,92 :: 		PORTD = 0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,93 :: 		CCPR1L = 110;
	MOVLW      110
	MOVWF      CCPR1L+0
;awul 01.c,94 :: 		CCPR2L = 250;
	MOVLW      250
	MOVWF      CCPR2L+0
;awul 01.c,97 :: 		}
	GOTO       L_line_following17
L_line_following16:
;awul 01.c,99 :: 		else if(PORTB==0b11101000){  //smooth right 2
	MOVF       PORTB+0, 0
	XORLW      232
	BTFSS      STATUS+0, 2
	GOTO       L_line_following18
;awul 01.c,100 :: 		PORTD = 0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,101 :: 		CCPR1L = 250;
	MOVLW      250
	MOVWF      CCPR1L+0
;awul 01.c,102 :: 		CCPR2L = 110;
	MOVLW      110
	MOVWF      CCPR2L+0
;awul 01.c,105 :: 		}
	GOTO       L_line_following19
L_line_following18:
;awul 01.c,107 :: 		else if(PORTB==0b00111000){  //left 1
	MOVF       PORTB+0, 0
	XORLW      56
	BTFSS      STATUS+0, 2
	GOTO       L_line_following20
;awul 01.c,108 :: 		PORTD = 0b00100000;
	MOVLW      32
	MOVWF      PORTD+0
;awul 01.c,109 :: 		CCPR1L = 0;
	CLRF       CCPR1L+0
;awul 01.c,110 :: 		CCPR2L = 250;
	MOVLW      250
	MOVWF      CCPR2L+0
;awul 01.c,114 :: 		}
	GOTO       L_line_following21
L_line_following20:
;awul 01.c,116 :: 		else if(PORTB==0b11100000){  //right 1
	MOVF       PORTB+0, 0
	XORLW      224
	BTFSS      STATUS+0, 2
	GOTO       L_line_following22
;awul 01.c,117 :: 		PORTD = 0b10000000;
	MOVLW      128
	MOVWF      PORTD+0
;awul 01.c,118 :: 		CCPR1L = 250;
	MOVLW      250
	MOVWF      CCPR1L+0
;awul 01.c,119 :: 		CCPR2L = 0;
	CLRF       CCPR2L+0
;awul 01.c,122 :: 		}
	GOTO       L_line_following23
L_line_following22:
;awul 01.c,124 :: 		else if(PORTB==0b01111000){  //left 2
	MOVF       PORTB+0, 0
	XORLW      120
	BTFSS      STATUS+0, 2
	GOTO       L_line_following24
;awul 01.c,125 :: 		PORTD = 0b00100000;
	MOVLW      32
	MOVWF      PORTD+0
;awul 01.c,126 :: 		CCPR1L = 0;
	CLRF       CCPR1L+0
;awul 01.c,127 :: 		CCPR2L = 255;
	MOVLW      255
	MOVWF      CCPR2L+0
;awul 01.c,131 :: 		}
	GOTO       L_line_following25
L_line_following24:
;awul 01.c,133 :: 		else if(PORTB==0b11110000){  //right 2
	MOVF       PORTB+0, 0
	XORLW      240
	BTFSS      STATUS+0, 2
	GOTO       L_line_following26
;awul 01.c,134 :: 		PORTD = 0b10000000;
	MOVLW      128
	MOVWF      PORTD+0
;awul 01.c,135 :: 		CCPR1L = 255;
	MOVLW      255
	MOVWF      CCPR1L+0
;awul 01.c,136 :: 		CCPR2L = 0;
	CLRF       CCPR2L+0
;awul 01.c,140 :: 		}
	GOTO       L_line_following27
L_line_following26:
;awul 01.c,141 :: 		else if(PORTB==0b00011000){  //left 1
	MOVF       PORTB+0, 0
	XORLW      24
	BTFSS      STATUS+0, 2
	GOTO       L_line_following28
;awul 01.c,142 :: 		PORTD = 0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;awul 01.c,143 :: 		CCPR1L = 110;
	MOVLW      110
	MOVWF      CCPR1L+0
;awul 01.c,144 :: 		CCPR2L = 255;
	MOVLW      255
	MOVWF      CCPR2L+0
;awul 01.c,148 :: 		}
	GOTO       L_line_following29
L_line_following28:
;awul 01.c,150 :: 		else if(PORTB==0b11000000){  //right 1
	MOVF       PORTB+0, 0
	XORLW      192
	BTFSS      STATUS+0, 2
	GOTO       L_line_following30
;awul 01.c,151 :: 		PORTD = 0b10010000;
	MOVLW      144
	MOVWF      PORTD+0
;awul 01.c,152 :: 		CCPR1L = 255;
	MOVLW      255
	MOVWF      CCPR1L+0
;awul 01.c,153 :: 		CCPR2L = 110;
	MOVLW      110
	MOVWF      CCPR2L+0
;awul 01.c,157 :: 		}
	GOTO       L_line_following31
L_line_following30:
;awul 01.c,159 :: 		else if(PORTB==0b10001000){  //y juntion
	MOVF       PORTB+0, 0
	XORLW      136
	BTFSS      STATUS+0, 2
	GOTO       L_line_following32
;awul 01.c,160 :: 		PORTD = 0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,161 :: 		CCPR1L = 250;
	MOVLW      250
	MOVWF      CCPR1L+0
;awul 01.c,162 :: 		CCPR2L = 250;
	MOVLW      250
	MOVWF      CCPR2L+0
;awul 01.c,166 :: 		}
	GOTO       L_line_following33
L_line_following32:
;awul 01.c,168 :: 		else if(PORTB==0b10000000){  //y juntion
	MOVF       PORTB+0, 0
	XORLW      128
	BTFSS      STATUS+0, 2
	GOTO       L_line_following34
;awul 01.c,169 :: 		PORTD = 0b10000000;
	MOVLW      128
	MOVWF      PORTD+0
;awul 01.c,170 :: 		CCPR1L = 250;
	MOVLW      250
	MOVWF      CCPR1L+0
;awul 01.c,171 :: 		CCPR2L = 0;
	CLRF       CCPR2L+0
;awul 01.c,175 :: 		}
	GOTO       L_line_following35
L_line_following34:
;awul 01.c,177 :: 		else if(PORTB==0b00001000){  //y juntion
	MOVF       PORTB+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_line_following36
;awul 01.c,178 :: 		PORTD = 0b00100000;
	MOVLW      32
	MOVWF      PORTD+0
;awul 01.c,179 :: 		CCPR1L = 0;
	CLRF       CCPR1L+0
;awul 01.c,180 :: 		CCPR2L = 250;
	MOVLW      250
	MOVWF      CCPR2L+0
;awul 01.c,184 :: 		}
	GOTO       L_line_following37
L_line_following36:
;awul 01.c,186 :: 		else if(PORTB==0b01100000){  //
	MOVF       PORTB+0, 0
	XORLW      96
	BTFSS      STATUS+0, 2
	GOTO       L_line_following38
;awul 01.c,187 :: 		PORTD = 0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;awul 01.c,188 :: 		CCPR1L = 255;
	MOVLW      255
	MOVWF      CCPR1L+0
;awul 01.c,189 :: 		CCPR2L = 255;
	MOVLW      255
	MOVWF      CCPR2L+0
;awul 01.c,193 :: 		}
	GOTO       L_line_following39
L_line_following38:
;awul 01.c,195 :: 		else if(PORTB==0b00110000){  //
	MOVF       PORTB+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_line_following40
;awul 01.c,196 :: 		PORTD = 0b10010000;
	MOVLW      144
	MOVWF      PORTD+0
;awul 01.c,197 :: 		CCPR1L = 255;
	MOVLW      255
	MOVWF      CCPR1L+0
;awul 01.c,198 :: 		CCPR2L = 255;
	MOVLW      255
	MOVWF      CCPR2L+0
;awul 01.c,202 :: 		}
	GOTO       L_line_following41
L_line_following40:
;awul 01.c,204 :: 		else if(PORTB==0b01101000){  //
	MOVF       PORTB+0, 0
	XORLW      104
	BTFSS      STATUS+0, 2
	GOTO       L_line_following42
;awul 01.c,205 :: 		PORTD = 0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;awul 01.c,206 :: 		CCPR1L = 255;
	MOVLW      255
	MOVWF      CCPR1L+0
;awul 01.c,207 :: 		CCPR2L = 255;
	MOVLW      255
	MOVWF      CCPR2L+0
;awul 01.c,210 :: 		}
	GOTO       L_line_following43
L_line_following42:
;awul 01.c,212 :: 		else if(PORTB==0b10110000){  //
	MOVF       PORTB+0, 0
	XORLW      176
	BTFSS      STATUS+0, 2
	GOTO       L_line_following44
;awul 01.c,213 :: 		PORTD = 0b10010000;
	MOVLW      144
	MOVWF      PORTD+0
;awul 01.c,214 :: 		CCPR1L = 255;
	MOVLW      255
	MOVWF      CCPR1L+0
;awul 01.c,215 :: 		CCPR2L = 255;
	MOVLW      255
	MOVWF      CCPR2L+0
;awul 01.c,219 :: 		}
	GOTO       L_line_following45
L_line_following44:
;awul 01.c,221 :: 		else if(PORTB==0b11111000){  //background
	MOVF       PORTB+0, 0
	XORLW      248
	BTFSS      STATUS+0, 2
	GOTO       L_line_following46
;awul 01.c,237 :: 		PORTD = 0b01010000;
	MOVLW      80
	MOVWF      PORTD+0
;awul 01.c,238 :: 		CCPR1L =250;
	MOVLW      250
	MOVWF      CCPR1L+0
;awul 01.c,239 :: 		CCPR2L =250;
	MOVLW      250
	MOVWF      CCPR2L+0
;awul 01.c,244 :: 		}
	GOTO       L_line_following47
L_line_following46:
;awul 01.c,250 :: 		PORTD = 0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,251 :: 		CCPR1L = 120;
	MOVLW      120
	MOVWF      CCPR1L+0
;awul 01.c,252 :: 		CCPR2L = 160;
	MOVLW      160
	MOVWF      CCPR2L+0
;awul 01.c,257 :: 		}
L_line_following47:
L_line_following45:
L_line_following43:
L_line_following41:
L_line_following39:
L_line_following37:
L_line_following35:
L_line_following33:
L_line_following31:
L_line_following29:
L_line_following27:
L_line_following25:
L_line_following23:
L_line_following21:
L_line_following19:
L_line_following17:
L_line_following15:
L_line_following13:
L_line_following11:
L_line_following9:
;awul 01.c,265 :: 		}
	GOTO       L_line_following2
L_line_following3:
;awul 01.c,268 :: 		}
L_end_line_following:
	RETURN
; end of _line_following

_obs_detec:

;awul 01.c,269 :: 		void obs_detec()
;awul 01.c,271 :: 		while(1)
L_obs_detec48:
;awul 01.c,273 :: 		bl=ADC_Read(0);  // adc means analog to digital convertor   0-1024
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _bl+0
	MOVF       R0+1, 0
	MOVWF      _bl+1
;awul 01.c,274 :: 		br=ADC_Read(1);  // adc means analog to digital convertor
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _br+0
	MOVF       R0+1, 0
	MOVWF      _br+1
;awul 01.c,275 :: 		fl=ADC_Read(2);  // adc means analog to digital convertor   0-1024
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _fl+0
	MOVF       R0+1, 0
	MOVWF      _fl+1
;awul 01.c,276 :: 		fr=ADC_Read(3);  // adc means analog to digital convertor
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _fr+0
	MOVF       R0+1, 0
	MOVWF      _fr+1
;awul 01.c,279 :: 		if(PORTB==0b11111000)
	MOVF       PORTB+0, 0
	XORLW      248
	BTFSS      STATUS+0, 2
	GOTO       L_obs_detec50
;awul 01.c,283 :: 		PORTD = 0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,284 :: 		CCPR1L =130;
	MOVLW      130
	MOVWF      CCPR1L+0
;awul 01.c,285 :: 		CCPR2L =160;
	MOVLW      160
	MOVWF      CCPR2L+0
;awul 01.c,286 :: 		Delay_ms(800);
	MOVLW      9
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_obs_detec51:
	DECFSZ     R13+0, 1
	GOTO       L_obs_detec51
	DECFSZ     R12+0, 1
	GOTO       L_obs_detec51
	DECFSZ     R11+0, 1
	GOTO       L_obs_detec51
	NOP
;awul 01.c,288 :: 		PORTD = 0b11110000;
	MOVLW      240
	MOVWF      PORTD+0
;awul 01.c,289 :: 		CCPR1L =130;
	MOVLW      130
	MOVWF      CCPR1L+0
;awul 01.c,290 :: 		CCPR2L =160;
	MOVLW      160
	MOVWF      CCPR2L+0
;awul 01.c,291 :: 		Delay_ms(20000);
	MOVLW      203
	MOVWF      R11+0
	MOVLW      236
	MOVWF      R12+0
	MOVLW      132
	MOVWF      R13+0
L_obs_detec52:
	DECFSZ     R13+0, 1
	GOTO       L_obs_detec52
	DECFSZ     R12+0, 1
	GOTO       L_obs_detec52
	DECFSZ     R11+0, 1
	GOTO       L_obs_detec52
	NOP
;awul 01.c,293 :: 		}
L_obs_detec50:
;awul 01.c,305 :: 		if(fl > 250 && fr < 250 )
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _fl+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec84
	MOVF       _fl+0, 0
	SUBLW      250
L__obs_detec84:
	BTFSC      STATUS+0, 0
	GOTO       L_obs_detec55
	MOVLW      128
	XORWF      _fr+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec85
	MOVLW      250
	SUBWF      _fr+0, 0
L__obs_detec85:
	BTFSC      STATUS+0, 0
	GOTO       L_obs_detec55
L__obs_detec80:
;awul 01.c,307 :: 		PORTD=0b10010000;
	MOVLW      144
	MOVWF      PORTD+0
;awul 01.c,308 :: 		CCPR1L = 120;
	MOVLW      120
	MOVWF      CCPR1L+0
;awul 01.c,309 :: 		CCPR2L = 140;
	MOVLW      140
	MOVWF      CCPR2L+0
;awul 01.c,313 :: 		}
	GOTO       L_obs_detec56
L_obs_detec55:
;awul 01.c,315 :: 		else if(fl < 250 && fr > 250)
	MOVLW      128
	XORWF      _fl+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec86
	MOVLW      250
	SUBWF      _fl+0, 0
L__obs_detec86:
	BTFSC      STATUS+0, 0
	GOTO       L_obs_detec59
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _fr+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec87
	MOVF       _fr+0, 0
	SUBLW      250
L__obs_detec87:
	BTFSC      STATUS+0, 0
	GOTO       L_obs_detec59
L__obs_detec79:
;awul 01.c,317 :: 		PORTD=0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;awul 01.c,318 :: 		CCPR1L = 120;
	MOVLW      120
	MOVWF      CCPR1L+0
;awul 01.c,319 :: 		CCPR2L = 140;
	MOVLW      140
	MOVWF      CCPR2L+0
;awul 01.c,324 :: 		}
	GOTO       L_obs_detec60
L_obs_detec59:
;awul 01.c,326 :: 		else if(fl > 250 && fr > 250)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _fl+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec88
	MOVF       _fl+0, 0
	SUBLW      250
L__obs_detec88:
	BTFSC      STATUS+0, 0
	GOTO       L_obs_detec63
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _fr+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec89
	MOVF       _fr+0, 0
	SUBLW      250
L__obs_detec89:
	BTFSC      STATUS+0, 0
	GOTO       L_obs_detec63
L__obs_detec78:
;awul 01.c,329 :: 		if(bl < br)
	MOVLW      128
	XORWF      _bl+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _br+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec90
	MOVF       _br+0, 0
	SUBWF      _bl+0, 0
L__obs_detec90:
	BTFSC      STATUS+0, 0
	GOTO       L_obs_detec64
;awul 01.c,331 :: 		PORTD=0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;awul 01.c,332 :: 		CCPR1L = 120;
	MOVLW      120
	MOVWF      CCPR1L+0
;awul 01.c,333 :: 		CCPR2L = 140;
	MOVLW      140
	MOVWF      CCPR2L+0
;awul 01.c,334 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_obs_detec65:
	DECFSZ     R13+0, 1
	GOTO       L_obs_detec65
	DECFSZ     R12+0, 1
	GOTO       L_obs_detec65
	NOP
;awul 01.c,337 :: 		}
	GOTO       L_obs_detec66
L_obs_detec64:
;awul 01.c,339 :: 		else if(br < bl)
	MOVLW      128
	XORWF      _br+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _bl+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec91
	MOVF       _bl+0, 0
	SUBWF      _br+0, 0
L__obs_detec91:
	BTFSC      STATUS+0, 0
	GOTO       L_obs_detec67
;awul 01.c,341 :: 		PORTD=0b10010000;
	MOVLW      144
	MOVWF      PORTD+0
;awul 01.c,342 :: 		CCPR1L = 120;
	MOVLW      120
	MOVWF      CCPR1L+0
;awul 01.c,343 :: 		CCPR2L = 140;
	MOVLW      140
	MOVWF      CCPR2L+0
;awul 01.c,344 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_obs_detec68:
	DECFSZ     R13+0, 1
	GOTO       L_obs_detec68
	DECFSZ     R12+0, 1
	GOTO       L_obs_detec68
	NOP
;awul 01.c,347 :: 		}
L_obs_detec67:
L_obs_detec66:
;awul 01.c,349 :: 		}
	GOTO       L_obs_detec69
L_obs_detec63:
;awul 01.c,351 :: 		else if(bl > 600)
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      _bl+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec92
	MOVF       _bl+0, 0
	SUBLW      88
L__obs_detec92:
	BTFSC      STATUS+0, 0
	GOTO       L_obs_detec70
;awul 01.c,353 :: 		PORTD=0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,354 :: 		CCPR1L = 160;
	MOVLW      160
	MOVWF      CCPR1L+0
;awul 01.c,355 :: 		CCPR2L = 110;
	MOVLW      110
	MOVWF      CCPR2L+0
;awul 01.c,359 :: 		}
	GOTO       L_obs_detec71
L_obs_detec70:
;awul 01.c,360 :: 		else if(br > 600)
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      _br+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec93
	MOVF       _br+0, 0
	SUBLW      88
L__obs_detec93:
	BTFSC      STATUS+0, 0
	GOTO       L_obs_detec72
;awul 01.c,362 :: 		PORTD=0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,363 :: 		CCPR1L = 110;
	MOVLW      110
	MOVWF      CCPR1L+0
;awul 01.c,364 :: 		CCPR2L = 160;
	MOVLW      160
	MOVWF      CCPR2L+0
;awul 01.c,368 :: 		}
	GOTO       L_obs_detec73
L_obs_detec72:
;awul 01.c,382 :: 		PORTD=0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,383 :: 		CCPR1L = 125;
	MOVLW      125
	MOVWF      CCPR1L+0
;awul 01.c,384 :: 		CCPR2L = 160;
	MOVLW      160
	MOVWF      CCPR2L+0
;awul 01.c,386 :: 		if(fl > 100 || fr > 100 )
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _fl+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec94
	MOVF       _fl+0, 0
	SUBLW      100
L__obs_detec94:
	BTFSS      STATUS+0, 0
	GOTO       L__obs_detec77
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _fr+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__obs_detec95
	MOVF       _fr+0, 0
	SUBLW      100
L__obs_detec95:
	BTFSS      STATUS+0, 0
	GOTO       L__obs_detec77
	GOTO       L_obs_detec76
L__obs_detec77:
;awul 01.c,388 :: 		PORTD=0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;awul 01.c,389 :: 		CCPR1L = 120;
	MOVLW      120
	MOVWF      CCPR1L+0
;awul 01.c,390 :: 		CCPR2L = 120;
	MOVLW      120
	MOVWF      CCPR2L+0
;awul 01.c,391 :: 		}
L_obs_detec76:
;awul 01.c,392 :: 		}
L_obs_detec73:
L_obs_detec71:
L_obs_detec69:
L_obs_detec60:
L_obs_detec56:
;awul 01.c,398 :: 		}
	GOTO       L_obs_detec48
;awul 01.c,399 :: 		}
L_end_obs_detec:
	RETURN
; end of _obs_detec
