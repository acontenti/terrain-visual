enum Direction {
  UP, RIGHT, DOWN, LEFT
}

enum EventType {
  NOTE_ON, NOTE_OFF, CONTROLLER
}

enum Control {
  TERRAIN_HUE, TERRAIN_SATURATION, 
    SKY_BRIGHTNESS, SKY_EAST_HUE, SKY_WEST_HUE, 
    SEA_LEVEL, SEA_HUE, SEA_SATURATION, 
    FX_DISTORTION, FX_RGB_SPLIT, FX_VIGNETTE
}

class Command {
  Direction direction = null;
  EventType eventType;
  float speed = -1;
  int value = -1;
  Control control;
  final int channel;
  final int number;

  Command(int channel, int number) {
    this.channel = channel;
    this.number = number;
  }

  boolean fits(EventType eventType, int channel, int number) {
    return this.eventType == eventType && (this.channel < 0 || this.channel == channel) && (this.number < 0 || this.number == number);
  }

  void execute(int value) {
    if (direction != null) {
      switch(direction) {
      case UP:
        position.acceleration.bump(speed >= 0 ? speed : map(value, 0, 127, 0, 1));
        break;
      case DOWN:
        position.acceleration.bump(-(speed >= 0 ? speed : map(value, 0, 127, 0, 1)));
        break;
      case RIGHT:
        position.cameraRotation.inc(speed >= 0 ? speed : map(value, 0, 127, 0, 90));
        break;
      case LEFT:
        position.cameraRotation.dec(speed >= 0 ? speed : map(value, 0, 127, 0, 90));
        break;
      }
    }
    if (control != null) {
      switch(control) {
      case TERRAIN_HUE:
        terrain.terrainHue = this.value >= 0 ? this.value : (int) map(value, 0, 127, 0, 255);
        break;
      case TERRAIN_SATURATION:
        terrain.terrainSaturation = this.value >= 0 ? this.value : (int) map(value, 0, 127, 0, 255);
        break;
      case SKY_BRIGHTNESS:
        sky.skyBrightness = this.value >= 0 ? this.value : (int) map(value, 0, 127, 0, 255);
        break;
      case SKY_EAST_HUE:
        sky.skyEastHue = this.value >= 0 ? this.value : (int) map(value, 0, 127, 0, 255);
        break;
      case SKY_WEST_HUE:
        sky.skyWestHue = this.value >= 0 ? this.value : (int) map(value, 0, 127, 0, 255);
        break;
      case SEA_LEVEL:
        sea.seaLevel = this.value >= 0 ? this.value : (int) map(value, 0, 127, -100, 100);
        break;
      case SEA_HUE:
        sea.seaHue = this.value >= 0 ? this.value : (int) map(value, 0, 127, 0, 255);
        break;
      case SEA_SATURATION:
        sea.seaSaturation = this.value >= 0 ? this.value : (int) map(value, 0, 127, 0, 255);
        break;
      case FX_DISTORTION:
        fx.distortion = (this.value >= 0 ? this.value : (int) map(value, 0, 127, 0, 1)) > 0;
        break;
      case FX_RGB_SPLIT:
        fx.rgbSplit = (this.value >= 0 ? this.value : (int) map(value, 0, 127, 0, 1)) > 0;
        break;
      case FX_VIGNETTE:
        fx.vignette = (this.value >= 0 ? this.value : (int) map(value, 0, 127, 0, 1)) > 0;
        break;
      default:
        break;
      }
    }
  }
}
