import processing.sound.*;

int counterHeight = 50;
SoundFile boing;

World world = new World();

void setup() {
  size(880, 620);
  background(0, 0, 0);
  smooth();
  noStroke();
  boing = new SoundFile(this,"../boing.wav");
}

void draw() {
  background(0);
  for (Ball ball : world.getBalls()) {
    ball.move();
    ball.display();
  }
  
  world.updateCounter();
}

void mouseClicked() {
  if (world.inDeleteMode()) {
    int ballAt = world.ballAt(mouseX, mouseY);
    if (ballAt != -1) {
      world.destoryBallAt(ballAt);
    }
  }
  else {
    if (mouseY <= height-counterHeight) {
      world.addBall(mouseX, mouseY);
    }
  }
}

void keyPressed() {
 if (key == CODED) {
    if (keyCode == SHIFT) {
      world.setDeleteMode(true);
    }
  }
}

void keyReleased() {
 if (key == CODED) {
    if (keyCode == SHIFT) {
      world.setDeleteMode(false);
    }
  }
}