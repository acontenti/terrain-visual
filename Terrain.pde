class Terrain {

  private class TerrainChunk {
    float z;
    color c;
  }

  private static final int scale = 20;
  static final int terrainWidth = 4000;
  static final int terrainHeight = 4000;
  private static final int cols = terrainWidth / scale;
  private static final int rows = terrainHeight / scale;
  private final TerrainChunk[][] terrain = new TerrainChunk[cols][rows];

  float density = 0.04;
  int terrainHue = 100, terrainSaturation = 127;

  Terrain() {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = new TerrainChunk();
      }
    }
  }

  void update() {
    PVector pos = position.get();
    float initialX = pos.x;
    for (int y = 0; y < rows; y++) {
      pos.x = initialX;
      for (int x = 0; x < cols; x++) {
        float z = noise(pos.x, pos.y);
        float brightness = map(z, 0, 1, 0, 255);
        terrain[x][y].c = color(terrainHue, terrainSaturation, brightness);
        terrain[x][y].z = map(z, 0, 1, -425, 125);
        pos.x += density;
      }
      pos.y += density;
    }
  }

  void draw() {
    pushMatrix();
    translate(-terrainWidth/2, -terrainHeight/2, 0);
    for (int y = 0; y < rows - 1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        fill(terrain[x][y].c);
        vertex(x * scale, y * scale, terrain[x][y].z);
        vertex(x * scale, (y+1) * scale, terrain[x][y+1].z);
      }
      endShape();
    }
    popMatrix();
  }
}
