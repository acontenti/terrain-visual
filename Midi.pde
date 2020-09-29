void noteOn(int channel, int pitch, int velocity) {
  println();
  println("Note On");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  for (Command cmd : commands) {
    if (cmd.fits(EventType.NOTE_ON, channel, pitch))
      cmd.execute(velocity);
  }
}

void noteOff(int channel, int pitch, int velocity) {
  println();
  println("Note Off");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  for (Command cmd : commands) {
    if (cmd.fits(EventType.NOTE_OFF, channel, pitch))
      cmd.execute(velocity);
  }
}

void controllerChange(int channel, int number, int value) {
  println();
  println("Controller Change");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  for (Command cmd : commands) {
    if (cmd.fits(EventType.CONTROLLER, channel, number))
      cmd.execute(value);
  }
}

void midiInputSelected(int n) {
  MidiBus.findMidiDevices();
  bus = new MidiBus(this, n, -1);
  initBox.hide();
  midiInputSelected = true;
  noCursor();
}
