import processing.serial.*;

// Serial communication object
Serial myPort;
String[] sensorData;

// Variables for storing roll, pitch, and yaw for different parts of the body
float waistRoll, waistPitch, waistYaw;
float upperLeg1Roll, upperLeg1Pitch, upperLeg1Yaw;
float lowerLeg1Roll, lowerLeg1Pitch, lowerLeg1Yaw;
float upperLeg2Roll, upperLeg2Pitch, upperLeg2Yaw;
float lowerLeg2Roll, lowerLeg2Pitch, lowerLeg2Yaw;

void setup() {
  size(800, 600, P3D);  // Set up the canvas size and the rendering mode
  myPort = new Serial(this, "COM6", 9600);  // Initialize serial communication with COM6 at a baud rate of 9600
  myPort.bufferUntil('\n');  // Set the buffer until a newline character is received
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    println("Received: " + inString);  // Print received data for debugging
    inString = trim(inString);  // Trim any leading/trailing whitespace
    sensorData = split(inString, ',');  // Split the data by commas

    if (sensorData.length == 15) {  // Ensure the received data has 15 elements (5 sensors, 3 values each)
      waistRoll = radians(float(sensorData[0]));
      waistPitch = radians(float(sensorData[1]));
      waistYaw = radians(float(sensorData[2]));
      upperLeg1Roll = radians(float(sensorData[3]));
      upperLeg1Pitch = radians(float(sensorData[4]));
      upperLeg1Yaw = radians(float(sensorData[5]));
      lowerLeg1Roll = radians(float(sensorData[6]));
      lowerLeg1Pitch = radians(float(sensorData[7]));
      lowerLeg1Yaw = radians(float(sensorData[8]));
      upperLeg2Roll = radians(float(sensorData[9]));
      upperLeg2Pitch = radians(float(sensorData[10]));
      upperLeg2Yaw = radians(float(sensorData[11]));
      lowerLeg2Roll = radians(float(sensorData[12]));
      lowerLeg2Pitch = radians(float(sensorData[13]));
      lowerLeg2Yaw = radians(float(sensorData[14]));
    }
  }
}

void draw() {
  background(200);  // Set the background color
  lights();  // Enable lighting

  translate(width / 2, height / 2 + 100, 0);  // Translate to the center of the canvas

  // Draw the upper body (static)
  pushMatrix();
  drawUpperBody();
  popMatrix();

  // Draw the waist and legs with appropriate rotations and translations
  pushMatrix();
  rotateZ(waistYaw);
  rotateX(waistPitch);
  rotateY(waistRoll);
  drawWaist();

  // Draw left leg
  drawLeg(-15, upperLeg1Roll, upperLeg1Pitch, upperLeg1Yaw, lowerLeg1Roll, lowerLeg1Pitch, lowerLeg1Yaw);

  // Draw right leg
  drawLeg(15, upperLeg2Roll, upperLeg2Pitch, upperLeg2Yaw, lowerLeg2Roll, lowerLeg2Pitch, lowerLeg2Yaw);

  popMatrix();
}

void drawUpperBody() {
  fill(255, 0, 0);
  box(30, 100, 20);  // Draw the upper body as a box
  pushMatrix();
  translate(0, -75, 0);
  drawHead();  // Draw the head on top of the upper body
  popMatrix();

  // Draw arms
  drawArm(-25);  // Left arm
  drawArm(25);   // Right arm
}

void drawHead() {
  fill(255, 224, 189);  // Skin color
  sphere(15);  // Draw the head as a sphere
}

void drawWaist() {
  fill(0, 255, 0);
  box(30, 20, 20);  // Draw the waist as a box
}

void drawLeg(float xOffset, float upperRoll, float upperPitch, float upperYaw, float lowerRoll, float lowerPitch, float lowerYaw) {
  pushMatrix();
  translate(xOffset, 30, 0);  // Translate to the upper leg position
  
  // Rotate and draw upper leg
  rotateZ(upperYaw);
  rotateX(upperPitch);
  rotateY(upperRoll);
  drawUpperLeg();

  // Translate to knee position
  translate(0, 50, 0);
  
  // Rotate and draw lower leg
  rotateZ(lowerYaw);
  rotateX(lowerPitch);
  rotateY(lowerRoll);
  drawLowerLeg();
  
  // Translate to foot position
  translate(0, 50, 0);
  
  // Draw foot
  drawFoot();
  
  popMatrix();
}

void drawUpperLeg() {
  fill(0, 0, 255);
  box(15, 50, 15);  // Draw the upper leg as a box
}

void drawLowerLeg() {
  fill(255, 255, 0);
  box(15, 50, 15);  // Draw the lower leg as a box
}

void drawFoot() {
  fill(139, 69, 19);  // Brown color for the foot
  box(15, 10, 25);  // Draw the foot as a box
}

void drawArm(float xOffset) {
  pushMatrix();
  translate(xOffset, -40, 0);  // Translate to the shoulder position
  
  // Draw upper arm
  drawUpperArm();

  // Translate to elbow position
  translate(0, 50, 0);
  
  // Draw lower arm
  drawLowerArm();
  
  // Translate to hand position
  translate(0, 50, 0);
  
  // Draw hand
  drawHand();
  
  popMatrix();
}

void drawUpperArm() {
  fill(0, 255, 255);
  box(10, 50, 10);  // Draw the upper arm as a box
}

void drawLowerArm() {
  fill(255, 165, 0);
  box(10, 50, 10);  // Draw the lower arm as a box
}

void drawHand() {
  fill(255, 224, 189);  // Skin color
  box(10, 10, 10);  // Draw the hand as a box
}
