# OHDSI shinydb read-only credentials
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = "postgresql",
                                                                server = paste(Sys.getenv("shinydbServer"),
                                                                               Sys.getenv("shinydbDatabase"),
                                                                               sep = "/"),
                                                                port = Sys.getenv("shinydbPort"),
                                                                user = Sys.getenv("shinydbUser"),
                                                                password = Sys.getenv("shinydbPw"))

CohortDiagnostics::launchDiagnosticsExplorer(connectionDetails = connectionDetails,
                                             resultsDatabaseSchema = "legendt2dm_class_diagnostics")
