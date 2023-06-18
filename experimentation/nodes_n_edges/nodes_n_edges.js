const movementRange = 15;
const frameLength = 1.0/30.0;
const numNodes = 50;
var time = 0.0;

const nodes = [];

class Node {
  constructor(){
    initalPosition = createVector(40,40);
    //this.position = initialPosition;
    this.initX = random(width);
    this.initY = random(height);
    this.x = this.initX;
    this.y = this.initY;
    this.diameter = 5;
    this.hFreq = random(-0.1,0.1);
    this.vFreq = random(-0.1,0.1);
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

class Edge {
  constructor(nodeOne, nodeTwo){
    this.nodeOne = nodeOne;
    this.nodeTwo = nodeTwo;
  }
}

function setup() {
  createCanvas(720, 400);
  stroke(255);
  frameRate(30);
  // create all nodes:
  for(var i = 0; i < numNodes; i++){
    nodes[i] = new Node();
    nodes[i].display();
  }
}

function draw() {
  background(0); // Set the background to black
  time = time + frameLength;
  for(var i = 0; i < numNodes; i++){
    nodes[i].move(time);
    nodes[i].display();
  }
}
