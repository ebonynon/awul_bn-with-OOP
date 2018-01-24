#line 1 "E:/fuseable pro/awul bn/awul 01.c"
int count=0;
int bl=0,br=0,fl=0,fr=0;
ADC_Init();
void line_following();
void obs_detec();


void main() {

TRISB = 0b11111000;
PORTB = 0x00;
TRISC = 0x00;
PORTC = 0b00000110;
TRISD = 0x00;
PORTD = 0x00;
TRISE = 0b011;
PORTE = 0b000;

 ADCON0 = 0b11010001;
 ADCON1 = 0b10000000;
 TRISA = 0b00001111;

PR2 = 0X7C;
T2CON = 0X05;
CCP1CON = 0X0C;
CCP2CON = 0X3C;

while(1)
{
 line_following();
 obs_detec();



}
}

void line_following(){


while(1){

 if(PORTB==0b00000000){
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
 if(PORTB==0b00000000){

 break;

 }
 }


 else if(PORTB==0b11011000){
 PORTD = 0b10100000;
 CCPR1L = 255;
 CCPR2L = 255;

 }

 else if(PORTB==0b10011000){
 PORTD = 0b10100000;
 CCPR1L = 140;
 CCPR2L = 250;



 }

 else if(PORTB==0b11001000){
 PORTD = 0b10100000;
 CCPR1L = 250;
 CCPR2L = 140;


 }

 else if(PORTB==0b10111000){
 PORTD = 0b10100000;
 CCPR1L = 110;
 CCPR2L = 250;


 }

 else if(PORTB==0b11101000){
 PORTD = 0b10100000;
 CCPR1L = 250;
 CCPR2L = 110;


 }

 else if(PORTB==0b00111000){
 PORTD = 0b00100000;
 CCPR1L = 0;
 CCPR2L = 250;



 }

 else if(PORTB==0b11100000){
 PORTD = 0b10000000;
 CCPR1L = 250;
 CCPR2L = 0;


 }

 else if(PORTB==0b01111000){
 PORTD = 0b00100000;
 CCPR1L = 0;
 CCPR2L = 255;



 }

 else if(PORTB==0b11110000){
 PORTD = 0b10000000;
 CCPR1L = 255;
 CCPR2L = 0;



 }
 else if(PORTB==0b00011000){
 PORTD = 0b01100000;
 CCPR1L = 110;
 CCPR2L = 255;



 }

 else if(PORTB==0b11000000){
 PORTD = 0b10010000;
 CCPR1L = 255;
 CCPR2L = 110;



 }

 else if(PORTB==0b10001000){
 PORTD = 0b10100000;
 CCPR1L = 250;
 CCPR2L = 250;



 }

 else if(PORTB==0b10000000){
 PORTD = 0b10000000;
 CCPR1L = 250;
 CCPR2L = 0;



 }

 else if(PORTB==0b00001000){
 PORTD = 0b00100000;
 CCPR1L = 0;
 CCPR2L = 250;



 }

 else if(PORTB==0b01100000){
 PORTD = 0b01100000;
 CCPR1L = 255;
 CCPR2L = 255;



 }

 else if(PORTB==0b00110000){
 PORTD = 0b10010000;
 CCPR1L = 255;
 CCPR2L = 255;



 }

 else if(PORTB==0b01101000){
 PORTD = 0b01100000;
 CCPR1L = 255;
 CCPR2L = 255;


 }

 else if(PORTB==0b10110000){
 PORTD = 0b10010000;
 CCPR1L = 255;
 CCPR2L = 255;



 }

 else if(PORTB==0b11111000){
#line 237 "E:/fuseable pro/awul bn/awul 01.c"
 PORTD = 0b01010000;
 CCPR1L =250;
 CCPR2L =250;




 }



 else{

 PORTD = 0b10100000;
 CCPR1L = 120;
 CCPR2L = 160;




 }







 }


 }
void obs_detec()
{
while(1)
{
bl=ADC_Read(0);
br=ADC_Read(1);
fl=ADC_Read(2);
fr=ADC_Read(3);


 if(PORTB==0b11111000)
#line 281 "E:/fuseable pro/awul bn/awul 01.c"
 {

 PORTD = 0b10100000;
 CCPR1L =130;
 CCPR2L =160;
 Delay_ms(800);

 PORTD = 0b11110000;
 CCPR1L =130;
 CCPR2L =160;
 Delay_ms(20000);

 }
#line 305 "E:/fuseable pro/awul bn/awul 01.c"
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
#line 380 "E:/fuseable pro/awul bn/awul 01.c"
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
