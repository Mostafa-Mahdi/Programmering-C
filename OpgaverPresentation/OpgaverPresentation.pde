String minString = "afbsdflee,gødre,eøsæekeenehzejkls.seekel";

void setup(){
  println(findEwhile(minString)); // 12
  println(findEfor(minString)); // 12
  println(antalBogstaver(minString)); // 40
  
}

void draw(){}


int findEwhile(String s){
  int i = 0; // holder styr med iterationer
  int antal = 0; // holder styr med antal e'er
  
  while(i < s.length()){ // loop igennem alle bogstaver
    if(s.charAt(i) == 'e'){ // er bogstavet e?
     antal++;  // så inkrementere vi antal
    }
    i++; //og iterationer
  }
  
  return antal;
}


int findEfor(String s){
  int antal = 0;
  for(int i = 0; i < s.length(); i++){
    if(s.charAt(i) == 'e'){
      antal++;
    }else if (s.charAt(i) == 'z'){
      println("Jeg har fundet en zebra på position: " + (i+1));
    }
  }
  return antal;
}

int antalBogstaver(String s){
  return s.length();
}
