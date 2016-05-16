/**
 * Processing HW #2: World Class
 * WHAT DOES THIS CLASS DO
 * 
 * 
 * Authors: Rudd Fawcett and Ally Klionsky
 * Course: Period 3 AP CS, Ms. Litvin
 * Due: 5/15/16
 */

import java.util.ArrayList;

/**
 * Constructs a world.
 * ??? WHATS A WORLD
 */
class World {
 ArrayList<Ball> balls;
 boolean deleteMode = false;
 int count = 0;
 int wallHits = 0;

 World() {
   balls = new ArrayList<Ball>();
 }

  /**
   * Returns the balls on the screen.
   * ???
   */
 ArrayList<Ball> getBalls() {
   return balls;
 }

  /**
   * Adds new ball to the screen.
   */
 void addBall(float mouseX, float mouseY) {
  float radius = 20 + random(40);
  
  //??  
  if (mouseX - radius < 0) {
    mouseX = radius;
  }
  //??
  if (mouseX + radius > width) {
    mouseX = width - radius;
  }

  //??
  if (mouseY - radius < 0) {
    mouseY = radius;
  }
  
  //??
  if (mouseY + radius > height-counterHeight) {
    mouseY = (height-counterHeight) - radius;
  }
  
  Ball ball = new Ball(mouseX, mouseY, radius);

  balls.add(ball);
 }
 
 /**
 * Adds to wall hit counter.
 */
 void hitWall() {
   wallHits++;
 }
 
 /**
 * Returns if in delete mode, or whether
 * or not the shift key is pressed.
 */ 
 boolean inDeleteMode() {
   return deleteMode;
 }

  /**
 * ???
 */
 int ballAt(float mouseX, float mouseY) {
   if (balls.isEmpty()) {
     return -1;
   }
   
   //???
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
 
  /**
   * Removes ball at a given index.
   */
 void destoryBallAt(int index) {
   balls.remove(index);
 }

 /**
 * Creates footer, updates number of balls on
 * screen and number of wall hits.
 */
 void update() {
  fill(color(255,255,255));
  rect(0,height-(counterHeight), width, counterHeight);
  
  fill(0);
  textSize(14);
  text("Balls: "+balls.size()+", Wall Hits: "+wallHits, 10, 600);
  text("Created by Ally and Rudd", width-190, 600); //heehee
  String mode = deleteMode ? "ON" : "OFF";
  String modeString = "Delete Mode: "+mode;
  text(modeString, (width-textWidth(modeString))/2, 600);
 }

  /**
   * Sets current mode to delete mode
   */
 void setDeleteMode(boolean mode) {
   deleteMode = mode;
 }
}