Board feld; 
Spieler spieler1;
Spieler spieler2;
Manager manager;

public static int borderXleft = 16;
public static int borderXright = 16;
public static int borderYtop = 16;
public static int borderYbottom = 150;
public static int maxCellsP1 = 25;
public static int currentCellsP1 = 0;
public static int maxCellsP2 = 25;
public static int currentCellsP2 = 0;
public static int rounds = 100;

public static boolean hasBegun = false;

//Pause
public static boolean isPaused = true;

PFont Score;
PFont Controls;

void setup()
{ 
  size(800 + borderXleft + borderXright, 640 + borderYtop + borderYbottom);   

  feld = new Board(manager);  
  spieler1 = new Spieler(feld, 1);
  spieler2 = new Spieler(feld, 2);
  manager = new Manager(feld);
  Score = createFont("Arial", 16);
  Controls = createFont("Arial", 12);
  textAlign(CENTER);

  background(255);
  stroke(0);

  feld.display();
}

void mousePressed()
{
  if (manager.player1Turn)
  {
    spieler1.mousePressed();
  } else 
  {
    spieler2.mousePressed();
  }
}

void draw()
{  
  background(255);
  if (millis() - manager.lastRecordedTime > manager.interval && !isPaused && rounds > 0)  //Wenn das Interval überschritten wurde und das Spiel nicht pausiert ist und die Runden noch nicht abgelaufen sind
  {
    feld.evolve();  //führe die Entwicklungen durch
    manager.lastRecordedTime = millis();  //Aktualisiere den zuletzt benutzten Zeitpunkt
  }  
  if (rounds == 0)
  {
    if (currentCellsP1 > currentCellsP2)
    {
      feld.p1Won = true;
      spieler1.WinMessage();
    } else if (currentCellsP1 < currentCellsP2)
    {
      spieler2.WinMessage();
    } else if (currentCellsP1 == currentCellsP2)
    {
      feld.draw = true;
      spieler1.DrawMessage();
    }
  }  
  
  feld.display();
}

void keyPressed()
{
  manager.keyPressed();
}

