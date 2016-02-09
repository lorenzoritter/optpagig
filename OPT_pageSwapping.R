pages <- c(6, 3, 2, 6, 2, 5, 3, 2, 3, 6, 7, 6, 6, 1, 5, 5, 4, 2, 6, 1, 3, 7, 2, 7, 4, 2, 2, 5, 5, 3, 5, 3, 2, 5, 5, 1, 3, 6, 5, 1, 2, 6, 5, 1, 3, 7, 2, 3, 1, 4, 7, 6, 1, 5, 7, 7, 3, 5, 2, 4, 1, 2, 3, 4, 2, 3, 3, 1, 2, 6, 4, 2, 2, 5, 3, 2, 6, 2, 4, 1, 3, 3, 7, 5, 5, 5, 3, 4, 7, 2, 2, 3, 4, 6, 1)

cache <- c(4,5,3,6,2)

# loop through all pages
for(page in pages){
  # if a page is not in the cache yet
  if(!(page %in% cache)){
    distances <- NULL
    # calculate the distance for all pages in the cache to be used next time
    for(j in cache){
      distances <- c(distances,min(match(j,pages)))
    }
    # if one page of the cache does not appear in the remaining pages any more, 
    # set its distance to maximum
    distances[is.na(distances)] <- length(pages)
    # replace the page in the cache with the highest distance with the new page
    print(paste("Replacing", cache[which.max(distances)], "with", page))
    cache[which.max(distances)] <- page
  }
  # pop the first element of the pages
  pages <- pages[-1]
}
