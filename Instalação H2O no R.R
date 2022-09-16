# Introductory H2O Machine Learning Tutorial
# Prepared for H2O Open Chicago 2016: http://open.h2o.ai/chicago.html


# First step is to download & install the h2o R library

# The following two commands remove any previously installed H2O packages for R.
if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }

# Next, we download packages that H2O depends on.
pkgs <- c("RCurl","jsonlite")
for (pkg in pkgs) {
  if (! (pkg %in% rownames(installed.packages()))) { install.packages(pkg) }
}

# Now we download, install and initialize the H2O package for R.
getOption("timeout")
options(timeout = 6000)
install.packages("h2o", type="source", repos="https://h2o-release.s3.amazonaws.com/h2o/rel-zumbo/4/R")

# Finally, let's load H2O and start up an H2O cluster
library(h2o)
h2o.init()
