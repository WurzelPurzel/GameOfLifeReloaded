class Manager
{
  //Pause
  boolean isPaused = true;
  
  //Timer
  int interval = 100;  //Alle 0,1 Sekunden wird ein Zug durchgeführt
  int lastRecordedTime = 0;  //Zeit, des zuletzt durchgeführten Zuges

  Manager()
  {
  
  }

  void keyPressed()
  {
    if (key == ' ')  //Pausiere/Beende Pause, wenn Space gedrückt wird
    {
      isPaused = !isPaused;  
    }
  }  
}
