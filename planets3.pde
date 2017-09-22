Planet[] planets = new Planet[9];
float distance = 0;
int mNum; 
float w;
float randMoon;
void setup() {
  size(800,600,P3D);
  
  for(int i=0; i<planets.length; i++){
    w = random(30,80);
    distance += w;
    
    randMoon = random(0,3);
    mNum = 0;
    if(randMoon>2){
      mNum = 2;
    }
    else if(randMoon>1){
      mNum = 1;
    }
    
    color c = color(random(0,255),random(0,255),random(0,255));
    planets[i] = new Planet(random(0.005,0.03),c,distance,w,mNum);
  }
}

void draw(){
  background(0);
  lights();
  
  pushMatrix();
  translate(width/2,height/2);
  translate(0,0,-mouseX+200);
  
  noStroke();
  fill(200,50,0);
  sphere(30);
  pushMatrix();
    translate(0,0,30);
    fill(0);
    sphere(3);
    popMatrix();
    
    rotateX(-mouseY*PI/(2*height));
    
    for(int i = 0; i<planets.length; i++){
      planets[i].update();
    }
    
   popMatrix();
}