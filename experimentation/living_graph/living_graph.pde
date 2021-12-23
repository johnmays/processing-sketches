int vertexSize = 4;
int driftLength = 50;
float randomFluxAmount = 1;

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
}

Vertex[] vertices;
Edge[] edges;

void setup(){
  size(600, 600);
  vertices = new Vertex[1];
  vertices[0] = new Vertex(width/2, height/2);
  frameRate(10);
}

void draw(){
  background(40);
  for(Vertex vertex: vertices){
    vertex.update();
    vertex.display();
  }
}
