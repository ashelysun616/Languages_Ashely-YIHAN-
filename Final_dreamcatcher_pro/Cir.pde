class Cir{
float a = 0;
float col=random(95,100);
float r=random(220,255);
float g=random(220,255);
float b=random(170,255);
float x1;
float y1;
//constructor 
  Cir(float start)
 {
   a = start;  
 }
 void display(){
  fill(r,g,b,col);
 noStroke();
 ellipse ((width/2)+x1, (height/2)+y1-150, 20,20); 
}
 void spin()
 {
 x1 = sin(a) * 194;
 y1 = cos(a) * 194;
 a = a + 0.01;
 }
}
  
  
 