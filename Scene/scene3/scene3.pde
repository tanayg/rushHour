//scene 3
//scene driving the car before game begins and after scene 2.
//top down view of cars "driving" (lines of road are actually just moving downward
float stripeX, stripeY;

//first using Tanay's models for the cars from top down
void Car1(float car1X, float car1Y) {
  //begin tires
  pushMatrix();
  translate(car1X, car1Y);
  fill(0);
  rect(-5, 40, 20, 40, 5, 0, 0, 5);
  rect(135, 40, 20, 40, 0, 5, 5, 0);
  rect(-5, 220, 20, 40, 5, 0, 0, 5);
  rect(135, 220, 20, 40, 0, 5, 5, 0);
  //end tires
  fill(41, 37, 38);
  rect(0, 0, 150, 300, 75, 75, 10, 10); //body
  fill(201, 82, 16); //stripe color
  //quad(90, 53, 110,
  rect(40, 2, 20, 298, 25, 0, 0, 0); //left stripe
  rect(90, 2, 20, 298, 0, 25, 0, 0); // right stripe
  fill(54, 52, 53);
  pushMatrix();
  translate(0, 20);
  quad(5, 50, 145, 50, 130, 100, 20, 100); // windshield
  popMatrix();
  quad(10, 220, 140, 220, 130, 250, 20, 250);
  fill(233, 232, 230);
  //begin lights
  pushMatrix();
  translate(16, 16);
  rotate(-PI/8);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  pushMatrix();
  translate(120, 10);
  rotate(PI/8);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  popMatrix();
  //end lights
}

void Car2(float car2X, float car2Y) {
  //begin tires
  pushMatrix();
  translate(car2X, car2Y);
  fill(0);
  rect(-5, 40, 20, 40, 5, 0, 0, 5);
  rect(135, 40, 20, 40, 0, 5, 5, 0);
  rect(-5, 220, 20, 40, 5, 0, 0, 5);
  rect(135, 220, 20, 40, 0, 5, 5, 0);
  //end tires
  fill(204, 0, 0);
  rect(0, 0, 150, 300, 45, 45, 10, 10); //body
  fill(54, 52, 53);
  pushMatrix();
  translate(0, 20);
  quad(5, 50, 145, 50, 130, 100, 20, 100); // windshield
  popMatrix();
  quad(10, 220, 140, 220, 130, 250, 20, 250);
  fill(233, 232, 230);
  //begin lights
  pushMatrix();
  translate(20, 10);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  pushMatrix();
  translate(110, 10);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  popMatrix();
}

void Bus(float busX, float busY) {
  fill(0);
  pushMatrix();
  translate(busX, busY);
  rect(45, 90, 20, 40, 5, 0, 0, 5);
  rect(185, 90, 20, 40, 0, 5, 5, 0);
  rect(45, 420, 20, 40, 5, 0, 0, 5);
  rect(185, 420, 20, 40, 0, 5, 5, 0);
  fill(255, 216, 0);
  rect(50, 50, 150, 450, 20, 20, 10, 10);
  fill(233, 232, 230);
  //begin lights
  pushMatrix();
  translate(70, 51);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  pushMatrix();
  translate(160, 51);
  rect(0, 0, 20, 8, 2, 2, 2, 2);
  popMatrix();
  //end lights
  fill(54, 52, 53);
  //rect(65, 85, 120, 40);
  quad(65, 85, 185, 85, 180, 110, 70, 110);
  quad(70, 480, 180, 480, 185, 490, 65, 490);
  fill(255, 0, 0);
  rect(70, 498, 10, 3);
  rect(170, 498, 10, 3);
  //stroke(246, 239, 119);
  line(70, 140, 70, 440);
  line(180, 140, 180, 440);
  line(125, 140, 125, 440);
  popMatrix();
}

//void roadStripes() {
//}

class roadStripes {
  PVector stripeVel;
  PVector stripePos;
  float[] posY = new float[4];
  float[] posX = new float[4];
  roadStripes() {
    stripeVel = new PVector(0, -50);
    for (int i = 0; i < 4; i++) {
      posY[i] = 200*i;
      posX[i] = 150;
      stripePos = new PVector(posX[i], posY[i]);
    }
  }
  
  void run() {
    renderS();
    updateS();
  }
  void updateS() {
    for(int i = 0; i < 4; i++) {
    stripePos.add(stripeVel);
    }
  }
  void renderS() {
    pushMatrix();
      fill(255);
      translate(stripePos.x, stripePos.y);
      rect(0, 0, 20, 100);
    popMatrix();
  }
}

roadStripes stripes;

void setup() {
  size(800, 800);
  stripeX = 0;
  stripeY = 0;
}

void draw() {
  background(100, 100, 20);
  fill(50);
  rect(50, 0, width-100, height);
  Car1(100, 100);
  Car2(300, 300);
  Bus(500, 100);
  stripes.run();
}