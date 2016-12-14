SunLine[] Lines = new SunLine[300];

void setup() {
  size(500, 500);
  colorMode(HSB);
  for (int i = 0;i<Lines.length;i=i+1) {
    Lines[i] = new SunLine(random(width), random(height), 3);
  }
}

void draw() {
  background(0);
  for (int i = 0;i<Lines.length;i=i+1) {
    Lines[i].render();
    Lines[i].shine();
    Lines[i].constrainRange();
  }
}

class SunLine {
  float x;
  float y;
  float yOff;

  SunLine(float x, float y, float yOff) {
    this.x = x;
    this.y = y;
    this.yOff = yOff;
  }

  void render() {
    fill(random(50,200),200,200,90);
    //noStroke();
    //ellipse(x, y, 5, 5);
    stroke(255);
    line(0,height,x,y);
  }

  void shine() {
    y = y+yOff;
  }

  void constrainRange() {
    if (y>height+50) {
      y=-100;
    }
  }
}