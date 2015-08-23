## This first function will be used to create a special matrix object, which can cache its inverse..
## The function will return a list that is going to be the input to the cacheSolve() function...
## 'x' is a square invertible matrix
## The use of '<<-' will assign specific values to 'x' and 'm' in this enviroment.

makeCacheMatrix <- function(x = matrix()) {   

 m <- NULL
 set <- function(y) {
   x <<- y
   m <<- NULL
 }

get <- function() x 
setmatrix <- function(solve) m <<- solve
getmatrix <- function() m

list(set=set, get=get,
     setmatrix=setmatrix,
     getmatrix=getmatrix)
}


## This second function will compute the inverse of the matrix returned by first function. 
## Its going to verify if the inverse of the matrix had already been calculated, and if its true,
## then the inverse is gonna be retrieved directly from the cache.. 

cacheSolve <- function(x, ...) {
  m <- x$getmatrix()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  matrix <- x$get()
  m <- solve(matrix,...)
  x$setmatrix(m)
  return(m)
}
