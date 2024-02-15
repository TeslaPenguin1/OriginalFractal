float i = 0;
float camX, camY, camZ;

void setup() {
  size(500,500,P3D);
  lights();
}

void draw() {
  background(0);
  //pointLight(255,255,255,0,0,0);
  
  camX = 500*sin(i);
  camY = 200*sin(i/2);
  camZ = 500*cos(i);
  
  camera(camX,camY,camZ,0,0,0,0,-1,0);
  i+=0.03;
  snowflake(0,0,0,300,0,0,0);
}

public void snowflake(float x, float y, float z, float siz, float col1, float col2, float col3) {
  //stroke(200);
  noStroke();
  
  
  float dlen = siz/3;
  float dpos = (siz - dlen)/2;
  
  if (siz >= 3) {
    //corners
    snowflake(x+dpos,y+dpos,z+dpos,dlen,col1+0.1,col2+0.1,col3+0.1);
    snowflake(x+dpos,y+dpos,z-dpos,dlen,col1+0.1,col2+0.1,col3-0.1);
    snowflake(x+dpos,y-dpos,z+dpos,dlen,col1+0.1,col2-0.1,col3+0.1);
    snowflake(x+dpos,y-dpos,z-dpos,dlen,col1+0.1,col2-0.1,col3-0.1);
    snowflake(x-dpos,y+dpos,z+dpos,dlen,col1-0.1,col2+0.1,col3+0.1);
    snowflake(x-dpos,y+dpos,z-dpos,dlen,col1-0.1,col2+0.1,col3-0.1);
    snowflake(x-dpos,y-dpos,z+dpos,dlen,col1-0.1,col2-0.1,col3+0.1);
    snowflake(x-dpos,y-dpos,z-dpos,dlen,col1-0.1,col2-0.1,col3-0.1);
    
    //center
    snowflake(x,y,z,dlen,col1,col2,col3);
  }
  else {
    fill(col1*512,col2*512,col3*512);
    translate(x,y,z);
    shininess(5);
    box(siz);
    translate(-x,-y,-z);
  }
}
