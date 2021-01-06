
initiate_movie_database <- function() {
      # Create a database of movies stored locally
            
      # All movies are stored on a local server, using the format:
      # "/movieTitle (ReleaseYear)/movieTitle (ReleaseYear) [extra info].extension"
      movie_list <- list.dirs("//TOWER/Media/Movies",
                      full.names = FALSE,
                      recursive = FALSE)
      
      # Create the database.
      # Remove the release year from the title and put it into a separate column.
      # Add blank columns for the color data.
      # Metadata will be added elsewhere.
      database <- data.frame('title' = as.character(unlist(strsplit(movie_list," \\(....\\).*"))),
                       'release_year' = as.numeric(gsub('^.|.$', '',regmatches(movie_list,regexpr("\\(....\\)",movie_list)))),
                       'file_dir' = paste0("//TOWER/Media/Movies/",movie_list,"/"),
                       'HSV_raw' = I(vector(mode="list", length=length(movie_list))),
                       'mean_hue' = numeric(length(movie_list)),
                       'mean_saturation' = numeric(length(movie_list)),
                       'mean_value' = numeric(length(movie_list)),
                       stringsAsFactors = FALSE)
      
      return(database)
}


#df <- data.frame(i=1:5, m=I(vector(mode="list", length=5)))
#df[[2, "m"]] <- matrix(rnorm(9), 3, 3)