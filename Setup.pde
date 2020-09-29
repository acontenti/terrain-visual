void setupUI() {
  ControlP5 cp5 = new ControlP5(this);
  initBox = cp5.addGroup("messageBox", width/2 - 150, 100, 300).hideBar();
  cp5.addTextlabel("messageBoxLabel", "Select MIDI input device", 20, 20).moveTo(initBox);
  cp5.addScrollableList("midiInputSelected")
    .setPosition(20, 50)
    .setSize(200, 100)
    .setBarHeight(0)
    .setBarVisible(false)
    .setItemHeight(20)
    .setType(ScrollableList.LIST)
    .moveTo(initBox)
    .addItems(MidiBus.availableInputs());
}

void registerCommands() {
  new CommandBuilder(0, 2).up().onNoteOn();
  new CommandBuilder(0, 0).left(30).onNoteOn();
  new CommandBuilder(0, 4).right(30).onNoteOn();
  new CommandBuilder(0, 5).up(0.5).onNoteOn();
  new CommandBuilder(0, 5).down(0.3).onNoteOff();

  new CommandBuilder(0, 1).terrainHue().onController();
  new CommandBuilder(0, 2).terrainSaturation().onController();
  new CommandBuilder(0, 3).skyEastHue().onController();
  new CommandBuilder(0, 4).skyWestHue().onController();
  new CommandBuilder(0, 5).skyBrightness().onController();

  new CommandBuilder(0, 7).terrainSaturation().onNoteOn();
  new CommandBuilder(0, 7).terrainSaturation().onController();
  new CommandBuilder(0, 9).seaLevel().onNoteOn();
}

void keyPressed() {
  if (key == 4/*ctrl-d*/) {
    debug = !debug;
  } else if (key == CODED) {
    if (keyCode == UP) {
      noteOn(0, 2, 80);
    } else if (keyCode == DOWN) {
      noteOff(0, 5, 0);
    } else if (keyCode == LEFT) {
      noteOn(0, 0, 0);
    } else if (keyCode == RIGHT) {
      noteOn(0, 4, 0);
    }
  }
}
