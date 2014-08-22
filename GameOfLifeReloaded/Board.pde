class Board
{
  Manager _manager;

  int cellWidth = 16;  //Größe der Zellen
  int cellHeight = 16;  

  float numberOfCellsX = width/cellWidth - borderXleft/cellWidth - borderXright/cellWidth;  //Anzahl der Zellen horizontal und
  float numberOfCellsY = height/cellHeight - borderYbottom/cellHeight - borderYtop/cellHeight;  //vertikal, abzüglich Rand

  int status[][] = new int [(int) numberOfCellsX][(int) numberOfCellsY];  //Status der Zellen
  int saveStat[][] = new int [(int) numberOfCellsX][(int) numberOfCellsY];  //Array zum Zwischenspeichern

  color p1 = color(0, 220, 0);  //Spieler1 = grün
  color p2 = color(0, 0, 220);  //Spieler2 = blau
  color neutral = color(255, 128, 0); // Neutral = orange
  color dead = color(255);  //Tot = weiß

  boolean colored = false;
  boolean p1Won = false;
  boolean draw = false;

  Board (Manager manager)
  { 
    _manager = manager;
    reset();
  }



  void display()
  {   
    if (manager.player1Turn && isPaused && rounds != 0)  //Wenn pausiert und Spieler1 an der Reihe, färbe Rand grün
    {
      fill(p1);       
      rect(0, 0, width, height - borderYbottom + borderYtop);  //Füllt den Rand mit jeweiliger Farbe
    }
    else if (isPaused && rounds != 0)  //Sonst wenn pausiert, färbe Rand blau
    {
      fill(p2); 
      rect(0, 0, width, height - borderYbottom + borderYtop);  //Füllt den Rand mit jeweiliger Farbe
    } 
    else if (rounds != 0) //Färbe weiß wenn das Spiel läuft
    {
      noStroke();
      fill(dead);  
      rect(0, 0, width, height - borderYbottom + borderYtop);  //Füllt den Rand mit jeweiliger Farbe
    } 
    else if (rounds == 0)
    {
      if (millis() - manager.lastSpecialEffect > manager.intervalSpecial && !isPaused)
      {
        colored = !colored;
        manager.lastSpecialEffect = millis();        
      } 
      feld.SpecialEffect(); 
      rect(0, 0, width, height - borderYbottom + borderYtop);
      
    }

    for (int x = 0; x < numberOfCellsX; x++)
    {
      for (int y = 0; y < numberOfCellsY; y++)
      {  
        if (status[x][y] == 1)  
        {
          fill(p1);  //Wenn Zelle Status 1 hat, fülle Spieler1
        } else if (status[x][y] == 2)
        {
          fill(p2);  //Wenn Zelle Status 2 hat, fülle Spieler2
        } else if (status[x][y] == 3)
        {
          fill(neutral); //Wenn Zelle Status 3 hat, fülle neutral
        } else
        {
          fill(dead);  //Sonst tot
        }
        stroke(0);
        rect(cellWidth*x + borderXleft, cellHeight*y + borderYtop, cellWidth, cellHeight);
      }
    }
    fill(0);

    //Score
    textFont(Score);
    text("Cells Left P1:" +" "+ maxCellsP1, width/4, height - 2*(borderYbottom/3) + borderYtop);
    text("Cell Left P2:" + " "+ maxCellsP2, 3*width/4, height - 2*(borderYbottom/3) + borderYtop);
    text("Cells P1 Total:" +" " + currentCellsP1, width/4, height - (borderYbottom/3) + borderYtop);
    text("Cell P2 Total:" + " " + currentCellsP2, 3*width/4, height - (borderYbottom/3) + borderYtop);

    //Controls
    textFont(Controls);
    text("TAB to switch players (when paused)", width/6, height - borderYbottom + 2*borderYtop);
    text("SPACE to pause", width/2, height - borderYbottom + 2*borderYtop);
    text("R to reset game (when paused)", 5*width/6, height - borderYbottom + 2*borderYtop);
  }  

  void reset()
  {
    for (int x = 0; x < numberOfCellsX; x++)
    {
      for (int y = 0; y < numberOfCellsY; y++)
      {  
        status[x][y] = 0;  //Zu Beginn alle Zellen tot
        if ( x > numberOfCellsX/3 && x <= numberOfCellsX - numberOfCellsX/3)
        {
          noiseSeed((int) random(0, 100000));
          if (noise(x, y) > 0.6)     //Erstellt Perlin-Noise (Dichte Funktion)
          {
            status [x][y] = 3;
          }
        }
      }
    }  
    maxCellsP1 = 25;
    currentCellsP1 = 0;
    maxCellsP2 = 25;
    currentCellsP2 = 0;
    rounds = 100;
    
    p1Won = false;
    draw = false;
    colored = false;
    hasBegun = false;
  }

  void SpecialEffect()
  {
    if (colored && p1Won)
    {
      fill(p1);
    }
    else if (colored && draw)
    {
      fill(128); 
    } 
    else if (colored && !p1Won)
    {
      fill(p2);
    }     
    else if (!colored)
    {
      noStroke();
      fill(dead);
    }
    
  }

  void evolve()  //Wendet die Regeln jede Runde an
  {
    rounds -= 1;

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
        int neighboursP2 = 0;
        int neighboursNeutral = 0;  //Nachbarn jeder Farbe zählen
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
                } else if (saveStat[xN][yN] == 2)  //Nachbarn der p2 Farbe zählen
                {
                  neighboursP2++;  //Lebende Nachbarn zählen
                } else if (saveStat[xN][yN] == 3)  //Nachbarn der neutral Farbe zählen
                {
                  neighboursNeutral++;  //Lebende Nachbarn zählen
                }
              }
            }
          }
        }
        //Jetzt Regeln anwenden
        // ------------------------------- SPIELER 1 -----------------------------------
        if (saveStat[x][y] == 1)  //Wenn die Zelle lebt, je nach Nachbarzahl töten
        {
          if (neighboursP1 < 2 || neighboursP1 > 3)  //Wenn nicht 2-3 Nachbarn von Spieler1 leben, töten
          {
            status[x][y] = 0;  //Töten
            currentCellsP1 -= 1;
          } else if ((neighboursP1 + 1) < neighboursP2)  //Wenn gewählte Zelle + ihre verbündeten Nachbarn weniger sind als gegnerische Nachbarn
          {
            status[x][y] = 2;  //Zelle wird übernommen
            currentCellsP1 -= 1;
            currentCellsP2 += 1;
          }
        }
        // ------------------------------- SPIELER 2 -----------------------------------
        else if (saveStat[x][y] == 2) 
        {
          if (neighboursP2 < 2 || neighboursP2 > 3)  
          {
            status[x][y] = 0;  //Töten
            currentCellsP2 -= 1;
          } else if ((neighboursP2 + 1) < neighboursP1)  //Wenn gewählte Zelle + ihre verbündeten Nachbarn weniger sind als gegnerische Nachbarn
          {
            status[x][y] = 1;  //Zelle wird übernommen
            currentCellsP1 += 1;
            currentCellsP2 -= 1;
          }
        } 
        // ------------------------------- NEUTRAL -----------------------------------
        else if (saveStat[x][y] == 3) 
        {
          if (neighboursNeutral < 2 || neighboursNeutral > 3)  
          {
            status[x][y] = 0;  //Töten
          } else if (0 < neighboursP1)  //Wenn gewählte Zelle + ihre verbündeten Nachbarn weniger sind als gegnerische Nachbarn
          {
            status[x][y] = 1;  //Zelle wird übernommen
            currentCellsP1 += 1;
          } else if (0 < neighboursP2)  //Wenn gewählte Zelle + ihre verbündeten Nachbarn weniger sind als gegnerische Nachbarn
          {
            status[x][y] = 2;  //Zelle wird übernommen
            currentCellsP2 += 1;
          } else if (0 < neighboursP1 && 0 < neighboursP2)  //Wenn es blaue und grüne Nachbarn gibt
          {
            //Schaue welche mehr sind
            if (neighboursP1 > neighboursP2)
            {
              status[x][y] = 1;
              currentCellsP1 += 1;
            } else if (neighboursP1 < neighboursP2)
            {
              status[x][y] = 2;
              currentCellsP2 += 1;
            } else if (neighboursP1 == neighboursP2)
            {
              //Lasse Zufall entscheiden
              int r = int(random(1, 3));
              if (r == 1)  //Wenn zufällige Zahl (1-2) 1 ist
              {
                status[x][y] = 1;  //Belebe Spieler1
                currentCellsP1 += 1;
              } else if (r == 2)
              {
                status[x][y] = 2;  //Sonst belebe Spieler2
                currentCellsP2 += 1;
              }
            }
          }
        } else  //Zelle ist tot, je nach Nachbarzahl beleben
        {
          //Wenn 3 Nachbarn leben, belebe die Zelle
          if (neighboursP1 == 3 && neighboursP2 == 3)  //Wenn Zelle jeweils von Spieler1 und Spieler2 3 lebende Nachbarn hat, wähle zufällig
          {
            int r = int(random(1, 3));
            if (r == 1)  //Wenn zufällige Zahl (1-2) 1 ist
            {
              status[x][y] = 1;  //Belebe Spieler1
              currentCellsP1 += 1;
            } else if (r == 2)
            {
              status[x][y] = 2;  //Sonst belebe Spieler2
              currentCellsP2 += 1;
            }
          }
          else if (neighboursP1 == 3 && neighboursNeutral == 3)  //Wenn Zelle jeweils von Spieler und Neutral 3 lebende Nachbarn hat, wähle den Spieler
          {
            status[x][y] = 1;
            currentCellsP1 += 1;
          } 
          else if (neighboursP2 == 3 && neighboursNeutral == 3)
          {
            status[x][y] = 2;
            currentCellsP2 += 1;
          } 
          else if (neighboursP1 == 3)  //Spieler1
          {
            status[x][y] = 1;
            currentCellsP1 += 1;
          } else if (neighboursP2 == 3) //Spieler2
          {
            status[x][y] = 2;
            currentCellsP2 += 1;
          } else if (neighboursNeutral == 3)
          {
            status[x][y] = 3;
          }
        }
      }
    }
  }
}

