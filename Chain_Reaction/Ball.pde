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

  Ball(int newX, int newY, int newDx, int newDy) {
    this();
    x = newX;
    y = newY;
    dx = newDx;
    dy = newDy;
  }

  void setState(int newState) {
    state = newState;
  }

  void stopMoving() {
    dx = 0;
    dy = 0;
    state = 1;
  }

  int getState() {
    return state;
  }

  float getRadius() {
    return rad;
  }
  
  void move() {
    System.out.println(state);
    if (state == 0) {
      x = x + dx;
      y = y + dy;
      bounce();
    } else if (state == 1) {
      System.out.println("expand");
      expand();
      if (rad >= 150) {
         System.out.println(state + " state "); 
         state = 2;
      }
    } else if (state == 2) {
      System.out.println("shrink");
      shrink();
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
    ellipse(x, y, rad, rad);
  }

  boolean collides(Ball other) {
    // For the initial ball
    //if (state == 1 || other.state == 1) {
    float d = dist(x, y, other.x, other.y);
    return d < rad;
    //}
    //return false;
  }

  void expand() {
    if (rad >= 100) {
     state = 2; 
    }
    
    if (rad < 150) {
      System.out.println(rad);
      rad++;
    }
    
    
  }

  void shrink() {
    System.out.println("SHRINK");
    if (rad >= 0) {
      rad--;
    }
  }
}