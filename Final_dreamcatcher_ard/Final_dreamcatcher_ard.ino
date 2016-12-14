//strip
#define REDPIN 5
#define GREENPIN 6
#define BLUEPIN 3
#define FADESPEED 5 

char val; // Data received from the serial port
//rgb
int redPin = 7;
int greenPin = 13;
int bluePin =2;
//color sensor
const int s0 = 8;  
const int s1 = 9;  
const int s2 = 12;  
const int s3 = 11;  
const int out = 10; 
int red = 0;  
int green = 0;  
int blue = 0;  
int ar1=0;  
int br1=0; 
int r, g, b;
void setup() {
  Serial.begin(9600);// set up Serial library at 9600 bps
  pinMode(s0, OUTPUT);  
  pinMode(s1, OUTPUT);  
  pinMode(s2, OUTPUT);  
  pinMode(s3, OUTPUT);  
  pinMode(out, INPUT);
  digitalWrite(s0, HIGH);  
  digitalWrite(s1, HIGH);    
  pinMode(REDPIN, OUTPUT);
  pinMode(GREENPIN, OUTPUT);
  pinMode(BLUEPIN, OUTPUT);
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT); 
}

void loop() {
  if (Serial.available() > 0 ) { 
     val = Serial.read(); // read it and store it in val
   }
  num();
  color();
if (val == '0') {      // If 1 was received
  setColor(0,0,0);
   r=11;
   g=11;
   b=11;
   analogWrite(REDPIN, r);
   analogWrite(GREENPIN,g);
   analogWrite(BLUEPIN, b);
   delay(FADESPEED);
///val end     
  }
if (val == '1') {      // If 1 was received
  setColor(160,32,240);
   r=0;
   g=0;
   b=0;
   analogWrite(REDPIN, r);
   analogWrite(GREENPIN,g);
   analogWrite(BLUEPIN, b);
   delay(FADESPEED);
///val end     
  }
else if (val == '2') { 
  setColor(0,0,0);  //rgb purple
// Green  
   r=0;
   g=255;
   b=0;
   analogWrite(REDPIN, r);
   analogWrite(GREENPIN,g);
   analogWrite(BLUEPIN, b);
   delay(FADESPEED);
///val end    
}
else if (val == '3') {
  //blue 
  setColor(0,0,0);  //rgb purple
   r=255;
   g=255;
   b=255;
   analogWrite(REDPIN, r);
   analogWrite(GREENPIN,g);
   analogWrite(BLUEPIN, b);
   delay(FADESPEED); 
///val end    
}
else if (val == '4') {
  //red 
  setColor(0,0,0);  //rgb purple
   r=255;
   g=0;
   b=0;
   analogWrite(REDPIN, r);
   analogWrite(GREENPIN,g);
   analogWrite(BLUEPIN, b);
   delay(FADESPEED);
///val end    
}
else if (val == '5') { 
  //White
  setColor(0,0,0);  //rgb purple
   r=135;
   g=206;
   b=235;
   analogWrite(REDPIN, r);
   analogWrite(GREENPIN,g);
   analogWrite(BLUEPIN, b);
   delay(FADESPEED);
///val end    
}
if (val == '6') {      // If 1 was received
  setColor(160,32,240);
   r=0;
   g=0;
   b=0;
   analogWrite(REDPIN, r);
   analogWrite(GREENPIN,g);
   analogWrite(BLUEPIN, b);
   delay(FADESPEED);
///val end     
  }
if (val == '7') {      // If 1 was received
   setColor(160,32,240);
   r=128;
   g=42;
   b=42;
   analogWrite(REDPIN, r);
   analogWrite(GREENPIN,g);
   analogWrite(BLUEPIN, b);
   delay(FADESPEED);
///val end     
 }
if(val == '8'){
  setColor(160,32,240);
  strip(); 
}

//////loop end
}



void num(){
//Serial.println(ar1); 
delay(300);
if (red < blue && red < green &&blue>5 && green > 10 &&red<20)
  {  // Red Color
   Serial.write(ar1); 
   ar1=3;
  }  
  else if (blue < red && blue < green&& red>0&&blue>0&&green>0&& green<30 &&blue<25)   
  { //  Blue Color   
   Serial.write(ar1); 
   ar1=2;
  }  
  else if (green < red && green < blue&& red>0&&blue>0&&green>0)  
  {  // Green Color  
   Serial.write(ar1); 
   ar1=1;
  }    
  else if (green<4 && red<3 && blue<3)  
  {  // WHITe Color 
   Serial.write(ar1); 
   ar1=4;
  } 
  else if (red < green && red<=blue && blue<10&& green<10&&blue>0)
  { // purple
   Serial.write(ar1); 
   ar1=5;
  }  
  else{
   Serial.write(ar1); 
   ar1=6;
  } 
}
   
 
void color()  
{    
  digitalWrite(s2, LOW);  
  digitalWrite(s3, LOW);  
  //count OUT, pRed, RED  
  red = pulseIn(out, digitalRead(out) == HIGH ? LOW : HIGH);  
  digitalWrite(s3, HIGH);  
  //count OUT, pBLUE, BLUE  
  blue = pulseIn(out, digitalRead(out) == HIGH ? LOW : HIGH);  
  digitalWrite(s2, HIGH);  
  //count OUT, pGreen, GREEN  
  green = pulseIn(out, digitalRead(out) == HIGH ? LOW : HIGH);  
}
void setColor(int redd, int greenn, int bluee)
{
  #ifdef COMMON_ANODE
    redd = 255 - redd;
    greend = 255 - greenn;
    bluee = 255 - bluee;
  #endif
  analogWrite(redPin, redd);
  analogWrite(greenPin, greenn);
  analogWrite(bluePin, bluee);  
}
void strip()
{
   for (r = 0; r < 256; r++) { 
    analogWrite(REDPIN, r);
    delay(FADESPEED);
  } 
  // fade from violet to red
  for (b = 255; b > 0; b--) { 
    analogWrite(BLUEPIN, b);
    delay(FADESPEED);
  }  
}

