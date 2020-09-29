class FXData {
  PostFX fx;
  DistortionPass distortionPass;

  boolean distortion = true, rgbSplit = true, vignette = true;

  FXData() {
    fx = new PostFX(TerrainVisual.this);
    distortionPass = new DistortionPass();
    fx.preload(RGBSplitPass.class);
    fx.preload(VignettePass.class);
    fx.preload(ToonPass.class);
  }

  void apply() {
    float speed = position.velocity.mag();
    PostFXBuilder fxb = fx.render();
    if (distortion) {
      distortionPass.intensity = speed * 10;
      fxb.custom(distortionPass);
    }
    if (rgbSplit) {
      fxb.rgbSplit(speed * 1000);
    }
    if (vignette) {
      fxb.vignette(speed, speed * 0.5);
    }
    fxb.compose();
  }
}
