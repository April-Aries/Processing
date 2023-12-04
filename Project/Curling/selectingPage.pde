PImage[] G=new PImage[6];
PImage[] B=new PImage[7];

int width=720;
int height=1080;
int fsWidth = displayWidth;
int fsHeight = displayHeight;
int selectedG=0;
int selectedB=0;
String[] B_text=new String[7];
String[] G_text=new String[6];
void ball_page_setup()
{
  fsWidth=displayWidth;
  fsHeight=displayHeight;
  G[0] = loadImage("B1.png");
  G[1] = loadImage("B2.png");
  G[2] = loadImage("B3.png");
  G[3] = loadImage("B4.png");
  G[4] = loadImage("B5.png");
  G[5] = loadImage("B6.png");
  G_text[0] = "glass";
  G_text[1] = "wood";
  G_text[2] = "sand";
  G_text[3] = "iron";
  G_text[4] = "plastic";
  G_text[5] = "Si";
  
  B[0]=loadImage("Ball1.png");
  B[1]=loadImage("Ball2.png");
  B[2]=loadImage("Ball3.png");
  B[3]=loadImage("Ball4.png");
  B[4]=loadImage("Ball5.png");
  B[5]=loadImage("Ball6.png");
  B[6]=loadImage("Ball7.png");
  for( int i = 0; i < 7; i++ )  B[i].resize(300, 300);
  B_text[0] = "basketball";
  B_text[1] = "soccer";
  B_text[2] = "pool ball";
  B_text[3] = "tennis";
  B_text[4] = "volleyball";
  B_text[5] = "baseball";
  B_text[6] = "bowling";
  textFont(Noto);
  
  rectMode(CENTER);
  imageMode(CENTER);
  //textAlign(CENTER, CENTER);
}

float Button_offset=40;
//float bx_offset=50;
float x_offset=50;
float y_offset=200;

float BBRx=0;
float BBRy=0;
float BBLx=0;
float BBLy=0;
float Gx=0;
float Gy=0;

float GBLx=0;
float GBLy=0;
float GBRx=0;
float GBRy=0;
float Bx=0;
float By=0;

float T_Backx=0;
float T_Backy=0;
float R_Applyx=0;
float R_Applyy=0;
float R_A_W=150;
float R_A_H=50;

void show_ball_page()
{
  stroke(#000000);
  fill(#F5EFE0);
  rect(fsWidth/2,fsHeight/2,width,height);
  
  BBRx=fsWidth/2-x_offset;
  BBRy=fsHeight/2+y_offset;
  BBLx=fsWidth/2-width/2+x_offset;
  BBLy=fsHeight/2+y_offset;
  Gx=(BBRx-BBLx)/2+fsWidth/2+x_offset;
  Gy=fsHeight/2-y_offset/2;
  fill(#1D5390);
  noStroke();
  triangle(BBRx, BBRy, BBRx, BBRy+Button_offset, BBRx+Button_offset/2, BBRy+Button_offset/2);
  triangle(BBLx, BBLy, BBLx, BBLy+Button_offset, BBLx-Button_offset/2, BBLy+Button_offset/2);
  image(G[selectedG], Gx, Gy);
  textSize(40);
  fill(#1D5390);
  text(G_text[selectedG],Gx-textWidth(G_text[selectedG])/2, fsHeight/2+y_offset+30);
 
  GBLx=fsWidth/2+x_offset;
  GBLy=fsHeight/2+y_offset;
  GBRx=fsWidth/2+width/2-x_offset;
  GBRy=fsHeight/2+y_offset;
  Bx=fsWidth/2-x_offset-(BBRx-BBLx)/2;
  By=fsHeight/2-y_offset/2;
  noFill();
  stroke(#1D5390);
  strokeWeight(3);
  triangle(GBLx, GBLy, GBLx, GBLy+Button_offset, GBLx-Button_offset/2, GBLy+Button_offset/2);
  triangle(GBRx, GBRy, GBRx, GBRy+Button_offset, GBRx+Button_offset/2, GBRy+Button_offset/2);
  image(B[selectedB], Bx, By);
  textSize(40);
  fill(#1D5390);
  text(B_text[selectedB],BBLx+30, fsHeight/2+y_offset+30);
  
  //R_Applyx=fsWidth/2;
  //R_Applyy=BBRy+200;
  //noStroke();
  //fill(#902F1D);
  //rect(R_Applyx, R_Applyy, R_A_W, R_A_H);
  //textSize(30);
  //fill(#F5EFE0);
  //text("APPLY",fsWidth/2-50, BBRy+210);
  
  T_Backx=fsWidth/2-width/2+10;
  T_Backy=50;
  textSize(30);
  fill(#1D5390);
  text("BACK",T_Backx, T_Backy);
  
  
  //stroke(255, 0, 0); 
  //strokeWeight(5);   
  //point(R_Applyx-R_A_W/2, R_Applyy-R_A_H/2); 
  //stroke(255, 0, 0); 
  //  strokeWeight(5);   
  //  point(BBLx, BBLy+Button_offset);
}

void mousePressed()
{
  if( PAGE == PAGE_BALL )
  {
    if(mouseX<GBLx && mouseX>(GBLx-Button_offset/2) && mouseY>GBLy && mouseY<GBLy+Button_offset)
    {
       selectedG-=1;
       if(selectedG<0)
       {
         selectedG=5;
       }
       //println(selectedG);
       image(G[selectedG], Gx, Gy);
    }
    if(mouseX>GBRx && mouseX<(GBRx+Button_offset/2) && mouseY>GBRy && mouseY<GBRy+Button_offset)
    {
       selectedG+=1;
       if(selectedG>5)
       {
         selectedG=0;
       }
       //println(selectedG);
       image(G[selectedG], Gx, Gy);
    }
    if(mouseX<BBLx && mouseX>(BBLx-Button_offset/2) && mouseY>BBLy && mouseY<BBLy+Button_offset)
    {
       selectedB-=1;
       if(selectedB<0)
       {
         selectedB=6;
       }
       //println(selectedB);
       image(B[selectedB], Bx, By);
    }
    if(mouseX>BBRx && mouseX<(BBRx+Button_offset/2) && mouseY>BBRy && mouseY<BBRy+Button_offset)
    {
        selectedB+=1;
        if(selectedB>6)
        {
          selectedB=0;
        }
        //println(selectedB);
        image(B[selectedB], Bx, By);
    }
    if(mouseX>T_Backx && mouseX<T_Backx+90 && mouseY<T_Backy && mouseY>T_Backy-30)
    {
      PAGE = PAGE_HOME;
    }
  }
  else if( PAGE == PAGE_GAME )
  {
    if( turn == 0){
    positioning=!positioning;
    if( mouseX>pixelWidth/2-312 && mouseX<pixelWidth/2+312){
      position[0] = mouseX;
    }else{
      if(mouseX>pixelWidth/2){
        position[0] = pixelWidth/2+312;
      }else{
        position[0] = pixelWidth/2-312;
      }
    }
    position[1] = pixelHeight/2+270;
    turn++;
    }else if( turn == 1){
      tan = ((float)mouseY-position[1]) / ((float)mouseX-position[0]);  //紀錄當前鼠標相對球的極座標
      angle[BBS-1] = atan( tan );
      if( mouseX < position[0] )  angle[BBS-1] += PI;
      if( sin(angle[BBS-1]) > 0 ){
          if( cos(angle[BBS-1]) > 0 ){
            angle[BBS-1]=0;
          }else{
            angle[BBS-1]=PI;
          }
      }
      
      speed[BBS-1]=sqrt(pow(mouseX-position[0],2)+pow(mouseY-position[1],2));
      if(speed[BBS-1]>210){
       speed[BBS-1]=210;
      }
      
      BOG[BBS-1][0]=position[0];
      BOG[BBS-1][1]=position[1];
      
      moving[BBS-1] = true;
      turn = 2;
    }
    if (mouseX > 0 && mouseX < 200 && mouseY > 0 && mouseY < 100) {
      score = 0; // 離開遊戲成績應該清0對吧？  
      PAGE = PAGE_HOME;
    }
  }
  
}
