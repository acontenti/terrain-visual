class Angle {
  float angle, target, delta;

  Angle(int angle) {
    this.angle = angle;
    this.target = angle;
    delta = 5;
  }

  float get() {
    boolean rotateRight;
    float totalAngle;
    if (angle + (360 - target) <= 180) {
      totalAngle = angle + (360 - target);
      rotateRight = true;
    } else {
      totalAngle = target - angle;
      rotateRight = false;
    }
    angle -= rotateRight ? (totalAngle / delta) : -(totalAngle / delta);
    return radians(angle);
  }

  void inc(float value) {
    target = angle + value;
  }

  void dec(float value) {
    target = angle - value;
  }
}