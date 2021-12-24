PImage img;

int index(int x, int y){
  return y * img.width + x;  //essentially # of passed rows + cur pixel in cur row
}

void setup(){
  size(800,400);
  img = loadImage("lil_john_400.JPG");
  img.loadPixels();
  // Turning input image grayscale:
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int index = index(x, y);
      color currentPixel = img.pixels[index];
      float r = red(currentPixel);
      float g = green(currentPixel);
      float b = blue(currentPixel);
      
      float gray = (r+g+b)/3;
      img.pixels[index] = color(gray, gray, gray);
    }
  }
  image(img,0,0);
  
  // Dithering:
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int currentIndex = index(x, y);
      color currentPixel = img.pixels[currentIndex];
      float gray = red(currentPixel);
      float ditheredGray = round(gray/255.0) * 255.0/1;
      img.pixels[currentIndex] = color(ditheredGray, ditheredGray, ditheredGray);
      float error = gray - ditheredGray;
      
      try{
        float newPixelValue = red(img.pixels[index(x+1,y)]) + (7.0/16.0)*error; //<>//
        img.pixels[index(x+1,y)] = color(newPixelValue, newPixelValue, newPixelValue);
      } catch (Exception e){
        ;
      }
      try{
        float newPixelValue = red(img.pixels[index(x-1,y+1)]) + (3.0/16.0)*error;
        img.pixels[index(x-1,y+1)] = color(newPixelValue, newPixelValue, newPixelValue);
      } catch (Exception e){
        ;
      }
      try{
        float newPixelValue = red(img.pixels[index(x,y+1)]) + (5.0/16.0)*error;
        img.pixels[index(x,y+1)] = color(newPixelValue, newPixelValue, newPixelValue);
      } catch (Exception e){
        ;
      }
      try{
        float newPixelValue = red(img.pixels[index(x+1,y+1)]) + (1.0/16.0)*error;
        img.pixels[index(x+1,y+1)] = color(newPixelValue, newPixelValue, newPixelValue);
      } catch (Exception e){
        ;
      }
    }   
  }
  img.updatePixels();
  image(img, 400, 0);
  // save("lil_john_dithered.jpg");
}
