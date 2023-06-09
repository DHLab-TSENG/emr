% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_emr.R
\docType{package}
\name{dxpr-package}
\alias{dxpr}
\alias{dxpr-package}
\title{emr : A health data analysis tool of electric medical record}
\description{
emr provides mechanisms to analyze, integrate and visualize clinical data, including diagnosis and procedure records. Preparing a research-ready dataset from EHRs is a complex and time-consuming task and requires substantial data science skills.
}
\details{
It has four main sections:

\itemize{
 \item Code standardization:  Transform the diagnostic and procedure codes into uniform format before the integration process.
 \item Data integration: Group EHR diagnostic/procedure codes with different strategies, after code grouping, emr provide functions for querying matching cases, splitting data and calculating condtion era by grouped categories of each patients.
 \item Exploratory data analysis (EDA) preparation: Convert long format of grouped data into wide format which is fit to others analytical and plotting packages.
 \item Visualization: Provide overviews for diagnoses standardization and data integration, such as the differences of comorbidities between case and control groups, and the most common diagnoses which are fail to be grouped or standardized.
}

 To learn more about emr, start with the vignettes:
`browseVignettes(package = "emr")`
}
\seealso{
Useful links:
\itemize{
  \item \url{https://dhlab-tseng.github.io/dxpr/}
  \item Report bugs at \url{https://github.com/DHLab-TSENG/dxpr/issues}
}

}
\author{
\strong{Maintainer}: Hsiang-Ju Chiu \email{aibabi3@gmail.com}

Authors:
\itemize{
  \item Yi-Ju Tseng \email{yjtseng@mail.cgu.edu.tw}
}

}
