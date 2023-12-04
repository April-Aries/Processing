/* Main Page */

void setup()
{
  /* Screen Setting */
  fullScreen();
  background(#FFFFFF);
  
  /* Fonts */
  TCfont = createFont("NotoSansTC-Medium.ttf", 28);
  Noto = createFont("NotoSerifTC-Black.otf",  28);
  
  /* Pictures */
  BG_home = loadImage( "home.png" );
  BG_home.resize( 1440, 1080 );
  BG_about = loadImage( "about.png" );
  BG_about.resize( 1440, 1080 );
  BG_tutorial = loadImage( "tutorial.png" ); // Editing...
  BG_tutorial.resize( 1440, 1080 );
  BG_rank = loadImage( "rank.png" );
  BG_rank.resize( 1440, 1080 );
  BG_end = loadImage( "end.png" );
  BG_end.resize( 1440, 1080 );
  
  Button_home = loadImage("button_home.png");
  Button_start = loadImage("button_start.png");
  Button_about = loadImage("button_about.png");
  Button_ball = loadImage("button_ball.png");
  Button_rank = loadImage("button_rank.png");
  Button_exit = loadImage("button_exit.png");
  Button_tutorial = loadImage("button_tutorial.png");
  Button_rank_black = loadImage("button_rank_black.png");
  Button_ThatsMe = loadImage("thatsMe.png");
  Button_backspace = loadImage("backspace.png");
  
  /* TextBox */
  nameTB = new TEXTBOX();
  nameTB.X = 900;
  nameTB.Y = 500;
  nameTB.W = 400;
  nameTB.H = 100;
  
  /* Others */
  frameRate( FRAMERATE );
  
  return;
}

void draw()
{
  background(#000000);
  switch( PAGE )
  {
    case PAGE_HOME:
      show_home_page();
      break;
    case PAGE_BALL:
      show_ball_page();
      break;
    case PAGE_RANKING:
      show_ranking_page();
      break;
    case PAGE_ABOUT:
      show_about_page();
      break;
    case PAGE_TUTORIAL:
      show_tutorial_page();
      break;
    case PAGE_GAME:
      show_game_page();
      break;
    case PAGE_END:
      show_end_page();
      break;
    default:
      show_error_page();
      break;
  }
  return;
}
