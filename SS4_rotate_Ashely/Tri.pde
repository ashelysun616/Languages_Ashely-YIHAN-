class Tri{
float e = 1;
float col=random(80,90);
float r=random(0,100);
float g=random(100,160);
float b=random(0,140);
float d=15;
float x2;
float y2;
float diameter;
//constructor 
  Tri(float start,float tempDiameter)
 {
   e = start;  
   diameter=tempDiameter;
 }
 void display(){
 fill(g,b,r,col);
 noStroke();
 triangle((width/2)+x2, (height/2)+y2-d,(width/2)+x2+15, (height/2)+y2-35, (width/2)+x2-35, (height/2)+y2-30);
}
 void spin()
 {
 x2 = sin(e) * 300;
 y2 = cos(e) * 300;
 e = e + 0.03;
 }
void change(){
  if (keyPressed) {
      if (key== '1') {
        d++;
      } else if (key=='2') {
        d--;
      }
    }
}
}
  
  
  
  
  
  
  
  
  
  
 