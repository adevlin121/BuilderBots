//Bot[] bots = new Bot[4];

int gridSize = 20;
int[][] canvas = new int[gridSize][gridSize];

int w = 1200;
int h = 800;
//size of each of the grid boxes
int gridBox = h/gridSize;
//where the grid starts to be drawn on screen
int gridStartx = w/6;
int colourBox = w/12;



//setting up colours
int bgColour = color(100, 100, 200);
int rectFill = color(255, 255, 255, 70);
int rectStroke = color(255);
int red = color(255, 0, 0);
int blue = color(0, 0, 255);
int green = color(0, 255, 0);
int yellow = color(255, 255, 0);
int pink = color(255, 0, 127);
int orange = color(255, 128, 0);

//variable for the stroke colour of the brush
int brush = 0;

void setup()
{
  size(w,h);
  
  //Initializing grid 2d array to be all 0's
  for(int i=0; i<gridSize; i++)
  {
    for(int j=0; j<gridSize; j++)
    {
      canvas[i][j] = 0;
    }//end inner for()
  }//end outer for()
}//end setup()

//testing

void draw()
{
  background(bgColour);
  int x = gridStartx;
  int y = 0;
  for(int i=0; i<gridSize; i++)
  {
    for(int j=0; j<gridSize; j++)
    {
      //this is where the colour setting is detected from the grid
      if(canvas[i][j] == 0)
      {
        fill(rectFill);
        stroke(rectStroke);
      }//end if()
      
      else
      {
        if(canvas[i][j] == 1)
        {
          fill(red);
          stroke(rectStroke);
        }//end inner if()
        else if(canvas[i][j] == 2)
        {
          fill(green);
          stroke(rectStroke);
        }//end inner if()
        else if(canvas[i][j] == 3)
        {
          fill(blue);
          stroke(rectStroke);
        }//end inner if()
        else if(canvas[i][j] == 4)
        {
          fill(yellow);
          stroke(rectStroke);
        }//end inner if()
        else if(canvas[i][j] == 5)
        {
          fill(pink);
          stroke(rectStroke);
        }//end inner if()
        else if(canvas[i][j] == 6)
        {
          fill(orange);
          stroke(rectStroke);
        }//end inner if()
      }//end else
      rect(x, y, gridBox, gridBox);
      x += gridBox;
    }//end inner for()
    x = gridStartx;
    y += gridBox;
  }//end outer for()
  
  /*
  for (int i = 0; i < bots.length; i++)
  {
    bots[i].move();
    bots[i].display();
  }
  */
}//end draw()

void mouseDragged()
{
   for(int i=0; i<gridSize; i++)
   {
     for(int j=0; j<gridSize; j++)
     {
       //if statements to detect where the mouse is to paint on the picture canvas
       if(mouseX > gridStartx && mouseX < gridStartx + (gridSize * gridBox))
       {
         if(mouseX > gridStartx + (gridBox * i) && mouseX < gridStartx + (gridBox * (i+1)))
         {
           if(mouseY > gridBox * j && mouseY < gridBox * (j+1))
           {
             canvas[j][i] = brush;
           }
         }
       }//end outer if()
     }//end inner for()
   }//end outer for()
}//end mousePressed()

