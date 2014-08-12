class Spieler
{
  Board _field;

  Spieler(Board field)
  {
    _field = field;
  }  
  
  void mousePressed()
  {
    if (mousePressed)
    {
      int inCellX = int(map(mouseX, 0, width, 0, _field.numberOfCellsX));  //Konvertiert MauspositionX auf Array-Indizes
      inCellX = int(constrain(inCellX, 0, _field.numberOfCellsX - 1));  //Verhindert OutOfBounds Error
      
      int inCellY = int(map(mouseY, 0, height, 0, _field.numberOfCellsY));  //Konvertiert MauspositionY auf Array-Indizes
      inCellY = int(constrain(inCellY, 0, _field.numberOfCellsY - 1));  //Verhindert OutOfBounds Error 
      
      if (_field.saveStat[inCellX][inCellY] == 0)
      {
        _field.status[inCellX][inCellY] = 1;  //Wenn Zelle tot, dann belebe
        fill(_field.alive);
      }
      else
      {
        _field.status[inCellX][inCellY] = 0;  //sonst töte
        fill(_field.dead);
      }
    }
    else
    {
      if (!mousePressed)  //Speichert Status wenn die Taste losgelassen wird
      {
        for (int x = 0; x < _field.numberOfCellsX; x++)
        {
          for (int y = 0; y < _field.numberOfCellsY; y++)
          {
            _field.saveStat[x][y] = _field.status[x][y];
          }  
        }
      }  
    }
    
  }
  
  
  
}
