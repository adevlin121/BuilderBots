class Bot
{
  color c;
  float xpos;
  float ypos;
  float speed;
  
  //struct of bot
  Bot(color tempC, float tempXpos, float tempYpos, float tempSpeed)
  { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    speed = tempSpeed;
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
    //check user drawing
    //create the user drawing on a new array
    //"bottom" of array up
    //bricks must be connected another brick in order to build
  }
}//end Bot
