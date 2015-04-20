class Bot extends Object
{
  int destY;
  int destX;
  
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
    if(xpos < destX)
    {
      xpos += speed;
    }
  }
}//end Bot
