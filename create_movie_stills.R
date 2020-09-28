
create_movie_stills <- function(file_dir, directory, fps) {
      # create a directory of still images/frames from a movie.
      suppressMessages(require(av))
      
      # There are different extensions in the movie database:
      # files <- list.files("//TOWER/Media/Movies", recursive = TRUE)
      # exts <- regmatches(files, regexpr("\\.(.{3}|(.{4}))$", files))
      # table(exts)
      # .bdjo .bdmv .clpi  .iso  .jar  .jpg .m2ts  .mkv  .mp4 .mpls  .png  .xml 
      #    14     4   172     1     4     2     8   426   809   166   310    10
      # This will only use .mkv and .mp4, which is the vast majority of files. Some
      # of those are not video files at all.
   
   
      list_of_files <- list.files(file_dir)
      title <- substr(file_dir,22,nchar(file_dir)-1)
      if (length(list_of_files) == 0) { 
         return(0)
         # No files in the subdirectory
      }
      else if(paste0(title,".mp4") %in% list_of_files) {
            file <- paste0(file_dir, title,".mp4")
      }
      else if (paste0(title,".mkv") %in% list_of_files) {
            file <- paste0(file_dir, title,".mkv")
      }
      else {
         return(0)
         # File is not mp4/mkv, or may be split into multiple parts.
      }
      
      av_video_images(file, destdir = directory, format = "png", fps = fps)
         # from av package. Will save every frame into the temp directory.
         # format is .png for lossless quality. fps = NULL will get every
         # frame of the movie. (fps can be a fraction, i.e. 0.1 would give
         # 1 frame every 10 seconds, which can reduce the load)
      
      return(1)
}