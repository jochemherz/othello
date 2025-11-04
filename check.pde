boolean checkPossible(int slf, int dir, boolean fliptiles){
  int limit;
  boolean limitreached = false;
  if(dir == -1 || dir == -1-cellamt || dir == cellamt-1){
    limit = 0;
  } else if(dir == 1 || dir == 1-cellamt || dir == 1 + cellamt){ 
    limit = cellamt - 1;
  } else { limit = -1; }
  int count = 0;
  
  if((slf+(count*dir))%cellamt == limit){
    limitreached = true;
  }

    if(isOpposite(slf, dir) == true && limitreached == false){
      count += 1; 
      
        if((slf+(count*dir))%cellamt == limit){
          limitreached = true;
        }
      
      while(isSame(slf+count*dir, dir) == true && limitreached == false){
        count += 1;
        
         if((slf+(count*dir))%cellamt == limit){
           limitreached = true;
         }
      }
      
      if(isOpposite(slf+count*dir, dir) == true && limitreached == false){
        if(fliptiles == true){
          for(int i=0; i<count; i++){
          cells[slf+(i+1)*dir] = turn;
          }
        }
        return true;
      }  else { return false; }  
    } else { return false; }
  
}

boolean onGrid(int slf, int dir){
  if(slf+dir >= 0 && slf+dir < sq(cellamt)){
    return true;
  } else { return false; }
}

boolean isEmpty(int slf, int dir){
  if(onGrid(slf, dir) == true && newcells[slf+dir] == 2){
    return true;
  } else { return false; }
}

boolean isOpposite(int slf, int dir){

      if(onGrid(slf, dir) == true && isEmpty(slf, dir) == false){
        if(newcells[slf] != newcells[slf+dir]){
          return true;
        } else { return false; }
      } else { return false; }
}

boolean isSame(int slf, int dir){

      if(onGrid(slf, dir) == true && isEmpty(slf, dir) == false){
        if(newcells[slf] == newcells[slf+dir]){
          return true;
        } else { return false; }
      } else { return false; }
}

boolean sameRow(int slf, int dir){

  if(slf / cellamt == (slf+dir) / cellamt){
    return true;
  } else { return false; }
}

boolean sameColumn(int slf, int dir){

  if(slf%cellamt == (slf+dir)%cellamt){
   return true;
  } else { return false; }

}
