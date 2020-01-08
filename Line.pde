class Line{
    int sx,sy;
    int ex,ey;
    void draw(){
        strokeWeight(1);
        line(sx,sy,ex,ey);
    }
    Line(int sx,int sy,int ex,int ey){
        this.sx=sx;this.sy=sy;this.ex=ex;this.ey=ey;
    }
}