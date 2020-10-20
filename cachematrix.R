## makeCacheMatrix creates special "matrix" object that can cache it's inverse

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- fucntion() x
    setinv <- function(inv) inverse <<- inv
    getinv <- function() inverse
    list(set = set, get = get,
         setinv = setinv
         getinv = getinv)
}


## cacheSolve checks if the inverse matrix exists, if so it returns the cached  
## inverse matrix otherwise it calculates the inverse, sets that value to  
## inverse, and returns the calculated inverse matrix.

cacheSolve <- function(x, ...) {
    inverse <- x$getinv()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    matr <- x$get()
    inverse <- solve(matr)
    x$setinv(inverse)
    inverse
}
