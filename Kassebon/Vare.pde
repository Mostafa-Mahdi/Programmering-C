class Vare { 
    String vareNavn;
    int antal;
    float belobPerVare;
    float belobUdenMoms;
    float belobMedMoms;
   
   
   public Vare(String vareNavn, float belobPerVare, int antal){
    this.vareNavn = vareNavn;
    this.belobPerVare = belobPerVare;
    this.antal = antal;
    
    // Beregn moms
    this.beregnPris();
   }
    
    public void beregnPris(){   
      this.belobUdenMoms = this.belobPerVare * this.antal;
      this.belobMedMoms = this.belobUdenMoms * 1.25;

    }

}
