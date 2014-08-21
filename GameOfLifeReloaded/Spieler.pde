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
    int inCellX = int(map(mouseX, 0 + borderXleft, width - borderXright, 0, _field.numberOfCellsX));  //Konvertiert MauspositionX auf Array-Indizes
    inCellX = int(constrain(inCellX, 0, _field.numberOfCellsX - 1));  //Verhindert OutOfBounds Error
      
    int inCellY = int(map(mouseY, 0 + borderYtop, height - borderYbottom, 0, _field.numberOfCellsY));  //Konvertiert MauspositionY auf Array-Indizes
    inCellY = int(constrain(inCellY, 0, _field.numberOfCellsY - 1));  //Verhindert OutOfBounds Error 



   
    if ((mouseX >= borderXleft) && (mouseX <= width - borderXright) && (mouseY >= borderYtop) && (mouseY <= height - borderYbottom))  //Fülle nur, wenn Maus auch im Spielfeld ist, berücksichtigt den Rand 
    {
    	if (_field.saveStat[inCellX][inCellY] == 1 && _playerID == 1 )

        {
       	 _field.status[inCellX][inCellY] = 0;  //Wenn Zelle lebt, egal ob Spieler1 oder Spieler2, dann töte
       	 fill(_field.dead);
     	 maxCellsP1 += 1;     
   	 }
   	 else if(_field.saveStat[inCellX][inCellY] == 2 && _playerID == 2)
        {
          _field.status[inCellX][inCellY] = 0;  //Wenn Zelle lebt, egal ob Spieler1 oder Spieler2, dann töte
          fill(_field.dead);
          maxCellsP2 += 1;
        }
      else
      {
        //sonst belebe
      if (_playerID == 1 && maxCellsP1 > 0 && mouseX < width/3)
        {
          _field.status[inCellX][inCellY] = 1;  //Spieler1
          fill(_field.p1);
        maxCellsP1 -= 1;
        }
      else if(_playerID == 2 && maxCellsP2 > 0 && mouseX > (width - width/3))
        {
          _field.status[inCellX][inCellY] = 2;  //Spieler2
          fill(_field.p2);  
        maxCellsP2 -= 1;
        }
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
