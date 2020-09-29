class Sky {
  private PGraphics pickingBuffer;
  private PShape sphereShape;
  int skyEastHue = 140, skyWestHue = 200, skyBrightness = 150, skySaturation = 180;

  Sky() {
    sphereShape = createShape(SPHERE, Terrain.terrainWidth);
    pickingBuffer = createGraphics(width, height, P3D);
  }

  void draw() {
    int x = 0, y = 0;
    float w = width, h = height;
    color c1 = color(skyEastHue, skySaturation, skyBrightness);
    color c2 = color(skyWestHue, skySaturation, skyBrightness);
    boolean axis = true;
    pickingBuffer.beginDraw(); 
    pickingBuffer.background(0);
    pickingBuffer.noFill();
    if (axis) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = pickingBuffer.lerpColor(c1, c2, inter);
        pickingBuffer.stroke(c);
        pickingBuffer.line(x, i, x+w, i);
      }
    } else {  // Left to right gradient
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = pickingBuffer.lerpColor(c1, c2, inter);
        pickingBuffer.stroke(c);
        pickingBuffer.line(i, y, i, y+h);
      }
    }
    pickingBuffer.endDraw();
    sphereShape.setTexture(pickingBuffer);
    translate(0, 0, 0);
    shape(sphereShape);
  }
}
