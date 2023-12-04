/* Rank Page */

String[] names = new String[5];
int[] scores = new int[5];

void rank_setup()
{
  /* Show Rank */
  String[] data = loadStrings( CSV_link );
  
  for( int i = 0; i < 5; i++ )  names[i] = "";
  
  for( int i = 0; i < 5; i++ )  scores[i] = 0;
  
  for( int i = 0; i < data.length; i++ )
  {
    if( i == 0 )  continue;
    String[] line = split( data[i], "," );

    String _name = line[1];
    String _score = line[2];
    int _score_ = int( _score );
    // Blank rank
    if( _name.equals( "" ) )  continue;
    
    for( int j = 0; j < 5; j++ )
    {
      if( _name.equals( names[j] ) ) // Same name
      {
        if( _score_ > scores[j] )  {  scores[j] = _score_;  break;  }
        else  break;
      }
      else if( names[j].equals( "" ) )
      {
        names[j] = _name;
        scores[j] = _score_;
        break;
      }
      else if( _score_ > scores[j] )
      {
        // move rest rank one after
        for( int k = 4; k > j; k-- )
        {
          names[k] = names[k-1];
          scores[k] = scores[k-1];
        }
        // Replace
        names[j] = _name;
        scores[j] = _score_;
        break;
      }
    }
  }
  
  return;
}

void show_ranking_page()
{
  /* Background */
  image( BG_rank, 240, 0 );
  
  /* Print Rank */
  for( int i = 0; i < 5; i++ )
  {
    // Blank case
    if( names[i].equals( "" ) )  break;
    
    // Name
    fill( #000000 );
    textFont( Noto );
    textSize( 50 );
    text( names[i], 600, 450 + 100*i );
    
    // Score
    text( str( scores[i] ), 1100, 450 + 100*i );
  }
  
  /* Button: Home */
  Button_home.resize(250, 100);
  button button_home = new button( Button_home, (pixelWidth - Button_home.width)/2, (pixelWidth + Button_home.width)/2, pixelHeight - Button_home.height, pixelHeight );
  button_home.button_draw();
  
  if( mousePressed && button_home.OnClick( mouseX, mouseY ) )  PAGE = PAGE_HOME;
  
  return;
}
