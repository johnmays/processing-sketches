int vertexSize = 4;
int driftRadius = 50;
float randomFluxAmount = 0;

class Vertex {
  PVector centerLocation;
  PVector location;
  PVector velocity;
  float driftSpeed;
  Vertex(int centerX, int centerY){
    centerLocation = new PVector(centerX, centerY);
    location = new PVector(centerLocation.x + random(-driftRadius, driftRadius)/2.0, centerLocation.y + random(-driftRadius, driftRadius)/2.0);
    velocity = PVector.random2D();
    driftSpeed = random(0.3,0.9);
  }
  
  void display(){
    //stroke(255); fill(0,0,0,0); ellipse(centerLocation.x, centerLocation.y, driftRadius*2, driftRadius*2);
    noStroke(); fill(255.0);
    ellipse(location.x, location.y, vertexSize, vertexSize);
    
  }
  
  void update(){
    PVector centerVector = location.copy().sub(centerLocation);
    float distanceFromCenter = centerVector.mag();
    if(distanceFromCenter >= driftRadius){
      velocity = centerVector.div(-distanceFromCenter);
    }
    location.add(velocity.copy().mult(driftSpeed));
  }
  
}

class Edge {
  Vertex v1;
  Vertex v2;
  Edge(Vertex tempV1, Vertex tempV2){
    v1 = tempV1;
    v2 = tempV2;
  }
  
  void display(){
    stroke(255.0);
    line(v1.location.x, v1.location.y, v2.location.x, v2.location.y);
  }
}

Vertex[] vertices;
Edge[] edges;

void setup(){
  size(600, 600);
  vertices = new Vertex[25];
  edges = new Edge[vertices.length - 1];
  int vIndex = 0;
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      if(x != 0 && y != 0 && x != width-1 && y != height-1){
        if(x%100==0 & y%100==0){
          vertices[vIndex] = new Vertex(x, y);
          vIndex++;
        }
      }
    }
  }
  //vertices[0] = new Vertex(width/2, height/2);
  //vertices[1] = new Vertex((width/2)+50, (height/2)+50);
  //edges[0] = new Edge(vertices[0], vertices[1]);
  frameRate(10);
  smooth();
}

void draw(){
  background(40);
  for(Vertex vertex: vertices){
    vertex.update();
    vertex.display();
  }
  //for(Edge edge: edges){
  //  edge.display();
  //}
}
