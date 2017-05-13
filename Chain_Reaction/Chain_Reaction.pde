Ball[] balls;
boolean reactionStarted;

void setup() {
  size(600, 600);
  reactionStarted = false;
  balls = new Ball[25];

  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);

  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].move();
    if (reactionStarted == true) {
      for (int j = 0; j < balls.length; j++) {
        if (i != j && balls[i].collides(balls[j])) {
          balls[i].stopMoving();
          balls[j].stopMoving();
        }
      }
    }
  }
}

void mouseClicked() {
  reactionStarted = true;
  Ball startBall = new Ball(mouseX, mouseY, 0, 0);
}