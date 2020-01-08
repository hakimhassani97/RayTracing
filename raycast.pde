ArrayList<Line> lines = new ArrayList<Line>();
int sx=0,sy=0;
void setup() {
    size(900,900);
    background(0);
}
void mouseClicked() {
    if(sx==0 && sy==0){
        sx=mouseX;sy=mouseY;
    }else{
        lines.add(new Line(sx,sy,mouseX,mouseY));
        sx=0;sy=0;
    }
}
void draw() {
    background(0);
    drawLines();
}

void drawLines(){
    for(Line l:lines){
        fill(255);
        l.draw();
    }
}
// void settings() {
//     fullScreen();
// }
