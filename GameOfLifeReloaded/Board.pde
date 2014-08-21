class Board
{
  
  int cellWidth = 16;  //Größe der Zellen
  int cellHeight = 16;  
 
  float numberOfCellsX = width/cellWidth - borderXleft/cellWidth - borderXright/cellWidth;  //Anzahl der Zellen horizontal und
  float numberOfCellsY = height/cellHeight - borderYbottom/cellHeight - borderYtop/cellHeight;  //vertikal, + Rand
  
  int status[][] = new int [(int) numberOfCellsX][(int) numberOfCellsY];  //Status der Zellen
  int saveStat[][] = new int [(int) numberOfCellsX][(int) numberOfCellsY];  //Array zum Zwischenspeichern
  
  color p1 = color(0, 220, 0);  //Spieler1 = grün
  color p2 = color(0, 0, 220);  //Spieler2 = blau
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
          fill(p1);  //Wenn Zelle Status 1 hat, fülle Spieler1
        }
        else if (status[x][y] == 2)
        {
          fill(p2);  //Wenn Zelle Status 2 hat, fülle Spieler2
        }
        else
        {
          fill(dead);  //Sonst tot
        }
        stroke(0);
        rect(cellWidth*x + borderXleft, cellHeight*y + borderYtop, cellWidth, cellHeight);
      }
    }
  }
 
  void reset()
  {
    //Setze alle Zellen zurück
    for (int x = 0; x < numberOfCellsX; x++)
    {
      for (int y = 0; y < numberOfCellsY; y++)
      {
        status[x][y] = 0; 
      }
    }  
  }
  
  void evolve()  //Wendet die Regeln jede Runde an
  {
    for (int x = 0; x < numberOfCellsX; x++)  //Speichert Status
        {
          for (int y = 0; y < numberOfCellsY; y++)
          {
            saveStat[x][y] = status[x][y];
          }  
        }    
    
    for (int x = 0; x < numberOfCellsX; x++)  //Alle Zellen überprüfen
    {
      for (int y = 0; y < numberOfCellsY; y++)
      {
        int neighboursP1 = 0;  
        int neighboursP2 = 0;  //Nachbarn jeder Farbe zählen
        for (int xN = x-1; xN <= x+1; xN++)  //Alle Nachbarn überprüfen
        {
          for (int yN = y-1; yN <= y+1; yN++)
          {
            if (((xN >= 0) && (xN < numberOfCellsX)) && ((yN >= 0) && (yN < numberOfCellsY)))  //Error vermeiden
            {
              if (!((xN == x) && (yN == y)))  //Die aktuelle Zelle NICHT prüfen, nur die Nachbarn
              {
                if (saveStat[xN][yN] == 1)  //Nachbarn der p1 Farbe zählen
                {
                  neighboursP1++;  //Lebende Nachbarn zählen  
                }
                else if (saveStat[xN][yN] == 2)  //Nachbarn der p2 Farbe zählen
                {
                  neighboursP2++;  //Lebende Nachbarn zählen
                }
              }  
            }
          } 
        }
        //Jetzt Regeln anwenden
        if (saveStat[x][y] == 1)  //Wenn die Zelle lebt, je nach Nachbarzahl töten
        {
          if (neighboursP1 < 2 || neighboursP1 > 3)  //Wenn nicht 2-3 Nachbarn von Spieler1 leben, töten
          {
            status[x][y] = 0;  //Töten  
          }
          else if ((neighboursP1 + 1) < neighboursP2)  //Wenn gewählte Zelle + ihre verbündeten Nachbarn weniger sind als gegnerische Nachbarn
          {
            status[x][y] = 2;  //Zelle wird übernommen
          }
        }
        else if (saveStat[x][y] == 2)  //Gleiches für Spieler2 nochmal
        {
          if (neighboursP2 < 2 || neighboursP2 > 3)  
          {
            status[x][y] = 0;  //Töten  
          } 
          else if ((neighboursP2 + 1) < neighboursP1)  //Wenn gewählte Zelle + ihre verbündeten Nachbarn weniger sind als gegnerische Nachbarn
          {
            status[x][y] = 1;  //Zelle wird übernommen
          } 
        }
        else  //Zelle ist tot, je nach Nachbarzahl beleben
        {
          //Wenn 3 Nachbarn leben, belebe die Zelle
          if (neighboursP1 == 3 && neighboursP2 == 3)  //Wenn Zelle jeweils von Spieler1 und Spieler2 3 lebende Nachbarn hat, wähle zufällig
          {
            int r = int(random(1, 3));
            if (r == 1)  //Wenn zufällige Zahl (1-2) 1 ist
            {
              status[x][y] = 1;  //Belebe Spieler1
            }  
            else if (r == 2)
            {
              status[x][y] = 2;  //Sonst belebe Spieler2
            }
          }
          else if (neighboursP1 == 3)  //Spieler1
          {
            status[x][y] = 1;    
          }
          else if (neighboursP2 == 3) //Spieler2
          {
            status[x][y] = 2;  
          }
        }
      }
    }    
  }
  
}

