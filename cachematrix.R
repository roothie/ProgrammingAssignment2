## Programming Assignment 2 for R Programming Coursera class
## Matrix inversion is usually a costly computation and there may be 
## some benefit to caching the inverse of a matrix rather than compute 
## it repeatedly.  
##
## Computing the inverse of a square matrix can be done with the solve 
## function in R. For example, if X is a square invertible matrix, then 
## solve(X) returns its inverse.
## 
## Your assignment is to write a pair of functions that cache the inverse of a matrix. 
## For this assignment, assume that the matrix supplied is always invertible.

## -------------------------------------------------------
## function makeCacheMatrix: 
## This function creates a special "matrix" object that can cache its inverse.
##
## Creates a list containing a function to:
## * set the value of the matrix
## * get the value of the matrix
## * set the value of the inverse of the matrix
## * get the value of the inverse of the matrix
## -------------------------------------------------------
makeCacheMatrix <- function(x = matrix()) {
  invM <- NULL
  
  ## set the value of the matrix
  set <- function (y) {
    x <<- y
    invM <<- NULL	
  }
  
  ## get the value of the matrix
  get <- function() x
  
  ## set the value of the inverse of the matrix
  setinverse <- function(inverse) invM <<- inverse
  
  ## get the value of the inverse of the matrix
  getinverse <- function() invM
  
  list(
    set = set, 
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}


## -------------------------------------------------------
## function cacheSolve:
## This function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above. If the inverse has already been calculated (and
## the matrix has not changed), then the cachesolve should retrieve the
## inverse from the cache.
## -------------------------------------------------------
cacheSolve <- function(x, ...) {
  invM <- x$getinverse()
  
  if(!is.null(invM)){
    message("getting cached data")
    return(invM)
  }
  
  data <- x$get()
  invM <- solve(data)
  
  ## Return a matrix that is the inverse of 'x'
  invM
  
}