Planet[] moons;

class Planet{
  float v;
  float velocity;
  color c;
  float distance,distance2;
  float w;
  float reverse;
  float alpha;
  int moonNum;
  
  Planet(float velocity, color c, float distance, float w, int moonNum){
    v=0;
    this.velocity = velocity;
    this.c=c;
    this.distance = distance;
    this.w = w/4;
    reverse = random(-1,1);
    alpha = random(1,2);
    this.moonNum = moonNum;
    
    if(moonNum>0){
      moons = new Planet[moonNum];
      for(int i =0; i<moons.length; i++){
        float  ww =random(15,20);
        distance2 += ww;
        
        color cc = color(100,100,100);
        moons[i] = new Planet(random(0.005,0.01),cc,distance2,ww,0);
      }
    }
  }
  
  void update (){
    pushMatrix();
    rotateX(PI/2);
    stroke(c);
    strokeWeight(1);
    noFill();
    ellipse(0,0,2*distance,2*distance);
    popMatrix();
    
    noStroke();
    pushMatrix();
    rotateY(v*reverse);
    pushMatrix();
    translate(distance,0,0);
    fill(c);
    sphere(w*3/4.0);
    fill(c,50);
    
    if(moonNum>0){
      sphere(w+(2*sin(radians(v*1000))));
      for(int i = 0; i<moons.length;i++){
        moons[i].update();
      }
    }
    popMatrix();
   popMatrix();
   v+=velocity;
   
  }
}


    
        
    