# OHDSI shinydb legendt2dm read-only credentials
appConnectionDetails <- DatabaseConnector::createConnectionDetails(
  dbms = "postgresql",
  server = paste(keyring::key_get("legendt2dmServer"),
                 keyring::key_get("legendt2dmDatabase"),
                 sep = "/"),
  user = keyring::key_get("legendt2dmUser"),
  password = keyring::key_get("legendt2dmPassword"))

# Run from db server
LegendT2dmCohortExplorer::launchCohortExplorer(cohort = "class", connectionDetails = appConnectionDetails)

LegendT2dmCohortExplorer::launchCohortExplorer(cohort = "outcome", connectionDetails = appConnectionDetails)
