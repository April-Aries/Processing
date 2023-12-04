/* Home Page */
void show_home_page()
{
  /* Background */
  image( BG_home, 240, 0 );
  
  /* Buttons */
  Button_start.resize(150, 70);
  button button_start = new button( Button_start, 880, 880 + Button_start.width, 550, 550 + Button_start.height );
  button_start.button_draw();
  Button_ball.resize(220, 70);
  button button_ball = new button( Button_ball, 880, 880 + Button_ball.width, 640, 640 + Button_ball.height );
  button_ball.button_draw();
  Button_rank.resize(170, 70);
  button button_rank = new button( Button_rank, 880, 880 + Button_rank.width, 730, 730 + Button_rank.height );
  button_rank.button_draw();
  Button_about.resize(170, 70);
  button button_about = new button( Button_about, 880, 880 + Button_about.width, 820, 820 + Button_about.height );
  button_about.button_draw();
  Button_exit.resize(150, 70);
  button button_exit = new button( Button_exit, 880, 880 + Button_exit.width, 910, 910 + Button_exit.height );
  button_exit.button_draw();
  Button_tutorial.resize(100, 100);
  button button_tutorial = new button( Button_tutorial, 1500, 1500 + Button_tutorial.width, 990, 990 + Button_tutorial.height );
  button_tutorial.button_draw();
  
  /* Actions */
  if( mousePressed )
  {
    if( button_start.OnClick( mouseX, mouseY ) )
    {
      game_setup();
      PAGE = PAGE_GAME;
    }
    else if( button_ball.OnClick( mouseX, mouseY ) )
    {
      ball_page_setup();
      PAGE = PAGE_BALL;
    }
    else if( button_rank.OnClick( mouseX, mouseY ) )
    {
      rank_setup();
      PAGE = PAGE_RANKING;
    }
    else if( button_about.OnClick( mouseX, mouseY ) )   PAGE = PAGE_ABOUT;
    else if( button_tutorial.OnClick( mouseX, mouseY ) )PAGE = PAGE_TUTORIAL;
    else if( button_exit.OnClick( mouseX, mouseY ) )    exit();
  }
  
  return;
}
