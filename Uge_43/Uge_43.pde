// Opgave 1

/* While
String s = "Hej med dig";
boolean found = false;
int i = 0;

while(!found){
  if(i < 5){
    print(s.charAt(i)); 
  }else{
   found = true; 
  }
  i++;
}
*/


// For-loop
/*
String s = "Hej med dig";
for(int i = 0; i < 5; i++){
  print(s.charAt(i));
}
*/


// Opgave 2, loop fra 10 til 30 og print i både for og while
/*
for(int i = 10; i <= 30; i++){
  println(i);
}
*/
/*
// While
int i = 0;

while(i <= 30){
  if(i <= 30 && i >= 20 ){
    println(i);
  }
  i++;
}
*/


// Opgave 3


//For
/*
String s = "Hej med dig";
int number_of_e = 0;
for(int i = 0; i < s.length(); i++){
  if(s.charAt(i) == 'e'){
   number_of_e++;
  }
}
print(number_of_e); // 2
*/
// While

/*
String s = "Hej med dig";
int i = 0;
int number_of_e = 0;

while(i < s.length()){
  if(s.charAt(i) == 'e'){
   number_of_e++;
  }
  i++;
}
print(number_of_e);
*/



// Opgave 4
/*

String s = "Løkken skal udskrive alle e'er og tilsidst udskrive hvor mange e'er som er fundet. Ja, så er det rigtigt :)";
int[] numbers = {39,19,41,6,4,16,6,16,35,99,41,48,99,95};

for(int requested_index: numbers){
  print(s.charAt(requested_index));
}
*/

// Opgave 5
/*
String s = "Løkken skal udskrive alle e'er og tilsidst udskrive hvor mange e'er som er fundet. Ja, så er det rigtigt :)";
print(s.length());
*/

// Opgave 6
/*
String s = "Løkken skal udskrive alle e'er og tilsidst udskrive hvor mange e'er som er fundet. Ja, så er det rigtigt :)";
print(s.substring(83));

*/

// Opgave 7
/*
String s = "Løkken skal udskrive alle e'er og tilsidst udskrive hvor mange e'er som er fundet. Ja, så er det rigtigt :)";
print(s.substring(83, 85));


// Opgave 8

String s = "Løkken skal udskrive alle e'er og tilsidst udskrive hvor mange e'er som er fundet. Ja, så er det rigtigt :)";
print(s.toUpperCase());



// Opgave 9

String s = "Løkken skal udskrive alle e'er og tilsidst udskrive hvor mange e'er som er fundet. Ja, så er det rigtigt :)";
print(s.toLowerCase());



// Opgave 10

/*
10) læs og forstå følgende program:

String str2 =  "Nej";
if (str2.equals("ja"))
  println ("Det gør den!");
 else
  println ("Det gør den ikke!");
 
a) hvad udskriver programmet?
Det gør den ikke!
b) hvordan kan du få programmet til at udskrive det modsatte af, hvad den gør nu?
str2 =  "ja"
*/
