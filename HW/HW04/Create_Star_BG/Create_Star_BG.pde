int i = 0;
int j = 0;
float[][] stars = new float[70][5];  //星體位置、顏色
String filename;

void setup()
{
  size( 400, 400 );
  surface.setTitle("BG");
  for( j = 1; j <= 10; j++ )
  {
    background(0);
    /* Position */
    for(i=0;i<70;i++)
    {
      stars[i][0]=random(150,255);
      stars[i][1]=random(150,255);
      stars[i][2]=random(150,255);
      stars[i][3]=random(0, 400);
      stars[i][4]=random(0, 400);
    }
    /* Draw stars */
    for(i=0;i<70;i++)
    {
      fill(stars[i][0],stars[i][1],stars[i][2]);
      circle(stars[i][3],stars[i][4],5.0);
    }
    
    /* Savefile */
    filename = "BG" + str(j) + ".png";
    save( filename );
  }
}
