import processing.video.*;
// Variable for capture device
Capture video;
Movie mov;
// Previous Frame
PImage prevFrame;
// How different must a pixel be to be a "motion" pixel
float threshold = 50;
void setup() {
size(320, 240);
// Using the default capture device
mov = new Movie(this, "ss55.mp4");
mov.loop();
video = new Capture(this, width/2, height);
video.start();
// Create an empty image the same size as the video
prevFrame = createImage(video.width/2, video.height, RGB);
}
// New frame available from camera
void captureEvent(Capture video) {
// Save previous frame for motion detection!!
prevFrame.copy(video, 0, 0, video.width/2, video.height, 0, 0, video.width/2,
video.height);
prevFrame.updatePixels();
video.read();
}
void movieEvent(Movie movie) {
mov.read();  
}
void draw() {
background(0); 
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
fill(0,0,0,40);
noStroke();
float r = avgMotion * 5;
image(mov, 160, 0,160,240);  
float newSpeed = map(r*2, 0, width/2, 0.5, 2);
mov.speed(newSpeed); 
text(nfc(newSpeed, 2) + "X", 10, 30); 
ellipse(240, height/2, r, r);
}