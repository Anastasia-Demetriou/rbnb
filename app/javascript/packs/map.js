const addressInput = document.getElementById('event_location')
if (addressInput) {
  const places = require('places.js');
  const placesAutocomplete = places({
    container: addressInput
  });
}
