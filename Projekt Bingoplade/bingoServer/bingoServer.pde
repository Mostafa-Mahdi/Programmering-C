import processing.net.*;
import java.util.Collections;
import java.util.ArrayList;
import java.util.Random;
import java.util.Arrays;


// Konfiguration af bingopladerne //
int BINGO_ROWS = 3; // maks 9, kan godt være 10, hvis man fjerner særtilfælden
int BINGO_COLUMNS = 9;
int NUMBERS_TO_DELETE = 4; // per row
int NUMBERS_TO_DRAW = 45; // fix lol
boolean COOL_MATRIX_EFFECT = true;
//


ArrayList<Integer> uncalledNumbers = new ArrayList<Integer>();
ArrayList<Integer> calledNumbers = new ArrayList<Integer>();
ArrayList<BingoClient> clients = new ArrayList<BingoClient>();
int currentBingoNumber = 0;
int[][] bingoPlade;
Server bingoServer;
boolean keyPressed;


void setup(){
  size(600, 600);
  bingoServer = new Server(this, 12345); 
  textAlign(CENTER);
  textSize(128);
  for(int i = 1;i<90;i++){
    uncalledNumbers.add(i);
  }
  Collections.shuffle(uncalledNumbers);
  for(int i =0;i<90-NUMBERS_TO_DRAW;i++){
   uncalledNumbers.remove(0); 
  }
  clear();
  text("Klar!", 300,300);
}

void draw(){
   if(uncalledNumbers.size() != 0 && keyPressed){
      println("Remaining numbers: " + uncalledNumbers.size());
      keyPressed = false;
      clear();
      int currentNumber = pickBingoNumber();
      text(currentNumber, 300,300);
      sendPacket("MSG", "New number: " + currentNumber);
      for(BingoClient bc: clients){
       boolean[] rowsOfBingo = bc.checkBingo();
       for(int i=0;i<3;i++){
         if(rowsOfBingo[i] && !bc.showedNotification[i]){
           int row = i + 1;
           println(bc.name + " got bingo on row " + row);
           sendPacket("MSG", bc.name + " got bingo on row " + row);
           bc.showedNotification[i] = true;
           bc.showBingo(3); // show bingo notification at user for 3 seconds
         }
       }
       
      }
    }else{
        if(keyPressed){
          clear();
          text("Færdig", 300, 300);
          sendPacket("MSG", "Game finished, congratulations to the winners");
          println("Game finished");
          keyPressed = false;  
          if(uncalledNumbers.size() == 0){
              restartGame(false);
          }
        }
       if(COOL_MATRIX_EFFECT && calledNumbers.size() == 0){
         restartGame(false);
       }
    }
  }


void serverEvent(Server newServer, Client newClient) {
  println("**NEW CLIENT**");
  String userInfo[] = new String[1];
  // wait for input
  while(newClient.available() == 0){
  }
  //
  userInfo = newClient.readStringUntil(10).replaceAll("" + char(10),"").split("&%;");
  BingoClient bc = new BingoClient(userInfo[0], userInfo[1], newClient);
  clients.add(bc);
  bc.sendPlade();
  bc.printInfo(); 
}

int pickBingoNumber(){
 // Retreive bingo number
 int bingoNumber = uncalledNumbers.get(0);
 uncalledNumbers.remove(0);
 calledNumbers.add(bingoNumber);
 
 sendPacket("NMB", calledNumbersToStr());
 return bingoNumber;
}

String recv(Client thisClient){
  // wait until data arrives
  while(thisClient.available() == 0){
  }
  // decode
  return thisClient.readStringUntil(10).replaceAll("" + char(10),"");
}

void sendPacket(String packetType, String data){
  bingoServer.write(packetType + data + char(10));
}

String calledNumbersToStr(){
   String text = "";
   for(int number : calledNumbers){
    text = text + number + "," ;
   }
   return text.substring(0, text.length()-1);
}
void disconnectEvent(Client disconnectedClient) {
  for(BingoClient bc: clients){
   if(bc.networkClient == disconnectedClient ){
     println(bc.name + " disconnected from server");
     clients.remove(bc);
   }
  }
}

void restartGame(boolean sendMsg){
   if(sendMsg){
     clear();
     text("Klar!", 300, 300);
     sendPacket("MSG", "Game finished early by Host.");
     keyPressed = false;  
   }
        
   for(BingoClient bc: clients){
      bc.nyPlade();
      bc.showedNotification = new boolean[3];
   }
   uncalledNumbers =  new ArrayList<Integer>();
   for(int i = 1;i<90;i++){
      uncalledNumbers.add(i);
   }
   Collections.shuffle(uncalledNumbers);
   for(int i =0;i<90-NUMBERS_TO_DRAW;i++){
       uncalledNumbers.remove(0); 
   }
   calledNumbers = new ArrayList<Integer>();
}

void keyPressed() {
  if(keyCode == 81){
       println("Restarting");
       restartGame(true);
  }else if(keyCode == 32){
    keyPressed = true; 
  }
}
