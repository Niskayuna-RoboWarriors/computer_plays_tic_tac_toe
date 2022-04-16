//yes I am aware that arduenos are programed in c and that this is being written in processing/java
void setup(){
  size(1280,720);//set the winow size
}
int[] board=new int[9];
int mode=2,wunNum=-1;

void draw(){
  background(#D8D8D8);//set the background color
  stroke(0);
  strokeWeight(4);
  //draw the board
  float widthseperator =0.1,heightseperator=0.15;
  line(width/2-width*widthseperator,height*0.1,width/2-width*widthseperator,height*0.9);
  line(width/2+width*widthseperator,height*0.1,width/2+width*widthseperator,height*0.9);
  line(width*0.25,height/2-height*heightseperator,width*0.75,height/2-height*heightseperator);
  line(width*0.25,height/2+height*heightseperator,width*0.75,height/2+height*heightseperator);
  fill(0);//draw the things on the baord
  textSize(180);
  textAlign(CENTER,CENTER);
  float leftCol=width*0.325,topRow=height*0.20,centerCol=width/2,centerRow=height/2,rightCol=width*0.675,bottomRow=height*0.8;
  if(board[0]==1){
    text("X",leftCol,topRow);
  }else if(board[0]==-1){
    text("O",leftCol,topRow);
  }
  if(board[1]==1){
    text("X",centerCol,topRow);
  }else if(board[1]==-1){
    text("O",centerCol,topRow);
  }
  if(board[2]==1){
    text("X",rightCol,topRow);
  }else if(board[2]==-1){
    text("O",rightCol,topRow);
  }
  if(board[3]==1){
    text("X",leftCol,centerRow);
  }else if(board[3]==-1){
    text("O",leftCol,centerRow);
  }
  if(board[4]==1){
    text("X",centerCol,centerRow);
  }else if(board[4]==-1){
    text("O",centerCol,centerRow);
  }
  if(board[5]==1){
    text("X",rightCol,centerRow);
  }else if(board[5]==-1){
    text("O",rightCol,centerRow);
  }
  if(board[6]==1){
    text("X",leftCol,bottomRow);
  }else if(board[6]==-1){
    text("O",leftCol,bottomRow);
  }
  if(board[7]==1){
    text("X",centerCol,bottomRow);
  }else if(board[7]==-1){
    text("O",centerCol,bottomRow);
  }
  if(board[8]==1){
    text("X",rightCol,bottomRow);
  }else if(board[8]==-1){
    text("O",rightCol,bottomRow);
  }
  
  if(detectWin()){
    fill(0,255,0);
    rect(0,0,50,50);
  }
}

void mouseClicked(){
  if(mouseX>width*0.25&&mouseX<width*0.75&&mouseY>height*0.1&&mouseY<height*0.9){
    float widthseperator =0.1,heightseperator=0.15;
    if(mouseX<width/2-width*widthseperator&&mouseY<height/2-height*heightseperator){
      if(board[0]!=0)
      return;
     board[0]=1;
     makeguess();
    }
    if(mouseX>width/2-width*widthseperator&&mouseY<height/2-height*heightseperator&&mouseX<width/2+width*widthseperator){
      if(board[1]!=0)
      return;
     board[1]=1;
     makeguess();
    }
    if(mouseX>width/2+width*widthseperator&&mouseY<height/2-height*heightseperator){
      if(board[2]!=0)
      return;
     board[2]=1;
     makeguess();
    }
    if(mouseX<width/2-width*widthseperator&&mouseY>height/2-height*heightseperator&&mouseY<height/2+height*heightseperator){
      if(board[3]!=0)
      return;
     board[3]=1;
     makeguess();
    }
    if(mouseX>width/2-width*widthseperator&&mouseY>height/2-height*heightseperator&&mouseY<height/2+height*heightseperator&&mouseX<width/2+width*widthseperator){
      if(board[4]!=0)
      return;
     board[4]=1;
     makeguess();
    }
    if(mouseX>width/2+width*widthseperator&&mouseY>height/2-height*heightseperator&&mouseY<height/2+height*heightseperator){
      if(board[5]!=0)
      return;
     board[5]=1;
     makeguess();
    }
    if(mouseX<width/2-width*widthseperator&&mouseY>height/2+height*heightseperator){
      if(board[6]!=0)
      return;
     board[6]=1;
     makeguess();
    }
    if(mouseX>width/2-width*widthseperator&&mouseY>height/2+height*heightseperator&&mouseX<width/2+width*widthseperator){
      if(board[7]!=0)
      return;
     board[7]=1;
     makeguess();
    }
    if(mouseX>width/2+width*widthseperator&&mouseY>height/2+height*heightseperator){
      if(board[8]!=0)
      return;
     board[8]=1;
     makeguess();
    }
  }
}

void makeguess(){
  if(boardfull())
  return;
  if(mode==1){
    boolean notplaced=true;
    while(notplaced){//while it has not placed
     int slot=(int)(Math.random()*1000000%9);//choose a random tile
     if(board[slot]!=0){//check if that tile has something allready
      continue; 
     }
     board[slot]=-1;//if not set that tile to O
     notplaced=false;
    }
  }//end of mode 1
  if(mode==2){//boss mode
    int placeattempot=towInaRow();
    if(placeattempot!=-1){//if the player has 2 in a row and can win then win
      board[placeattempot]=-1;
    }else if(block()!=-1){//Block: If the opponent has two in a row, the player must play the third themselves to block the opponent. 
      board[block()]=-1;
    }else{
      mode=1;
      makeguess();
      mode=2;
    }
  }
}

boolean boardfull(){
  return board[0]!=0&&board[1]!=0&&board[2]!=0&&board[3]!=0&&board[4]!=0&&board[5]!=0&&board[6]!=0&&board[7]!=0&&board[8]!=0;
}

boolean detectWin(){
  for(int i=-1;i<2;i+=2){//check for both O and X
    if(board[0]==i&&board[1]==i&&board[2]==i){//top row
    wunNum=1;
      return true;
    }
    if(board[3]==i&&board[4]==i&&board[5]==i){//middle row
    wunNum=2;
      return true;
    }
    if(board[6]==i&&board[7]==i&&board[8]==i){//bottom row
    wunNum=3;
      return true;
    }
    
    if(board[0]==i&&board[3]==i&&board[6]==i){//left colom
    wunNum=4;
      return true;
    }
    if(board[1]==i&&board[4]==i&&board[7]==i){//middle colom
    wunNum=5;
      return true;
    }
    if(board[2]==i&&board[5]==i&&board[8]==i){//right colom
    wunNum=6;
      return true;
    }
    
    if(board[0]==i&&board[4]==i&&board[8]==i){//diagonal 1
    wunNum=7;
      return true;
    }
    if(board[2]==i&&board[4]==i&&board[6]==i){//diagonal 2
    wunNum=8;
      return true;
    }
  }
  return false;
}

int towInaRow(){
  //horozontal wins
  //top row wins
  if(board[0]==-1&&board[1]==-1&&board[2]==0){//O O -
    return 2;
  }
  if(board[0]==-1&&board[1]==0&&board[2]==-1){//O - O
    return 1;
  }
  if(board[0]==0&&board[1]==-1&&board[2]==-1){//- O O
    return 0;
  }
  //moddle row wins
  if(board[3]==-1&&board[4]==-1&&board[5]==0){//O O -
    return 5;
  }
  if(board[3]==-1&&board[4]==0&&board[5]==-1){//O - O
    return 4;
  }
  if(board[3]==0&&board[4]==-1&&board[5]==-1){//- O O
    return 3;
  }
  //bottom row wins
  if(board[0]==-1&&board[1]==-1&&board[2]==0){//O O -
    return 2;
  }
  if(board[0]==-1&&board[1]==0&&board[2]==-1){//O - O
    return 1;
  }
  if(board[0]==0&&board[1]==-1&&board[2]==-1){//- O O
    return 0;
  }
  
  //verticle wins
  //left colom wins
  if(board[0]==-1&&board[3]==-1&&board[6]==0){//O O -
    return 6;
  }
  if(board[0]==-1&&board[3]==0&&board[6]==-1){//O - O
    return 3;
  }
  if(board[0]==0&&board[3]==-1&&board[6]==-1){//- O O
    return 0;
  }
  //center colom wins
  if(board[1]==-1&&board[4]==-1&&board[7]==0){//O O -
    return 7;
  }
  if(board[1]==-1&&board[4]==0&&board[7]==-1){//O - O
    return 4;
  }
  if(board[1]==0&&board[4]==-1&&board[7]==-1){//- O O
    return 1;
  }
  //right colom wins
  if(board[2]==-1&&board[5]==-1&&board[8]==0){//O O -
    return 8;
  }
  if(board[2]==-1&&board[5]==0&&board[8]==-1){//O - O
    return 5;
  }
  if(board[2]==0&&board[5]==-1&&board[8]==-1){//- O O
    return 2;
  }
  
  //diagonal wins
  //diagonal 1
  if(board[0]==-1&&board[4]==-1&&board[8]==0){//O O -
    return 8;
  }
  if(board[0]==-1&&board[4]==0&&board[8]==-1){//O - O
    return 4;
  }
  if(board[0]==0&&board[4]==-1&&board[8]==-1){//- O O
    return 0;
  }
  //diagonal 2
  if(board[2]==-1&&board[4]==-1&&board[6]==0){//O O -
    return 6;
  }
  if(board[2]==-1&&board[4]==0&&board[6]==-1){//O - O
    return 4;
  }
  if(board[2]==0&&board[4]==-1&&board[6]==-1){//- O O
    return 2;
  }
  return -1;
}


int block(){
  if(board[0]==1&&board[1]==1&&board[2]==0){//O O -
    return 2;
  }
  if(board[0]==1&&board[1]==0&&board[2]==1){//O - O
    return 1;
  }
  if(board[0]==0&&board[1]==1&&board[2]==1){//- O O
    return 0;
  }
  //moddle row blocks
  if(board[3]==1&&board[4]==1&&board[5]==0){//O O -
    return 5;
  }
  if(board[3]==1&&board[4]==0&&board[5]==1){//O - O
    return 4;
  }
  if(board[3]==0&&board[4]==1&&board[5]==1){//- O O
    return 3;
  }
  //bottom row blocks
  if(board[0]==1&&board[1]==1&&board[2]==0){//O O -
    return 2;
  }
  if(board[0]==1&&board[1]==0&&board[2]==1){//O - O
    return 1;
  }
  if(board[0]==0&&board[1]==1&&board[2]==1){//- O O
    return 0;
  }
  
  //verticle blocks
  //left colom blocks
  if(board[0]==1&&board[3]==1&&board[6]==0){//O O -
    return 6;
  }
  if(board[0]==1&&board[3]==0&&board[6]==1){//O - O
    return 3;
  }
  if(board[0]==0&&board[3]==1&&board[6]==1){//- O O
    return 0;
  }
  //center colom blocks
  if(board[1]==1&&board[4]==1&&board[7]==0){//O O -
    return 7;
  }
  if(board[1]==1&&board[4]==0&&board[7]==1){//O - O
    return 4;
  }
  if(board[1]==0&&board[4]==1&&board[7]==1){//- O O
    return 1;
  }
  //right colom blocks
  if(board[2]==1&&board[5]==1&&board[8]==0){//O O -
    return 8;
  }
  if(board[2]==1&&board[5]==0&&board[8]==1){//O - O
    return 5;
  }
  if(board[2]==0&&board[5]==1&&board[8]==1){//- O O
    return 2;
  }
  
  //diagonal blocks
  //diagonal 1
  if(board[0]==1&&board[4]==1&&board[8]==0){//O O -
    return 8;
  }
  if(board[0]==1&&board[4]==0&&board[8]==1){//O - O
    return 4;
  }
  if(board[0]==0&&board[4]==1&&board[8]==1){//- O O
    return 0;
  }
  //diagonal 2
  if(board[2]==1&&board[4]==1&&board[6]==0){//O O -
    return 6;
  }
  if(board[2]==1&&board[4]==0&&board[6]==1){//O - O
    return 4;
  }
  if(board[2]==0&&board[4]==1&&board[6]==1){//- O O
    return 2;
  }
  return -1;
}
