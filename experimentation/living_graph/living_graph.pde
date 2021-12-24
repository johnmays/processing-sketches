int vertexSize = 4;
int driftLength = 50;
float randomFluxAmount = 0;

class Vertex {
  PVector centerLocation;
  PVector location;
  PVector velocity;
  float driftSpeed;
  Vertex(int centerX, int centerY){
    centerLocation = new PVector(centerX, centerY);
    location = new PVector(centerX + random(-driftLength, driftLength), centerY + random(-driftLength, driftLength));
    velocity = new PVector(random(0.3, 1), random(0.3, 1));
    driftSpeed = random(0.1,0.8);
  }
  
  void display(){
    fill(255.0);
    ellipse(location.x, location.y, vertexSize, vertexSize);
  }
  
  void update(){
    //random fluctuations in direction:
    if(random(0,1)>0.98){
      if(random(0,1)>0.5){
        location.x += randomFluxAmount;
      }else{
        location.x += -randomFluxAmount;
      }
      if(random(0,1)>0.5){
        location.y += randomFluxAmount;
      }else{
        location.y += -randomFluxAmount;
      }
    }
    
    if(abs(centerLocation.x-location.x)>=driftLength){
      velocity.x *= -1;
    }
    if(abs(centerLocation.y-location.y)>=driftLength){
      velocity.y *= -1;
    }
    location.add(velocity);
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
  vertices = new Vertex[2];
  edges = new Edge[vertices.length - 1];
  vertices[0] = new Vertex(width/2, height/2);
  vertices[1] = new Vertex((width/2)+50, (height/2)+50);
  edges[0] = new Edge(vertices[0], vertices[1]);
  frameRate(10);
  smooth();
}

void draw(){
  background(40);
  for(Vertex vertex: vertices){
    vertex.update();
    vertex.display();
  }
  for(Edge edge: edges){
    edge.display();
  }
}
