class Value {
  float value, target;

  Value(float val) {
    this.value = val;
  }

  void bump(float val) {
    this.value = val;
    this.target = 0;
  }

  float get() {
    if (target - value < 0.01) {
      value *= 0.6;
    } else if (target > value) {
      value += 0.1;
    }
    return value;
  }
}
