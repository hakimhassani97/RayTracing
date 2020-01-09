ArrayList<Line> lines = new ArrayList<Line>();
int sx=0,sy=0;
int firstX=0,firstY=0;
int nbWalls=4;
void setup() {
    size(1300,900);
    background(0);
}

void draw() {
    background(0);
    drawLines();
    checkIntersection();
}

//handle lines
void checkIntersection(){
    for(Line l:lines){
        for(Line m:lines){
            if(m.sx!=l.sx && m.sy!=l.sy && m.ex!=l.ex && m.ey!=l.ey){
                intersect(m,new Line(l.sx,l.sy,mouseX,mouseY));
            }
        }
        for(Line m:lines){
            if(m.sx!=l.sx && m.sy!=l.sy && m.ex!=l.ex && m.ey!=l.ey){
                intersect(m,new Line(l.ex,l.ey,mouseX,mouseY));
            }
        }
    }
}
PVector intersect(Line l1, Line l2){
    float x1=l1.sx,y1=l1.sy,x2=l1.ex,y2=l1.ey;
    float x3=l2.sx,y3=l2.sy,x4=l2.ex,y4=l2.ey;
    // calculate the distance to intersection point
    float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    // if uA and uB are between 0-1, lines are colliding
    if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
        // optionally, draw a circle where the lines meet
        float intersectionX = x1 + (uA * (x2-x1));
        float intersectionY = y1 + (uA * (y2-y1));
        fill(255,0,0);
        noStroke();
        ellipse(intersectionX,intersectionY, 20,20);
        return new PVector(intersectionX,intersectionY);
    }
    return null;
}
void mouseClicked() {
    if(sx==0 && sy==0){
        sx=mouseX;sy=mouseY;
        firstX=mouseX;firstY=mouseY;
    }else{
        lines.add(new Line(sx,sy,mouseX,mouseY));
        sx=mouseX;sy=mouseY;
        if(lines.size()%nbWalls==0){
            lines.add(new Line(mouseX,mouseY,firstX,firstY));
            sx=0;sy=0;
        }
    }
}
void drawLines(){
    stroke(255);
    for(Line l:lines){
        l.draw();
    }
}
// void settings() {
//     fullScreen();
// }
