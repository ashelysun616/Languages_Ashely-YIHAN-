void setup(){
 size (800,800);
 background( 255,30,90);
}

  
  
void draw(){
  strokeWeight(6);
  stroke(255);
  line(mouseX,mouseY,pmouseX,pmouseY);
  //pmouse to keep and save point
  stroke(88);
  ellipse(400,400,100,100);
  
  
  
}