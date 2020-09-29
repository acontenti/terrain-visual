class DistortionPass implements Pass {
  PShader shader;
  float intensity = 0;

  public DistortionPass() {
    shader = loadShader("distortion.glsl");
  }

  @Override
    public void prepare(Supervisor supervisor) {
    shader.set("intensity", intensity);
  }

  @Override
    public void apply(Supervisor supervisor) {
    PGraphics pass = supervisor.getNextPass();
    supervisor.clearPass(pass);

    pass.beginDraw();
    pass.shader(shader);
    pass.image(supervisor.getCurrentPass(), 0, 0);
    pass.endDraw();
  }
}
