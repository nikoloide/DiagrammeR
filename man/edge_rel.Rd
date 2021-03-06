% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/edge_rel.R
\name{edge_rel}
\alias{edge_rel}
\title{Create, read, update, delete, or report status of an
edge relationship}
\usage{
edge_rel(graph, from, to, action = "read", value = NULL)
}
\arguments{
\item{graph}{a graph object of class
\code{dgr_graph}.}

\item{from}{a node ID from which the edge to be
queried is outgoing.}

\item{to}{a node ID to which the edge to be queried
is incoming.}

\item{action}{the operation to perform on the edge's
relationship attribute. To remove a relationship
from an edge, use either \code{delete},
\code{remove}, or \code{drop}. To add a relationship
to an edge with no set relationship, use \code{add}
or \code{create}. To update an edge relationship,
use \code{update}. To return the value of an edge
relationship, use \code{read}. To determine whether
there is a set relationship, use \code{check}.}

\item{value}{a string denoting the relationship, to
be supplied when either adding or updating an edge
relationship.}
}
\value{
a graph object of class \code{dgr_graph}.
}
\description{
From a graph object of class
\code{dgr_graph}, query an edge in the graph
(defined by a pair of node IDs extant in the graph)
and perform operations on the relationship for that
edge.
}
\examples{
# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 5,
    type = c("a", "b", "c", "a", "c"))

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 3, 5, 2, 4),
    to = c(2, 2, 4, 4, 3),
    rel = c("rel_a", "rel_b",
            "rel_b", "rel_a",
            "rel_c"))

# Create a graph
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Read the edge `rel` for edge `1`->`2`
graph \%>\% edge_rel(1, 2)
#> [1] "rel_a"

# Remove the `rel` value entirely from
# edge `1`->`2`
graph <-
  graph \%>\%
  edge_rel(1, 2, "delete")

# Check that the edge `1`->`2` no longer
# has a `rel` assignment
graph \%>\% edge_rel(1, 2, "check")
#> [1] FALSE

# Add the `rel` value `rel_b`` to edge `1`->`2`
graph <-
  graph \%>\%
  edge_rel(1, 2, "add", "rel_b")

# Read the edge `rel` for edge `1`->`2`
graph \%>\% edge_rel(1, 2)
#> [1] "rel_b"

# Perform an in-place update of the `rel`
# value for edge `1`->`2` (`rel_b`` to `rel_a``)
graph <-
  graph \%>\%
  edge_rel(1, 2, "update", "rel_a")

# Read the edge `rel` for edge `1`->`2`
# to ensure that the change was made
graph \%>\% edge_rel(1, 2)
#> [1] "rel a"
}
