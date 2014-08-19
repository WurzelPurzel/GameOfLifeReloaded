class Spieler
{
  Board _field;
  int _playerID;

  Spieler(Board field, int playerID)
  {
    _field = field;
    _playerID = playerID;
  }  
  
  void mousePressed()
  {     
    int inCellX = int(map(mouseX, 0, width, 0, _field.numberOfCellsX));  //Konvertiert MauspositionX auf Array-Indizes
    inCellX = int(constrain(inCellX, 0, _field.numberOfCellsX - 1));  //Verhindert OutOfBounds Error
      
    int inCellY = int(map(mouseY, 0, height, 0, _field.numberOfCellsY));  //Konvertiert MauspositionY auf Array-Indizes
    inCellY = int(constrain(inCellY, 0, _field.numberOfCellsY - 1));  //Verhindert OutOfBounds Error 
      
    if (_field.saveStat[inCellX][inCellY] == 1 || _field.saveStat[inCellX][inCellY] == 2)
    {
      _field.status[inCellX][inCellY] = 0;  //Wenn Zelle lebt, egal ob Spieler1 oder Spieler2, dann töte
      fill(_field.dead);
    }
    else
    {
      //sonst belebe
      if (_playerID == 1)
      {
        _field.status[inCellX][inCellY] = 1;  //Spieler1
        fill(_field.p1);
      }
      else
      {
        _field.status[inCellX][inCellY] = 2;  //Spieler2
        fill(_field.p2);  
      }
    }    
      
    //Speichert Status      
    for (int x = 0; x < _field.numberOfCellsX; x++)
    {
      for (int y = 0; y < _field.numberOfCellsY; y++)
      {
        _field.saveStat[x][y] = _field.status[x][y];
      }  
    }
        
  }
  
  
}
