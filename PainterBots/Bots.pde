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
    xpos = xpos + speed;
    ypos = ypos + speed;
  }
  
  //testing
}//end Bot
