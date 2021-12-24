PImage img;

int index(int x, int y){
  return y * img.width + x;  //essentially # of passed rows + cur pixel in cur row
}

void setup(){
  size(800,400);
  img = loadImage("lil_john.JPG");
  img.loadPixels();
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
  
  image(img,0,0,400,400);
  
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int index = index(x, y);
      color currentPixel = img.pixels[index];
      float gray = red(currentPixel);
      float newGray = round(1*gray/255.0) * 255.0/1;
      
      img.pixels[index] = color(newGray, newGray, newGray);
      
      float error = gray - newGray;
      try{
        float newPixelValue = red(img.pixels[index(x+1,y)]) + (7/16)*error; //<>//
        img.pixels[index(x+1,y)] = color(newPixelValue, newPixelValue, newPixelValue);
      } catch (Exception e){
        ;
      }
      try{
        img.pixels[index(x-1,y+1)] += (3/16)*error;
      } catch (Exception e){
        ;
      }
      try{
        img.pixels[index(x,y+1)] += (5/16)*error;
      } catch (Exception e){
        ;
      }
      try{
        img.pixels[index(x+1,y+1)] += (1/16)*error;
      } catch (Exception e){
        ;
      }
    }   
  }
  img.updatePixels();
  image(img, 400, 0, 400, 400);
}

void draw(){
  
}
