boolean button = false;
int ly=380;
int spacing=80;
int len=50;
float a=50;
float b=600;
float k;
float f;
float c;
float z=210;
float value=0;
float x=mouseX;
float y=mouseY;
float w;
float g=800;
float h1=100;
float speed1=5;
float speed2=7;
float easing = 0.1;
int num =15;
float mx[] = new float[num];
float my[] = new float[num];

void setup(){
  size(1080,720);
  smooth(); 
}

void draw(){
  background(255); 
  stroke(122);
  strokeWeight(5);
 for (int lx = 0; lx <= 1080; lx += spacing) {
line(lx, ly, lx+len, ly);
}
  if (dist(a,b,x,y)<50) {  
    gameover();  
  } 
/////// hide
  else if (button) 
{
a = a + speed2;
if (a>1080) {
    a=0;
    b=random(460,620);
    speed2=random(4,10);
  }
}
  stroke(255,0,0);
  strokeWeight(3);
  line(a,b,a-50,b-50);
  line(a,b,a-50,b+50);
  line(a-50,b,a-100,b-50);
  line(a-50,b,a-100,b+50);
  line(a+50,b,a,b-50);
  line(a+50,b,a,b+50);

////////easing the ellipse
  float dx = mouseX - x;
  x += dx * easing; 
  float dy = mouseY - y;
  y += dy * easing;
  
int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    fill(x,175,y);
    strokeWeight(0);
    ellipse(mx[index]+70, my[index]+50, i, i);
  }

///////////cat body
if(y>450)  
  {
fill(0);
stroke(127);
strokeWeight(1);
triangle(x-20,y-60,x,y-40,x-20,y-20);
triangle(x+20,y-60,x,y-40,x+20,y-20);
quad(x,y,x-20,y-20,x,y-40,x+20,y-20);
triangle(x+10,y-10,x-10,y+10,x+10,y+35);
triangle(x+10,y-10,x+40,y+20,x+10,y+50);
triangle(x-10,y+60,x+40,y+20,x+40,y+60);
quad(x+40,y+60,x+60,y+60,x+70,y+50,x+50,y+50);
  }
  
////////////fly ball
if(y>360)  
  {
    if (button) 
{
g = g - value;
if (g<0) {
    g=y;
  }
}
stroke(255,235,205);
fill(190,z,240);
if(dist(w,h1,x,g)<50)
  {
   fill(255);
  }
  ellipse(x, g, 32, 32);
  }
  

////////////fly fish  
if(y>400)  
  {
    if (button) 
{
w = w + speed1;
if (w>width) {
    w=0;
    h1=random(40,340);
    speed1=random(4,10);
  }
}
stroke(255);
fill(190,k,240);
 if (h1<=190)
 {
   k=210;
 }
 else if (h1>190)
 {
   k=150;
 }
 
if(dist(w,h1,x,g)<50)
  {
   fill(255);
  }
quad(w, h1, w+50,h1-50,w+100,h1,w+50,h1+50);
quad(w, h1, w-35,h1-35,w-45,h1,w-35,h1+35);
}
}

///////////   
void keyPressed() {
  if (z==210) {
    z =150;
  } else {
    z=210;
  }
}
///////////
void mousePressed()
{
  if(g>=h1)
  {
 value=speed1;  
 button = !button;
  }
  else{
value=0;
  }
}
///////////
void gameover() {  
  fill (240, 40, 40);  
  textSize (65);  
  textAlign(CENTER);  
  text ("Game Over", width/2, height/2);  
  fill (255);  
  textSize (30);  
  text (num, width/2, height/2+100);  
}  