
initiate_movie_database <- function() {
      # Create a database of movies stored locally
            
      # All movies are stored on a local server, using the format:
      # "/movieTitle (ReleaseYear)/movieTitle (ReleaseYear) [extra info].extension"
      database <- list.dirs("//TOWER/Media/Movies",
                      full.names = FALSE,
                      recursive = FALSE)
      
      # Create the database.
      # Remove the release year from the title and put it into a separate column.
      # Add blank columns for the color data.
      # Metadata will be added elsewhere.
      database <- data.frame('title' = as.character(unlist(strsplit(database," \\(....\\).*"))),
                       'release_year' = as.numeric(gsub('^.|.$', '',regmatches(database,regexpr("\\(....\\)",database)))),
                       'file_dir' = paste0("//TOWER/Media/Movies/",database,"/"),
                       'HSV_raw' = data.frame(0),
                       'mean_hue' = numeric(length(database)),
                       'mean_daturation' = numeric(length(database)),
                       'mean_value' = numeric(length(database)),
                       stringsAsFactors = FALSE)
      
      return(database)
}