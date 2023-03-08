list_reports <- function(dir=here::here("reports"),
                         pattern = "EpiCompare.html$",
                         domain="https://neurogenomics.github.io/EpiArchives"){
    #### Find files ####    
    files <- list.files(path = dir, 
                        pattern = pattern, 
                        recursive = TRUE)
    #### Construct links ####
    links <- stats::setNames(paste0(domain,"/",files),
                             dirname(files))
    #### Make markdown elements #### 
    md <- lapply(names(links), function(nm){
        paste0("## [",nm,"](",links[[nm]],")") 
    })
    cat(paste(md,collapse = "\n"))
}