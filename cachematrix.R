## these 2 functions together will cache the inverse of a matrixdown

## this function exposes 4 member functions: set, get, setInverse, getInverse
## this stores the inverse of a matrix in cache
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL # assign inverse variable to null for later use
  
  set <- function(y){
    x <<- y 
    m <<- NULL 
  }
  get <- function() x
  
  setMatrix <- function(solve) m <<- solve
  getMatrix <- function() m
  
  list(set = set
       ,get = get
       ,setMatrix = setMatrix
       ,getMatrix = getMatrix)
}

## returns the inverse value from cache or adds the inverse to cache and displays results
## from forums steps to check
## a <- makeCacheMatrix(matrix(c(-1, -2, 1, 1), 2,2))
## cacheSolve(a) returns the inverse of the matrix first time throw
## cacheSolve(a) returns "getting cached data" and 
cacheSolve <- function(x, ...) {
  t <- x$getMatrix()
  if(!is.null(t)){
      message("Getting cached data")
      return(t)
  }
  data <- x$get()
  t <- solve(data, ...)
  x$setMatrix(t)
  t
}
