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
      int inCellX = int(map(mouseX, 0, width, 0, _field.numberOfCellsX));
      inCellX = int(constrain(inCellX, 0, _field.numberOfCellsX - 1));
      
      int inCellY = int(map(mouseY, 0, height, 0, _field.numberOfCellsY));
      inCellY = int(constrain(inCellY, 0, _field.numberOfCellsY - 1));  
      
      if (_field.saveStat[inCellX][inCellY] == 0)
      {
        _field.status[inCellX][inCellY] = 1;
      }
      else
      {
        _field.status[inCellX][inCellY] = 0;
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
