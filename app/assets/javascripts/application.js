//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

function deleteAllSong(event){
  if (confirm('Are you sure you want to delete?')) {
    $('.song-delete').each(function (index, target){
      let artist = $(target).data("artist");
      let song = $(target).data("id");

      ajaxDeleteRequest(artist,song);
    });
  }
}
function deleteSong(event){
  let artist = $(event.target).data("artist");
  let song = $(event.target).data("id");

  if (confirm('Are you sure you want to delete?')) {
    ajaxDeleteRequest(artist,song);
  }
}

function ajaxDeleteRequest(artist, song){
  $.ajax({
    type: "DELETE",
    url: "/api/artists/" + artist + "/songs/"+ song,
    contentType: "application/json",
    dataType: "json"
  })
  .success(function(data) {
    $('#song' + song).remove();
  });
}


$(document).ready(function() {
  $('.song-delete').on('click', deleteSong);
  $('.delete-all').on('click', deleteAllSong);
});
