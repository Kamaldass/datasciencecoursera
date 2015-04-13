################################################################################
# Name of the Function: makeCacheMatrix
# Created By: Edilbert Premdass
# Created Date: 03/18/2015
# 
# Purpose: This function computes the inverse of the square matrix returned  
#          This function "makeCacheMatrix" creates a cache of the inverse a given matrix 
#          set the value of the Vector
#          get the value of the vector
#          set the value of the Inverse Matrix
#          get the value of the Inverse Matrix
# 
# Assumtion: We will be using only invertible square matrix.
################################################################################

makeCacheMatrix <- function(x = matrix()) 
{
      InvMat <- NULL
      set <- function(y) {
            x <<- y
            InvMat <<- NULL
      }
      get <- function() x
      setInvMat <- function(inverse) InvMat <<- inverse
      getInvMat <- function() InvMat
      list(set=set, get=get, setinverse=setInvMat, getinverse=getInvMat)
}