class Ball {
  color fill;
  float radius;
  PVector velocity, location, acceleration;

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

  void move() {
    add(location, velocity);

    if ((location.x > width-radius) || (location.x < radius)) {
     velocity.x = velocity.x * -1;
     boing.play();
     world.hitWall();
    }

    if ((location.y > (height-counterHeight)-(radius)) || (location.y < radius)) {
     velocity.y = velocity.y * -1;
     boing.play();
     world.hitWall();
    }
  }

  float getX() {
    return location.x;
  }

  float getY() {
    return location.y;
  }

   void add(PVector a, PVector b) {
     a.y = a.y + b.y;
     a.x = a.x + b.x;
   }

   void mult(PVector a, float random) {
     a.x = a.x * random;
     a.y = a.y * random;
   }

   float getRadius() {
     return radius;
   }

  void display() {
    fill(fill);
    ellipse(location.x, location.y, radius*2, radius*2);
  }
}