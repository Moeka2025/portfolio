async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

  const mapElement = document.getElementById("map");

  const lat = parseFloat(mapElement.dataset.lat);
  const lng = parseFloat(mapElement.dataset.lng);

  const position = { lat: lat, lng: lng };

  const map = new Map(mapElement, {
    center: position,
    zoom: 15,
    mapId: "45b63fed22b8937c7516a470"
  });

  const marker = new google.maps.Marker({
    position: position,
    map: map,
    title: mapElement.dataset.title
  });  

  const contentString = `
    <div>
      <h3>${mapElement.dataset.title}</h3>
      <p>${mapElement.dataset.address}</p>
      <img src="${mapElement.dataset.image}" width="250">
    </div>
  `;

  const infowindow = new google.maps.InfoWindow({
    content: contentString,
  });

  marker.addListener("click", () => {
    infowindow.open(map, marker);
    });
  }

initMap();
