/* settings
 *  clock 1.2 mhz
 *  bod 4.3v
 *  
 *
 *
             ______________
 <----Reset--| ( )        |----VCC---->
 <----A3  3--|            |----2 A1--->
 <----A2  4--|            |----1 PWM-->
 <----GND  --|            |----0 PWM-->
 <-----------|____________|
 There are two analog outputs 0,1 (PWM) we use these for send variable random output to the leds connected to these two pins
 The ATTINY85 can be powered by up to a 5V source
 *
 *see https://www.instructables.com/15-Dollar-Attiny85-HOW-TO-PROGRAM-IT/
 *for more information
 */
void setup() {
  // put your setup code here, to run once:
pinMode(0, OUTPUT);
pinMode(1, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
int i=0;
do 
  {
  i = random(255);
  analogWrite(0,i);
    analogWrite(1,255-i);
  delay(300);
  i++;
  }
  while (i<255);
}
