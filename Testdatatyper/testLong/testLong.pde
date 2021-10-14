// variabel til test af integer datatypen
long nummer = 0;

void setup(){
    size(400,600);// sæt størrelse på canvas
    noLoop();
}

void draw(){
  // looper såfremt den næste iteration ikke giver et negativt værdi
  
  // Iterate hurtigt til den negative værdi
  nummer = findMax(nummer, 2147483647);
  
  // Find max præcist
  nummer = findMax(nummer, 1);
  
  // udskriv nummer
   println(nummer); // 9223372036854775807
   // Print max value 
   println(Long.MAX_VALUE);

}


long findMax(long nummer, int increment){
 
  // Iterate indtil den næste iteration vil give et negative værdi
  while(nummer + increment >= 0){
    nummer = nummer + increment;
  }
  return nummer;
}
