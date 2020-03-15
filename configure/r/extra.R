# plyr: split and combine
# googleVis: viz output on web
# ElemStatLearn: the element of statistical learning
#   http://www-stat.stanford.edu/~tibs/ElemStatLearn/
# gbm: regression method
# bayesm: Bayesian inference
# RWeka: R interface to Weka.
# lsa: latent semantic analysis
# tm: text mining application
# igraph: create and manipulate graphs
# survival: survival analysis
# Hmisc: Harrell Miscellaneous, many useful function for data analysis
# zipfR: Large Number of Rare Event (LNRE) model
# RODBC: database connectivity also excel 
# 

p=c("R2HTML", "YaleToolkit", "ggplot2", "googleVis", "plyr", 
    "ElemStatLearn", "gbm", "bayesm", "RWeka", "lsa", "tm",
    "igraph", "survival", "Hmisc", "ICSNP", "zipfR", "RODBC")

repositories = c("http://mirrors.nics.utk.edu/cran/")
install_package = function(pack, repos)
{
    if (!(pack %in% row.names(installed.packages()))) {
        update.packages(repos=repositories, ask=F)
        install.packages(pack, repos=repositories, dependencies=T)
    }
    require(pack, character.only=TRUE)
}

for (pack in p) {
    install_package(pack, repositories)
}
