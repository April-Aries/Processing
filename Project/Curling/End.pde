/* End Page */
String warning_msg = "";
int send_time = 0;
int key_input_offset = 0;
int back_offset = 0;

PostRequest runQuery;

void show_end_page()
{
  /* Background */
  image( BG_end, 240, 0 );
  
  /* Show Score */
  fill( #FFFFFF );
  textFont( TCfont );
  textSize( 100 );
  text( score, 1000, 400 );
  
  
  /* Name Input */
  fill( #000000 );
  textFont( Noto );  
  textSize( 50 );
  text( "Name    :", 650, 570 );
  
  // TextBox
  nameTB.DRAW();
  
  // backsoace
  Button_backspace.resize( 70, 70 );
  button button_backspace = new button( Button_backspace, 1320, 1320 + Button_backspace.width, 520, 520 + Button_backspace.height );
  button_backspace.button_draw();
  
  /* Buttons */
  
  Button_ThatsMe.resize(250, 100);
  button button_ThatsMe = new button( Button_ThatsMe, 880, 880 + Button_ThatsMe.width, 700, 700 + Button_ThatsMe.height );
  button_ThatsMe.button_draw();
  
  Button_home.resize(250, 100);
  button button_home = new button( Button_home, 1200, 1200 + Button_home.width, 950, 950 + Button_home.height );
  button_home.button_draw();
  
  Button_rank_black.resize(250, 100);
  button button_rank = new button( Button_rank_black, 500, 500 + Button_rank_black.width, 950, 950 + Button_rank_black.height );
  button_rank.button_draw();
  
  if( back_offset != 0 )  back_offset++;
  if( back_offset > FRAMERATE )  back_offset = 0;
  
  if( key_input_offset != 0 )  key_input_offset++;
  if( key_input_offset > 0.5 * FRAMERATE )  key_input_offset = 0;
  
  
  if( send_time != 0 && send_time <= FRAMERATE * 2 )
  {
    textSize( 50 );
    fill( #FF0000 );
    text( warning_msg, ( pixelWidth - textWidth(warning_msg) ) / 2, 900 );
    send_time += 1;
  }
  
  if( send_time == FRAMERATE * 2 )  send_time = 0;
  
  if( mousePressed && button_home.OnClick( mouseX, mouseY ) )
  {
    PAGE = PAGE_HOME;
    nameTB.Text = "";
  }
  else if( mousePressed && button_rank.OnClick( mouseX, mouseY ) )
  {
    rank_setup();
    PAGE = PAGE_RANKING;
    nameTB.Text = "";
  }
  else if( mousePressed && button_ThatsMe.OnClick( mouseX, mouseY ) )
  {
    send_time = 1;
    if( nameTB.Text.equals( "" ) )  warning_msg = "Please fill in the name textbox";
    else
    {
      /* Check if the same name */
      String[] data = loadStrings( CSV_link );
      int flag = 0;
      for( int i = 0; i < data.length; i++ )
      {
        String[] lines = split( data[i], "," );
        if( lines[1].equals( nameTB.Text ) )
        {
          warning_msg = "This name has been used!";
          nameTB.Text = "";
          flag = 1;
          break;
        }
      }
      
      if( flag == 0 )
      {
        /* Send query to cloud */
        submit( nameTB.Text, score );
        
        warning_msg = "Your data has been sent to the cloud!";
      }
    }
    nameTB.Text = "";
  }
  else if( mousePressed && button_backspace.OnClick( mouseX, mouseY ) && back_offset == 0 && nameTB.TextLength > 0 )
  {
    back_offset = 1;
    nameTB.BACKSPACE();
  }
  else if( mousePressed )
  {
    nameTB.PRESSED( mouseX, mouseY );
  }
  
  if( keyPressed && key_input_offset == 0 )
  {
    nameTB.KEYPRESSED( key );
    key_input_offset = 1;
  }
  
  return;
}

void submit( String name, int score )
{
  /* Send to the cloud */
  String CallURL = "https://docs.google.com/forms/d/e/1FAIpQLSeURNJCKOnf6YutNBvYLIy0tI50yU9JcyIVlSBLALs2atV2Mg/formResponse";
  CallURL = CallURL + "?entry.452187943=" + name;
  CallURL = CallURL + "&entry.1342471323=" + str( score );
  runQuery = new PostRequest( CallURL );
  runQuery.send();
  return;
}
