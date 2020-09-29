class Position {
  Value acceleration = new Value(0.0);
  Angle cameraRotation = new Angle(0);
  private PVector position = new PVector(0, 0);
  PVector cameraPosition = new PVector(0, 0, 100);
  PVector velocity = new PVector(0, 0, 0);
  float pitch = PI/24;
  float friction = 0.75;

  void update() {
    float pan = cameraRotation.get();
    PVector forward = new PVector(cos(pan), sin(pan), -tan(pitch));
    forward.normalize();
    PVector center = PVector.add(cameraPosition, forward);
    camera(cameraPosition.x, cameraPosition.y, cameraPosition.z, center.x, center.y, center.z, 0, 0, -1);
    velocity.add(PVector.mult(forward, acceleration.get()));
    velocity.mult(friction);
    position.add(velocity);
  }

  PVector get() {
    return position.copy();
  }
}
