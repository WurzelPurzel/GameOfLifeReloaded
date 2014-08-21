 Board feld; 
Spieler spieler1;
Spieler spieler2;
Manager manager;

public static int borderXleft = 16;
public static int borderXright = 16;
public static int borderYtop = 16;
public static int borderYbottom = 150;
public static int maxCellsP1 = 25;
public static int maxCellsP2 = 25;
public static int rounds = 100;

//Pause
public static boolean isPaused = true;

PFont TextFont;

void setup()
{ 
  size(800 + borderXleft + borderXright,640 + borderYtop + borderYbottom);   
  
  feld = new Board();  
  spieler1 = new Spieler(feld, 1);
  spieler2 = new Spieler(feld, 2);
  manager = new Manager(feld);
  TextFont = createFont("Arial", 16);
  textFont(TextFont);
  textAlign(LEFT,BOTTOM);
  
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
  background(255);
  feld.display();
  if (millis() - manager.lastRecordedTime > manager.interval)  //Wenn das Interval überschritten wurde
  {
    if (!isPaused && rounds > 0)  //und das Spiel nicht pausiert ist und die Runden noch nicht abgelaufen sind
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


