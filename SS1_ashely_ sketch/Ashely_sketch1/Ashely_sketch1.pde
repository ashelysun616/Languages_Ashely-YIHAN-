//this is a cat
void setup(){
size (1080,720);
}
void draw(){
  background (0,0,0);
//cat body
fill (255,255,255);
stroke(0);
strokeWeight(8);
triangle(0,0,120,120,0,240);
triangle(240,0,120,120,240,240);
quad(120,120,240,240,120,360,0,240);
triangle(180,320,80,420,180,520);
triangle(180,320,340,460,180,700);
triangle(50,720,340,460,340,720);
quad(340,720,460,720,550,630,430,630);
noFill();
fill (255,0,0);
ellipse(550,630,50,50);
noFill();
//cat face
strokeWeight(5);
fill (255,255,255);
triangle(480,0,720,0,600,120);
triangle(480,240,720,240,600,120);
quad(600,120,720,0,840,120,720,240);
//face 2
strokeWeight(3);
triangle(1080,360,960,480,1080,600);
triangle(960,480,840,600,840,360);
quad(960,480,840,600,960,720,1080,600);
//line
stroke(  255 ,99 ,71);
strokeWeight(6);
line(780,0,900,120);
line(780,240,900,120);
stroke(  255 ,69, 0);
strokeWeight(8);
line(840,0,960,120);
line(840,240,960,120);
strokeWeight(10);
stroke(  255 ,0, 0);
line(900,0,1020,120);
line(900,240,1020,120);
stroke(  255 ,255, 255);
strokeWeight(3);
rect (995,95,45,45,15,0,15,0);
}