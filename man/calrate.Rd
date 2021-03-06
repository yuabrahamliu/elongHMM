% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/inference.R
\name{calrate}
\alias{calrate}
\title{Calculate gene elongation rate from a pair of Pro-seq or Gro-seq data}
\usage{
calrate(
  time1file,
  time2file,
  targetfile,
  genomename = NULL,
  time,
  strandmethod = 1,
  threads = 1,
  savegenenames = NULL,
  plotgenenames = TRUE,
  genelencutoff = 70000,
  fpkmcutoff = 1
)
}
\arguments{
\item{time1file}{The reference Pro-seq/Gro-seq bam file name, corresponding
to 0min. Can be a string indicating the directory of the file, or a
GAlignmentPairs object, or a GRanges object from the original bam file.}

\item{time2file}{The treatment Pro-seq/Gro-seq bam file name, corresponding
to a specific time point (e.g. 15min if DRB was used for 15min). Can be a
string indicating the directory of the file, or a GAlignmentPairs object,
or a GRanges obejct from the original bam file.}

\item{targetfile}{The genes whose transcriptional elongation rate need to be
analyzed. If it is NULL, all the genes longer than at least 4000bp in the
genome specified by the parameter \code{genomename} will be analyzed. If
provied by the user, columns named as chr, start, end, strand, and gene_id
are required. All genes should have a length greater than at least 4000bp.}

\item{genomename}{Specify the genome of the genes to be analyzed, when the
parameter \code{targetfile} is NULL.}

\item{time}{The time difference between \code{time1file} and
\code{time2file}, using min as its unit.}

\item{strandmethod}{The strand specific method used when preparing the
sequencing library, can be 1 for directional ligation method and 2 for
dUTP method. If the sample is sequenced using a single strand method, set
it as 0.}

\item{threads}{Number of threads to do the parallelization. Default is 1.}

\item{savegenenames}{For which genes their concrete rate inference results
need to be saved, including the binned ratio values between their data in
\code{timefile2} and \code{timefile1}, the extended ratio values for
specific bins, etc.}

\item{plotgenenames}{Whether to plot the binned and extended ratio values
for the genes provided by \code{savegenenames}.}

\item{genelencutoff}{The cutoff on gene length (bp). Only genes longer than
this cutoff will be considerred. If its value is NULL or less than 4000,
genes longer than 4000bp will be considerred. Default is 70000.}

\item{fpkmcutoff}{The cutoff on gene FPKM value. Only genes with an FPKM
value greater than the cutoff in \code{time1file} will be considerred.
Default is 1.}
}
\value{
A list including a data.frame recording the transcription elongation
rates inferred using the LSS method, as well as other information, such as
the significance of results.
}
\description{
Calculate gene elongation rate from a pair of Pro-seq data, or Gro-seq data,
using an LSS (least sum of square) based method.
}
