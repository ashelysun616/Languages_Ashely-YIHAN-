public class Ball
{
  PVector loc = new PVector();
  PVector speed = new PVector( random( -2, 2 ), random( -2, 2 ) );
  color col;
  boolean alive = true;
  int age = 0;
  float diameter;
  Ball( float x, float y, float mag, color col,float tempDiameter)
  {
    loc.x = x;
    loc.y = y;
    speed.normalize();
    speed.mult( mag );
    this.col = col;
    diameter= tempDiameter;
  }
 
  public void update()
  {
    age += j;
    speed.y += a;
    speed.x += s;
    loc.add( speed );
    if( loc.y > height || age >= 255 )
      alive = false;
    fill( red(col), blue(col), green(col), 255 - age );
    noStroke();
    ellipse( loc.x, loc.y,diameter, diameter);
  }
}