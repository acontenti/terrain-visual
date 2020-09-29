class Sea {
  int seaLevel = 0, seaHue = 165, seaSaturation = 127;

  void draw() {
    pushMatrix();
    fill(color(seaHue, seaSaturation, 66));
    translate(-5000, -5000, map(seaLevel, -100, 100, -800, 0));
    rect(0, 0, 10000, 10000);
    popMatrix();
  }
}
