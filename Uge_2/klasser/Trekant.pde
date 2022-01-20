class Trekant {
  // klassens attributter/ tilstand
  float x1, x2, x3, y1, y2, y3, r, g, b;

  //konstroktøren
  Trekant() {
    this.generate();
  }

  // klassens metoder
  
  // find to tilfældige værdier inden for canvas størrelsen
  void generate() {
    this.x1 = random(600);
    this.x2 = random(600);
    this.x3 = random(600);
    
    this.y1 = random(400);
    this.y2 = random(400);
    this.y3 = random(400);
    
    this.r = random(255);
    this.g = random(255);
    this.b = random(255);
    
  }
  
  // tegn firkant på canvas
  void drawTrekant() {
    fill(r, g, b);
    triangle(x1, y1, x2, y2, x3, y3);
  }
}
