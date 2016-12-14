void ChangeW() {
  noStroke();
  float p=random(60,100);
  //float num1 = offset + sin(angle + 0.4) * scalar;
  frameRate(60);
  //ellipse(1076, 627,d/2+angle, d/2+angle);
  float angle1 = sin(radians(20+frameCount)) * d1/5;
  float angle2 = sin(radians(frameCount)) * d2/5;
  float angle3 = sin(radians(frameCount/3)) * d3/5;
  float angle4 = sin(radians(frameCount/2)) * d3/5;
  fill(220,220,220,p);
  ellipse(550, 652, d1/2+angle1+44, d1/2+angle1+44);
  ellipse(1056, 524, d2/2+angle2, d2/2+angle2);
  ellipse(1095, 153, d3/2+angle3+100, d3/2+angle3+100);
  ellipse(781, 85, d1/2+angle1+64, d1/2+angle1+64);
  ellipse(891, 295, d4+angle4+77, d4+angle4+77);
  ellipse(583, 240, d2/2+angle2, d2/2+angle2); 
  ellipse(707, 470, d3/2+angle3+80, d3/2+angle3+80);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Lover", 550, 658);
  text("Money", 1056, 530); 
  text("Favorite place", 1122, 153); 
  text("Family", 780, 85);   
  text("Flower", 893, 301); 
  text("Beauty", 583, 251);
  text("Childhood", 707, 480);
}