class Board
{
  int rectangleWidth = 16;
  int rectangleHeight = 16;  

  float numberOfRectanglesX = width/rectangleWidth - 2;
  float numberOfRectanglesY = height/rectangleHeight - 2;
  
  int status[][] = new int [(int) numberOfRectanglesX][(int) numberOfRectanglesY];

  Board ()
  {
    for (int i = 0; i < numberOfRectanglesX; i++)
    {
      for (int j = 0; j < numberOfRectanglesY; j++)
      {
        status[i][j] = 0;
      }
    }
  }

  void display()
  {
    for (int x = 1; x <= numberOfRectanglesX; x++)
    {
      for (int y = 1; y <= numberOfRectanglesY; y++)
      {  
        rect(rectangleWidth*x, rectangleHeight*y, rectangleWidth, rectangleHeight);
      }
    }
  }
}

