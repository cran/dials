# dials 0.0.3

## Breaking changes

* All parameter _objects_ are now parameter _functions_. For example, the pre-configured object `mtry` is now a function, `mtry()`, with arguments for the `range` and the `trans`. This provides greater flexibility in parameter creation, and should feel more natural.

* `deg_free()` erroneously produced real values; integers are now returned. 

* Default ranges were changed for `learn_rate()` and `neighbors()` were changed.

* `update.param_set()` now takes multiple named arguments. 


## Other changes

* Two functions for space-filling designs were added: `grid_max_entropy()` and `grid_latin_hypercube()`. 

* A data set was added for modeling ridership on the Chicago L trains.

## New parameter functions:

* Parameters `spline_degree()`, `over_ratio()`, `under_ratio()`, `freq_cut()`, `unique_cut()`,  `num_breaks()`, `min_unique()`, `num_hash()`, `signed_hash()`, `sample_prop()`, `window_size()`, `min_dist()`, and `degree_int()` were added. 


# dials 0.0.2

* Parameter objects now contain code to finalize their values and a number of helper functions for certain data-specific parameters. A `force` option can be used to avoid updating the values. 

* Parameter objects are printed differently inside of tibbles. 

* `regularization` was changed to `penalty` in a few models to be consistent with [this change](https://tidymodels.github.io/model-implementation-principles/standardized-argument-names.html#tuning-parameters). 

* `batch_size` and `threshold` were added.

* Added a set of parameters for the `textrecipes` package [issue 16](https://github.com/tidymodels/dials/issues/16). 

# dials 0.0.1

* First CRAN version
