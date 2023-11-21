void show_page_rank()
{
  /* Background */
  background( RANK_BG );
  
  /* Buttons: exit */
  button home = new button( "home", HomeButton, 500, 500+250, 800, 800+100 );
  home.button_draw();
  
  /* Actions */
  
  // Home Button
  if( mousePressed && home.OnClick( mouseX, mouseY ) )  PAGE = PAGE_HOME;
  
  // Read Data
  //Table table = loadTable( "Rank.csv", "header" );
  //table.sort( "score" );
  String[] data = loadStrings("Rank.txt");
  String[] names = new String[5];
  for( int i = 0; i < 5; i++ )  names[i] = "";
  int[] scores = new int[5];
  for( int i = 0; i < 5; i++ )  scores[i] = 0;
  
  for( int i = 0; i < data.length; i++ )
  {
    String[] line = split( data[i], "," );

    String _name = line[0];
    String _score = line[1];
    int _score_ = int( _score );
    
    // Form rank
    for( int j = 0; j < 5; j++ )
    {
      // Blank rank
      if( names[j] == "" ) // simply write in
      {
        names[j] = _name;
        scores[j] = _score_;
        break;
      }
      
      // Modify rank
      if( _score_ > scores[j] )
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

  /* Print Rank */
  for( int i = 0; i < 5; i++ )
  {
    // Blank case
    if( names[i].equals( "" ) )  break;
    
    // Name
    textSize( 80 );
    fill( #000000 );
    text( names[i], 320, 390 + 100*i );
    
    // Score
    text( str( scores[i] ), 750, 390 + 100*i );
  }
  
  //table = loadTable( CSV_link, "header");
  //println(table.getRowCount());
  
  return;
}
