//original from: https://github.com/KrabCode/krabcode.github.io/blob/master/posts/galaxy/sketch.js

float maxGen = 400;
float mx, my;
float mxSim = 7;
float mySim = 16;
boolean goingUp = true;

void setup() {
  //  frameRate(4);
  size(800, 800);
  colorMode(HSB, 100);
  //  colorMode(RGB,100,100,100);
  rectMode(CENTER);
  mx = .99;
  my = .98;
}

void draw() {
  background(0);
  translate(width/2, height/2);
  //    if(mouseX>0 || mouseY>0){
  //    mx = map(mouseX, 0, width, -.5, .5);
  //    my = map(mouseY, 0, height, -.5, .5);
  //  }
//  println(millis()%100);
//  if (millis()%100 > 80) {
println("X : " + mxSim);
println("Y: " + mySim);
mxSim += .1;
mySim += .1;
//    if (goingUp) {
//      mxSim+=.1;
////          mySim=mxSim-5;
//      if (mxSim > 16.0) {
//        goingUp = !goingUp;
//      }
//    } else {
//      mxSim-=.1;
////          mySim=mxSim+5;
//      if (mxSim <= 7.0) {
//        goingUp = !goingUp;
//      }
//    }
//  }
  //    if(mxSim > 10){
  //      mxSim = 5;
  //      mySim = 10;
  //      goingUp = !goingUp;
  //    }
  //    if(mxSim < 10){
  //      mxSim = 20;
  //    }
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
  point(x, y);
  recursive(++gen);
}

