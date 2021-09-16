void setup(){
  size(600, 300);
}

void draw(){
  
  // Roterer
  background(100);
  translate(frameCount, 140);
  rotate(frameCount); // Incremented by 60FPS
  
  // Tegn cirkel
  circle(0,0, 220);
  circle(0,0, 20);
  
  // Tegn linjer
  line(0,-110,0, 110);
  line(-110,0,110, 0);

}
