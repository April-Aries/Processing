class button
{
  String name;
  PImage appearance;
  float left;
  float right;
  float top;
  float bottom;
  
  button( String button_name, PImage look, int x_left, int x_right, int y_top, int y_bottom )
  {
    name = button_name;
    appearance = look;
    left = x_left;
    right = x_right;
    top = y_top;
    bottom = y_bottom;
  }
  
  boolean OnClick( float x, float y )
  {
    if( x >= left && x <= right && y <= bottom && y >= top )  return true;
    else return false;
  }
  
  void button_draw()
  {
    imageMode( CORNER );
    image( appearance, left, top );
  }
}
