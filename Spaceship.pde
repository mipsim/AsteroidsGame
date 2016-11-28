//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class SpaceShip extends Floater  
{ 
  private boolean inHyperSpace;

  public SpaceShip()
  {
    corners = 4;
    int[] xS = {(int)myCenterX-8, (int)myCenterX+18, (int)myCenterX-8, (int)myCenterX-5};
    int[] yS = {(int)myCenterY-8, (int)myCenterY, (int)myCenterY+8, (int)myCenterY}; 
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX = 0;
    myCenterY = 0;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;

    inHyperSpace = false;
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
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////