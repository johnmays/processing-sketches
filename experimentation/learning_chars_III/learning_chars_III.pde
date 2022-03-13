char[] charArray = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y', 'Z', 'λ'}; //comment uhh
//char[] charArray = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'λ'}; //comment uhh
String message = "EL MATRIX DE LA SMOSH";
char[][] animatedMessage = new char[message.length()][];
int delay = 20; //ms
int loopIteration = 0;

void setup(){
  size(400, 400);
  pixelDensity(displayDensity());
  textFont(createFont("SourceCodePro-Regular.ttf", 24));
  //textFont(createFont("matrix.ttf", 24));
  background(0);
  noStroke();
  fill(255);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  //setting up lead up strings:
  for (int i = 0; i < message.length(); i++){
    animatedMessage[i] = leadUpString(message.charAt(i));
  }
}

void draw(){
  background(0);
  delay(delay);
  for (int i = 0; i < animatedMessage.length; i++){
    if(loopIteration < animatedMessage[i].length){
      //fill(255);
      fill(#008f11);
      text(animatedMessage[i][loopIteration], int(1.1*textWidth("T"))*(2.5+i), 200);
    }else{
      if(loopIteration == animatedMessage[i].length){
        delay += 4;
      }
      fill(#00ff41);
      text(animatedMessage[i][animatedMessage[i].length-1], int(1.1*textWidth("T"))*(2.5+i), 200);
    }
  }
  loopIteration++;
}

char[] leadUpString(char finalChar){
  int arrLength = int(random(65, 90));
  char[] arr = new char[arrLength];
  for (int i = 0; i < arrLength; i++){
    arr[i] = charArray[int(random(0, charArray.length))];
  }
  arr[arrLength-1] = finalChar;
  return arr;
}
