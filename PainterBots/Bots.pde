class Bot extends Object
{
  
  //struct of bot
  Bot(color tempC, float tempXpos, float tempYpos, float tempSpeed)
  {
    super(tempC, tempXpos, tempYpos, tempSpeed);
  }
  */
  
  //draw bot
  void display()
  {
    fill(c);
    noStroke();
    ellipse(xpos, ypos, 10, 10);
  }
  
  //move bot
  void move()
  {
    //each bot is initally assigned a grid number, starting from bottom left
    //if bot has "completed" grid number, is assigned next grid number in the grid
    //create the user drawing on a new array
    //"bottom" of array up
    //bricks must be connected another brick in order to build
  }
}//end Bot
