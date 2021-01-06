
movie_file_name <- function(movie_file_dir) {
      
      # There are different extensions in the movie database:
      # files <- list.files("//TOWER/Media/Movies", recursive = TRUE)
      # exts <- regmatches(files, regexpr("\\.(.{3}|(.{4}))$", files))
      # table(exts)
      # .bdjo .bdmv .clpi  .iso  .jar  .jpg .m2ts  .mkv  .mp4 .mpls  .png  .xml 
      #    14     4   172     1     4     2     8   426   809   166   310    10
      # This will only use .mkv and .mp4, which is the vast majority of files. Some
      # of those are not video files at all.
      
      list_of_files <- list.files(movie_file_dir)
      title <- substr(movie_file_dir,22,nchar(movie_file_dir)-1)
      if (length(list_of_files) == 0) { 
            return(0)
            # No files in the subdirectory
      }
      else if(paste0(title,".mp4") %in% list_of_files) {
            movie_file_name <- paste0(movie_file_dir, title,".mp4")
      }
      else if (paste0(title,".mkv") %in% list_of_files) {
            movie_file_name <- paste0(movie_file_dir, title,".mkv")
      }
      else {
            movie_file_name <- 0
            # File is not mp4/mkv, or may be split into multiple parts.
      }
      
      return(movie_file_name)
      
}