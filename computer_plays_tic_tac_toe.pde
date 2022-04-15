//yes I am aware that arduenos are programed in c and that this is being written in processing/java
void setup(){
  size(1280,720);//set the winow size
}
int[] board=new int[9];

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
}
