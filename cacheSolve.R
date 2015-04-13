################################################################################
# Name of the Function: cacheSolve
# Created By: Edilbert Premdass
# Created Date: 03/18/2015
# 
# Purpose: This function computes the inverse of the square matrix returned  
#          by above "makeCacheMatrix" function. If the inverse has already been 
#          calculated (and the matrix has not changed), then the cachesolve 
#          should retrieve the inverse from the cache. 
#          If its not already calculated, solve(data) is used to calculte 
#          the inverse of a matrix.
# 
# Assumtion: We will be using only invertible square matrix.
################################################################################

cacheSolve <- function(x, ...) 
{
      InvMat <- x$getinverse()
      if(!is.null(InvMat)) {
            print("getting cached data.")
            return(InvMat)
      }
      data <- x$get()
      InvMat <- solve(data)
      x$setinverse(InvMat)
      InvMat
}