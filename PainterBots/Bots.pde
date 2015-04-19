class Bot
{
  float x; //horizontal LOC of bot
  float y; // vertical LOC of bot
  float speed;
  int colour = color(100, 100, 100);
  int w;
  int h;
  
  /*
  {
    parent = p;    
    x = 0; //horizontal of 0
    y = 0; //vertical of 0
    w = 5;
    h = 5;
    speed = parent.random(1, 10); //speed is a random number between 1 and 10
  }
  */
  
  //draw bot
  void display()
  {
    fill(colour);
    noStroke();
    ellipse(x, y, w, h);
  }
  
  //move bot
  void move()
  {
    x += speed;
  }
}//end Bot
