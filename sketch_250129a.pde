boolean wPressed = false;
boolean sPressed = false;
boolean aPressed = false;
boolean dPressed = false;
boolean spacePressed = false;
float speed = 5;
void settings() {
 size(1024,720,P3D);
}

void setup() {
    Camera main = new Camera(1,PVector(20,0,0),PVector(1,0,0);
  print(cameraPos);
}
class Camera {
    int id;
    PVector position;
    PVector lookAt;
    float yaw = 0;
    float pitch = 0;
    PVector yawDirection;
    yawDirection = new P3Vector(cos(radians(yaw)),sin(radians(yaw))); 

    Camera(int newId,PVector newPos, PVector newLookAt){
        id=newId;
        position=newPos;
        lookAt=newLookAt;
    }
    
    void update() {
        if(wPressed) {
            position = position + speed*yawDirection;
        }
        if(sPressed) {
            position = position - speed*yawDirection;
        }
        if(aPressed) {
            position = position + speed*yawDirection;
        }
        if(dPressed) {
            position = position - speed*yawDirection;
        }
    }
    //void yawVector() {
    //}
    
    void setOrientation(float yaw, float pitch) {
        cameraYaw = yaw;
        cameraPitch = pitch;
        yawDirection.x = cos(radians(yaw));
        yawDirection.y = sin(radians(yaw));
        
    }
    void setPosition(PVector newPos) {
        position = newPos;
    }
    void setPosition(float x,float y,float z){

        position.x =x;
        position.y =y;
        position.z =z;
    }
    

}

void draw() {
 box(20);
 camera(cameraPos.x,cameraPos.y,cameraPos.z,
         cameraLookAt.x,cameraLookAt.y,cameraLookAt.z,
         0,1,0);
 
}

void keyPressed() {

    if(key == 'w' || key == 'W") { wPressed == true; }    
    if(key == 's' || key == 'S") { sPressed == true; }    
    if(key == 'a' || key == 'A") { aPressed == true; }    
    if(key == 'd' || key == 'D") { dPressed == true; }    
}
void keyReleased() {

    if(key == 'w' || key == 'W") { wPressed == false; }    
    if(key == 's' || key == 'S") { sPressed == false; }    
    if(key == 'a' || key == 'A") { aPressed == false; }    
    if(key == 'd' || key == 'D") { dPressed == false; }  

}
