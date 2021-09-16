// Opgave 1 besvarelse
// a) Linje 42

// b) 9, 10, 12, 13

// c) 2 ints Parametre 

// d) See below


void setup(){
  size (600,600);
  noLoop();
}

void draw(){

  // make frame behind alien
  frameFunction(0,0);
  frameFunction(300,0);
  
  frameFunction(0,300);
  frameFunction(300,300);
  
  //divide screen i four squares
  line(300,0,300,600);//vertical line
  line (0,300,600,300); //Horizontal line
  
  // Draw the aliens
  drawAliens();
  

}



void drawAliens(){
  // Draw alien in all 4 squares
  
  // 1 square
  drawAlien(0, 0, "Muggi");
  
  // 2nd square
  drawAlien(300, 0, "Capper");
  
  // 3rd square
  drawAlien(300, 300, "Muhadi");
  
  // Last square
  drawAlien(0, 300, "Marco");
 
}

void drawAlien(int x, int y, String name){
  // Combine the functions
  drawFaceAndNose(x, y);
  drawBodyAndLegs(x, y, name);
}


void drawFaceAndNose(int x, int y){
  // make head and color white
  fill(255,255,255);
  circle(150 + x,75 + y,100);
  
  // make eys and color black
  fill(0,0,0);
  ellipse(125 + x, 75 + y, 25, 50);
  ellipse(175 + x, 75 + y, 25, 50);
} 


void drawBodyAndLegs(int x, int y, String name){
  // make body and color black
  fill(0,0,0);
  rect(125 + x,120 + y,50,100);
  
  //make legs and thick
  strokeWeight(5);
  line(125 + x,220 + y,110 + x, 250 + y);
  line(175 + x,220 + y,195 + x, 250 + y);
  
  // Don't draw nothing.
  if(name != ""){
    textSize(32);
    text(name, 120 + x, 270 + y);
    strokeWeight(1);
  }
}

void frameFunction(int x, int y ){
  rect(10+x,10+y,280,280);
}
