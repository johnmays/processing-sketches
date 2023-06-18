var movementRange = 30;
var nodeOne;
var time = 0.0;
var frameLength = 1.0/30.0;

class Node {
  constructor(){
    this.initX = random(width);
    this.initY = random(height);
    this.x = this.initX;
    this.y = this.initY;
    this.diameter = 5;
    this.hFreq = random(0.01,0.1);
    this.vFreq = random(0.01,0.1);
  }
  
  move(time) {
    this.x = this.initX + movementRange*sin(2*PI*this.hFreq*time);
    this.y = this.initY + movementRange*sin(2*PI*this.vFreq*time);
  }
  
  display() {
    ellipse(this.x, this.y, this.diameter, this.diameter);
    console.log("foo");
  }
}

function setup() {
  createCanvas(720, 400);
  stroke(255);
  frameRate(30);
  nodeOne = new Node();
  nodeOne.display();
}

function draw() {
  background(0); // Set the background to black
  time = time + frameLength;
  nodeOne.move(time);
  nodeOne.display();
}
