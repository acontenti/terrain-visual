import controlP5.*;
import themidibus.*;
import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

ArrayList<Command> commands = new ArrayList();
Terrain terrain;
Sky sky;
Sea sea;
Position position;
FXData fx;
ControlGroup initBox;
MidiBus bus;
boolean midiInputSelected = false, debug = false;

void setup() {
  fullScreen(P3D);
  smooth(4);
  frameRate(30);
  colorMode(HSB, 255, 255, 255);
  noStroke();
  terrain = new Terrain();
  position = new Position();
  sky = new Sky();
  sea = new Sea();
  fx = new FXData();
  setupUI();
  registerCommands();
}

void draw() {
  background(0);
  if (midiInputSelected) {
    position.update();
    terrain.update();
    sky.draw();
    sea.draw();
    terrain.draw();
    fx.apply();
    if (debug) {
      camera();
      fill(255);
      text((int) frameRate, 20, 20);
    }
  }
}
