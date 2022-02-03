// initiering af variablen f
Firkant f;
Circle c;
int number = 0;

void setup() {
  size (600, 400);
}

void draw() {
  // tegner firkanten på canvas

  if(number == 0){
    // initiering af objektet f
    f = new Firkant();
    // kald metoden generate som laver en tilfældig x og y pos
    f.generate();
    f.drawFirkant();
    number++;
  }else if(number == 1){
    Circle c = new Circle();
    c.generate();
    c.drawCircle();
    number++;
  }
  else if(number == 2){
    Trekant t = new Trekant();
    t.generate();
    t.drawTrekant();
    number++;
  }
  else if(number == 3){
    Rektangel r = new Rektangel();
    r.generate();
    r.drawRektangel();
    number++;
  }
  // reset
  if(number == 4){
    number = 0;
  }
}
