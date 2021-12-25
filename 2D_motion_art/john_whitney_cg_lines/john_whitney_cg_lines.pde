float t;
int trailLength = 50;

void setup(){
  size(600, 600);
  t = 0;
  background(62);
  stroke(255);
  strokeWeight(3);
  frameRate(24);
}

void draw(){
  background(62);
  translate(width/2, height/2);
  int alpha = 255;
  for(int i = 0; i < trailLength; i++){
    stroke(255,255,255,alpha);
    line(x1(t-i), y1(t-i), x2(t-i), y2(t-i));
    //point(x1(t-i), y1(t-i));
    //point(x2(t-i), y2(t-i));
    stroke(50,100,190,alpha);
    line(y1(t-i), x1(t-i), x2(t-i), y2(t-i));
    alpha -= 255/trailLength;
  }
  fill(0,27,190,80);
  //ellipse(-(y2(t)+y1(t))/2.0, -(x2(t)+x1(t))/2.0, 50, 50);
  t++;
  saveFrame("output/jwcgl_####.png");
}

float x1(float t){
  return 200*sin(t/10);
}

float y1(float t){
  return 300*sin(t/20);
}

float x2(float t){
  return 200*sin(t/10)+100*cos(t/10);
}

float y2(float t){
  return 300*cos(t/15);
}
