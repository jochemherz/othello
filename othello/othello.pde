//package name "com.jackpot.othello", key "GreenDoor"

int cellamt;
boolean playerturn;
float colspd;
int turn, oturn;
int[] cells, newcells;
float[] celltone;
int boardsize, mrg, topmrg, cellspace, stonemrg;
float uplim, lowlim;
boolean nopossiblemove, end;
PFont font;
int player1 = 0; int player2 = 0;
int timer = 0;

void setup(){

  fullScreen();
  orientation(PORTRAIT);
  font = createFont("PressStart2P-Regular.ttf", 48);
  textFont(font);
  textAlign(CENTER, CENTER);
  stroke(0);
  cellamt = 8;
  stonemrg = 15;
  colspd = 0.015;
  uplim = 0.95;
  lowlim = 0.05;
  playerturn = false;
  makeCells();
  end = false;

}

void draw(){
  
  background(30, 230, 60);
  makeGrid(0, 20);

  drawCells();
  updateCelltone();
  
  if (end == false){
    if (mousePressed == true){
      //if ready
      if(playerturn == false){ fill(255*lowlim);} else { fill(255*uplim); }
      ellipse(mouseX, mouseY, 2*cellspace-2*stonemrg, 2*cellspace-2*stonemrg);
}

  }
  
  if(end == true){
    displayscore();
    timer += 1;
    
    if(mousePressed == true && timer > 3*frameRate){
      gameRestart();
    }
  }

}



void mouseReleased(){
  
  if(end == false){
  if(mouseOnEmptyCell() == true 
  && possibleMove((mouseX-mrg)/cellspace, (mouseY-topmrg)/cellspace, true) == true
  ){
    Stone();
    
       //check for a possible next move
    
    if(nopossiblemove == false && checkpossiblemove() == false) {
      playerturn = !playerturn;
      nopossiblemove = true;
      if(nopossiblemove == true && checkpossiblemove() == false){
        end = true;
        nopossiblemove = false;
        end();
      } else { nopossiblemove = false; }
    }
  }
    
   
      
  arrayCopy(cells, newcells);
  
  }
}

boolean possibleMove(int x, int y, boolean fliptiles){
  int self = y*cellamt + x;
  int left = -1; int right = 1;
  int up = -cellamt; int down = cellamt;
  int upleft = -1-cellamt; int upright = 1-cellamt;
  int downleft = cellamt-1; int downright = 1+cellamt;
  
  if(playerturn == false){ turn = 0; oturn = 1;} else 
  if(playerturn == true){ turn = 1; oturn = 0;}
  
  arrayCopy(cells, newcells);
  newcells[self] = turn;
  
  //big block of conditionals, making sure that they all execute and flip tiles even after the first true encounter
  if (
    (sameRow(self, left) == true && checkPossible(self, left, fliptiles) == true)
  | (sameRow(self, right) == true && checkPossible(self, right, fliptiles) == true)
  | (sameColumn(self, up) == true && checkPossible(self, up, fliptiles) == true)
  | (sameColumn(self, down) == true && checkPossible(self, down, fliptiles) == true)
  | (checkPossible(self, upleft, fliptiles) == true ) 
  | (checkPossible(self, upright, fliptiles) == true )
  | (checkPossible(self, downleft, fliptiles) == true )
  | (checkPossible(self, downright, fliptiles) == true )
  ){
    return true;
  } else { return false; }
  
  
  }
  //x-1, x+1, y-1, y+1, y-1 x-1, y+1 x-1, y-1 x+1, y+1 x+1;
  
    

void Stone(){

  int xcell = (mouseX-mrg)/cellspace;
  int ycell = (mouseY-topmrg)/cellspace;
  int self = ycell*cellamt+xcell;
  
  if(playerturn == false){ turn = 0; oturn = 1;} else 
  if(playerturn == true){ turn = 1; oturn = 0;}
        
  cells[self] = turn;
  celltone[self] = turn;
  
  playerturn = !playerturn;
  
  }

boolean mouseOnEmptyCell(){
  int xcell = (mouseX-mrg)/cellspace;
  int ycell = (mouseY-topmrg)/cellspace;
  
  if(mouseX > mrg && mouseX < width-mrg
  && mouseY > topmrg && mouseY < height-topmrg
  && cells[ycell*cellamt+xcell] == 2){
    return true;
} else { return false;}
}

boolean checkpossiblemove(){

  for(int y=0; y<cellamt; y++){
    for(int x=0; x<cellamt; x++){
      if(cells[y*cellamt+x] == 2 && possibleMove(x, y, false) == true){
        arrayCopy(cells, newcells);
        return true;      
        } arrayCopy(cells, newcells);   
    } 
  } arrayCopy(cells, newcells); return false;
  
}

void drawCells(){
  noStroke();
  for(int y=0; y<cellamt; y++){
    for(int x=0; x<cellamt; x++){
      if(celltone[y*cellamt+x] <= 1 && celltone[y*cellamt+x] >= 0){
        fill(celltone[y*cellamt+x]*255);
        ellipse(x*cellspace+mrg+cellspace/2, y*cellspace+topmrg+cellspace/2, 
                cellspace-(2*stonemrg), cellspace-2*stonemrg);
      }
    }
  }
}

void updateCelltone(){

  
  
  for(int i=0; i<celltone.length; i++){
    if(celltone[i] >= 0){
      if(cells[i] == 1){
        celltone[i] += colspd;
      }
      if(cells[i] < celltone[i]){
        celltone[i] -= colspd;
      }
    }
    if(celltone[i] > uplim){ celltone[i] = uplim; }
    if(celltone [i] > -1 && celltone[i] < lowlim){ celltone[i] = lowlim; }
  }

}

void makeCells(){

  //initialize cells
  cells = new int[cellamt*cellamt];
  for(int y=0; y<cellamt; y++){
    for(int x=0; x<cellamt; x++){
      cells[y*cellamt+x] = 2;
    }
  }
  cells[27] = 0; cells[28] = 1;
  cells[35] = 1; cells[36] = 0;
  
  //initialize newcells
  newcells = new int[cellamt*cellamt];
  arrayCopy(cells, newcells);
  
  //initialize celltone
  celltone = new float[cellamt*cellamt];
  for(int y=0; y<cellamt; y++){
    for(int x=0; x<cellamt; x++){
      celltone[y*cellamt+x] = -1;
    }
  }
  celltone[27] = 0; celltone[28] = 1;
  celltone[35] = 1; celltone[36] = 0;
}

void makeGrid(color c, int margin){

  mrg = margin;
  boardsize = width - 2*mrg;
  topmrg = (height-boardsize)/2;
  cellspace = boardsize/cellamt;
  
  stroke(c);
  
  for(int i=0; i<cellamt+1; i++){
    line(mrg+i*cellspace, topmrg, mrg+i*cellspace, height-topmrg);
    line(mrg, topmrg+i*cellspace, width-mrg, topmrg+i*cellspace);
  }

}

void end(){
  for(int i=0; i<cells.length; i++){
    if(cells[i] == 0){ player1 += 1; }
    if(cells[i] == 1){ player2 += 1; }
  }
}

void displayscore(){

  textSize(60);
  fill(255*lowlim);
  text(player1, width/3, height-topmrg/2);
  fill(255*uplim);
  text(player2, 2*width/3, height-topmrg/2);
  translate(2*width/3, topmrg/2);
  rotate(PI);
  fill(255*lowlim);
  text(player1, 0, 0);
  fill(255*uplim);
  text(player2, width/3, 0);

}

void gameRestart(){

  playerturn = false;
  makeCells();
  end = false;
  timer = 0;
  player1 = 0; player2 = 0;

}
