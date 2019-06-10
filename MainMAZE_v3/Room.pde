class Room 
{
  // VARIABLES =================================================================
  int x; // x in the grid
  int y; // y in the grid
  int roomcolor; // color of the room

  // CONSTRUCTOR
  Room( int x, int y, int roomcolorr) 
  {
    this.x=x;
    this.y=y;
    this.roomcolor=roomcolorr;
  }
  
  
  // METHODS ===================================================================
  void draw_room() 
  {
    // drawing of a square with the color of the room
    fill(roomcolor); 
    rect(x*size,y*size,size,size);
  }
  
  void draw_room(Room tr)
  {
    // drawing of a square more or less transparent depending of the distance tr
    float d = distance(tr);
    float transparence = 255-30*d; // 255 = clear, 0 = dark / 0 = big circle, 150 = almost no light
    fill(roomcolor, transparence);
    rect(x*size,y*size,size,size);
  }
  
  // if a room is "neigbourg" of another room (is next to another room)
  boolean isNeighbour(Room other)
  {
    // 
    return (abs(x-other.x)+abs(y-other.y))==1;
  } 
  
  // distance with another t room
  float distance(Room t)
  {
    float res = 0;
    res = sqrt((this.x-t.x)*(this.x-t.x)+(this.y-t.y)*(this.y-t.y));
    return res;
  }
}