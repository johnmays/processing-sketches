PImage img;

//String[] charArray = {"λ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O"};
String[] charArray = {"T", "A", "S", "S", "O"};
int margin = 36;
int space = 36;
color[] blues = {#00ffdf, #7dfffc, #009fff};

void setup(){
  size(400, 400);
  pixelDensity(displayDensity());
  textFont(createFont("SourceCodePro-Regular.ttf", 36));
  background(0);
  noStroke();
  fill(255);
  text("P", 0, 28);
  textAlign(CENTER, CENTER);
}

void draw(){
  delay(100);
  background(0);
  for (int i = margin; i <= width - margin; i+= space){
    for (int j = margin; j <= height - margin; j+= space){
      if (random(1) < 0.5){
        if (random(1) < 0.05){
          fill(blues[int(random(0, blues.length))]);
        }else{
          fill(255);
        }
        text(charArray[int(random(0, charArray.length))], i, j);
      }
    }
  }
}
