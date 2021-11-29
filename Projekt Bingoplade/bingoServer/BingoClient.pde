class BingoClient{

  String name;
  String nickName;
  int[][] plade = new int[9][3];
  Client networkClient;
  boolean[] showedNotification = new boolean[3];
  
  BingoClient(String n, String nn, Client nc){
    this.name=n;
    this.nickName = nn;
    plade = getBingoPlade();
    plade = deleteRandomNumbers(NUMBERS_TO_DELETE);
    networkClient = nc;
  }
  
  void sendPlade(){
    sendPacket("PLD", pladeToStr());
  }
  
  void nyPlade(){
    plade = getBingoPlade();
    plade = deleteRandomNumbers(NUMBERS_TO_DELETE);
    sendPlade();
  }
  
  boolean[] checkBingo(){
    boolean[] bingos = new boolean[3];
    for(int i = 0; i<3;i++){
      for(int j=0;j<9;j++){
        if(plade[j][i] == 0){
          continue;
        }
        bingos[i] = calledNumbers.contains(plade[j][i]);
        
        // leave loop, hvis der mangler en i rækken.
        if(!bingos[i]){
          break;
        }
        
      }
    }
    return bingos;
  }
  
  void printInfo(){
    println("Name: " + name);
    println("NickName: " + nickName);
    println("IP: " + networkClient.ip());  
}
  
  int[][] strToPlade(String strPlade){
    
    String colChar = ";";
    String rowChar = ",";
  
  
    int[][] bingoPlade = new int[9][3];
    String columns[] = strPlade.split(colChar);
    for (int i=0; i<9; i++) {
        String rows[] = columns[i].split(rowChar);
        for(int j=0; j<3; j++) {
            bingoPlade[i][j] = Integer.parseInt(rows[j]);
        }
    }
    return bingoPlade;
  }
  
  String pladeToStr(){
   String pladeStr = "";
   for(int i = 0; i < 9; i++){
     for(int j = 0; j< 3;j++){
       if(j == 0){
         pladeStr = pladeStr + plade[i][j];
       }
       else{
         pladeStr = pladeStr + "," + plade[i][j];
       }
     }
     if(i != 8){
       pladeStr += ";";
     }
   }
   return pladeStr;
  }
  
  
  int[][] getBingoPlade(){
    for(int i = 0; i<BINGO_COLUMNS;i++){
      if(i == 0){ // særtilfælde
        plade[i] = getRandom(1, i*10+10, BINGO_ROWS, true);
        continue;
      }
      plade[i] = getRandom(i*10, i*10+10, BINGO_ROWS, true);
    }
    return plade;
  }
  
  // laver tilfældig tal, samt sortere den.
  int[] getRandom(int min, int max, int amount, boolean sort){
      int[] random = new int[amount];
      // Tilføj alle tal til en temp var
      ArrayList<Integer> nr = new ArrayList<Integer>();
      for(int i=min;i < max;i++){
          nr.add(i);
      }
      
      // Tildel.
      Collections.shuffle(nr);
      for(int i = 0;i < amount; i++){
          int randomTal = nr.get(0);
          nr.remove(0);
          random[i] = randomTal;
       }
       if(sort){
         Arrays.sort(random);
       }
       return random;
  }
  
  
  int[][] deleteRandomNumbers(int amount){
    for(int i = 0; i < BINGO_ROWS; i++){
      int[] randomTal = getRandom(0, BINGO_COLUMNS, amount, false);
      for(int tal: randomTal){
        plade[tal][i] = 0;
      }
    }
    return plade;
  }


  void showBingo(int secsToShow){
   sendPacket("BNG", Integer.toString(secsToShow)); 
  }
  
  void sendPacket(String packetType, String data){
    networkClient.write(packetType + data + char(10));
  }

}
