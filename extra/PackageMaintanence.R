 #


# Install shinyApp into `ShinyDeploy`

deploy <- function(sourcePath,
                   destinationPath,
                   directoryName,
                   schemaName,
                   overwrite = FALSE) {

  destination <- file.path(destinationPath, directoryName)

  if (dir.exists(destination) && !overwrite) {
    stop("Directory ", destination, " already exists")
  }
  dir.create(destination)

  file.copy(from = file.path(sourcePath, "."), to = destination,
            recursive = TRUE,
            overwrite = overwrite)

  fileName <- file.path(sourcePath, "config.json")
  if (file.exists(fileName)) {
    unlink(fileName)
  }
  fileConn <- file(fileName)
  writeLines(text =  RJSONIO::toJSON(
    list(resultsSchema = schemaName,
         headerText = "LEGEND-T2DM Class Cohorts")),
             fileConn)
  close(fileConn)

}

deploy(system.file("shiny", package = "LegendT2dmCohortExplorer"),
       "~/Dropbox/Projects/ShinyDeploy",
       "LegendT2dmClassCohortExplorer",
       "legendt2dm_class_diagnostics",
       overwrite = TRUE)
