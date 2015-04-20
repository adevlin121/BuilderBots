class Bot extends Object
{
  int destY;
  int destX;
  int blockNum1;
  int blockNum2;
  int job = 0;
  int brickColour = 0;
  
  //struct of bot
  Bot(color tempC, float tempXpos, float tempYpos, float tempSpeed)
  {
    super(tempC, tempXpos, tempYpos, tempSpeed);
  }
  
  //draw bot
  void display()
  {
    fill(c);
    noStroke();
    ellipse(xpos, ypos, 10, 10);
  }
  
  void move()
  {
    //if statements to control the bots next instruction
    //this is when the bot must reference the drawing made by the user
    if(job == 0)
    {
      destX = refX;
      destY = refY;
    }//end if(job == 0)
    //this is when the bot must go to the brick location and place it
    else if(job == 1)
    {
      if(xpos == destX && ypos == destY)
      {
        destX = gridStartx + (gridBox * blockNum1);
        destY = gridBox * blockNum2;
        job = 2;
      }
    }//end else if(job == 1)
    //placing the block on the building
    else if(job == 2)
    {
      if(xpos == gridStartx + (gridBox * blockNum1) && ypos == gridBox * blockNum2)
      {
        job = 0;
        building[blockNum2][blockNum1] = brickColour;
      }
    }
    
    //getting the info from the canvas and passing it to the bot
    if(xpos == refX && ypos == refY)
    {
      for(int i=0; i<gridSize; i++)
      {
        for(int j=0; j<gridSize; j++)
        {
          if(canvas[i][j] > 0 && canvas[i][j] < 10)
          {
            //getting the location of the brick
            blockNum1 = i;
            blockNum2 = j;
            
            //getting the colour of the required brick
            if(canvas[i][j] == 1)
            {
              destX = redX;
              destY = redY;
              brickColour = 1;
            }
            else if(canvas[i][j] == 2)
            {
              destX = blueX;
              destY = blueY;
              brickColour = 2;
            }
            else if(canvas[i][j] == 3)
            {
              destX = greenX;
              destY = greenY;
              brickColour = 3;
            }
            else if(canvas[i][j] == 4)
            {
              destX = yellowX;
              destY = yellowY;
              brickColour = 4;
            }
            else if(canvas[i][j] == 5)
            {
              destX = pinkX;
              destY = pinkY;
              brickColour = 5;
            }
            else if(canvas[i][j] == 6)
            {
              destX = orangeX;
              destY = orangeY;
              brickColour = 6;
            }
            
            
            job = 1;
          }//end if()
        }//end inner for()
      }//end outer for()
      //changing the value of canvas to show it is being worked on
      canvas[blockNum1][blockNum2] = 10;
    }//end outermost if()
    
    //moving
    if(xpos < destX)
    {
      xpos += speed;
    }
    else if(xpos > destX)
    {
      xpos -=speed;
    }
    if(ypos < destY)
    {
      ypos += speed;
    }
    else if(ypos > destY)
    {
      ypos -= speed;
    }
  }
}//end Bot
