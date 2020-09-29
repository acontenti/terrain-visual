class CommandBuilder {
  private Command cmd;

  CommandBuilder(int channel, int number) {
    cmd = new Command(channel, number);
  }

  CommandBuilder(int channel) {
    cmd = new Command(channel, -1);
  }

  CommandBuilder direction(Direction direction) {
    cmd.direction = direction;
    return this;
  }

  CommandBuilder up() {
    cmd.direction = Direction.UP;
    return this;
  }

  CommandBuilder up(float speed) {
    cmd.direction = Direction.UP;
    cmd.speed = constrain(speed, 0, 1.0);
    return this;
  }

  CommandBuilder down() {
    cmd.direction = Direction.DOWN;
    return this;
  }

  CommandBuilder down(float speed) {
    cmd.direction = Direction.DOWN;
    cmd.speed = constrain(speed, 0, 1.0);
    return this;
  }

  CommandBuilder left() {
    cmd.direction = Direction.LEFT;
    return this;
  }

  CommandBuilder left(float angle) {
    cmd.direction = Direction.LEFT;
    cmd.speed = constrain(angle, 0, 90);
    return this;
  }

  CommandBuilder right() {
    cmd.direction = Direction.RIGHT;
    return this;
  }

  CommandBuilder right(float angle) {
    cmd.direction = Direction.RIGHT;
    cmd.speed = constrain(angle, 0, 90);
    return this;
  }

  CommandBuilder speed(float speed) {
    cmd.speed = constrain(speed, 0, MAX_FLOAT);
    return this;
  }

  CommandBuilder angle(float angle) {
    cmd.speed = constrain(angle, 0, 90);
    return this;
  }

  CommandBuilder value(int value) {
    cmd.value = constrain(value, 0, 255);
    return this;
  }

  CommandBuilder control(Control control) {
    cmd.control = control;
    return this;
  }

  CommandBuilder terrainHue() {
    cmd.control = Control.TERRAIN_HUE;
    return this;
  }

  CommandBuilder terrainSaturation() {
    cmd.control = Control.TERRAIN_SATURATION;
    return this;
  }

  CommandBuilder skyBrightness() {
    cmd.control = Control.SKY_BRIGHTNESS;
    return this;
  }

  CommandBuilder skyEastHue() {
    cmd.control = Control.SKY_EAST_HUE;
    return this;
  }

  CommandBuilder skyWestHue() {
    cmd.control = Control.SKY_WEST_HUE;
    return this;
  }

  CommandBuilder seaLevel() {
    cmd.control = Control.SEA_LEVEL;
    return this;
  }

  CommandBuilder seaHue() {
    cmd.control = Control.SEA_HUE;
    return this;
  }

  CommandBuilder seaSaturation() {
    cmd.control = Control.SEA_SATURATION;
    return this;
  }

  CommandBuilder fxDistortion() {
    cmd.control = Control.FX_DISTORTION;
    return this;
  }

  CommandBuilder fxDistortion(boolean on) {
    cmd.control = Control.FX_DISTORTION;
    cmd.value = on ? 1 : 0;
    return this;
  }

  CommandBuilder fxRGBShift() {
    cmd.control = Control.FX_RGB_SPLIT;
    return this;
  }

  CommandBuilder fxRGBShift(boolean on) {
    cmd.control = Control.FX_RGB_SPLIT;
    cmd.value = on ? 1 : 0;
    return this;
  }

  CommandBuilder fxVignette() {
    cmd.control = Control.FX_VIGNETTE;
    return this;
  }

  CommandBuilder fxVignette(boolean on) {
    cmd.control = Control.FX_VIGNETTE;
    cmd.value = on ? 1 : 0;
    return this;
  }

  Command onNoteOn() {
    cmd.eventType = EventType.NOTE_ON;
    commands.add(cmd);
    return cmd;
  }

  Command onNoteOff() {
    cmd.eventType = EventType.NOTE_OFF;
    commands.add(cmd);
    return cmd;
  }

  Command onController() {
    cmd.eventType = EventType.CONTROLLER;
    commands.add(cmd);
    return cmd;
  }
}
