PImage bad;
PImage good;
PFont TCfont;
PFont Kfont;
int super_x = 700;
int super_y = 400;
int punch_x = 300;
int punch_y = 300;
int num = 80;
float mx[] = new float[num];
float my[] = new float[num];

void setup()
{
  /* Window */
  size( 1024, 768 );
  background(#FFFBD8);
  surface.setTitle("HW01");
  surface.setResizable(true);
  surface.setLocation(100, 100);
  
  /* Text */
  TCfont = createFont("NotoSansTC-Medium.ttf", 28);
  Kfont = createFont("Kalam-Regular.ttf", 28 );
  
  /* Picture */
  bad = loadImage("bad_guy.png");
  good = loadImage("good_guy.png");
}

void draw()
{
  /* Background */
  fill( #FFFBD8 );
  rect( 0, 0, 1024, 768 );
  
  /* Other Objects */
  
  /* Object 1 */
  stroke(#000000);
  strokeWeight(3);
  // Face
  fill( #FFC58E );
  circle( super_x, super_y, 300 );
  // Nose
  fill( #FF663B );
  circle( super_x, super_y, 80 );
  // Chick
  fill( #FF9C81 );
  circle( super_x-80, super_y, 80 );
  circle( super_x+80, super_y, 80 );
  // Eyes
  fill( #000000 );
  ellipse( super_x-40, super_y-60, 20, 30 );
  ellipse( super_x+40, super_y-60, 20, 30 );
  //Eyebrow
  noFill();
  arc( super_x-40, super_y-60, 60, 90, 2.96650, 6.1075 );
  arc( super_x+40, super_y-60, 60, 90, 3.31549, 6.4565 );
  //mouth
  arc( super_x, super_y+25, 160, 100, 0.52350, 2.61749 );
  // light
  fill( #FFFFFF );
  noStroke();
  rect( super_x, super_y-5, 10, 10, 28 );
  rect( super_x-85, super_y-5, 10, 10, 28 );
  rect( super_x+80, super_y-5, 10, 10, 28 );
  
  /* Object 2 */
  stroke(#000000);
  strokeWeight(3);
  //face
  fill( #F5D8C1 );
  ellipse( punch_x, punch_y, 200, 300 );
  //eyes
  fill( #FFFFFF );
  arc( punch_x-50, punch_y-40, 50, 40, 0, PI );
  arc( punch_x+50, punch_y-40, 50, 40, 0, PI );
  line( punch_x-75, punch_y-40, punch_x-25, punch_y-40 );
  line( punch_x+75, punch_y-40, punch_x+25, punch_y-40 );
  fill( #000000 );
  circle( punch_x-40, punch_y-35, 2 );
  circle( punch_x+60, punch_y-35, 2 );
  //eyebrow
  line( punch_x-75, punch_y-50, punch_x-25, punch_y-50 );
  line( punch_x+75, punch_y-50, punch_x+25, punch_y-50 );
  //nose
  line( punch_x+10, punch_y-20, punch_x+20, punch_y+45 );
  line( punch_x+20, punch_y+45, punch_x+15, punch_y+50 );
  //mouth
  line( punch_x+15, punch_y+100, punch_x+10, punch_y+100 );
  
  
  /* Moving element */
  noStroke();
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    if( mousePressed )
    {
      image( good, mx[index],my[index], i, i );
    }
    else
    {
      image( bad, mx[index],my[index], i, i );
    }
  }
  
  /* Text */
  textFont(Kfont);
  textAlign(LEFT, BOTTOM);
  
  fill(#3085F0);
  text( " Processing", 0, 665 );
  text( " Week3 Homework", 0, 715 );
  text( " Vector draw", 0, 765 );
  
  textAlign(RIGHT, BOTTOM);
  textFont(TCfont);
  text( "HW_1_向量繪圖造型練習，41047054S，陳柏瑜", 1024, 768);
}
