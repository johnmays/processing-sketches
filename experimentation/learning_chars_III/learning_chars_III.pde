char[] charArray = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y', 'Z', 'λ'}; //comment uhh
String message = "IT USED TO BE WARM HERE";
char[][] animatedMessage = new char[message.length()][];
int delay = 20; //ms
int loopIteration = 0;

void setup(){
  size(400, 400);
  pixelDensity(displayDensity());
  textFont(createFont("SourceCodePro-Regular.ttf", 24));
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
  delay(delay);
  for (int i = 0; i < animatedMessage.length; i++){
    if(loopIteration < animatedMessage[i].length){
      fill(0);
      rect(int(1.1*textWidth("P"))*(2.5+i), 200, 16, 36);
      fill(255);
      text(animatedMessage[i][loopIteration], int(1.1*textWidth("P"))*(2.5+i), 200);
    }else if(loopIteration == animatedMessage[i].length){
      delay += 4;
    }
  }
  loopIteration++;
}

char[] leadUpString(char finalChar){
  int arrLength = int(random(45, 75));
  char[] arr = new char[arrLength];
  for (int i = 0; i < arrLength; i++){
    arr[i] = charArray[int(random(0, charArray.length))];
  }
  arr[arrLength-1] = finalChar;
  return arr;
}
