Cir[] cirs=new Cir[9];
Tri[]tris=new Tri[9];
void setup() {
  size (1280, 720);
  //initialize objects by calling the constructor with a for loop
  float a = 0;
  float e = 0;
  for(int i = 0; i < cirs.length; i++)
  {
    cirs[i] = new Cir (a,70);
    a+= 7;
  }
  for(int i = 0; i < cirs.length; i++)
  {
    tris[i] = new Tri (e,30);
    e+=7;
  }
}
void draw(){
  background(255);
  fill(random(170),random(100),random(500),70);
  noStroke();
  triangle(width/2, height/2-30, width/2-40, height/2+40, width/2+40, height/2+40);
  textSize(30);
  textAlign(CENTER);
  text("Press 1 or 2", 1100, 650);
  for(int i=0;i<cirs.length;i++){
  cirs[i].display();
  cirs[i].spin(); 
  cirs[i].change();
  }
  for(int i=0;i<tris.length;i++){
  tris[i].display();
  tris[i].spin(); 
  tris[i].change();
  }
}