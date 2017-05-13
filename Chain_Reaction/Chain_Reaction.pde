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
      ////System.out.println("expand");
      //Ball startBall = new Ball();
      //startBall.display();
      //startBall.setState(1);
      for (int j = 0; j < balls.length; j++) {
        if (i != j && balls[i].collides(balls[j])) {
           balls[i].setDirection(0,0);
           balls[j].setDirection(0,0);
        }
      }
    }
  }
}

void mouseClicked() {
  reactionStarted = true;
}