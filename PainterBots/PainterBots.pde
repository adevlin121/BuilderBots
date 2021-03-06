Bot[] bots = new Bot[10];
ArrayList <Object> bricks;

int gridSize = 20;
int[][] canvas = new int[gridSize][gridSize];
int[][] building = new int[gridSize][gridSize];

int w = 1200;
int h = 800;
//size of each of the grid boxes
int gridBox = h/gridSize;
//where the grid starts to be drawn on screen
int gridStartx = w/6;
int colourBox = w/12;
//where the colours get drawn on screen
int colourStartX1 = w/24;
int colourStartX2 = colourStartX1 * 21;
int colourStartY1 = colourStartX1;
int colourStartY2 = colourStartX1 * 7;
int colourStartY3 = colourStartX1 * 13;
int buildButtonX = w/24;
int eraseButtonX = colourStartX2;
int buildButtonY = colourStartX1 * 4;

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

//destinations for the colours
int redX = colourStartX1 + (colourBox/2);
int redY = colourStartY1 + (colourBox/2);
int blueX = colourStartX1 + (colourBox/2);
int blueY = colourStartY2 + (colourBox/2);
int greenX = colourStartX1 + (colourBox/2);
int greenY = colourStartY3 + (colourBox/2);
int yellowX = colourStartX2 + (colourBox/2);
int yellowY = colourStartY1 + (colourBox/2);
int pinkX = colourStartX2 + (colourBox/2);
int pinkY = colourStartY2 + (colourBox/2);
int orangeX = colourStartX2 + (colourBox/2);
int orangeY = colourStartY3 + (colourBox/2);

//destination of the drawing for the bots to reference
int refX = w/40;
int refY = colourStartX1*11;

//variable for the stroke colour of the brush
int brush = 0;
//variable to differentiate between user painting and bot building
boolean activeBots = false;
void setup()
{
  for (int i = 0; i < bots.length; i++)
  {
    bots[i] = new Bot(color(0), 30 + 10*(i), colourStartX1 * 11, 5);
  }
  bricks = new ArrayList<Object>();
  
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

void draw()
{
  background(bgColour);
  int x = gridStartx;
  int y = 0;
  
  //drawing the "paint" blocks for the user
  stroke(rectStroke);
  fill(red);
  rect(colourStartX1, colourStartY1, colourBox, colourBox);
  fill(blue);
  rect(colourStartX1, colourStartY2, colourBox, colourBox);
  fill(green);
  rect(colourStartX1, colourStartY3, colourBox, colourBox);
  fill(yellow);
  rect(colourStartX2, colourStartY1, colourBox, colourBox);
  fill(pink);
  rect(colourStartX2, colourStartY2, colourBox, colourBox);
  fill(orange);
  rect(colourStartX2, colourStartY3, colourBox, colourBox);
  
  //drawing the erase and build buttons
  fill(rectFill);
  rect(buildButtonX, buildButtonY, colourBox, colourBox);
  fill(0);
  text("Build", buildButtonX + (colourBox/3), buildButtonY + (colourBox/2));
  fill(rectFill);
  rect(eraseButtonX, buildButtonY, colourBox, colourBox);
  fill(0);
  text("Erase", eraseButtonX + (colourBox/3), buildButtonY + (colourBox/2));
  
  if(!activeBots)
  {
    //drawing the canvas grid for the user
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
            fill(blue);
            stroke(rectStroke);
          }//end inner if()
          else if(canvas[i][j] == 3)
          {
            fill(green);
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
  }//end if(!activeBots)
  
  else if(activeBots)
  {
    
    
    for(int i=0; i<gridSize; i++)
    {
      for(int j=0; j<gridSize; j++)
      {
        noStroke();
        if(building[i][j] == 0)
        {
          noFill();
        }//end if()
        
        else
        {
          if(building[i][j] == 1)
          {
            fill(red);
          }//end inner if()
          else if(building[i][j] == 2)
          {
            fill(blue);
          }//end inner if()
          else if(building[i][j] == 3)
          {
            fill(green);
          }//end inner if()
          else if(building[i][j] == 4)
          {
            fill(yellow);
          }//end inner if()
          else if(building[i][j] == 5)
          {
            fill(pink);
          }//end inner if()
          else if(building[i][j] == 6)
          {
            fill(orange);
          }//end inner if()
        }//end else
        rect(x, y, gridBox, gridBox);
        x += gridBox;
      }//end inner for()
      x = gridStartx;
      y += gridBox;
    }//end outer for()
    
    for (int i = 0; i < bots.length; i++)
    {
      bots[i].move();
      bots[i].display();
    }
  }//end if()
}//end draw()

void mouseClicked()
{
  //detecting if the paint blocks have been clicked
  if(mouseX > colourStartX1 && mouseX < colourStartX1 + colourBox)
  {
    if(mouseY > colourStartY1 && mouseY < colourStartY1 + colourBox)
    {
      brush = 1;
    }//end if()
    else if(mouseY > colourStartY2 && mouseY < colourStartY2 + colourBox)
    {
      brush = 2;
    }//end if()
    else if(mouseY > colourStartY3 && mouseY < colourStartY3 + colourBox)
    {
      brush = 3;
    }//end if()
    else if(mouseY > buildButtonY && mouseY < buildButtonY + colourBox)
    {
      //make robots do things
      println("make do things");
      activeBots = true;
    }
  }//end outer if()
  
  else if(mouseX > colourStartX2 && mouseX < colourStartX2 + colourBox)
  {
    if(mouseY > colourStartY1 && mouseY < colourStartY1 + colourBox)
    {
      brush = 4;
    }//end if()
    else if(mouseY > colourStartY2 && mouseY < colourStartY2 + colourBox)
    {
      brush = 5;
    }//end if()
    else if(mouseY > colourStartY3 && mouseY < colourStartY3 + colourBox)
    {
      brush = 6;
    }//end if()
    else if(mouseY > buildButtonY && mouseY < buildButtonY + colourBox)
    {
      brush = 0;
    }
  }
  
  //nested for loops to populate the canvas array
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
          }//end inner if()
        }//end middle if()
      }//end outer if()
    }//end inner for()
  }//end outer for()
}//end mouseClicked()

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
           }//end inner if()
         }//end outer if(
       }//end outer if()
     }//end inner for()
   }//end outer for()
}//end mouseDragged()

