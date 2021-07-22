wideToLongTable <- function(dataframe) {
  long_table <- dataframe %>%
    # add row numbers as we need them to keep the order
    dplyr::mutate(rn = dplyr::row_number()) %>%
    # gather is depricated
    tidyr::pivot_longer(-rn, names_to = "colu", values_to = "vals") %>%
    # extract number from the column names that now are a column as we need them to keep the order also
    dplyr::mutate(nr = readr::parse_number(colu))
  
  long_table <- long_table %>%
    dplyr::filter(stringr::str_detect(colu, "Z")) %>%
    dplyr::left_join(long_table %>%
                       dplyr::filter(stringr::str_detect(colu, "R")), by = c("rn", "nr")) %>%
    # order to get the exact output you are looking for
    dplyr::arrange(nr) %>%
    # select and rename to get exactout put you a looking vor
    dplyr::select(Z = colu.x, `Time in ms` = vals.x, R = colu.y, Reaction = vals.y) 
}