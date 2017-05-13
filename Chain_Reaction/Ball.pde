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
    rad = 20;
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);
    dx = random(10) - 5;
    dy = random(10) - 5;
    state = 0;
  }

  void setState(int newState) {
    state = newState;
  }

  void setDirection(float x, float y) {
    dx = x;
    dy = y;
  }

  void move() {
    if (state == 0) {
      x = x + dx;
      y = y + dy;
      bounce();
    } else if (state == 1) {
    }
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
    if (state == 0) {
      ellipse(x, y, rad, rad);
    } else if (state == 1) {
      System.out.println("Expand");
    }
  }

  boolean collides(Ball other) {
    float d = dist(x, y, other.x, other.y);
    return d < rad;
  }
}