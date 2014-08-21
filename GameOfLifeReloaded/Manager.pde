class Manager
{
  Board _field;
  
  //Pause

  
  //Timer
  int interval = 100;  //Alle 0,1 Sekunden wird ein Zug durchgeführt
  int lastRecordedTime = 0;  //Zeit, des zuletzt durchgeführten Zuges
  
  boolean player1Turn = true;
  
  Manager(Board field)
  {
    _field = field;
  }

  void keyPressed()
  {
    if (key == ' ')  //Pausiere/Beende Pause, wenn Space gedrückt wird
    {
      if(!isPaused)
      {
      isPaused = true;
      } 
      else if(isPaused)
      {
        isPaused = false;
      }
    }
    
    if (key == TAB)
    {
      player1Turn = !player1Turn;  
    }
    
    if ((key == 'r' || key == 'R') && isPaused)
    {
      _field.reset();  
    }
  } 
 
  
}
