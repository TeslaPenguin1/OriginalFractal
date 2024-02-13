float i = 0;
float camX, camY, camZ;

void setup() {
  size(500,500,P3D);
  lights();
}

void draw() {
  background(0);
  
  camX = 500*sin(i);
  camY = 200*sin(i/2);
  camZ = 500*cos(i);
  
  camera(camX,camY,camZ,0,0,0,0,-1,0);
  
  i+=0.03;
  myFractal(0,0,0,100);
}

public void myFractal(float x, float y, float z, float siz) {
  stroke(200);
  fill(255);
  
  translate(x,y,z);
  
  sphereDetail(3,40);
  sphere(siz);
  translate(-x,-y,-z);
  
  if (siz > 10) {
    myFractal(x,y+siz*3/2,z,siz/2);
    myFractal(x,y-siz*3/2,z,siz/2);
    
    myFractal(x-siz,y,z,siz/2);
    rotateY(2*PI/3.0);
    myFractal(x-siz,y,z,siz/2);
    rotateY(2*PI/3.0);
    myFractal(x-siz,y,z,siz/2);
    rotateY(-4*PI/3.0);
  }
}
