/* Setting Page */

void show_setting_page()
{
  /* Background */
  image( BG_home, 240, 0 );
  
  fill( #FF0000 );
  textFont( Noto );
  textSize( 100 );
  text( "TBD", 850, 750 );
  
  /* Button: Home */
  Button_home.resize(250, 100);
  button button_home = new button( Button_home, (pixelWidth - Button_home.width)/2, (pixelWidth + Button_home.width)/2, pixelHeight - Button_home.height, pixelHeight );
  button_home.button_draw();
  
  if( mousePressed && button_home.OnClick( mouseX, mouseY ) )  PAGE = PAGE_HOME;
  return;
}
