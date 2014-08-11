class Board
{
  int cellWidth = 16;  //Größe der Zellen
  int cellHeight = 16;  

  float numberOfCellsX = width/cellWidth - 2;  //Anzahl der Zellen horizontal und
  float numberOfCellsY = height/cellHeight - 2;  //vertikal, + Rand
  
  int status[][] = new int [(int) numberOfCellsX][(int) numberOfCellsY];  //Status der Zellen
  
  color alive = color(0, 255, 0);  //Alive = grün
  color dead = color(255);  //Tot = weiß

  Board ()
  {
    for (int i = 0; i < numberOfCellsX; i++)
    {
      for (int j = 0; j < numberOfCellsY; j++)
      {
        status[i][j] = 0;  //Zu Beginn alle Zellen tot
      }
    }
  }

  void display()
  {
    for (int x = 1; x <= numberOfCellsX; x++)
    {
      for (int y = 1; y <= numberOfCellsY; y++)
      {  
        if (status[x-1][y-1] == 1)  
        {
          fill(alive);  //Wenn Zelle am leben, fülle
        }
        else
        {
          fill(dead);  //Sonst tot
        }
        stroke(0);
        rect(cellWidth*x, cellHeight*y, cellWidth, cellHeight);
      }
    }
  } 

  
}

