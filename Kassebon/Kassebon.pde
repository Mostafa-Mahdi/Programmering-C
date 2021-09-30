// Pseudekode
//int belobUdenMoms = 100;
//float belobMedMoms = 0;
//String navn = "Jens";

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
    
    public float subTotal(int pris){
      // Return price without Danish VAT
      return pris * 0.8;
    }
    

}


void draw(){
  ArrayList<Vare> indkobskurv = new ArrayList<Vare>();
  Vare chips = new Vare("Kims Bacon Chips", 12.99, 2);
  Vare dip = new Vare("Sour Cream & Onion dip", 6.99, 2);
  Vare soda = new Vare("Freeway Sodavand", 12.99, 2);
  indkobskurv.add(chips);  
  indkobskurv.add(dip);  
  indkobskurv.add(soda);  
  chips.beregnPris();
  println("Mostafas Kiosk");
  for(Vare vare:indkobskurv ){   
    print(vare.vareNavn + " | " + vare.belobMedMoms + " kr");   
  }
}  
