Board feld; 
Spieler spieler1;
Spieler spieler2;
Manager manager;

public static int borderXleft = 16;
public static int borderXright = 16;
public static int borderYtop = 16;
public static int borderYbottom = 200;
public static int maxCellsP1 = 25;
public static int maxCellsP2 = 25;

void setup()
{ 
  size(800 + borderXleft + borderXright,640 + borderYtop + borderYbottom);   
  
  feld = new Board();  
  spieler1 = new Spieler(feld, 1);
  spieler2 = new Spieler(feld, 2);
  manager = new Manager(feld);
  
  background(255);
  stroke(0);

  feld.display();
}

void mousePressed()
{
  if (manager.player1Turn)
  {
    spieler1.mousePressed();  
  }
  else 
  {
    spieler2.mousePressed();
  }
}

void draw()
{  
  feld.display();
  if (millis() - manager.lastRecordedTime > manager.interval)  //Wenn das Interval überschritten wurde
  {
    if (!manager.isPaused)  //und das Spiel nicht pausiert ist
    {
      feld.evolve();  //führe die Entwicklungen durch
      manager.lastRecordedTime = millis();  //Aktualisiere den zuletzt benutzten Zeitpunkt
    }
  }
}

void keyPressed()
{
  manager.keyPressed();  
}


