
# Step 1. load the dengue geocoded dataset ####
load("~/OneDrive/proyects/geocoding_mex/2025/8.RData/denmex_2025.RData")

y <- z |>
    dplyr::mutate(x = long,
                  y = lat) |>
    sf::st_as_sf(coords = c("x", "y"),
                 crs = 4326) |>
    dplyr::filter(accuracy != "locality")
table(y$accuracy)

cul <- rgeomex::extract_locality(cve_edo = "25",
                                      locality = "Culiacan de Rosales")

y <- y[cul, ]

mapview::mapview(y)

densnv::mp_heatmap(geocoded_datasets = y,
                   cve_edo = "25",
                   locality = "Culiacan de Rosales",
                   status_caso = c(1, 2),
                   week = c(1:53),
                   zoom = NULL,
                   map_type = NULL,
                   alpha = 0.6,
                   static = FALSE,
                   palette = viridis::turbo)
