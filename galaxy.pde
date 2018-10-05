//original from: https://github.com/KrabCode/krabcode.github.io/blob/master/posts/galaxy/sketch.js

float maxGen = 400;
float mx, my;
float mxSim = 7; //simulated mouseX
float mySim = 16; //simulated mouseY
boolean goingUp = true;

void setup() {
  size(800, 800);
  colorMode(HSB, 100);
  rectMode(CENTER);
  mx = .99;
  my = .98;
}

void draw() {
  background(0);
  translate(width/2, height/2);
//println("X : " + mxSim);
//println("Y: " + mySim);
mxSim += .1;
mySim += .1;

  mx = map(mxSim, 0, width, -.5, .5);
  my = map(mySim, 0, height, -.5, .5); 

  recursive(0);
}

void recursive( float gen ) {
  if (gen > maxGen) return;
  float t = .5+.5*frameCount/5000;
  float x = (maxGen-gen)*(sin(gen*t*mx));
  float y = (maxGen-gen)*(cos(gen*t*my));
  stroke(50+gen/8, 50+gen/8, 100);
  strokeWeight(8);
  fill(0);
  point(y, x);
  point(x, y);
  recursive(++gen);
}

