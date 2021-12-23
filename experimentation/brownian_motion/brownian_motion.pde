//Globals

int numNodes = 10;
Node[] nodes;
int range = 13;
int particleSize = 6;
int posMemoryDepth = 24;

class Node {
  int x;
  int y;
  int[] xMemoryQueue;
  int[] yMemoryQueue;
  boolean posMemory;
  
  Node(int xInit,int yInit, boolean tempPosMemory){
    x = xInit;
    y = yInit;
    posMemory = tempPosMemory;  //sets whether or not the position memory tail will be calc'd and displayed
    if (posMemory){
      xMemoryQueue = new int[posMemoryDepth];
      yMemoryQueue = new int[posMemoryDepth];
    }
  }
  
  void update(){
    if(posMemory){
      updateQueue();
    }
    int newX = x + int(random(-range, range));
    int newY = y + int(random(-range, range));
    if (newX >= 0 && newX < 600){
      x = newX;
    }
    if (newY >= 0 && newY < 600){
      y = newY;
    }
  }
  
  void updateQueue(){
    for(int i = posMemoryDepth-1; i > 0; i--){
      xMemoryQueue[i] = xMemoryQueue[i-1];
      yMemoryQueue[i] = yMemoryQueue[i-1];
    }
    xMemoryQueue[0] = x;
    yMemoryQueue[0] = y;
  }
  
  void display(){
    fill(255);
    ellipse(x, y, particleSize, particleSize);
    if(posMemory){
      int queueTransparencyValue = 255;
      for(int i = 0; i < posMemoryDepth; i++){
        queueTransparencyValue -= abs(int(255/posMemoryDepth));
        fill(255, 255, 255, queueTransparencyValue);
        ellipse(xMemoryQueue[i], yMemoryQueue[i], particleSize, particleSize);
      }
    }
  }
}

void setup(){
  size(600,600);
  noStroke();
  frameRate(20);
  nodes = new Node[numNodes];
  for(int i = 0; i < numNodes; i++){
    nodes[i] = new Node(int(random(0, 600)), int(random(0, 600)), true);
  }
}

void draw(){
  background(0);
  for(Node node: nodes){
    node.update();
    node.display();
  }
}
