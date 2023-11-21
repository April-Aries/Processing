String CSV_link = "https://docs.google.com/spreadsheets/d/e/2PACX-1vSKOpM2xZzCAi5QkF8DeLa0kU5HVGRQCpB0974fimQj_vLMxBdzFrvzfMPTa4CTHligtLq1xWiyv2TS/pub?gid=608239100&single=true&output=csv&sheet=1";

void show_page_home()
{
  /* Background */
  background( HOME_BG );
  
  /* Buttons: data import, view rank, exit */
  button rank = new button( "rank", RankButton, 500, 500+250, 470, 470+100 );
  rank.button_draw();
  button write = new button( "write", ImportButton, 500, 500+250, 590, 590+100 );
  write.button_draw();
  button read = new button( "read", ReadCloudButton, 500, 500+250, 710, 710+100 );
  read.button_draw();
  button exit = new button( "exit", ExitButton, 500, 500+250, 830, 830+100 );
  exit.button_draw();
  
  /* Actions */
  if( mousePressed && rank.OnClick( mouseX, mouseY ) )  PAGE = PAGE_RANK;
  else if( mousePressed && write.OnClick( mouseX, mouseY ) )  PAGE = PAGE_IMPORT;
  else if( mousePressed && read.OnClick( mouseX, mouseY ) )  read_data();
  else if( mousePressed && exit.OnClick( mouseX, mouseY ) )  exit();
  
  return;
}

void read_data()
{
  String[] lines = loadStrings( CSV_link );
  for (int i = 0; i < lines.length; i++)
  {
    println(i + ". " + lines[i] );
  }
  return;
}
