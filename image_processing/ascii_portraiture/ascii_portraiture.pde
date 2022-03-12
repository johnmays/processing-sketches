PImage img;
int xSpace = 5;
int ySpace = 30;

void setup(){
  size(400, 400);
  pixelDensity(displayDensity());
  background(0);
  noStroke();
  fill(255);
  img = loadImage("lil_john_400.JPG");
  img.loadPixels();
  textFont(createFont("SourceCodePro-Regular.ttf", 10));
  textAlign(LEFT, TOP);
  rectMode(CORNER);
  // Turning input image grayscale:
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      int index = index(x, y);
      color currentPixel = img.pixels[index];
      float r = red(currentPixel);
      float g = green(currentPixel);
      float b = blue(currentPixel);
      
      float gray = (r+g+b)/3;
      img.pixels[index] = color(gray, gray, gray);
    }
  }
  // Display Image 
  image(img,0,0);
  for(int i = 0; i < width; i+= xSpace){
    for(int j = 0; j < height; j+= ySpace){
      int cumulativeBrightness = 0;
      int numPixels = 0;
      for(int x = i; x < i + xSpace && x < width; x++){
        for(int y = j; y < j + ySpace && y < height; y++){
          int index = index(x, y);
          color currentPixel = img.pixels[index];
          cumulativeBrightness += red(currentPixel);
          numPixels++;
        }
      }
      int averageBrightness = int(cumulativeBrightness/numPixels);
      fill(averageBrightness);
      rect(i, j, xSpace, ySpace); 
    }
  }
  // Display Image 
  // image(img,0,0);
}

int index(int x, int y){
  return y * img.width + x;  //essentially # of passed rows + cur pixel in cur row
}
