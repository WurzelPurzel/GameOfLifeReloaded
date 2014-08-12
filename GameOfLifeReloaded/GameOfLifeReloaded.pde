Board feld; 
Spieler spieler1;

void setup()
{
  size(1280,720);
  
  frameRate(3);  
  
  feld = new Board();
  
  spieler1 = new Spieler(feld);
  
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
  feld.evolve();
}


