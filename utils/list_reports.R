list_reports <- function(dir=here::here("reports"),
                         pattern = "EpiCompare.html$",
                         domain="https://neurogenomics.github.io/EpiArchives",
                         header="###"){
    # devoptera::args2vars(list_reports, reassign = TRUE)
    wd <- getwd()
    #### Find files ####    
    files <- list.files(path = dir, 
                        pattern = pattern,
                        full.names = TRUE,
                        recursive = TRUE)
    #### Construct links ####
    links <- stats::setNames(gsub(wd,domain,files),
                             basename(dirname(files)))
    #### Make markdown elements #### 
    md <- lapply(names(links), function(nm){
        paste(
            paste0(header," [",nm,"](",links[[nm]],")"),
            paste0("- ","[Code to reproduce.](",
                   gsub(".html$","_code.R",links[[nm]]),
                   ")")
        )
    })
    cat(paste(md,collapse = "\n"))
}