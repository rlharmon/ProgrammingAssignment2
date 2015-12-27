## these 2 functions together will cache the inverse of a matrix

## this function exposes 4 member functions: set, get, setInverse, getInverse
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

## this function determines caches or returns from cache the inverse of the matrix 
## based on the value already being cached
## we are only storing the cached values so, not checking if matrix has changed
cacheSolve <- function(x, ...) {
  t <- x$getMatrix()
  if(!is.null(t)){
      message("Getting cached data")
      #print(t)
      #print("test_pre")
      return(t)
      #print("test_post")
  }
  data <- x$get()
  t <- solve(data, ...)
  x$setMatrix(t)
  t
  #print(t)
}
