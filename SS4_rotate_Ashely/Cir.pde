class Cir{
float a = 1;
float col=random(70,90);
float r=random(10,190);
float g=random(100,220);
float b=random(2,100);
float x1;
float y1;
float diameter;
//constructor 
  Cir(float start,float tempDiameter)
 {
   a = start;  
   diameter=tempDiameter;
 }
 void display(){
 fill(r,g,b,col);
 noStroke();
 ellipse ((width/2)+x1, (height/2)+y1, diameter,diameter); 
 fill(g,b,r,col);
 ellipse ((width/2)+x1, (height/2)+y1, 20+diameter,20+diameter);  
}
 void spin()
 {
 x1 = sin(a) * 200;
 y1 = cos(a) * 200;
 a = a + 0.01;
 }
void change(){
  if (keyPressed) {
      if (key== '1') {
        diameter++;
      } else if (key=='2') {
        diameter--;
      }
    }
}
}
  
  
  
  
  
  
  
  
  
  
 