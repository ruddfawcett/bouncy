/**
 * Processing HW #2: Ball Class
 * This class creates balls of a random size, color,
 * acceleration, and velocity on wherever the mouse is clicked.
 *
 * Authors: Rudd Fawcett and Ally Klionsky
 * Course: Period 3 AP CS, Ms. Litvin
 * Due: 5/15/16
 */

class Ball {
  color fill;
  float radius;
  PVector velocity, location, acceleration;

  /**
   * Constructs a ball with a given location (x
   * and y values) and diameter. Fills it with
   * random color and assigns it a random velocity.
   */
  Ball(float x, float y, float radius) {
    this.radius = radius;

    ellipseMode(CENTER);
    fill = color(random(255),random(255),random(255));
    location = new PVector(x,y);
    velocity = PVector.random2D();

    acceleration = new PVector(-0.001,0.01);
    mult(acceleration, random(30));

    add(velocity, acceleration);
  }
  /**
   * Moves a specific ball.
   */
  void move() {
    add(location, velocity);

    // If the ball hits the edge of the screen (left and right).
    if ((location.x > width-radius) || (location.x < radius)) {
     velocity.x = velocity.x * -1;
     boing.play();
     world.hitWall();
    }

    // If the ball hits the edge of the screen (top and bottom).
    if ((location.y > (height-counterHeight)-(radius)) || (location.y < radius)) {
     velocity.y = velocity.y * -1;
     boing.play();
     world.hitWall();
    }
  }

  /**
   * Returns location of x value.
   */
  float getX() {
    return location.x;
  }

  /**
   * Returns location of y value.
   */
  float getY() {
    return location.y;
  }

  /**
   * Adds two vectors together.
   */
   void add(PVector a, PVector b) {
     a.y = a.y + b.y;
     a.x = a.x + b.x;
   }

  /**
   * Multiples a vector by a random number.
   */
   void mult(PVector a, float random) {
     a.x = a.x * random;
     a.y = a.y * random;
   }

  /**
   * Returns diameter of the ellipse.
   */
   float getRadius() {
     return radius;
   }
  /**
   * Displays and creates a ball at a given
   * location, size, and color.
   */
  void display() {
    fill(fill);
    ellipse(location.x, location.y, radius*2, radius*2);
  }
}
