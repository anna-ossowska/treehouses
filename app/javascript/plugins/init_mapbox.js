import mapboxgl from 'mapbox-gl';

// build the map
const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    // old style of the map
    // style: 'mapbox://styles/mapbox/streets-v10'

    // new style of the map
      style: 'mapbox://styles/pettersyvertsen/ckfqz1xhf0ifl19nd8qaxxulu'      
  });
  return map
};

// add markers to map
const addMarkersToMap = (map, markers) => { 
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
}

// fit markers 
const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  console.log(markers);
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 2 });
};

// This function called first!
const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
   const map = buildMap(mapElement);  
   const markers = JSON.parse(mapElement.dataset.markers)
   addMarkersToMap(map, markers);
   fitMapToMarkers(map, markers);
  }
};

export { initMapbox };