// Pseudekode
//int belobUdenMoms = 100;
//float belobMedMoms = 0;
//String navn = "Jens";

//todo lav canvas.

void setup(){
  size(400, 600);
  noLoop();
}

class Vare { 
    String vareNavn;
    int antal;
    float belobPerVare;
    float belobUdenMoms;
    float belobMedMoms;
   
   
   // Definere vare
   public Vare(String vareNavn, float belobPerVare, int antal){
    this.vareNavn = vareNavn;
    this.belobPerVare = belobPerVare;
    this.antal = antal;
   }
    
    public void beregnPris(){   
      this.belobUdenMoms = this.belobPerVare * this.antal;
      this.belobMedMoms = this.belobUdenMoms * 1.25;

    }
    

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
  

  // Header af kvittering
  println("Mostafas Kiosk");
  println("------------------");
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
