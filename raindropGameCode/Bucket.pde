class Bucket {
  PVector loc;

  Bucket(float x, float y) {
    loc = new PVector(x, y);
  }

  void display() {
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 100, 100);
  }
}