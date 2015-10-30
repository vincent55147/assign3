//You should implement your assign3 here.
//moveimage
PImage enemy,fighter,treasure;
//background
PImage bg1,bg2,hp,bg3,start1,start2,end1,end2;

int treasureX,treasureY,enemyX=0,enemyY,bg1x=0,hphave,fighterX,fighterY,i,mode,s;

boolean go_left  = false;
boolean go_up    = false;
boolean go_down  = false;
boolean go_right = false;
boolean start    = true;
boolean end      = false;
boolean change ;

void setup () {
  size(640, 480) ;
  fighterX=width-51;
  fighterY=height/2;
  //loadimage
  bg1=loadImage("img/bg1.png");
  bg3=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  fighter=loadImage("img/fighter.png");
  treasure=loadImage("img/treasure.png"); 
  hp=loadImage("img/hp.png");
  enemy=loadImage("img/enemy.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  //random
  treasureY=floor(random(41,439));
  treasureX=floor(random(41,599));
  enemyY=floor(random(0,419)); 
  mode=0;
  hphave=40;
}

void draw() {
   if(start){
  image(start2,0,0);
  if((mouseX>206&&mouseX<446)&&(mouseY>306&&mouseY<408)){
  image(start1,0,0);
  }
  }
  
  else if(end){
  image(end2,0,0);
  if((mouseX>206&&mouseX<446)&&(mouseY>306&&mouseY<408)){
  image(end1,0,0);
  }
  }
  //game
  else{
  bg1x+=2;
  bg1x=bg1x%1280;
  image(bg1,bg1x,0);
  image(bg2,bg1x-640,0);
  image(bg3,bg1x-1280,0);
  
  enemyX+=3;
  
  if(mode%3+1==1){
  if(enemyX>945){
  mode++;
  enemyX=0; 
  enemyY=floor(random(305,419));
  }
  for(int v=0;v<5;v++){
    image(enemy,enemyX+v*61-305,enemyY);
  }
  }
  
  if(mode%3+1==2){
  if(enemyX>945){
  mode++;
  enemyX=0; 
  enemyY=floor(random(122,236));
  }
  for(int v=0;v<5;v++){
    image(enemy,enemyX+v*61-305,enemyY-v*61);
  }
  }
 
 if(mode%3+1==3){
  if(enemyX>945){
  mode++;
  enemyX=0; 
  enemyY=floor(random(0,419));
  }
  for(int v=0;v<5;v++){
 
    if(v==0)image(enemy,enemyX-305,enemyY);
    if(v==1){image(enemy,enemyX+v*61-305,enemyY-1*61);image(enemy,enemyX+v*61-305,enemyY+1*61);}
    if(v==2){image(enemy,enemyX+v*61-305,enemyY-2*61);image(enemy,enemyX+v*61-305,enemyY+2*61);}
    if(v==3){image(enemy,enemyX+v*61-305,enemyY-1*61);image(enemy,enemyX+v*61-305,enemyY+1*61);}
    if(v==4)image(enemy,enemyX+v*61-305,enemyY);
  }
  }
  image(fighter,fighterX,fighterY);
  fill(255,0,0);
  
  
  
  
  
  
  
  rect(10,0,hphave,31);
  image(hp,0,0);
  image(treasure,treasureX,treasureY);
  
  
  
  
  
  
  if((fighterX<=width-51&&fighterX>=0)){
  if((fighterY<=height-51&&fighterY>=0)){
  if(go_up){
  fighterY-=5;
  }
  if(go_down){
  fighterY+=5;
  }
  if(go_left){
  fighterX-=5;
  }
  if(go_right){
  fighterX+=5;
  }
  }
  else if(fighterY>height-51)
    fighterY=height-51;
   else
   fighterY=0;
  }
  else if(fighterX>width-51)
    fighterX=width-51;
    else
    fighterX=0;

  //catch treasure
   if((treasureX+41 >fighterX&&treasureX+41<=fighterX+51)&&(treasureY>=fighterY&&treasureY<=fighterY+51)){
    if(hphave<200)
     hphave+=20;
  treasureY=floor(random(41,439));
  treasureX=floor(random(41,599));
  }
  else if((treasureX+41 >fighterX&&treasureX+41<=fighterX+51)&&
  (treasureY+41>=fighterY&&treasureY+41<=fighterY+51)){
   if(hphave<200)
    hphave+=20;
    treasureY=floor(random(41,439));
  treasureX=floor(random(41,599));
  }
  else if((treasureX+41 >fighterX+51&&treasureX<=fighterX+51)&&
  (treasureY+41>=fighterY+51&&treasureY+41<=fighterY+51)){
   if(hphave<200)
    hphave+=20;
    treasureY=floor(random(41,439));
  treasureX=floor(random(41,599));
  }
    else if((treasureX+41 >fighterX+51&&treasureX<=fighterX+51)&&
  (treasureY+41>=fighterY+51&&treasureY<=fighterY+51)){
   if(hphave<200)
    hphave+=20;
    treasureY=floor(random(41,439));
  treasureX=floor(random(41,599));
  }
  
  
  if(hphave<=0)
   end=true; 
}
}


void mousePressed(){
  if(start){
    if((mouseX>206&&mouseX<446)&&(mouseY>306&&mouseY<408))
   start = false;
  }
   if(end){
    if((mouseX>206&&mouseX<446)&&(mouseY>306&&mouseY<408))
   end = false;
   hphave=40;
   fighterX=width-51;
   fighterY=height/2;
   treasureY=floor(random(41,439));
  treasureX=floor(random(41,599));
  }

}

void keyPressed(){
if(key==CODED){
  switch(keyCode){
    case UP:
    go_up = true;
    break;
    case DOWN:
    go_down = true;
    break;
    case LEFT:
    go_left = true;
    break;
    case RIGHT:
    go_right = true;
    break;   
  }
}
}
void keyReleased(){
if (key == CODED) {
    switch (keyCode) {
      case UP:
        go_up = false;
        break;
      case DOWN:
        go_down = false;
        break;
      case LEFT:
        go_left = false;
        break;
      case RIGHT:
        go_right = false;
        break;
    }
  }
}
