import java.util.Collections;
import java.util.ArrayList;
import java.util.Random;
import java.util.Arrays;
import processing.net.*; 

Client bingoClient; 

// Konstanter, ændre helst ikke. //
// Kassernes størrelse
int HEIGHT = 80;
int WIDTH = 80;
int PADDING = 20;
// Konfiguration af bingopladerne
int BINGO_ROWS = 3; // maks 9, kan godt være 10, hvis man fjerner særtilfælden
int BINGO_COLUMNS = 9;
String name = "Mostafa Mahdi";
String nickName = "SkyChrome";
//


// Deklaration og initialiseringer.
int[][] bingoPlade = new int[BINGO_COLUMNS][BINGO_ROWS];
int windowHeight = (HEIGHT*BINGO_ROWS)+(PADDING*2);
int windowWidth = (WIDTH*BINGO_COLUMNS)+(PADDING*2);
ArrayList<Integer> calledNumbers = new ArrayList<Integer>();
int bingoStopFrame = 0;


// Den rette size beregnes udfra formel.
void settings(){
 size(windowWidth, windowHeight);
}


void setup(){
 textSize(32);
 bingoClient = new Client(this, "127.0.0.1", 12345); 
 bingoClient.write(name + "&%;" + nickName + char(10)); // send user info.
}

void draw(){
  // Vi tegner bingopladen
  drawRects(bingoPlade);
  // Hvis der sat en stopFrame så viser Bingo notifkationen indtil vi rammer stopframen
  if(bingoStopFrame != 0){
    showBingo();
    if(frameCount > bingoStopFrame){
        bingoStopFrame = 0;
    }
  }
}


// Funktion der viser bingo notifikation
void showBingo(){
 fill(0,0,255);
 rect((WIDTH*BINGO_ROWS)+PADDING*2, windowHeight/2, 200, 80); 
 fill(255);
 text("BINGO", ((WIDTH*BINGO_ROWS)+PADDING*2)+60, (windowHeight/2)+50);
}

// Fylder kasserne med tal fra 2D array.
void drawRects(int[][] bingoPlade){
  // padding
  for(int line = 0; line < BINGO_ROWS; line++){
      for(int column = 0; column < BINGO_COLUMNS; column++){
        int currentNumber = bingoPlade[column][line];
         drawRect(line, column, Integer.toString(currentNumber), calledNumbers.contains(currentNumber));
    }
  }
}


// Tegner kasse på skærmen afhængig af hvilke kolonne, linje. Der kan skrives tekst. Farven skiftes udfra boolean værdien bingo.
void drawRect(int line, int column, String text, boolean bingo){
 if(bingo){  
   fill(0,255,0);
 }
 if(text.charAt(0) == '0'){
   fill(100);
 }
 rect(PADDING + (WIDTH*column), PADDING + (HEIGHT*line), WIDTH, HEIGHT);
 fill(0);
 // Manual alignment.
 int extraPadding = Math.round(PADDING*0.75);
 if(text.length() == 1){
   extraPadding = PADDING/2;
 }
 // Kun hvis feltet ikke indeholder værdien 0 viser vi den.
 if(text.charAt(0) != '0'){
   text(text, ((PADDING + (WIDTH*column))+WIDTH/2)-(extraPadding),((PADDING + (HEIGHT*line))+HEIGHT/2)+(PADDING/2));
 }
 fill(255);
}


// Konvertering af string til 2d array
int[][] strToPlade(String strPlade){
  String colChar = ";";
  String rowChar = ",";


  int[][] bingoPlade = new int[BINGO_COLUMNS][BINGO_ROWS];
  String columns[] = strPlade.split(colChar);
  for (int i=0; i<BINGO_COLUMNS; i++) {
      String rows[] = columns[i].split(rowChar);
      for(int j=0; j<BINGO_ROWS; j++) {
          bingoPlade[i][j] = Integer.parseInt(rows[j]);
      }
  }
  return bingoPlade;
}

// kode der køres hver gang der kommer tal fra serveren
void clientEvent(Client thisClient) {
  if(thisClient.available() == 0){
    return; // we dont need random events without any data.
  }
  while(thisClient.available() != 0){
    // Parse packet
    String rawInput = recv(thisClient, false);
    String packetType = rawInput.substring(0,3);
    String data =  rawInput.substring(3,rawInput.length());
    
    // Find den rette handler
    if(packetType.contentEquals("NMB")){
      //Siden calledNumbers er dynamisk, opretter vi en ny ArrayList hver gang.
      calledNumbers = new ArrayList<Integer>();
      for(String rawNumber : data.split(",")){
        calledNumbers.add(Integer.parseInt(rawNumber));
      }
    } else if(packetType.contentEquals("MSG")){
     // Packet message, her printer vi bare ud til consollen
     println(data); 
    }
    else if(packetType.contentEquals("BNG")){
     // Bingo!
     bingoStopFrame = frameCount + (60*Integer.parseInt(data));
    }
    else if(packetType.contentEquals("PLD")){
     // Sender en plade
     calledNumbers = new ArrayList<Integer>();
     bingoPlade = strToPlade(data);// vi læser alt data indtil newline, og sletter den til sidst.
    }
    // parse packet type
    // handle based on packet type
    redraw();
  }
}


// automatisk dekodning af server input
String recv(Client thisClient, boolean waitForData){
  // wait until data arrives
  while(thisClient.available() == 0 && waitForData){
  }
  // decode
  return thisClient.readStringUntil(10).replaceAll("" + char(10),"");
}
