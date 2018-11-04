while(sum(is.na(addresses_and_coords$lon)) > 0 && counter <10) {
  missing_addresses <- addresses_and_coords %>%
    filter(is.na(lon)==TRUE)
  addresss <- missing_addresses$address
  geocodes <-geocode(as.character(addresses), source = "google")
  addresses_and_coords <- addresses_and_coords %>%
    filter(is.na(lon)==FALSE)
  new_addresses <- data.frame(address = addresses,
                              lon = geocodes$lon,
                              lat = geocodes$lat)
  addresses_and_coords <- rbind(addresses_and_coords, new_addresses)
  counter <- counter + 1
}
