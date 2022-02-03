// initiering af variablen f
Firkant f;
Circle c;

void setup() {
  size (600, 400);
}

void draw() {
  // tegner firkanten på canvas

    // initiering af objektet f
    f = new Firkant();
    f.drawFirkant();
    
    Circle c = new Circle();
    c.drawCircle();
    
    Trekant t = new Trekant();
    t.drawTrekant();
    
    Rektangel r = new Rektangel();
    r.drawRektangel();
  
}
