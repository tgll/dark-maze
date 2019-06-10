class MazeStruct 
{
  // all the rooms are empty before the creation of the maze 
  ArrayList<Room> rooms = new ArrayList<Room>(); 
  Room entrance;
  Room exit;

  // CONSTRUCTOR
  MazeStruct() 
  {
    // create rooms from laby.txt
    // entrance room
    entrance = createRoom(1,color(0,255,0));
    rooms.add(entrance);
    // exit room
    exit = createRoom(2,color(255,0,0));
    rooms.add(exit);
    // others rooms
    String[] lines = loadStrings(filename);
    int n = lines.length;
    for (int i = 3; i<n; i++) 
    {
      Room roo = createRoom(i,255);
      rooms.add( roo );
    }
  }

  // METHODS ===================================================================
  void drawallrooms(Room position) 
  {
    // draw of the maze = draw of all the maze rooms
    for (Room s : rooms)
      s.draw_room(position);
  }

  // create a room for coordonates from the lines[i]
  Room createRoom(int i, int colo) 
  {
    String[] lines = loadStrings(filename);
    String s = lines[i]; // s = "x y"
    String[] tab = split(s, " "); // split s in two words
    int x = Integer.parseInt(tab[0]);
    int y = Integer.parseInt(tab[1]);
    return new Room(x, y, colo);
  }
}