int dieSize = 50;
int gapSize = 30;

/* Array size two greater than needed means that the indexes of my
tally values will match.
*/


public int[] makeTally(){
  int[] tally = new int [13];
  for(int i = 0; i < tally.length; i++)
  {
    tally[i] = 0;
  }
  return tally;
}

int[] tallies = makeTally();


public float countTally()
{
  float sum = 0;
  for(int i = 0; i < tallies.length; i++)
    {
      sum += tallies[i];
    }
  return sum;
}



void setup()
{
  noLoop();
  size(700, 700);
  background(200);
 
}
// new Die(50, 50).show(); //this makes everything so much easier

int totalCur = 0;
void draw()
{
  totalCur = 0;
  background(200);
  for( int i = gapSize; i < 0.8 *height - 1*gapSize - 2*dieSize; i += 2.5*gapSize + 2*dieSize) // controls rows
    {
      for(int j = gapSize; j < width - 1*gapSize - 1*dieSize; j += 1.5*gapSize + dieSize) //
      {  
        Die a = new Die(j, i);
        a.roll();
        a.show();
        Die b = new Die(j, i + gapSize/2 + dieSize);
        b.roll();
        b.show();
        tallies[a.myFace + b.myFace] += 1;
        totalCur += a.myFace + b.myFace;
      }
    }
   
  int phase = 0;
  for(int z = 2; z < tallies.length; z ++)
  {
    if(phase == 5)
    {
    0;
    }
    phase += 1;
    textSize(11);
    text((  z + ": " +(int)(tallies[z]/countTally()*10000)/100.0 + "% " ), width * ( (z - 1.5) /12.0), height - 100);
    
      
}
  textSize(20);
  text("Total: " + totalCur, width/2 - 22, height  - 50);
}
void mousePressed()
{
  redraw();
}
class Die //models one single dice cube
{
  int myX, myY, myFace;
 
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }
  void roll()
  {
    myFace = (int)(Math.random() * 6 + 1);
  }
  void show()
  {
    fill(255);
    strokeWeight(1.8);
    rect(myX, myY, dieSize, dieSize);
    fill(0);
    strokeWeight(0);
    if(myFace == 1 || myFace == 3 || myFace == 5)
      ellipse(myX + dieSize/2, myY + dieSize/2, dieSize/5.0, dieSize/5.0);
    if(myFace == 2)
    {
      ellipse(myX + dieSize * 1/3, myY + dieSize * 2/3, dieSize/5.0, dieSize/5.0);
      ellipse(myX + dieSize * 2/3, myY + dieSize * 1/3, dieSize/5.0, dieSize/5.0);
    }
    if(myFace == 3){
      ellipse(myX + dieSize * 1/4, myY + dieSize * 3/4, dieSize/5.0, dieSize/5.0);
      ellipse(myX + dieSize * 3/4, myY + dieSize * 1/4, dieSize/5.0, dieSize/5.0);
    }
    if(myFace == 5 || myFace == 6 || myFace == 4)
    {
      ellipse(myX + dieSize * 1/5, myY + dieSize * 4/5, dieSize/5.0, dieSize/5.0);
      ellipse(myX + dieSize * 1/5, myY + dieSize * 1/5, dieSize/5.0, dieSize/5.0);
      ellipse(myX + dieSize * 4/5, myY + dieSize * 4/5, dieSize/5.0, dieSize/5.0);
      ellipse(myX + dieSize * 4/5, myY + dieSize * 1/5, dieSize/5.0, dieSize/5.0);
    }
    if(myFace == 6)
    {
       ellipse(myX + dieSize * 1/5, myY + dieSize * 1/2, dieSize/5.0, dieSize/5.0);
       ellipse(myX + dieSize * 4/5, myY + dieSize * 1/2, dieSize/5.0, dieSize/5.0); 
    }
    
    
    
  }
}
