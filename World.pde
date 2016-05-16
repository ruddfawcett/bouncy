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
  float radius = 20 + random(40);
  
  if (mouseX - radius < 0) {
    mouseX = radius;
  }
  
  if (mouseX + radius > width) {
    mouseX = width - radius;
  }
  
  if (mouseY - radius < 0) {
    mouseY = radius;
  }
  
  if (mouseY + radius > height-counterHeight) {
    mouseY = (height-counterHeight) - radius;
  }
  
  Ball ball = new Ball(mouseX, mouseY, radius);

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

 void update() {
  fill(color(255,255,255));
  rect(0,height-(counterHeight), width, counterHeight);
  
  fill(0);
  textSize(14);
  text("Balls: "+balls.size()+", Wall Hits: "+wallHits, 10, 600);
  text("Created by Rudd and Ally", width-190, 600);
  String mode = deleteMode ? "ON" : "OFF";
  String modeString = "Delete Mode: "+mode;
  text(modeString, (width-textWidth(modeString))/2, 600);
 }

 void setDeleteMode(boolean mode) {
   deleteMode = mode;
 }
}