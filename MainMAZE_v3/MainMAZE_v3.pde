/******************************** //<>//
* File: MainMAZE.java           *
*********************************
* Author : Tallulah GILLIARD    *
* M1 HCID / Programming Class   *
********************************/ 

// VARIABLES =================================================================
// Boolean for ending game (use to end one and launch new)
boolean ongoinggame = true;
// Boolean for starting game  
boolean startgame = false;
// text file analysis
String[] lines;

int size = 15; // size of a square (room size)
int widthh; // maze width (number of rooms)
int heightt; // maze height (number of rooms)
String filename;
MazeStruct maze;
Player player;


// SETUP =====================================================================
void setup() {
  size(615, 615);  // size(dimentions, dimentions);
  noStroke();
}

// Initialisation of the game
void HomePage() {
  background(0);
  textSize(30);
  text ("Select a level", 300, 250); //<>//
  textAlign(CENTER);
  textSize(20);
  text ("(press number between 0 and 9)", 300, 300);
  
  if (keyCode >= 96 && keyCode <= 105)
  {
    filename = "level" + (keyCode - 96) + ".txt"; 
    println(filename);
    lines = loadStrings(filename); // FILE NAME
    String s = lines[0]; // s = "39 39"
    String[] tab = split(s, " "); // split the line in two 'words'
    widthh = Integer.parseInt(tab[0]);
    heightt = Integer.parseInt(tab[1]);
    println("Grid dimensions : "+widthh+"x"+heightt);
    // window dimentions
    int dimentions = (widthh+2)*size;
    println(dimentions);
    startgame = true;
    ongoinggame = true;
    // create maze
    maze = new MazeStruct();
    // create player
    player = new Player();
    player.go(maze.entrance);
  }
}

// Initialisation of the game
void EndPage() {
  background(0);
  fill(255);
  textSize(40);
  text ("YOU WIN !!!", 300, 250);
  textAlign(CENTER);
  textSize(20);
  text ("(press n for new game)", 300, 300);
  if (key == 'n') 
  {
    ongoinggame = false;
    startgame = false;
    player.position = maze.entrance;
  }
}



// DRAW LOOP ==================================================================
void draw() 
{
  // If g key not pressed
  if (startgame == false) 
  {
    HomePage();
  }
  
  if ((ongoinggame == true)&&(startgame == true))
  {
    background(0); // black background
    // draw maze
    maze.drawallrooms(player.position);
    player.draw_player();
    // test exit
    if (player.position == maze.exit)
    {
      println("YOU WIN !!!"); // YOU WIN
      //exit();
      EndPage();
    }

  }
}


// LISTENERS FUNCTIONS =========================================================

void keyPressed() {
  //println("key : "+keyCode); 
  // move player depending of the key
  // algorithme : 
  // for all neighbour room of player position
  //   if the room match the pressed key
  //   move player in that room
  if(startgame == true) {
    for (Room s : maze.rooms) 
    {
      // for all rooms s of the maze
      if (s.isNeighbour(player.position)) 
      {
        // if s is neighbour of player position
        if (key == CODED) {
          if (keyCode == DOWN) 
          {
            if ((s.x==player.position.x)&&(s.y==player.position.y+1))
            {
              player.go(s); 
              return;
            }
          }
          
          if (keyCode == UP) 
          {
            if ((s.x==player.position.x)&&(s.y==player.position.y-1))
            {
              player.go(s); 
              return;
            }
          }
          
          if (keyCode == LEFT) 
          {
            if ((s.x==player.position.x-1)&&(s.y==player.position.y))
            {
              player.go(s); 
              return;
            }
          }
          
          if (keyCode == RIGHT) 
          {
            if ((s.x==player.position.x+1)&&(s.y==player.position.y))
            {
              player.go(s); 
              return;
            }
          }
        }
      }
    }
  }
}