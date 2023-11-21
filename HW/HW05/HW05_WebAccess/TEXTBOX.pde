/* This code is originated from
   https://github.com/mitkonikov/Processing.git */

public class TEXTBOX
{
   public int X = 0, Y = 0, H = 35, W = 200;
   public int TEXTSIZE = 70;
   
   // COLORS
   public color Background = color(140, 140, 140);
   public color Foreground = color(0, 0, 0);
   public color BackgroundSelected = color(200, 200, 200);
   public color Border = color(30, 30, 30);
   public int BorderWeight = 5;
   
   public String Text = "";
   public int TextLength = 0;

   private boolean selected = false;
   
   TEXTBOX()
   {
      // CREATE OBJECT DEFAULT TEXTBOX
   }
   
   TEXTBOX(int x, int y, int w, int h)
   {
      X = x; Y = y; W = w; H = h;
   }
   
   void DRAW()
   {
      // DRAWING THE BACKGROUND
      if (selected) {
         fill(BackgroundSelected);
      } else {
         fill(Background);
      }
      
      strokeWeight(BorderWeight);
      stroke(Border);
      rect(X, Y, W, H);
      
      // DRAWING THE TEXT ITSELF
      fill(Foreground);
      textSize(TEXTSIZE);
      text(Text, X + (textWidth("a") / 2), Y + TEXTSIZE);
   }
   
   // IF THE KEYCODE IS ENTER RETURN 1
   // ELSE RETURN 0
   void KEYPRESSED(char KEY, int KEYCODE)
  {
      if (selected)
      {
         //println( "KEY: ", KEY, "KEYCODE: ", KEYCODE );
         //if (KEYCODE == (int)BACKSPACE)
         if( KEYCODE == (int)BACKSPACE )
         {
            BACKSPACE();
         }
         else if (KEYCODE == 32)
         {
            // SPACE
            addText(' ');
         }
         else
         {
            // CHECK IF THE KEY IS A LETTER OR A NUMBER
            boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
            boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
            boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
      
            if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber)
            {
               addText(KEY);
            }
         }
      }
   }
   
   private void addText(char text)
   {
      // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
      if (textWidth(Text + text) < W)
      {
         Text += text;
         TextLength++;
      }
   }
   
   private void BACKSPACE()
   {
      if (TextLength - 1 >= 0)
      {
         Text = Text.substring(0, TextLength - 1);
         TextLength--;
      }
   }
   
   // FUNCTION FOR TESTING IS THE POINT
   // OVER THE TEXTBOX
   private boolean overBox(int x, int y)
   {
      if (x >= X && x <= X + W)
      {
         if (y >= Y && y <= Y + H)
         {
            return true;
         }
      }
      
      return false;
   }
   
   void PRESSED(int x, int y)
   {
      if (overBox(x, y))
      {
         selected = true;
      }
      else
      {
         selected = false;
      }
   }
}
