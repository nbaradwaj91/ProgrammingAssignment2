## Put comments here that give an overall description of what your
## functions do

## These functions exploit the scoping rules of R and save time in long calculations 
## especially if carried out in a loop. First function creates a matrix and the 
## second one caches its inverse

## Write a short comment describing this function
## This function creates a special matrix with functions to set and get
## both the values and inverse values of the object and returns a list.
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y){
    x <<- y
    i <- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse 
    getinverse <- function() i
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function
## This function calculates the inverse of the matrix if not already calculated or reads
## inverse from cache if already calculated

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data)
    x$setinverse(i)
    i    
    ## Return a matrix that is the inverse of 'x'
}
