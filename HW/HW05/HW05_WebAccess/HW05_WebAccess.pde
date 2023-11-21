import http.requests.*;

/* Pages */
PImage HOME_BG;
PImage RANK_BG;
PImage IMPORT_BG;

int PAGE = 0;
final int PAGE_HOME = 0;
final int PAGE_IMPORT = 1;
final int PAGE_RANK = 2;

/* Buttons */
PImage HomeButton;
//button home = new button( "home", HomeButton.  );
PImage RankButton;
PImage ImportButton;
PImage ExitButton;
PImage ExitBlackButton;
PImage SendButton;
PImage ReadCloudButton;

/* Fonts */
PFont comic;

void setup()
{
  /* Background */
  size( 1264, 948 );
  surface.setTitle("HW05");
  surface.setResizable(false);
  surface.setLocation( 100, 75 );
  HOME_BG = loadImage( "home.png" );
  RANK_BG = loadImage( "leaderboard.png" );
  IMPORT_BG = loadImage( "import.png" );
  
  /* Text Boxex*/
  
  TEXTBOX nameTB = new TEXTBOX();
  nameTB.X = 630;
  nameTB.Y = 450;
  nameTB.W = 400;
  nameTB.H = 100;
  
  TEXTBOX scoreTB = new TEXTBOX();
  scoreTB.X = 630;
  scoreTB.Y = 275;
  scoreTB.W = 400;
  scoreTB.H = 100;
  
  textboxes.add( nameTB );
  textboxes.add( scoreTB );
  
  /* Fonts */
  comic = createFont( "ComicNeue-Bold.ttf", 60 );
  textFont( comic );
  
  /* Buttons */
  // Home
  HomeButton = loadImage( "homeButton.png" );
  HomeButton.resize( 250, 100 );
  // Score Import
  ImportButton = loadImage( "importButton.png" );
  ImportButton.resize( 250, 100 );
  // Rank
  RankButton = loadImage( "rankButton.png" );
  RankButton.resize( 250, 100 );
  // Exit
  ExitButton = loadImage( "exitButton.png" );
  ExitButton.resize( 250, 100 );
  // ExitBlack
  ExitBlackButton = loadImage( "exitBlackButton.png" );
  ExitBlackButton.resize( 250, 100 );
  // Exit
  SendButton = loadImage( "sendButton.png" );
  SendButton.resize( 250, 100 );
  // ReadCloud
  ReadCloudButton = loadImage( "readCloud.png" );
  ReadCloudButton.resize( 250, 100 );
  
  /* Others */
  frameRate(10);
  
  return;
}

void draw()
{
  switch( PAGE )
  {
    case PAGE_HOME:
      show_page_home();
      break;
    case PAGE_IMPORT:
      show_page_import();
      break;
    case PAGE_RANK:
       show_page_rank();
       break;
  }
  return;
}
