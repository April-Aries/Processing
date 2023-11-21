int i=0;
int j = 0;
int time = 0;

int translation_lon=0;  //縱向累積位移
int translation_lat=0;  //橫向累積位移
float theta=0;            //當前鼠標相對畫面中心的極座標

float rocketX=pixelWidth/2;
float rocketY=pixelHeight/2;
float diffX = 0.0;
float diffY = 0.0;

float[][] planets = new float[6][2];  //行星位置
PImage img[] = new PImage[32];
String[] Name_p = {"Jupiter","Mars","Mercury","Neptune","Pluto","Venus"};

boolean moving = true;

PImage BG[] = new PImage[10]; // 背景圖片、X, Y
int[][] BG_position = new int[20][20];
int BGX = int(-0.5 * pixelWidth);
int BGY = int(-0.5 * pixelHeight);

void setup()
{
  fullScreen();
  background(0);
  rectMode(CENTER);
  fill(255);

  for( i = 0; i < 10; i++ )
  {
    BG[i] = loadImage( "BG" + str(i+1) + ".png" );
  }
  
  for( i=0;i<Name_p.length;i++)
  {
    img[i] = loadImage(Name_p[i]+".png");
    img[i].resize( 200 , int(img[i].height*200/img[i].width) );
    planets[i][0] = random(-pixelWidth*0.5,pixelWidth*1.5);
    planets[i][1] = random(-pixelHeight*0.5,pixelHeight*1.5);
  }
}

void draw()
{
  time++;
  background(0);
  
  // Draw Background
  draw_BG();
  
  // planets
  modify();
  
  /* Draw Planets */
  for( i=0;i<Name_p.length/2;i++)
  {
    image( img[i] , planets[i][0] , planets[i][1] );
  }
  
  /* Get Mouse Data*/
  get_mouse();
  
  /* Draw Rocket */
  draw_rocket();
  
  /* Draw Rest Planets */
  for( i=Name_p.length/2; i < Name_p.length;i++)
  {
    image( img[i] , planets[i][0] , planets[i][1] );
  }
}

void draw_BG()
{
  i = 0;
  for( BGX = int(-0.5 * pixelWidth); BGX <= 1.5 * pixelWidth; BGX += 400 )
  {
    j = 0;
    for( BGY = int(-0.5 * pixelHeight); BGY <= 1.5 * pixelHeight; BGY += 400 )
    {
      image( BG[ BG_position[i][j] ], BGX, BGY );
      j++;
    }
    i++;
  }
  
  return;
}

void modify()
{
  /* Change stars and planets position*/
  // stars
  if( time % 20 == 0 )
  {
    /* 拼貼背景圖 */
    for( i = 0; i < 20; i++ )
    {
      for( j = 0; j < 20; j++ )
      {
        BG_position[i][j] = int( random(0,10) );
        if( BG_position[i][j] == 10 ) BG_position[i][j] = 9;
      }
    }
    if( time == 600 )  time = 0;
  }
  
  /* Change relative planets position */
  for( i=0;i<Name_p.length;i++)
  {
    planets[i][0] -= diffX;
    planets[i][1] -= diffY;
  }
  
  return;
}

void get_mouse()
{
  float tan = ((float)mouseY-pixelHeight/2) / ((float)mouseX-pixelWidth/2);  //紀錄當前鼠標相對畫面中心的極座標
  theta = atan( tan );
  float speed = 0.0;
  
  /* Determine if moving */
  if( mouseX>pixelWidth/2+200 || mouseX<pixelWidth/2-200 || mouseY>pixelHeight/2+200 || mouseY<pixelHeight/2-200 )
  {
    moving = true;
    speed = 10;
  }
  else
  {
    speed = 0;
    moving = false;
  }
  
  /* Calculate speed */
  if( mouseX < pixelWidth/2 )  theta += PI;
  diffX = cos(theta) * speed;
  diffY = sin(theta) * speed;
  
  return;
}

void draw_rocket()
{
  pushMatrix();
  noStroke();
  
  rocketX += diffX;
  rocketY += diffY;
  
  if( rocketX > pixelWidth )  rocketX = pixelWidth;
  else if( rocketX < 0 )  rocketX = 0;
  if( rocketY > pixelHeight )  rocketY = pixelHeight;
  else if( rocketY < 0 )  rocketY = 0;
  
  translate( rocketX, rocketY );
  
  /* Rotate */
  rotate(theta);
  
  /* Draw */
  fill(255);
  rect(0,0,100,50);
  
  if(moving)
  {
    fill(255,100,0);
    triangle(-50,-25,-50,5,-85,-10);
    triangle(-50,-5,-50,25,-85,10);
    triangle(-50,-15,-50,15,-85,0);
    fill(255,0,0);
    triangle(-50,-25,-50,25,-70,0);
  }
  
  fill(255,0,0);
  triangle(50,-25,50,25,100,0);
  fill(150);
  triangle(0,25,-50,25,-50,50);
  triangle(0,-25,-50,-25,-50,-50);
    
  popMatrix();
  
  return;
}
