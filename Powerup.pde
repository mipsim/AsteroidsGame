//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class PowerUp extends Floater
{

	private boolean powerAvail;
	private int itemRotation;

  public PowerUp()
  {
    corners = 4;
    int[] xS = {(int)myCenterX-6, (int)myCenterX+12, (int)myCenterX+6, (int)myCenterX-12};
    int[] yS = {(int)myCenterY-6, (int)myCenterY-6, (int)myCenterY+6, (int)myCenterY+6}; 
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX = 0;
    myCenterY = 0;
    myPointDirection = 0;
    myDirectionX = 0;
    myDirectionY = 0;

    powerAvail = false;
    itemRotation = 0;
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return  (int)(myCenterX);}  
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)(myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
  public void setPowerAvail(boolean x) {powerAvail = x;}
  public boolean getPowerAvail() {return powerAvail;}

  public void setItemRotation(int x) {itemRotation = x;}

  public void show()
  {
    fill(254,226,62);
    noStroke();               
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
  }

  public void move()
  {
  	rotate(itemRotation);
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////