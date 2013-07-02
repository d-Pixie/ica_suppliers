Array.prototype.remove = function(v) {
  return $.grep(this, function(e) {
    return e !== v;
  });
};

var map, geocoder, result = '', marker = null;

function initialize() {
  var myLatlng = new google.maps.LatLng(56.889, 14.807);
  var myOptions = {
    zoom: 11,
    center: myLatlng,
    disableDefaultUI: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  geocoder = new google.maps.Geocoder();
  
  /* TODO Make sure we only lookup() if anything has changed (don't spam Google) */
  $('.guessable').live({
    'keyup':lookup
  });
  
	/* Handle click on our guessed addresses dropdown */
  $('#guesses > span').live({
    click: function(e) {
      $('#guesses').hide();
      result = $(this).data('geocoder-object');
      $('#supplier_address').val('');
      $('#supplier_postalcode').val('');
      $('#supplier_city').val('');
      $.each(result.address_components, function(index, component) {
        if (component.types.indexOf('postal_town') >= 0) {
          $('#supplier_city').val(component.long_name.toUpperCase());    
        }
        var num = parseInt(component.long_name.replace(/^\s+|\s+$/g,""));
        if (!isNaN(num)) {
          $('#supplier_postalcode').val(num);
        }
        if (component.types.indexOf('route') >= 0) {
          $('#supplier_address').val(component.long_name +' '+ $('#supplier_address').val());
        }
        if (component.types.indexOf('street_number') >= 0) {
          $('#supplier_address').val($('#supplier_address').val() +' '+ component.long_name);
        }
      });
      if (marker) {
        marker.setMap(null);
      } else {
        marker = new google.maps.Marker({ clickable:false, icon: '/assets/default.png' });
      }
      marker.setPosition(result.geometry.location);
      marker.setTitle(result.formatted_address);
      marker.setMap(map);
      map.panTo(result.geometry.location);
      $('#supplier_latlong').val(JSON.stringify(result.geometry.location));
    }
  });
  $('body').trigger('map_loaded');
}

function lookup() {
  if (($('#supplier_address').val().length > 3) && (typeof(geocoder) !== "undefined") && (geocoder !== null)) {
    geocoder.geocode( { 'address':$('#supplier_address').val(), 'region':'se' }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        $('#guesses').show().html('');
        $.each(results, function(index, result) {
          $('#guesses').append($('<span>').text(index+': '+result.formatted_address).data('geocoder-object',result));
        });
      } else {
        $('#guesses').hide();
      }
    });
  }
}

$(document).ready(function() {
	/* Bind to click on categoryicons in supplier/new and edit */
  $('.category').bind('click', function() {
    var id, ids = [];
    id = $(this).attr('id').substr(4);
    $(this).toggleClass('use');
    $('.use').each(function (i){
      ids.push(parseInt($(this).attr('id').substr(4)));
    }); 
    $('#categories_ids').val(JSON.stringify(ids));
    return false;
  });

  if ($('#categories_ids').length > 0) {
	  $.each( $.parseJSON($('#categories_ids').val()), function(index, value) {
	    $('#cat_' + value).addClass('use');
	  });
 	}
  
  $('#map_canvas').height($('#map_wrapper').height());
  google.load('maps', '3', {other_params:'sensor=false', callback: initialize });
});