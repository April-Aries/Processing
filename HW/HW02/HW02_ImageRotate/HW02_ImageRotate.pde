PFont TCfont;
PFont Kfont;
PFont ROfont;

PImage dad;
PImage mom;
PImage sis;
PImage bro;
PImage haha;
PImage angry;

int offset_x = 150;
int offset_y = 330;
int family_size = 150;

int face_x = 512;
int face_y = 600;
int face_size = 100;

int angle = 0;

void setup()
{
  /* Window */
  size( 1024, 768 );
  surface.setTitle("HW02");
  surface.setLocation(100, 100);
  
  /* Text */
  TCfont = createFont("NotoSansTC-Medium.ttf", 28);
  Kfont = createFont("Kalam-Regular.ttf", 28 );
  ROfont = createFont("RampartOne-Regular.ttf", 28 );
  
  /* Picture */
  imageMode( CENTER );
  dad = loadImage("dad.png");
  mom = loadImage("mom.png");
  sis = loadImage("sis.png");
  bro = loadImage("bro.png");
  haha = loadImage("haha.png");
  angry = loadImage("angry_mom.png");
  
  /* Rotatation */
  frameRate(18);
}

void draw()
{
  background(#FFFBD8);
  
  textFont(Kfont);
  textAlign(LEFT, BOTTOM);
  
  fill(#3085F0);
  text( " # Processing", 0, 665 );
  text( " # Week4 Homework", 0, 715 );
  text( " # ImageRotate", 0, 765 );

  textFont(TCfont);
  textAlign(RIGHT, BOTTOM);
  text( "2D點陣彩圖置入與換圖，41047054S，陳柏瑜", 1024, 768);
  
  /* Text */
  textFont( ROfont );
  textAlign( CENTER );
  textSize(100);
  
  /* mouse pic */
  if( mousePressed )
  {
    background( #000000 );
    fill( #FF0000 );
    text("不要亂按！", 512, 384 );
    image( angry, mouseX, mouseY, 200, 160 );
  }
  else
  {
    /* Family Pic */
    if( angle <= 360 )
    {
      draw_family( dad, offset_x, offset_x, family_size, angle );
      draw_family( mom, 1024-offset_x, offset_x, family_size, angle );
      draw_family( sis, offset_x, offset_x+offset_y, family_size, angle );
      draw_family( bro, 1024-offset_x, offset_x+offset_y, family_size, angle );
      
      
      /* vector draw */
      pushMatrix();
      translate( face_x, face_y );
      rotate( radians( 360 - angle ) );
      face_draw( 0, 0, face_size );
      popMatrix();
      angle += 20;
    }
    else
    {
      delay( 500 );
      angle = 0;
    }
    
    fill( #FF0000 );
    text("我 們 這 一 家", 512, 384 );
    image( haha, mouseX, mouseY, 80, 80 );
  }
}

void draw_family( PImage pic, int x, int y, int size, int angle )
{
  pushMatrix();
  translate( x, y );
  rotate( radians( angle ) );
  image( pic, 0, 0, size, size );
  popMatrix();
}

void face_draw( int x, int y, int size )
{
  strokeWeight( 2 );
  stroke( #000000 );
  
  // face
  fill( #FFFFFF );
  circle( x, y, size );
  
  // eyebrow
  line( x-15, y-30, x-25, y-20 );
  line( x+15, y-30, x+25, y-20 );
  
  
  // eyes
  line( x-15, y-15, x-10, y-10 );
  line( x+15, y-15, x+10, y-10 );
  
  
  // mouth
  arc( x, y+5, size/2, size/2.5, radians( 15 ), radians( 165 )  );
  line( x - size/2 + 24, y+10, x + size/2 - 25, y+10 );
  
  // nose
  arc( x, y, size/10, size/10, PI, TWO_PI );
  
  
  // chicks
  noStroke();
  fill( #f0768b );
  ellipse( x-size/2+10, y, size/7, size/10 );
  ellipse( x+size/2-10, y, size/7, size/10 );
  
}
