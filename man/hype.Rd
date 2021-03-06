% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hype.R
\name{hype}
\alias{hype}
\title{Hyperparameter optimization}
\description{
Hyperparameter optimization

Hyperparameter optimization
}
\examples{

# Have df output, but only use one value from it
h1 <- hype$new(
  eval_func = function(a, b) {data.frame(c=a^2+b^2, d=1:2)},
  extract_output_func = function(odf) {odf$c[1]},
  a = par_unif$new('a', -1, 2),
  b = par_unif$new('b', -10, 10),
  n_lhs = 10
)
h1$run_all()
h1$add_EI(n = 1)
h1$run_all()
#system.time(h1$run_EI_for_time(sec=3, batch_size = 1))
#system.time(h1$run_EI_for_time(sec=3, batch_size = 3))
h1$plotorder()
h1$plotX()
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{X}}{Data frame of inputs that have been evaluated or will be evaluated
next.}

\item{\code{Z}}{Output at X}

\item{\code{mod}}{Gaussian process model used to predict what the output will be.}

\item{\code{parnames}}{Names of the parameters}

\item{\code{parlower}}{Lower bounds for each parameter}

\item{\code{parupper}}{Upper bounds for each parameter}

\item{\code{ffexp}}{An ffexp R6 object used to run the experiment and store
the results.}

\item{\code{eval_func}}{The function we evaluate.}

\item{\code{extract_output_func}}{A function that takes in the output from
`eval_func` and returns the value we are trying to minimize.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{hype$new()}}
\item \href{#method-add_data}{\code{hype$add_data()}}
\item \href{#method-add_X}{\code{hype$add_X()}}
\item \href{#method-add_LHS}{\code{hype$add_LHS()}}
\item \href{#method-add_EI}{\code{hype$add_EI()}}
\item \href{#method-run_all}{\code{hype$run_all()}}
\item \href{#method-run_EI_for_time}{\code{hype$run_EI_for_time()}}
\item \href{#method-plot}{\code{hype$plot()}}
\item \href{#method-pairs}{\code{hype$pairs()}}
\item \href{#method-plotorder}{\code{hype$plotorder()}}
\item \href{#method-plotX}{\code{hype$plotX()}}
\item \href{#method-print}{\code{hype$print()}}
\item \href{#method-clone}{\code{hype$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Create hype R6 object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$new(eval_func, ..., X0 = NULL, n_lhs, extract_output_func)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{eval_func}}{The function used to evaluate new points.}

\item{\code{...}}{Hyperparameters to optimize over.}

\item{\code{X0}}{Data frame of initial points to run.}

\item{\code{n_lhs}}{The number that should initially be run using
a maximin Latin hypercube.}

\item{\code{extract_output_func}}{A function that takes in the output from
`eval_func` and returns the value we are trying to minimize.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-add_data"></a>}}
\if{latex}{\out{\hypertarget{method-add_data}{}}}
\subsection{Method \code{add_data()}}{
Add data to the experiment results.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$add_data(X, Y)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{X}}{Data frame with names matching the input parameters}

\item{\code{Y}}{Output at rows of X matching the experiment output.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-add_X"></a>}}
\if{latex}{\out{\hypertarget{method-add_X}{}}}
\subsection{Method \code{add_X()}}{
Add new inputs to run. This allows the user to specify
what they want run next.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$add_X(X)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{X}}{Data frame with names matching the input parameters.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-add_LHS"></a>}}
\if{latex}{\out{\hypertarget{method-add_LHS}{}}}
\subsection{Method \code{add_LHS()}}{
Add new input points using a maximin
Latin hypercube.
Latin hypercubes are usually more spacing than randomly picking points.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$add_LHS(n)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{n}}{Number of points to add.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-add_EI"></a>}}
\if{latex}{\out{\hypertarget{method-add_EI}{}}}
\subsection{Method \code{add_EI()}}{
Add new inputs to run using the expected information
criteria
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$add_EI(n, covtype = "matern5_2", nugget.estim = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{n}}{Number of points to add.}

\item{\code{covtype}}{Covariance function to use for the Gaussian process
model.}

\item{\code{nugget.estim}}{Should a nugget be estimated?}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-run_all"></a>}}
\if{latex}{\out{\hypertarget{method-run_all}{}}}
\subsection{Method \code{run_all()}}{
Run all unevaluated input points.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$run_all(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{Passed into `ffexp$run_all`.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-run_EI_for_time"></a>}}
\if{latex}{\out{\hypertarget{method-run_EI_for_time}{}}}
\subsection{Method \code{run_EI_for_time()}}{
Add points using the expected information criteria,
evaluate them, and repeat until a specified amount of time has passed.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$run_EI_for_time(
  sec,
  batch_size,
  covtype = "matern5_2",
  nugget.estim = TRUE,
  ...
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{sec}}{Number of seconds to run for. It will go over this time
limit, finish the current iteration, then stop.}

\item{\code{batch_size}}{Number of points to run at once.}

\item{\code{covtype}}{Covariance function to use for the Gaussian process
model.}

\item{\code{nugget.estim}}{Should a nugget be estimated?}

\item{\code{...}}{Passed into `ffexp$run_all`.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-plot"></a>}}
\if{latex}{\out{\hypertarget{method-plot}{}}}
\subsection{Method \code{plot()}}{
Make a plot to summarize the experiment.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$plot()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-pairs"></a>}}
\if{latex}{\out{\hypertarget{method-pairs}{}}}
\subsection{Method \code{pairs()}}{
Plot pairs of inputs and output
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$pairs()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-plotorder"></a>}}
\if{latex}{\out{\hypertarget{method-plotorder}{}}}
\subsection{Method \code{plotorder()}}{
Plot the output of the points evaluated in order.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$plotorder()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-plotX"></a>}}
\if{latex}{\out{\hypertarget{method-plotX}{}}}
\subsection{Method \code{plotX()}}{
Plot the output as a function of each input.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$plotX()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-print"></a>}}
\if{latex}{\out{\hypertarget{method-print}{}}}
\subsection{Method \code{print()}}{
Print details of the object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$print(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{not used}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{hype$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
