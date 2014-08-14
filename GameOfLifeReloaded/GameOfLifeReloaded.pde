Board feld; 
Spieler spieler1;
Manager manager;

void setup()
{
  size(1280,720);   
  
  feld = new Board();  
  spieler1 = new Spieler(feld);
  manager = new Manager();
  
  background(255);
  stroke(0);

  feld.display();
}

void mousePressed()
{
  spieler1.mousePressed();  
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


