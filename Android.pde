int arms;
void setup() {
    // Aspect Ratio 16x9
    //size(360, 180, OPENGL);
    size(270, 480, OPENGL);
    arms = 1;
}

void draw() {

    background(255, 255, 255);
    lights();

    noStroke();

    //body
    pushMatrix();
    fill(0, 255, 0);
    translate( 135, 240, 0 );
    rotateX( PI/2 );
    rotateZ( PI/2 );
    //rotateZ( PI );
    //rotateZ( 3*PI/2 );
    //rotateZ( 2*PI );
    //rotateZ( PI );
    //rotateX( radians( frameCount ) );
    rotateZ( radians( frameCount ) );
    drawCylinder(30,  55, 95 );
    delay(350);
    
    //head
    pushMatrix();
    fill(0, 255, 0);
    translate( 0, 0, 43 );
    //rotateZ( arms*PI/5 );
    //rotateZ( arms*PI/6 );
    rotateZ( arms*PI/7 );
    //rotateZ( radians( frameCount ) );
    //stroke(0);
    sphere(55);
    
        //left antenna
        pushMatrix();
        fill(0, 255, 0);
        translate( 0, 20, 60 );
        rotateX(-0.3);
        //rotateX( radians( frameCount ) );
        drawCylinder( 15,  5, 30 );
        popMatrix();

        //right antenna
        pushMatrix();
        fill(0, 255, 0);
        translate( 0, -20, 60 ); 
        rotateX(0.3);
        drawCylinder( 15,  5, 30 );
        popMatrix();

        //left eye
        pushMatrix();
        fill(0, 0, 0);
        translate( 50, 20, 13 );
        sphere(4);
        popMatrix();

        //right eye
        pushMatrix();
        fill(0, 0, 0);
        translate( 50, -20, 13 );
        sphere(4);
        popMatrix();
    
    popMatrix();
    
        
    //left shoulder
    pushMatrix();
    fill(0, 255, 0);
    translate( 0, 70, 34 );
    rotateY( arms*PI/6 );
    sphere(15);

        //left arm
        pushMatrix();
        fill(0, 255, 0);
        translate( 0, 0, -30 ); 
        drawCylinder( 20,  15, 70 );
        popMatrix();
        
        //left hand
        pushMatrix();
        fill(0, 255, 0);
        translate( 0, 0, -60 );
        sphere(15);
        popMatrix();
        
        arms *= -1;

    
    popMatrix();
        
     //right shoulder
     pushMatrix();
     fill(0, 255, 0); 
     translate( 0, -70, 34 );
     rotateY( arms*PI/6 );
     sphere(15);
     
        //right arm
        pushMatrix();
        fill(0, 255, 0); 
        translate(0, 0, -30 );
        drawCylinder( 20, 15, 70 );  
        popMatrix();

         //right hand
         pushMatrix();
         fill(0, 255, 0);
         translate( 0, 0, -60 ); 
         sphere(15);
         popMatrix();

     popMatrix();

     //left hip
     pushMatrix();
     fill(0, 255, 0);
     translate( 0, -20, -50 );
     rotateY( -arms*PI/6 );
     sphere(15);
     
         //left leg
         pushMatrix();
         fill(0, 255, 0); 
         translate( 0, 0, -15 );
         //rotateY( PI/6 );
         drawCylinder( 15, 15, 30 );
         
             //left foot
             pushMatrix();
             //fill(0, 255, 0); 
             fill(0, 255, 0);
             translate( 0, 0, -15 );
             sphere(15);
             popMatrix();
         
         popMatrix();
     
     popMatrix();


     //Right hip
     pushMatrix();
     fill(0, 255, 0);
     translate( 0, 20, -50 );
     rotateY( arms*PI/6 );
     sphere(15);

         //Right leg
         pushMatrix();
         fill(0, 255, 0);
         translate( 0, 0, -15 );
         //rotateY( -PI/6 );
         drawCylinder( 15, 15, 30 );
         
             //Right foot
             pushMatrix();
             fill(0, 255, 0);
             translate( 0, 0, -15 );
             sphere(15);
             popMatrix();
         
         popMatrix();
    
     popMatrix();

         
     
     
     popMatrix();
     
      saveFrame("Android-####.png");
      if (frameCount == 334) { exit(); }

}

void drawCylinder( int sides, float r, float h)
{
    float angle = 360 / sides;
    float halfHeight = h / 2;

    // draw top of the tube
    beginShape();
    
    for (int i = 0; i < sides; i++) 
    {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x, y, -halfHeight);
    }
    
    endShape(CLOSE);

    // draw bottom of the tube
    beginShape();
    
    for (int i = 0; i < sides; i++) 
    {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x, y, halfHeight);
    }
    
    endShape(CLOSE);
    
    // draw sides
    beginShape(TRIANGLE_STRIP);
    
    for (int i = 0; i < sides + 1; i++) 
    {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x, y, halfHeight);
        vertex( x, y, -halfHeight);    
    }
    
    endShape(CLOSE);

}
