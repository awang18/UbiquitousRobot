class Ball {

  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  Ball() {
    x = random((width - rad) + rad / 2);
    y = random((height - rad) + rad / 2);
    rad = 10;
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    dx = random(10) - 5;
    dy = random(10) - 5;
    state = 0;
  }

  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }

  void bounce() {
    if (x >= width || x <= 0) {
      dx = -dx;
    } else if (y >= height || y <= 0) {
      dy = -dy;
    }
  }

  void display() {
    fill(c);
    ellipse(x, y, rad, rad);
  }
}