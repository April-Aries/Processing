/* About Page */

void show_about_page()
{
  /* Background */
  image( BG_about, 240, 0 );
  
  /* Text */
  textFont( TCfont );
  fill( #000000 );
  String[] lines = loadStrings( "AboutUs.txt" );
  for( int i = 0; i < lines.length; i++ )
  {
    text( lines[i], 400, 220 + 50*i );
  }
  
  /* Button: Home */
  Button_home.resize(250, 100);
  button button_home = new button( Button_home, (pixelWidth - Button_home.width)/2, (pixelWidth + Button_home.width)/2, pixelHeight - Button_home.height, pixelHeight );
  button_home.button_draw();
  
  if( mousePressed && button_home.OnClick( mouseX, mouseY ) )  PAGE = PAGE_HOME;
  
  return;
}
