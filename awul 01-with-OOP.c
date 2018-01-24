int count=0;                                                                                         int count=0;

int bl=0,br=0,fl=0,fr=0;

ADC_Init();

class line_following();

class obs_detec();

//void white_area();


void main() {


TRISB = 0b11111000; // portB set inputs (front sener panal)

PORTB = 0x00;

TRISC = 0x00; // portC set outputs (pwm)

PORTC = 0b00000110;

TRISD = 0x00; // portD set outputs (moter controller)

PORTD = 0x00;

TRISE = 0b011; // portE set inputs (back senser panel)

PORTE = 0b000;


 ADCON0 = 0b11010001; // set analog

 ADCON1 = 0b10000000;

 TRISA = 0b00001111;


PR2 = 0X7C; // PWM s are on

T2CON = 0X05; // aduma wm rate aka = 110

CCP1CON = 0X0C;

CCP2CON = 0X3C;


while(1)

{

 line_following();

 obs_detec();

// white_area();



}

}


class line_following(){



while(1){


  if(PORTB==0b00000000){ //

   PORTD = 0b11110000;

   CCPR1L = 130;

   CCPR2L = 160;

    Delay_ms(100);



   PORTD = 0b10100000;

   CCPR1L = 130;

   CCPR2L = 160;

    Delay_ms(200);


   PORTD = 0b11110000;

   CCPR1L = 130;

   CCPR2L = 160;

    Delay_ms(100);

    if(PORTB==0b00000000){ // go to obs....


    break;


    }

  }



  else if(PORTB==0b11011000){ //go ahead

   PORTD = 0b10100000;

   CCPR1L = 255;

   CCPR2L = 255;


  }


   else if(PORTB==0b10011000){ //smooth left 1

   PORTD = 0b10100000;

   CCPR1L = 140;

   CCPR2L = 250;




  }


  else if(PORTB==0b11001000){ //smooth right 1

   PORTD = 0b10100000;

   CCPR1L = 250;

   CCPR2L = 140;



  }


    else if(PORTB==0b10111000){ //smooth left 2

   PORTD = 0b10100000;

   CCPR1L = 110;

   CCPR2L = 250;



  }


  else if(PORTB==0b11101000){ //smooth right 2

   PORTD = 0b10100000;

   CCPR1L = 250;

   CCPR2L = 110;



  }


    else if(PORTB==0b00111000){ //left 1

   PORTD = 0b00100000;

   CCPR1L = 0;

   CCPR2L = 250;




  }


  else if(PORTB==0b11100000){ //right 1

   PORTD = 0b10000000;

   CCPR1L = 250;

   CCPR2L = 0;



  }


   else if(PORTB==0b01111000){ //left 2

   PORTD = 0b00100000;

   CCPR1L = 0;

   CCPR2L = 255;




  }


  else if(PORTB==0b11110000){ //right 2

   PORTD = 0b10000000;

   CCPR1L = 255;

   CCPR2L = 0;




  }

  else if(PORTB==0b00011000){ //left 1

  PORTD = 0b01100000;

  CCPR1L = 110;

  CCPR2L = 255;




  }


  else if(PORTB==0b11000000){ //right 1

   PORTD = 0b10010000;

   CCPR1L = 255;

   CCPR2L = 110;




  }


  else if(PORTB==0b10001000){ //y juntion

   PORTD = 0b10100000;

   CCPR1L = 250;

   CCPR2L = 250;




  }


  else if(PORTB==0b10000000){ //y juntion

    PORTD = 0b10000000;

    CCPR1L = 250;

    CCPR2L = 0;




  }


  else if(PORTB==0b00001000){ //y juntion

    PORTD = 0b00100000;

    CCPR1L = 0;

    CCPR2L = 250;




            }


   else if(PORTB==0b01100000){ //

       PORTD = 0b01100000;

       CCPR1L = 255;

       CCPR2L = 255;




       }


   else if(PORTB==0b00110000){ //

       PORTD = 0b10010000;

       CCPR1L = 255;

       CCPR2L = 255;




       }


       else if(PORTB==0b01101000){ //

       PORTD = 0b01100000;

       CCPR1L = 255;

       CCPR2L = 255;



       }


       else if(PORTB==0b10110000){ //

       PORTD = 0b10010000;

       CCPR1L = 255;

       CCPR2L = 255;




       }


       else if(PORTB==0b11111000){ //background

       

      /* if(count>=1){

PORTD = 0b10100000;

CCPR1L =130;

CCPR2L =160;

Delay_ms(800);

PORTD = 0b11110000;

CCPR1L =130;

CCPR2L =160;

Delay_ms(20000);

}

else if(count<1){ */

       PORTD = 0b01010000;

       CCPR1L =250;

       CCPR2L =250;

       

     // }

                   

                   

       }




 else{


        PORTD = 0b10100000;

        CCPR1L = 120;

        CCPR2L = 160;





       }








 }



 }

class obs_detec()

{

while(1)

{

bl=ADC_Read(0); // adc means analog to digital convertor 0-1024

br=ADC_Read(1); // adc means analog to digital convertor

fl=ADC_Read(2); // adc means analog to digital convertor 0-1024

fr=ADC_Read(3); // adc means analog to digital convertor



 if(PORTB==0b11111000)

 { /*count=count+1;

break;*/


       PORTD = 0b10100000;

       CCPR1L =130;

       CCPR2L =160;

       Delay_ms(800);


       PORTD = 0b11110000;

       CCPR1L =130;

       CCPR2L =160;

       Delay_ms(20000);


 }

 /* else if(PORTB==0b11111000 && PORTE==0b11)

{

PORTD=0b10100000;

CCPR1L = 125;

CCPR2L = 160;

Delay_ms(200);

PORTD=0b11110000;

CCPR1L = 125;

CCPR2L = 160;

} */


if(fl > 250 && fr < 250 )

  {

  PORTD=0b10010000;

  CCPR1L = 120;

  CCPR2L = 140;




 }


 else if(fl < 250 && fr > 250)

  {

  PORTD=0b01100000;

  CCPR1L = 120;

  CCPR2L = 140;





 }


 else if(fl > 250 && fr > 250)

  {


  if(bl < br)

  {

  PORTD=0b01100000;

  CCPR1L = 120;

  CCPR2L = 140;

    Delay_ms(10);



  }


  else if(br < bl)

  {

  PORTD=0b10010000;

  CCPR1L = 120;

  CCPR2L = 140;

    Delay_ms(10);



 }


 }


  else if(bl > 600)

  {

  PORTD=0b10100000;

  CCPR1L = 160;

  CCPR2L = 110;




 }

  else if(br > 600)

  {

  PORTD=0b10100000;

  CCPR1L = 110;

  CCPR2L = 160;




 }


 /*else if(PORTB==0b11111000 && PORTE==0b11){

PORTD=0b11110000;

CCPR1L = 120;

CCPR2L = 120;

}

*/



  else

  {

  PORTD=0b10100000;

  CCPR1L = 125;

  CCPR2L = 160;


  if(fl > 100 || fr > 100 )

  {

  PORTD=0b10100000;

  CCPR1L = 120;

  CCPR2L = 120;

  }

 }






}

}

/*

void white_area(){

if(PORTB==0b11111000){ // && PORTE==0b11

PORTD=0b11110000;

CCPR1L = 120;

CCPR2L = 120;

}

else {

PORTD=0b10100000;

CCPR1L = 130;

CCPR2L = 160;

}

} */



int bl=0,br=0,fl=0,fr=0;

ADC_Init();

class line_following();

class obs_detec();

//void white_area();


void main() {


TRISB = 0b11111000; // portB set inputs (front sener panal)

PORTB = 0x00;

TRISC = 0x00; // portC set outputs (pwm)

PORTC = 0b00000110;

TRISD = 0x00; // portD set outputs (moter controller)

PORTD = 0x00;

TRISE = 0b011; // portE set inputs (back senser panel)

PORTE = 0b000;


 ADCON0 = 0b11010001; // set analog

 ADCON1 = 0b10000000;

 TRISA = 0b00001111;


PR2 = 0X7C; // PWM s are on

T2CON = 0X05; // aduma wm rate aka = 110

CCP1CON = 0X0C;

CCP2CON = 0X3C;


while(1)

{

 line_following();

 obs_detec();

// white_area();



}

}


class line_following(){



while(1){


  if(PORTB==0b00000000){ //

   PORTD = 0b11110000;

   CCPR1L = 130;

   CCPR2L = 160;

    Delay_ms(100);



   PORTD = 0b10100000;

   CCPR1L = 130;

   CCPR2L = 160;

    Delay_ms(200);


   PORTD = 0b11110000;

   CCPR1L = 130;

   CCPR2L = 160;

    Delay_ms(100);

    if(PORTB==0b00000000){ // go to obs....


    break;


    }

  }



  else if(PORTB==0b11011000){ //go ahead

   PORTD = 0b10100000;

   CCPR1L = 255;

   CCPR2L = 255;


  }


   else if(PORTB==0b10011000){ //smooth left 1

   PORTD = 0b10100000;

   CCPR1L = 140;

   CCPR2L = 250;




  }


  else if(PORTB==0b11001000){ //smooth right 1

   PORTD = 0b10100000;

   CCPR1L = 250;

   CCPR2L = 140;



  }


    else if(PORTB==0b10111000){ //smooth left 2

   PORTD = 0b10100000;

   CCPR1L = 110;

   CCPR2L = 250;



  }


  else if(PORTB==0b11101000){ //smooth right 2

   PORTD = 0b10100000;

   CCPR1L = 250;

   CCPR2L = 110;



  }


    else if(PORTB==0b00111000){ //left 1

   PORTD = 0b00100000;

   CCPR1L = 0;

   CCPR2L = 250;




  }


  else if(PORTB==0b11100000){ //right 1

   PORTD = 0b10000000;

   CCPR1L = 250;

   CCPR2L = 0;



  }


   else if(PORTB==0b01111000){ //left 2

   PORTD = 0b00100000;

   CCPR1L = 0;

   CCPR2L = 255;




  }


  else if(PORTB==0b11110000){ //right 2

   PORTD = 0b10000000;

   CCPR1L = 255;

   CCPR2L = 0;




  }

  else if(PORTB==0b00011000){ //left 1

  PORTD = 0b01100000;

  CCPR1L = 110;

  CCPR2L = 255;




  }


  else if(PORTB==0b11000000){ //right 1

   PORTD = 0b10010000;

   CCPR1L = 255;

   CCPR2L = 110;




  }


  else if(PORTB==0b10001000){ //y juntion

   PORTD = 0b10100000;

   CCPR1L = 250;

   CCPR2L = 250;




  }


  else if(PORTB==0b10000000){ //y juntion

    PORTD = 0b10000000;

    CCPR1L = 250;

    CCPR2L = 0;




  }


  else if(PORTB==0b00001000){ //y juntion

    PORTD = 0b00100000;

    CCPR1L = 0;

    CCPR2L = 250;




            }


   else if(PORTB==0b01100000){ //

       PORTD = 0b01100000;

       CCPR1L = 255;

       CCPR2L = 255;




       }


   else if(PORTB==0b00110000){ //

       PORTD = 0b10010000;

       CCPR1L = 255;

       CCPR2L = 255;




       }


       else if(PORTB==0b01101000){ //

       PORTD = 0b01100000;

       CCPR1L = 255;

       CCPR2L = 255;



       }


       else if(PORTB==0b10110000){ //

       PORTD = 0b10010000;

       CCPR1L = 255;

       CCPR2L = 255;




       }


       else if(PORTB==0b11111000){ //background

       

      /* if(count>=1){

PORTD = 0b10100000;

CCPR1L =130;

CCPR2L =160;

Delay_ms(800);

PORTD = 0b11110000;

CCPR1L =130;

CCPR2L =160;

Delay_ms(20000);

}

else if(count<1){ */

       PORTD = 0b01010000;

       CCPR1L =250;

       CCPR2L =250;

       

     // }

                   

                   

       }




 else{


        PORTD = 0b10100000;

        CCPR1L = 120;

        CCPR2L = 160;





       }








 }



 }

class obs_detec()

{

while(1)

{

bl=ADC_Read(0); // adc means analog to digital convertor 0-1024

br=ADC_Read(1); // adc means analog to digital convertor

fl=ADC_Read(2); // adc means analog to digital convertor 0-1024

fr=ADC_Read(3); // adc means analog to digital convertor



 if(PORTB==0b11111000)

 { /*count=count+1;

break;*/


       PORTD = 0b10100000;

       CCPR1L =130;

       CCPR2L =160;

       Delay_ms(800);


       PORTD = 0b11110000;

       CCPR1L =130;

       CCPR2L =160;

       Delay_ms(20000);


 }

 /* else if(PORTB==0b11111000 && PORTE==0b11)

{

PORTD=0b10100000;

CCPR1L = 125;

CCPR2L = 160;

Delay_ms(200);

PORTD=0b11110000;

CCPR1L = 125;

CCPR2L = 160;

} */


if(fl > 250 && fr < 250 )

  {

  PORTD=0b10010000;

  CCPR1L = 120;

  CCPR2L = 140;




 }


 else if(fl < 250 && fr > 250)

  {

  PORTD=0b01100000;

  CCPR1L = 120;

  CCPR2L = 140;





 }


 else if(fl > 250 && fr > 250)

  {


  if(bl < br)

  {

  PORTD=0b01100000;

  CCPR1L = 120;

  CCPR2L = 140;

    Delay_ms(10);



  }


  else if(br < bl)

  {

  PORTD=0b10010000;

  CCPR1L = 120;

  CCPR2L = 140;

    Delay_ms(10);



 }


 }


  else if(bl > 600)

  {

  PORTD=0b10100000;

  CCPR1L = 160;

  CCPR2L = 110;




 }

  else if(br > 600)

  {

  PORTD=0b10100000;

  CCPR1L = 110;

  CCPR2L = 160;




 }


 /*else if(PORTB==0b11111000 && PORTE==0b11){

PORTD=0b11110000;

CCPR1L = 120;

CCPR2L = 120;

}

*/



  else

  {

  PORTD=0b10100000;

  CCPR1L = 125;

  CCPR2L = 160;


  if(fl > 100 || fr > 100 )

  {

  PORTD=0b10100000;

  CCPR1L = 120;

  CCPR2L = 120;

  }

 }






}

}

/*

void white_area(){

if(PORTB==0b11111000){ // && PORTE==0b11

PORTD=0b11110000;

CCPR1L = 120;

CCPR2L = 120;

}

else {

PORTD=0b10100000;

CCPR1L = 130;

CCPR2L = 160;

}

} */