/* Game Page */

int x=0;
int i=0;
int j=0;
int turn=0;
float tan=0;
float theta=0;
float size=0;
int timer=0;
int score=0;                    //這個是要被讀取的分數
float[] speed = new float[5];
float[] angle = new float[5];
int[] Dpm_X = new int[5];       //displacement_of Y
int[] Dpm_Y = new int[5];       //displacement_of Y
int[][] BOG = new int[5][2];    //balls_on_ground
int BBS = 0;                    //balls_been_shoot
int[] position = {0,0};
int balls=0;    //球數統計
String[] Ball_N = { "Ball1.png" , "Ball2.png" , "Ball3.png" , "Ball4.png" , "Ball5.png" , "Ball6.png" , "Ball7.png" };
float[] EOB = { 1 , 0.9 , 0.8 , 0.75 , 0.7 , 0.6 , 0.5};  //
PImage Ball_I;
String[] Ground_N = {"11.jpg" , "12.jpg" , "13.jpg" , "14.jpg" , "15.jpg" , "16.jpg" , };  //624*957
float[] FOG = { 1 , 0.5 , 1.5 , 2 , 2.5 , 5};
PImage Ground_I;
float ec = 0;
float friction = 1;
boolean positioning = false;
boolean[] moving = new boolean[5];

void show_game_page()
{
  background(255);
  noFill();
  stroke(0);
  strokeWeight(4);
  fill(250,50,50);
  rect(pixelWidth-200,150,200,100);
  fill(0);
  textSize(50);
  text("Score:",pixelWidth-500,200);
  textSize(80);
  text(score,pixelWidth-230,180);
  
  // Back button ( Here is not an actual button though )
  fill( #F5EFE0 );
  rect( 100, 50, 200, 100 );
  fill( 0 );
  textFont( Noto );
  textSize(50);
  text( "Back", 40, 70 );
  
  noFill();
  image( Ground_I , pixelWidth/2,pixelHeight/2);
  rect(pixelWidth/2,pixelHeight/2,624,957);  //場地框大小
  line(pixelWidth/2-312,pixelHeight/2+270,pixelWidth/2+312,pixelHeight/2+270);  //球起點線
  for(i=3;i>0;i--){
    circle(pixelWidth/2,pixelHeight/2-200,(i-1)*150+200);      //場中同心圓
  }
  
  for(i=0;i<BBS;i++){
    if(!moving[i] && BOG[i][0]>pixelWidth/2-352 && BOG[i][0]<pixelWidth/2+352){
      image( Ball_I , BOG[i][0] , BOG[i][1]);
    }
  }
  noFill();
  if( turn == 0 ){    //定位階段，這個以下就都是判斷了，沒有外觀上的東西能改(想加點碰撞特效也不是不行
    if( mouseX>pixelWidth/2-312 && mouseX<pixelWidth/2+312){
      image( Ball_I , mouseX , pixelHeight/2+270);
    }else{
      if(mouseX>pixelWidth/2){
        image( Ball_I , pixelWidth/2+312 , pixelHeight/2+270);
      }else{
        image( Ball_I , pixelWidth/2-312 , pixelHeight/2+270);
      }
    }
  }else if( turn == 1 ){      //瞄準階段
    noStroke();
    fill(255);
    rect(pixelWidth/2-387,pixelHeight/2,150,pixelHeight);  
    rect(pixelWidth/2+387,pixelHeight/2,150,pixelHeight);  
    rect(pixelWidth/2,pixelHeight/2-553,650,150);
    noFill();
    stroke(0);
    strokeWeight(4);
    rect(pixelWidth/2+400,pixelHeight/2+200,80,500,40,40,40,40);
    for(i=4;i>=BBS;i--){
      image( Ball_I , pixelWidth/2+400 , pixelHeight/2+i*80+80);
    }
    
    image( Ball_I , position[0] , position[1]);
    tan = ((float)mouseY-position[1]) / ((float)mouseX-position[0]);  //紀錄當前鼠標相對球的極座標
    theta = atan( tan );
    if( mouseX < position[0] )  theta += PI;
    translate(position[0],position[1]);
    size=sqrt(pow(mouseX-position[0],2)+pow(mouseY-position[1],2));    //強度度量做在這裡
    
    if(mouseY<position[1]){
        rotate(theta);
    }else{
      if( mouseX < position[0] ){
        rotate(PI);
      }
    }
    if(size>210){
      fill(255);
      rect(75,0,150,60);        
      fill(255,0,0);
      triangle(150,-60,150,60,210,0);
    }else{
      fill(255);
      rect((int)(size*5/14),0,(int)(size*5/7),(int)(size*2/7));        
      fill(255,0,0);
      triangle((int)(size*5/7),-(int)(size*2/7),(int)(size*5/7),(int)(size*2/7),(int)(size),0);
    }
  }else if( turn == 2 ){    //發射階段
    for( i=0 ; i < BBS ; i++ ){
      
      if(moving[i]){                 //若i項球正在移動
        Dpm_X[i] += (int)(cos(angle[i]) * (speed[i]));                    //增加其橫向位移
        Dpm_Y[i] += (int)(sin(angle[i]) * (speed[i]));                    //增加其縱向位移
        if(BOG[i][0]+Dpm_X[i]/30>pixelWidth/2-352 && BOG[i][0]+Dpm_X[i]/30<pixelWidth/2+352){
          image( Ball_I , BOG[i][0]+Dpm_X[i]/30 , BOG[i][1]+Dpm_Y[i]/30 );  //在其原點+位移的座標上顯示該球
        }
        speed[i] -= friction;                                             //摩擦力作用
        if(speed[i] <= 0){                                               //速度為0者取消其移動
          moving[i]=false;
          BOG[i][0] +=Dpm_X[i]/30;
          BOG[i][1] +=Dpm_Y[i]/30;
          Dpm_X[i] = 0;
          Dpm_Y[i] = 0;
        }
      }
      
      for( j=0 ; j < BBS ; j++ ){                                                                                                                        //判定撞擊
        if( i!=j && sqrt(pow( BOG[i][0]+Dpm_X[i]/30 - BOG[j][0] - Dpm_X[j]/30 ,2)+pow( BOG[i][1]+Dpm_Y[i]/30 - BOG[j][1] - Dpm_Y[j]/30 ,2)) <= 75 && timer == 0 ){   //不是同個、間距<75，且過冷卻
          tan = (float)( BOG[j][1] + Dpm_Y[j]/30 - BOG[i][1] - Dpm_Y[i]/30 ) / (float)( BOG[j][0] + Dpm_X[j]/30 - BOG[i][0] - Dpm_X[i]/30 );
          theta = atan( tan );
          //print(speed[j]+"\t"+angle[j]+"\t"+speed[i]+"\t"+angle[i]+"\n");
          if( BOG[j][0] + Dpm_X[j]/30 < BOG[i][0] + Dpm_X[i]/30 )  theta += PI;
          speed[j] = cos( angle[i] - theta ) * speed[i] ;
          //speed[j] = cos( angle[i] - theta ) * speed[i] * ec;
          angle[j] = theta;
          moving[j] = true;
          speed[i] = (sin( angle[i] - theta ) * speed[i]);
          //speed[i] = (sin( angle[i] - theta ) * speed[i]) * ec + speed[i]*(1-ec);
          if ( cos(theta) > 0){
            angle[i] = (theta - PI/2);
            //angle[i] = (theta - PI/2) * ec + angle[i] * (1-ec);
          }else{
            angle[i] = (theta + PI/2);
            //angle[i] = (theta + PI/2) * ec + angle[i] * (1-ec);
          }
          //print(speed[j]+"\t"+angle[j]+"\t"+speed[i]+"\t"+angle[i]+"\n");
          if(timer == 0)    timer=2;
        }
      }
      
    }
    if( !moving[0] && !moving[1] && !moving[2] && !moving[3] && !moving[4]){
      score = 0;
      for(i=0;i<BBS;i++){
        if(sqrt(pow(pixelWidth/2 - BOG[i][0],2)+pow(pixelHeight/2-200 - BOG[i][1],2))<=100){
          score += 50;
        }else if(sqrt(pow(pixelWidth/2 - BOG[i][0],2)+pow(pixelHeight/2-200 - BOG[i][1],2))<=175){
          score += 30;
        }else if(sqrt(pow(pixelWidth/2 - BOG[i][0],2)+pow(pixelHeight/2-200 - BOG[i][1],2))<=250){
          score += 10;
        }
      }
      if( BBS == 5){
        print(score);
        turn = 0;
        PAGE = PAGE_END;    //這裡代入結算畫面，現在丟完五顆就退出是正常的
      }else{
        BBS += 1;
        turn = 0;
      }
    }
    if(timer!=0)    timer-=1;
  }
  if( turn!=1 ){
    noStroke();
    fill(255);
    rect(pixelWidth/2-387,pixelHeight/2,150,pixelHeight);  
    rect(pixelWidth/2+387,pixelHeight/2,150,pixelHeight);  
    rect(pixelWidth/2,pixelHeight/2-553,650,150); 
    
    noFill();
    stroke(0);
    strokeWeight(4);
    rect(pixelWidth/2+400,pixelHeight/2+200,80,500,40,40,40,40);
    for(i=4;i>=BBS;i--){
      image( Ball_I , pixelWidth/2+400 , pixelHeight/2+i*80+80);
    }
  }
  
  return;
}

void game_setup()
{
  noFill();
  stroke(0);
  strokeWeight(4);
  rectMode(CENTER);
  imageMode(CENTER);
  balls=5;  //設定球數
  Ball_I = loadImage(Ball_N[selectedB]);        //這裡代入球種(替換0)
  ec = EOB[0];                          //這裡代入球種(替換0)，這裡有個bug不好修，換球就先當成換皮吧，這行的數字不要改
  Ball_I.resize(75,75);
  Ground_I = loadImage(Ground_N[selectedG]);    //這裡代入場地(替換0)
  Ground_I.resize(624,957);
  friction = FOG[selectedG];                    //這裡代入場地(替換0)
  
  BBS = 1;
  Dpm_X[BBS-1] = 0;
  Dpm_Y[BBS-1] = 0;
  BOG = new int[5][2];
  return;
}
