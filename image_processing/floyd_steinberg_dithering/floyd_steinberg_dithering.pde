
PImage img;

void setup(){
  size(800,400);
  img = loadImage("lil_john.JPG");
  image(img,0,0,400,400);
}

void draw(){
  img.loadPixels();
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int index = y * img.width + x;  //essentiall # of passed rows + cur pixel in cur row
      color currentPixel = pixels[index];
      float r = red(currentPixel);
      float g = green(currentPixel);
      float b = blue(currentPixel);
      
      float gray = (r+g+b)/3;
      float newGray = round(gray/255.0) * 255.0;
      
      img.pixels[index] = color(newGray, newGray, newGray);
    }
  }
  img.updatePixels();
  image(img, 400, 0);

}
