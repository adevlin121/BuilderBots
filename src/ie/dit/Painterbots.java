package ie.dit;
import processing.core.*;

public class Painterbots  extends PApplet
{
	public void setup()
	{
		size(200,200);
		background(0);
	}
	
	public void draw()
	{
		stroke(255);
		rect(10, 10, 20, 20);
	}
}
