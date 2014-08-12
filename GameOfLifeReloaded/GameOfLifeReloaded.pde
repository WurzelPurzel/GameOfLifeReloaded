Board feld; 
Spieler spieler1;
Manager manager;

void setup()
{
  size(1280,720);
  
  frameRate(18);  
  
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
  if (!manager.isPaused)
  {
    feld.evolve();
  }
}

void keyPressed()
{
  manager.keyPressed();  
}


