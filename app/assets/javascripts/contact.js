$(function() {
    var myLatlng = new google.maps.LatLng(-0.1643532,-78.4711528);

    map = new google.maps.Map(document.getElementById('map'), {
        center: myLatlng,
        zoom: 16,
        max_zoom: 18,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        panControl: false,
        zoomControl: true,
        scaleControl: true,
        disableDefaultUI: true
    });

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: 'AutoStop LC'
    });

    var contentString = '<strong>AutoStop LC</strong>!';
    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });
    infowindow.open(map,marker);

});