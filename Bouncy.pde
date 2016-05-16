/**
 * Bouncy HW #2:
 * This program creates balls of a random size, color,
 * acceleration, and velocity wherever the mouse is clicked.
 * When a ball hits the perimeter of the window, the ball
 * bounces off at the opposite angle and a sound is played.
 * If the shift key is pressed, mouse clicks directly on a
 * ball (not on the bounding box) delete that ball.
 *
 * Authors: Rudd Fawcett and Ally Klionsky
 * Course: Period 3 AP CS, Ms. Litvin
 * Due: 5/15/16
 */

// Imports sound library
import processing.sound.*;

int counterHeight = 50;
SoundFile boing;

World world = new World();

/**
 * Sets up the window.
 */
void setup() {
  size(880, 620);
  background(0, 0, 0);
  smooth();
  noStroke();
  boing = new SoundFile(this,"../boing.wav");
}

/**
 * Moves and displays every ball on the screen.
 */
void draw() {
  background(0);
  for (Ball ball : world.getBalls()) {
    ball.move();
    ball.display();
  }

  world.update();
}

/**
 * If ball is clicked and shift key is
 * is pressed, delete ball. If not,
 * adds ball at mouse location.
 */
void mouseClicked() {
  if (world.inDeleteMode()) {
    int ballAt = world.ballAt(mouseX, mouseY);
    if (ballAt != -1) {
      world.destroyBallAt(ballAt);
    }
  }
  else {
    if (mouseY <= height-counterHeight) {
      world.addBall(mouseX, mouseY);
    }
  }
}

/**
 * If shift key is pressed, program
 * turns into "delete mode," where
 * balls are deleted if clicked.
 */
void keyPressed() {
 if (key == CODED) {
    if (keyCode == SHIFT) {
      world.setDeleteMode(true);
    }
  }
}

/**
 * If shift key is released, program
 * exits "delete mode," and balls are
 * added at the mouse location.
 */
void keyReleased() {
 if (key == CODED) {
    if (keyCode == SHIFT) {
      world.setDeleteMode(false);
    }
  }
}
