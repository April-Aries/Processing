/* Audio */
import ddf.minim.*;

Minim minim;
AudioPlayer star;

/* Text */
PFont TCfont;
PFont Kfont;
PFont ROfont;

/* Picture */
PImage bg;

/* Button */
// Play
int play_x = 20;
int play_y = 900;
int play_size = 80;
PImage play;
// Pause
int pause_x = 150;
int pause_y = 900;
int pause_size = 80;
PImage pause;
// Mute
int mute_x = 280;
int mute_y = 900;
int mute_size = 80;
PImage mute;
// Stop
int stop_x = 410;
int stop_y = 900;
int stop_size = 80;
PImage stop;
// Restart
int restart_x = 540;
int restart_y = 900;
int restart_size = 80;
PImage restart;

void setup()
{
  /* Audio Setting */
  minim = new Minim(this);
  star = minim.loadFile("like_a_star.mp3");
  star.play();
  
  /* Window Settings */
  size(640, 1000);
  surface.setTitle("HW03");
  surface.setLocation(300, 20);
  
  /* Text */
  TCfont = createFont("NotoSansTC-Medium.ttf", 28);
  Kfont = createFont("Kalam-Regular.ttf", 28 );
  ROfont = createFont("RampartOne-Regular.ttf", 28 );
  
  /* Picture */
  bg = loadImage("BG.jpg");
  play = loadImage("play.png");
  pause = loadImage("pause.png");
  mute = loadImage("mute.png");
  stop = loadImage("stop.png");
  restart = loadImage("restart.png");
}

void draw()
{
  /* Background */
  background( bg );
  
  /* Information text output */
  textFont(TCfont);
  textAlign(RIGHT, TOP);
  fill(#FFCC3E);
  text( "41047054S 陳柏瑜 播放器", 630, 10 );
  
  /* Play & Pause Button */
  if( mousePressed )
  {
    strokeWeight(5);
    stroke(#000000);
    mousePressed();
  }
  else
  {
    fill(#FF1530, 95);
    rectMode(CORNER);
    strokeWeight(5);
    stroke(#000000);
    rect( play_x, play_y, play_size, play_size, 20 );
    imageMode(CORNER);
    image(play, play_x+15, play_y+15, play_size-30, play_size-30 );
    // Pause
    fill(#FF1530, 95);
    rect( pause_x, pause_y, pause_size, pause_size, 20 );
    image(pause, pause_x+15, pause_y+15, pause_size-30, pause_size-30 );
    // Mute
    fill(#FF1530, 95);
    rect( mute_x, mute_y, mute_size, mute_size, 20 );
    image(mute, mute_x+15, mute_y+15, mute_size-30, mute_size-30 );
    // Restart
    fill(#FF1530, 95);
    rect( restart_x, restart_y, restart_size, restart_size, 20 );
    image( restart, restart_x+15, restart_y+15, restart_size-25, restart_size-25 );
    // Stop
    fill(#FF1530, 95);
    rect( stop_x, stop_y, stop_size, stop_size, 20 );
    image( stop, stop_x+15, stop_y+15, stop_size-30, stop_size-30 );
  }
  
  /* Sound Wave */
  strokeWeight(2);
  fill(#FFCC3E);
  for(int i=0; i < star.left.size()-1; i+=10)
  {
    rect(i, 500-star.left.get(i)*150, 10, star.left.get(i)*150 );
  }
  
}

void mousePressed()
{
  /* Play Button */
  if( inPlayButton( mouseX, mouseY ) )
  {
    fill(#D403FF,95);
    rect( play_x, play_y, play_size, play_size, 20 );
    imageMode(CORNER);
    image(play, play_x+15, play_y+15, play_size-30, play_size-30 );
    if( star.isPlaying() == false )    star.loop();
  }
  else
  {
    fill(#FF1530, 95);
    rect( play_x, play_y, play_size, play_size, 20 );
    imageMode(CORNER);
    image(play, play_x+15, play_y+15, play_size-30, play_size-30 );
  }
  
  /* Pause Button */
  if( inPauseButton( mouseX, mouseY ) )
  {
    fill(#D403FF,95);
    rect( pause_x, pause_y, pause_size, pause_size, 20 );
    image(pause, pause_x+15, pause_y+15, pause_size-30, pause_size-30 );
    star.pause();
  }
  else
  {
    fill(#FF1530, 95);
    rect( pause_x, pause_y, pause_size, pause_size, 20 );
    image(pause, pause_x+15, pause_y+15, pause_size-30, pause_size-30 );
  }
  
  /* Mute Button */
  if( inMuteButton( mouseX, mouseY ) )
  {
    fill(#D403FF, 95);
    rect( mute_x, mute_y, mute_size, mute_size, 20 );
    image(mute, mute_x+15, mute_y+15, mute_size-30, mute_size-30 );
    if( star.isMuted() )    star.unmute();
    else                    star.mute();
  }
  else
  {
    fill(#FF1530, 95);
    rect( mute_x, mute_y, mute_size, mute_size, 20 );
    image(mute, mute_x+15, mute_y+15, mute_size-30, mute_size-30 );
  }
  
  /* Stop Button */
  if( inStopButton( mouseX, mouseY ) )
  {
    fill(#D403FF, 95);
    rect( stop_x, stop_y, stop_size, stop_size, 20 );
    image( stop, stop_x+15, stop_y+15, stop_size-30, stop_size-30 );
    stop();
  }
  else
  {
    fill(#FF1530, 95);
    rect( stop_x, stop_y, stop_size, stop_size, 20 );
    image( stop, stop_x+15, stop_y+15, stop_size-30, stop_size-30 );
  }
  
  /* Restart */
  if( inRestartButton( mouseX, mouseY ) )
  {
    fill(#D403FF, 95);
    rect( restart_x, restart_y, restart_size, restart_size, 20 );
    image( restart, restart_x+15, restart_y+15, restart_size-25, restart_size-25 );
    minim.stop();
    star = minim.loadFile("like_a_star.mp3");
    star.play();
  }
  else
  {
    fill(#FF1530, 95);
    rect( restart_x, restart_y, restart_size, restart_size, 20 );
    image( restart, restart_x+15, restart_y+15, restart_size-25, restart_size-25 );
  }
    
}

boolean inPlayButton( float x, float y )
{
  if( x > play_x && x < play_x + play_size && y > play_y && y < play_y + play_size )   return true;
  else  return false;
}

boolean inPauseButton( float x, float y )
{
  if( x > pause_x && x < pause_x + pause_size && y > pause_y && y < pause_y + pause_size )   return true;
  else  return false;
}

boolean inMuteButton( float x, float y )
{
  if( x > mute_x && x < mute_x + mute_size && y > mute_y && y < mute_y + mute_size )   return true;
  else  return false;
}

boolean inStopButton( float x, float y )
{
  if( x > stop_x && x < stop_x + stop_size && y > stop_y && y < stop_y + stop_size )   return true;
  else  return false;
}

boolean inRestartButton( float x, float y )
{
  if( x > restart_x && x < restart_x + restart_size && y > restart_y && y < restart_y + restart_size )   return true;
  else  return false;
}

void stop()
{
  star.close();
  minim.stop();
  super.stop();
}
