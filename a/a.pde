//State variable constants
int DIRT = 0;
int FIRE = 1;
int BURNT = 2;
int GRASS = 3;

//Helpful color values
color DIRT_COLOR = #81582F;
color FIRE_COLOR = #F20C0C;
color BURNT_COLOR = #810707;
color GRASS_COLOR = #49B90D;

//Driver variables
boolean burning = false;
int grassDensity = 75;
int numTracts = 10;
int tractLength = 20;
Land[][] grid;


void setup() {
  size(700, 350);
  frameRate(5);
  grid = new Land[numTracts][tractLength];
  for (int r=0; r < grid.length; r++) {
    for(int i=0; i<grid[r].length;i++) {
      setupLand(grid, numTracts, tractLength, grassDensity);
      showLand(grid);
    }
  }
}//setup

void draw() {
  for (int r=0; r < grid.length; r++) {
    for(int i=0; i<grid[r].length;i++) {
      showLand(grid);
    }
  }
  if (burning) {
    for (int r=0; r < grid.length; r++) {
      for(int i=0; i<grid[r].length;i++) {
        liveFire(grid);
      }
    }
  }//burning
}//draw


void setupLand(Land[][] field, int numRows, int numPlots, int density) {
  //figure out size of each plot of land
  int plotSize = width / numPlots;
  //instantiate each Land object
  for (int i=0; i<field.length; i++) {
    for (int j=0; j<field[i].length; j++) {
      int type = DIRT;
      
      if (i == 0) {
      type = FIRE;
      }
      else if (random(100) < density) {
        type = GRASS;
      }
      field[i][j] = new Land(plotSize*i, plotSize*j, plotSize, type);
    }
  }//setup loop
}//setupLand

void showLand(Land[][] field) {
  for (int r=0; r < field.length; r++) { 
    for(int i=0; i < field[r].length; i++) { 
      field[r][i].display();
    }
  }
}//showLand


void liveFire(Land[][] field) {
  //First, check Land objects to the left, apply state change rules.
  //Assume nothing useful to the left of row[0]
  for (int i=0; i<field.length; i++) {
   field[0][i].updateNextState(0); 
  }
  for (int i=0; i<field.length; i++) {
    for (int j=1; j<field[i].length;j++) {
      field[i][j].updateNextState(field[i][j-1].state);
    }
  }//set nextStates for all plots

  //Based on potential state changes from updateNextState
  for (int i=0; i<field.length; i++) {
    for (int j=0; j<field[i].length;j++) {
      field[i][j].changeState();
    }
  }//change states
}//liveFire





void keyPressed() {
  if (key == ' ') {
    burning = !burning;
  }//start burning
  else if (key == 'r') {
    burning = false;
    for (int r=0; r < grid.length; r++) {
      setupLand(grid, tractLength, grassDensity, r);
    }
  }
}
