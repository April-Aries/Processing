/* To do
1. Input is not stable
2. Backspace is not working
3. Space is not working
*/

PostRequest runQuery;

ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
int send_time = 0;
String warning_msg = "";

void show_page_import()
{
  /* Background */
  background( IMPORT_BG );
  
  fill( #000000 );
  textSize( 60 );
  text( "Name    :", 360, 500 );
  
  /* Text boxes */
  for (TEXTBOX t : textboxes)
  {
      t.DRAW();
  }
  
  /* Buttons: exit */
  button home = new button( "home", HomeButton, 300, 300+250, 800, 800+100 );
  home.button_draw();
  
  /* Button Send */
  button send = new button( "send", SendButton, 700, 700+250, 800, 800+100 );
  send.button_draw();
  
  /* Actions */
  
  //TB Actions
  
  for (TEXTBOX t : textboxes)
  {
    if( mousePressed )
    {
      t.PRESSED( mouseX, mouseY );
    }
  
    if( keyPressed )
    {
      t.KEYPRESSED( key, (int)keyCode );
    }
  }
  
  // Send Message
  if( send_time != 0 && send_time <= 20 )
  {
    textSize( 50 );
    fill( #FF0000 );
    text( warning_msg, (width - textWidth(warning_msg)) / 2, 930 );
    send_time += 1;
  }
  
  if( send_time == 12 )  send_time = 0;
  
  // Home Button
  if( mousePressed && home.OnClick( mouseX, mouseY ) )
  {
    /* Clean TextBox Buffer */
    for (TEXTBOX t : textboxes)
    {
        t.Text = "";
    }
    
    /* Page turn ... */
    PAGE = PAGE_HOME;
  }
  // Send Button
  else if( mousePressed && send.OnClick( mouseX, mouseY ) )
  {
    submit();
    if( textboxes.get(0).Text == "" && textboxes.get(1).Text == "" )
    {
      warning_msg = "Please fill your name and score\n";
    }
    else if( textboxes.get(0).Text == "" )
    {
      warning_msg = "Please fill your name\n";
    }
    else if( textboxes.get(1).Text == "" )
    {
      warning_msg = "Please fill your score\n";
    }
    else
    {
      warning_msg = "Your data has been sent!\n";
    }
    send_time = 1;
  }
  
  return;
}

void submit()
{
  /* Send to the cloud */
  String CallURL = "https://docs.google.com/forms/d/1aTh_jZyxIBnNB2u6rGggY6YZq0XgQvIp5EftwggR6GE/formResponse";
  CallURL = CallURL + "?entry.429617380=" + textboxes.get(0).Text;
  CallURL = CallURL + "&entry.1530940973=" + textboxes.get(1).Text;
  runQuery = new PostRequest( CallURL );
  runQuery.send();
  
  /* Save to the local csv
  Table table = loadTable( "Rank.csv", "header" );
  TableRow newRow = table.addRow();
  newRow.setString("name", textboxes.get(0).Text );
  newRow.setInt("score", int( textboxes.get(1).Text ) );
  saveTable( table, "Rank.csv" );
  */
  
  /* Save to the local txt */
  String[] lines = loadStrings("Rank.txt");
  String[] newdata = {};
  String name = textboxes.get(0).Text;
  String score = textboxes.get(1).Text;
  int flag = 0;
  
  for( int i = 0; i < lines.length; i++ )
  {
    String[] list = split( lines[i], "," );
    int standard = int( list[1]);
    if( !list[0].equals( name ) )
    {
      newdata = append( newdata, lines[i] );
    }
    else if( list[0].equals( name ) )
    {
      if( int(score) > standard )  newdata = append( newdata, name + "," + score );
      else  newdata = append( newdata, lines[i] );
      flag = 1;
    }
  }
  
  if( flag == 0 )
  {
    newdata = append( newdata, name + "," + score );
  }
  
  saveStrings( "Rank.txt", newdata );
  
  send_time = 1;
  
  return;
}
