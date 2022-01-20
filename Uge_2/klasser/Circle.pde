class Circle {
  // klassens attributter/ tilstand
  float x, y, r, g, b, size;

  //konstroktøren
  Circle() {
    this.generate();
  }

  // klassens metoder
  
  // find to tilfældige værdier inden for canvas størrelsen
  void generate() {
    this.x = random(600);
    this.y = random(400);
    this.r = random(255);
    this.g = random(255);
    this.b = random(255);
    this.size = random(100);
    
  }
  
  
  void drawCircle(){
    fill(r, g, b);
    circle(x, y, size);
  }
}
