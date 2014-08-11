



int rectangleWidth = 16;
int rectangleHeight = 16;

float numberOfRectanglesX = 1280/rectangleWidth - 2;
float numberOfRectanglesY = 720/rectangleHeight - 2;

void setup()
{
  size(1280,720);
  background(255);
  stroke(0);

  for (int x = 1; x <= numberOfRectanglesX ; x++)
  {
    for (int y = 1; y <= numberOfRectanglesY ; y++)
    {  
      rect(rectangleWidth*x, rectangleHeight*y, rectangleWidth, rectangleHeight);                        

                    
    }
  }  
}
