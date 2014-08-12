class Board
{
  Spieler spieler;
  
  int cellWidth = 16;  //Größe der Zellen
  int cellHeight = 16;  

  float numberOfCellsX = width/cellWidth;  //Anzahl der Zellen horizontal und
  float numberOfCellsY = height/cellHeight;  //vertikal, + Rand
  
  int status[][] = new int [(int) numberOfCellsX][(int) numberOfCellsY];  //Status der Zellen
  
  color alive = color(0, 255, 0);  //Alive = grün
  color dead = color(255);  //Tot = weiß

  Board ()
  {
    for (int x = 0; x < numberOfCellsX; x++)
    {
      for (int y = 0; y < numberOfCellsY; y++)
      {
        status[x][y] = 0;  //Zu Beginn alle Zellen tot
      }
    }
  }

  void display()
  {    
    for (int x = 0; x < numberOfCellsX; x++)
    {
      for (int y = 0; y < numberOfCellsY; y++)
      {  
        if (status[x][y] == 1)  
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
  
  void evolve()  //Wendet die Regeln jede Runde an
  {
    for (int x = 0; x < numberOfCellsX; x++)  //Alle Zellen überprüfen
    {
      for (int y = 0; y < numberOfCellsY; y++)
      {
        int neighbours = 0;  //Nachbarn zählen
        for (int xN = x-1; xN <= x+1; xN++)  //Alle Nachbarn überprüfen
        {
          for (int yN = y-1; yN <= y+1; yN++)
          {
            if (((xN >= 0) && (xN < numberOfCellsX)) && ((yN >= 0) && (yN < numberOfCellsY)))  //Error vermeiden
            {
              if (!((xN == x) && (yN == y)))  //Die aktuelle Zelle NICHT prüfen, nur die Nachbarn
              {
                if (status[xN][yN] == 1)
                {
                  neighbours++;  //Lebende Nachbarn zählen  
                }
              }  
            }
          } 
        }
        
        if (status[x][y] == 1)  //Wenn die Zelle lebt, je nach Nachbarzahl töten
        {
          if (neighbours < 2 || neighbours > 3)
          {
            status[x][y] = 0;  //Töten, wenn nicht 2 - 3 Nachbarn leben  
          }
        }
        else  //Zelle ist tot, je nach Nachbarzahl beleben
        {
          if (neighbours == 3)
          {
            status[x][y] = 1;  //Wenn 3 Nachbarn leben, belebe die Zelle  
          }
        }
      }
    }    
  }
  
}

