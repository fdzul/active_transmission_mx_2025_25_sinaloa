
# Step 1. load the dengue geocoded dataset ####
load("~/OneDrive/proyects/geocoding_mex/2025/8.RData/denmex_2025.RData")

z <- z |>
    dplyr::filter(accuracy != "locality")
    

densnv::mp_heatmap(geocoded_datasets = z,
                   cve_edo = "25",
                   locality = "Culiacan de Rosales",
                   status_caso = c(1, 2),
                   week = c(1:53),
                   zoom = NULL,
                   map_type = NULL,
                   alpha = 0.6,
                   static = FALSE,
                   palette = viridis::turbo)
