class Player
{
  Room position;
 
  void draw_player()
  {
    // blue square
    fill(0,0,255);
    rect((position.x)*size, (position.y)*size, size, size);
  }
 
  void go(Room destination)
  {
    position = destination;
  }

}