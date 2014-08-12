class Manager
{
  boolean isPaused = true;

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
