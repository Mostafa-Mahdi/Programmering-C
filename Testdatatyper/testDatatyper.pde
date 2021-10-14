// variabel til test af integer datatypen
int nummer = 0;
int increment = 1;

void setup(){
    size(400,600);// sæt størrelse på canvas
    noLoop();
}

void draw(){
  // looper såfremt den næste iteration ikke giver et negativt værdi
  while(nummer + increment >= 0){
    nummer = nummer + increment;
  }
  // udskriv nummer
   println(nummer); // 2147483647

}

/*
    a. Int 2^31
    b. Float 2^31
    c. Char 2^8 = ascii
    d. Boolean 2^8
    e. Byte 2^8
    f. Short 2^16
    g. long  2^63
    h. Double. 2^31


  Med mine resultater passer det meget fint med det hvad jeg har fået fra mine programmer

*/
