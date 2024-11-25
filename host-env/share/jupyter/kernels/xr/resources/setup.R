local({

  message("Loading xr kernel resources")

  attach(new.env(), "tools:xeusr", pos = 2L)
  .xeus_env <- as.environment("tools:xeusr")
  assign(".xeus_env", .xeus_env, pos = .xeus_env)
  
  print("Loading xr kernel resources here")
  # here <- file.path(
  #   dirname(Sys.which("xr")),
  #   "..", "share", "jupyter", "kernels", "xr", "resources"
  # )

  here <- file.path(
    "host-env", "share", "jupyter", "kernels", "xr", "resources"
  )

  message("Loading xr kernel resources from ", here)

  files <- setdiff(list.files(here), "setup.R")

  message("Loading xr kernel resources files: ", files)

  for (f in files) {
    sys.source(file.path(here, f), envir = .xeus_env)
  }

})
