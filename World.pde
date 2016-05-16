import java.util.ArrayList;

class World {
 ArrayList<Ball> balls;
 boolean deleteMode = false;
 int count = 0;
 int wallHits = 0;

 World() {
   balls = new ArrayList<Ball>();
 }

 ArrayList<Ball> getBalls() {
   return balls;
 }

 void addBall(float mouseX, float mouseY) {
  float randWidth = 40 + random(40);
  
  if (mouseX - randWidth < 0) {
    mouseX = randWidth/2;
  }
  
  if (mouseX + randWidth/2 > width) {
    mouseX = width - randWidth/2;
  }
  
  if (mouseY - randWidth < 0) {
    mouseY = randWidth/2;
  }
  
  if (mouseY + randWidth/2 > height-counterHeight) {
    mouseY = (height-counterHeight) - randWidth/2;
  }
  
  Ball ball = new Ball(mouseX, mouseY, randWidth);

  balls.add(ball);
 }
 
 void hitWall() {
   wallHits++;
 }

 boolean inDeleteMode() {
   return deleteMode;
 }

 int ballAt(float mouseX, float mouseY) {
   if (balls.isEmpty()) {
     return -1;
   }

   for (int i = balls.size()-1; i >= 0; i--) { // view hierarchy
     float radiusSquare = (balls.get(i).getRadius())*(balls.get(i).getRadius());
     float xDifferenceSquare = (mouseX - balls.get(i).getX())*(mouseX - balls.get(i).getX());
     float yDifferenceSquare = (mouseY - balls.get(i).getY())*(mouseY - balls.get(i).getY());

     boolean inCircle = (xDifferenceSquare + yDifferenceSquare) < radiusSquare;

     if (inCircle) {
       return i;
     }
   }

   return -1;
 }

 void destoryBallAt(int index) {
   balls.remove(index);
 }

 void updateCounter() {
  fill(color(255,255,255));
  rect(0,height-(counterHeight), width, counterHeight);
  
  
  fill(0);
  textSize(14);
  text("Created by Rudd and Ally", width-190, 600);

  fill(0);
  textSize(14);
  text("Balls: "+balls.size()+", Wall Hits: "+wallHits, 10, 600);
 }

 void setDeleteMode(boolean mode) {
   deleteMode = mode;
 }
}