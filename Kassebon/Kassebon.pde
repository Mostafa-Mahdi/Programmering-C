// Pseudokode
//int belobUdenMoms = 100;
//float belobMedMoms = 0;
//String navn = "Jens";

//todo lav canvas.


void setup(){
  size(400, 600);
  noLoop();
}

public float subTotal(float pris){
      // Return price without Danish VAT
      return pris * 0.8;
}

void draw(){
  // Definere arraylist
  ArrayList<Vare> indkobskurv = new ArrayList<Vare>();
  
  
  // lav objekter statisk for nu
  indkobskurv.add(new Vare("Kims Bacon Chips", 12.99, 2));
  indkobskurv.add(new Vare("Sour Cream & Onion dip", 6.99, 1));
  indkobskurv.add(new Vare("FreeWay Sodavand", 12.99, 1));
  
// kunne man ikke lave det som en funktion???
// og så skal du lige briuge canvas i stedet for consol!

  // Header af kvittering
  println("Mostafas Kiosk");
  println("------------------");
  // det er Haram at deklarere variabler midt i koden!!
  float totalPris = 0;
  
  
  // declare total pris 
    for(Vare vare:indkobskurv ){ 
    vare.beregnPris(); // Beregn priser
    println(vare.antal + "x " + vare.vareNavn + " | " + vare.belobMedMoms + " kr");
    totalPris = totalPris + vare.belobMedMoms;
  }
  // Beregn total pris
  println("------------------");
  println("Subtotal: " + subTotal(totalPris) + " kr");
  println("Total: " + totalPris + " kr");
}  
