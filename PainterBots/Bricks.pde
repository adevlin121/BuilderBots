class Brick extends Object
{
  color c;
  float xpos;
  float ypos;
  float speed;
  
  //struct of brick
  Brick(color tempC, float tempXpos, float tempYpos, float tempSpeed)
  {
    super(tempC, tempXpos, tempYpos, tempSpeed);
  }
  
  //draw brick
  void display()
  {
    fill(c);
    noStroke();
    ellipse(xpos, ypos, 10, 10);
  }
  
  //move brick
  void move()
  {
    //brick follows bot
  }
  
  //testing
}//end Brick
