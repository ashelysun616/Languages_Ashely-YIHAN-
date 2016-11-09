import processing.video.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.*;

float opacity;
float angle;
float jitter;
float k; // 
float p; // number of balls
float l; // speed of trajectory
float a;
float s;
float w;
float e;
float j; // AGE
float g; // ball width
float h; // ball height
float r;
int i; // beat detect sensitivity

boolean v = true;
boolean f = true;


boolean firstTime = true;

int numChars = 56;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
FilePlayer filePlayer;
TickRate rateControl;
AudioOutput out;
//file
String fileName = "333.wav";
//capture
Capture video;
// Previous Frame
PImage prevFrame;
// How different must a pixel be to be a "motion" pixel
float threshold = 80;
ArrayList balls = new ArrayList();
 
 
void setup()
{
  
  size(displayWidth, displayHeight);
 background(255,252,240, 100);
  minim = new Minim(this);
  frameRate( 60 );
  smooth();
song = minim.loadFile("333.wav", 2048);
////////
filePlayer = new FilePlayer( minim.loadFileStream(fileName));
filePlayer.loop();
rateControl = new TickRate(1.f);
out = minim.getLineOut();
filePlayer.patch(rateControl).patch(out);
///////
video = new Capture(this, width, height);
video.start();
prevFrame = createImage(video.width, video.height, RGB);
//////
song.setGain(0);
beat = new BeatDetect(song.bufferSize(), song.sampleRate()); 
  beat.setSensitivity(0);
  bl = new BeatListener(beat, song);
    song.play();
    song.loop();
    song.setGain(-10);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate()); 
  bl = new BeatListener(beat, song); 
  k = 5;
  p = 10;
  l = 40;
  a = 0;
  s = 0;
  j = 2;
  i = 5;
  w = height/2;
  e = width/2;
  v = false;
  f = false;
}
 void captureEvent(Capture video) {
// Save previous frame for motion detection!!
prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width*4/5,
video.height*4/5);
prevFrame.updatePixels();
video.read();
}
void draw()
{
image(video, 0, 0);
loadPixels();
video.loadPixels();
prevFrame.loadPixels();
// Begin loop to walk through every pixel
// Start with a total of 0
float totalMotion = 0;
// Sum the brightness of each pixel
for (int i = 0; i < video.pixels.length/3; i++) {
color current = video.pixels[i];
// Step 2: What is the current color?
color previous = prevFrame.pixels[i];
// Step 3: What is the previous color?
// Step 4: Compare colors (previous vs. current)
float r1 = red(current);
float g1 = green(current);
float b1 = blue(current);
float r2 = red(previous);
float g2 = green(previous);
float b2 = blue(previous);
float diff = dist(r1, g1, b1, r2, g2, b2);
totalMotion+=diff;
}
float avgMotion = totalMotion / video.pixels.length/2;
// Draw a circle based on average motion
fill(255,255,255,40);
noStroke();
float r = avgMotion * 5;
float rate = r/100;  
rateControl.value.setLastValue(rate);
//float dB =r/10;
//float dB = map(mouseX, 0, r, -6, 6);
  //gain.setValue(dB);
println(r);
ellipse(width/2, height/2, r, r);
////////////////
  // use the mix buffer to draw the waveforms.
  // because these are MONO files, we could have used the left or right buffers and got the same data
  boolean kick = beat.isKick();
  boolean hat = beat.isHat();
  boolean snare = beat.isSnare();
  if( beat.isRange( 3, 15, i ) )
  {
    color col = color( random( 125, 200 ), random( 125, 200 ), random( 125, 200) );
    if( v == false)
    {
      
    for( int j = 0; j < abs(song.mix.level()*p); j++ )
    {
    float y = random(height);
    float x = random(width);
      for (int i = 0; i < abs(song.mix.level()*k); i++)
      {
        balls.add( new Ball( x, y, song.mix.get(0)*l, col,r/3 ) );
      }
    }
  }
  if( v == true)
  {
    for( int j = 0; j < abs(song.mix.level()*p); j++ )
    {
    float y = w;
    float x = e;
      for (int i = 0; i < abs(song.mix.level()*k); i++)
      {
        balls.add( new Ball( x, y, song.mix.get(0)*l, col,r/3) );
      }
    }
  }
  }  
  for( int i = 0; i < balls.size(); i++ )
  {
    Ball b = (Ball)balls.get(i);
    b.update();
    if( !b.alive )
    {
      balls.remove( b );
      i--;
    }
  }
}

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
 
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
 
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
 
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}