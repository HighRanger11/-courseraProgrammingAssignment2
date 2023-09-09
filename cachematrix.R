## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


   

makeCacheMatrix <- function(x = matrix()) { ## define the argument with default mode of "matrix"
## This function creates a special "matrix" object that can cache its inverse
    inv <- NULL                             ## initialize inv as NULL; will hold value of matrix inverse 
    set <- function(y) {                    ## define the set function to assign new 
        x <<- y                             ## value of matrix in parent environment
        inv <<- NULL                        ## if there is a new matrix, reset inv to NULL
    }
    get <- function() x                     ## define the get fucntion - returns value of the matrix argument

    setinverse <- function(inverse) inv <<- inverse  ## assigns value of inv in parent environment
    getinverse <- function() inv                     ## gets the value of inv where called
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## you need this in order to refer 
                                                                                  ## to the functions with the $ operator
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
           inv = x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data = x$get()  # Retrieve matrix to invert
  inv = solve(data, ...)  # Calculate inverse
  x$setinverse(inv)  # Cache the calculated inverse
  inv  # Return the calculated inverse
}

my_Matrix = makeCacheMatrix(matrix(1:4, 2, 2))
my_Matrix$get()
my_Matrix$getinverse()
cacheSolve(my_Matrix)
my_Matrix$getinverse()

