PImage img;
int xSpace = 8;
int ySpace = 12;
int pixelDensity = 2;

char[][] glyphs = {{' '}, {')', '(', '*', ';', ':', '/', '<', '~'}, {'{', '}', 'X', 'S'}, {'I', 'P', 'T'}, {'9', 'M', 'K', 'Q'}, {'8', '?', '@'}};
//char[] glyphs = {' ', '░', '▒', '▓'};
void setup(){
  size(400, 400);
  pixelDensity(pixelDensity);
  background(0);
  noStroke();
  fill(255);
  img = loadImage("lil_john_400.JPG");
  img.loadPixels();
  textFont(createFont("SourceCodePro-Regular.ttf", ySpace));
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
    //image(img,0,0);
  int minBrightness = 255;
  int maxBrightness = 0;
  //print(textWidth('T'));
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
      if (averageBrightness < minBrightness){
        minBrightness = averageBrightness;
      }
      if (averageBrightness > maxBrightness){
        maxBrightness = averageBrightness;
      }
      fill(averageBrightness);
      rect(i, j, xSpace, ySpace); 
    }
  }
  loadPixels();
  //println(maxBrightness);
  //println(minBrightness);
  for(int x = 0; x < width; x+= xSpace){
    for(int y = 0; y < height; y+= ySpace){
      //int index = index(x*pixelDensity, y*pixelDensity);
      int index = canvasIndex(x*pixelDensity, y*pixelDensity);
      color currentPixel = pixels[index];
      //color currentPixel = get(x, y);
      int gray = int(red(currentPixel));
      gray = int((gray - minBrightness)*(255 / (maxBrightness - minBrightness)));
      fill(gray);
      rect(x, y, xSpace, ySpace);
      //fill(255);
      //rect(x, y, 2, 2);
    }
  }
  //println(pixels.length);
  //println(img.pixels.length);
  loadPixels();
}

int index(int x, int y){
  return y * img.width + x;  //essentially # of passed rows + cur pixel in cur row
}

int canvasIndex(int x, int y){
  return y * img.width*pixelDensity + x;  //essentially # of passed rows + cur pixel in cur row
}
