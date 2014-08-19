class Manager
{
  //Pause
  boolean isPaused = true;
  
  //Timer
  int interval = 100;  //Alle 0,1 Sekunden wird ein Zug durchgeführt
  int lastRecordedTime = 0;  //Zeit, des zuletzt durchgeführten Zuges
  
  boolean player1Turn = true;

  Manager()
  {
  
  }

  void keyPressed()
  {
    if (key == ' ')  //Pausiere/Beende Pause, wenn Space gedrückt wird
    {
      isPaused = !isPaused;  
    }
    
    if (key == TAB)
    {
      player1Turn = !player1Turn;  
    }
  }  
}
