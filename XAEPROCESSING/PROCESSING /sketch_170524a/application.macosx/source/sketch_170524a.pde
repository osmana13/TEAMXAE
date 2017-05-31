import codeanticode.syphon.SyphonServer;
PGraphics canvas ;
SyphonServer server;

void setup() {
  size(400,400, P3D);
  canvas = createGraphics(400,400, P3D);
  
server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
canvas.beginDraw();
canvas.background(mouseY);
canvas.line(50, 50, mouseX, mouseY);
canvas.endDraw();
image(canvas, 0, 0);

server.sendImage(canvas);
}