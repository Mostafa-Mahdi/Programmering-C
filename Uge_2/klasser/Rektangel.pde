class Rektangel {
  // klassens attributter/ tilstand
  float x, x1, y, y1, r, g, b;

  //konstroktøren
  Rektangel() {
    this.generate();
  }

  // klassens metoder
  
  // find to tilfældige værdier inden for canvas størrelsen
  void generate() {
    this.x = random(600);
    this.y = random(400);
    
    this.x1 = random(600);
    this.y1 = random(400);
    
    this.r = random(255);
    this.g = random(255);
    this.b = random(255);
    
  }
  
  // tegn firkant på canvas
  void drawRektangel() {
    fill(r, g, b);
    rect(x, y, x1, y1);
  }
}
