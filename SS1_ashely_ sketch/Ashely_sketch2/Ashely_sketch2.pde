void setup(){
//this is a cat
size (1080,720);
//background(r,g,b)
//background (255,255,255);
}
void draw(){
  background (255,255,255);
//face
rect (601,120,250,150,20,20,3,3);
fill (162,162,162);
stroke(255);
triangle(600,120,725,120,600,220);
triangle(850,120,725,120,850,220);
noFill();

stroke(0);
ellipse(663,230, 55, 55);
ellipse(787,230, 55, 55);
fill (0);
ellipse(787,230, 20, 20);
ellipse(663,230, 20, 20);
noFill();


//body
fill (255);
stroke(162);
strokeWeight(2);
rect (400,300,200,135,0,0,20,30);
noFill();



fill (0);
stroke(255);
strokeWeight(3);
rect (370,300,30,90,20,0,0,20);
quad(600,270,600,450,700,460,700,360);
quad(700,360,700,450,790,430,790,340);
line(600,220,400,300);

strokeWeight(3);
line(600,460,600,220);
triangle(600,220,400,300,600,300);

//face
stroke(0);
strokeWeight(1);
fill (255);
arc(725,270,250,180,0,PI,CHORD);
line(725,270,725,360);
line(685,270,685,353);
line(645,270,645,343);
line(765,270,765,353);
line(805,270,805,339);
noFill();
}