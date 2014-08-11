class Spieler
{
  Board _field;

  Spieler(Board field)
  {
    _field = field;
  }  
  
  void mousePressed()
  {
    int inCellX = int(map(mouseX, 0, width, 0, width/_field.cellWidth));
    inCellX = constrain(inCellX, 0, width/_field.cellWidth - 1);
    
    int inCellY = int(map(mouseY, 0, height, 0, height/_field.cellHeight));
    inCellY = constrain(inCellY, 0, height/_field.cellHeight - 1);  
    
    if (_field.status[inCellX][inCellY] == 0)
    {
      _field.status[inCellX][inCellY] = 1;
    }
    else
    {
      _field.status[inCellX][inCellY] = 0;
    }
  }
  
}
