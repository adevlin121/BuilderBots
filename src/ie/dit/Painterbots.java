package ie.dit;
import processing.core.*;

public class Painterbots  extends PApplet
{
	Bot[] bots = new Bot[4];
	
	int gridSize = 10;
	int[][] drawGrid = new int[gridSize][gridSize];
	int bgColour = color(100, 100, 200);
	int rectFill = color(255, 255, 255, 70);
	int rectStroke = color(255);
	int w = 1200;
	int h = 800;
	int gridBox = h/gridSize;
	int gridStartx = (int) (gridBox * 2.5); 
	
	public void setup()
	{
		size(w,h);
		
		//Initializing grid 2d array to be all 0's
		for(int i=0; i<gridSize; i++)
		{
			for(int j=0; j<gridSize; j++)
			{
				drawGrid[i][j] = 0;
			}//end inner for()
		}//end outer for()
	}//end setup()
	
	public void draw()
	{
		background(bgColour);
		fill(rectFill);
		stroke(rectStroke);
		int x = gridStartx;
		int y = 0;
		for(int i=0; i<gridSize; i++)
		{
			for(int j=0; j<gridSize; j++)
			{
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
	}//end draw()
}//end Painterbots class
