class Board
{
  int rectangleWidth = 16;  //Größe der Zellen
  int rectangleHeight = 16;  

  float numberOfRectanglesX = width/rectangleWidth - 2;  //Anzahl der Zellen horizontal und
  float numberOfRectanglesY = height/rectangleHeight - 2;  //vertikal, + Rand
  
  int status[][] = new int [(int) numberOfRectanglesX][(int) numberOfRectanglesY];  //Status der Zellen

  Board ()
  {
    for (int i = 0; i < numberOfRectanglesX; i++)
    {
      for (int j = 0; j < numberOfRectanglesY; j++)
      {
        status[i][j] = 0;  //Zu Beginn alle Zellen tot
      }
    }
  }

  void display()
  {
    for (int x = 1; x <= numberOfRectanglesX; x++)
    {
      for (int y = 1; y <= numberOfRectanglesY; y++)
      {  
        if (status[x-1][y-1] == 1)  //Wenn Zelle am leben, dann färbe grün
        {
          fill(0, 255, 0);  
        }
        else
        {
          fill(255);  //Sonst tot, also weiß
        }
        stroke(0);
        rect(rectangleWidth*x, rectangleHeight*y, rectangleWidth, rectangleHeight);
      }
    }
  }
}

