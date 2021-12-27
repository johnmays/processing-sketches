let x1;
let y1;
let t = 0;

function setup() {
  createCanvas(600, 600);
  x1 = new x(1.0);  //something awry here
  y1 = new y(1.0);
  console.log(x1.getSpeed());
}


function draw() {
  fill(0, 14); noStroke();
  rect(0,0, width, height);
  stroke(255);
  translate(width/2, height/2);
  point(x1.output(t), y1.output(t));
  t++;
}

class x{
  x(speed){
    this.speed = speed;
    console.log("ran");
  }
  
  output(t){
    return 200*sin(t/10.0);
  }
  
  getSpeed(){
    return this.speed;
  }
}

class y{
  x(speed){
    this.speed = speed;
  }
  
  output(t){
    return 200*cos(t/10);
  }
}
