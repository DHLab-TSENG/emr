% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fun_emr.R, R/selectCases.R
\name{selectCases}
\alias{selectCases}
\title{Data integration for case selection}
\usage{
selectCases(
  dxDataFile,
  idColName,
  icdColName,
  dateColName,
  icdVerColName = NULL,
  icd10usingDate = NULL,
  groupDataType = CCS,
  customGroupingTable,
  isDescription = TRUE,
  caseCondition,
  caseCount = 2,
  periodRange = c(30, 365),
  caseName = "Selected"
)
}
\arguments{
\item{dxDataFile}{A data frame object of clinical diagnostic data with at least 3 columns: ID, ICD, and Date. As for date column, the data format should be YYYY/MM/DD or YYYY-MM-DD.}

\item{idColName}{Column name of ID column in dxDataFile. Data type of this argumant should be string without quotation marks.}

\item{icdColName}{Column name of ICD column in dxDataFile. Data type of this argumant should be string without quotation marks.}

\item{dateColName}{Column name of date column in dxDataFile (with date in YYYY/MM/DD or YYYY-MM-DD format). Data type of this argumant should be string without quotation marks.}

\item{icdVerColName}{(Optional) Column name of ICD-9/10 version recorded in dxDataFile. Data format in this column should be numeric 9L or 10L.}

\item{icd10usingDate}{The date that ICD-10 was started to be used in dxDataFile dataset. The data format should be YYYY/MM/DD or YYYY-MM-DD. Necessary if icdVerColName is null.}

\item{groupDataType}{Four Stratified methods can be chosen: CCS (\code{ccs}), multiple-level CCS (\code{ccslvl1}, \code{ccslvl2}, \code{ccslvl3}, \code{ccslvl4}), PheWAS (\code{PheWAS}), comorbidities (\code{ahrq},\code{charlson}, \code{elix}), precise or fuzzy customized  method (\code{customGrepIcdGroup}, \code{customIcdGroup}). The value should be string stated above without quotation mark. Default value is \code{ccs}.}

\item{customGroupingTable}{Used-defined grouping categories. \code{icdDxToCustom} needs a dataset with two columns called "Group" and "ICD", respectively; User can define one or more disease categories in "Group" column, and define a list of corresponding category-related ICD codes in "ICD" column. \code{icdDxToCustomGrep} needs a dataset with two columns: "Group", "grepIcd"; "Group" defines one or more disease categories and "grepICD" defines disease-related ICD code character strings containing regular expressions.}

\item{isDescription}{Binary. If true, category description of classification methods will be used in the group column. If false, category name will be used. By default, it is set to be \code{True} (standard category description).}

\item{caseCondition}{Certain diseases to be selected. The condition can be specific ICD, CCS category description, etc. String with regular expression is also supported.}

\item{caseCount}{Minimum number of diagnoses time to be selected. If \code{caseCount} = \code{2}, then only patients who had been diagnosed twice (or above) would be selected. Default value is 1.}

\item{caseName}{Value to identify selected or not. The value will be filled in the labeling column called \code{selectedCase}. By default, it is set to be \code{"selected"}.}

\item{PeriodRange}{Determine duration of interest for performing the case selection. By default, it is set from 30 to 365 days (with argument \code{c(30,365)}). The lower bound and the upper of the wanted duration should be coded as a vector.}
}
\value{
A new \code{data.table} based on standard classification dataset with a new column: \code{selectedCase}, in which each row is labeled as selected or not.
}
\description{
This query function can select the cases matching defined conditions for analyses.
}
\details{
User can select cases by diagnostic categories, such as CCS category, ICD codes, etc. The function also provides the options to set the minimum number of diagnoses within a specific duration. The output dataset can be passed to `groupedDataLongToWide` to create tables in wide format for statistical analytic usage.
}
\examples{
# sample file for example

head(sampleDxFile)

#select case with "Diseases of the urinary system" by level 2 of CCS classification

selectCases(dxDataFile = sampleDxFile,
            ID, ICD, Date,
            icdVerColName = NULL,
            groupDataType = ccslvl2,
            icd10usingDate = "2015/10/01",
            caseCondition = "Diseases of the urinary system",
            caseCount = 1)
}
\seealso{
Other data integration functions: \code{\link{splitDataByDate}}, \code{\link{getEligiblePeriod}}, \code{\link{getConditionEra}}
}
