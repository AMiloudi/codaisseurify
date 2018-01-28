function submitSong(event){
  event.preventDefault();
  let songTitle = $("#song_title").val();
  let songYear  = $("#song_released_year").val();
  let artistId = $("#artistField").val();

  ajaxCreateSong(songTitle, songYear, artistId);
}

function ajaxCreateSong(songTitle, songYear, artistId){

  $.ajax({
    type: "POST",
    url: "/api/artists/"+ artistId + "/songs",
    data: JSON.stringify({
      title: songTitle,
      released_year: songYear,
      artist_id: artistId
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .success(function(data) {
    createSong(songTitle, songYear, data.artist.id, data.song.id);
    $('.notice').html(data.message);
  });
}

function createSong(songTitle, songYear, artistId, songId){
  $('#songTable tr:last').after('<tr id="song'+ songId +'">' +
  '<td>'+ songTitle + '</td>' +
  '<td>'+ songYear +'</td>' +
  '<td>' +
  '<a class="btn btn-default" href="/artists/' + artistId + '/songs/' + songId + '/edit">Update</a>' +
  '<button type="button" class="btn btn-default song-delete" data-artist="'+ artistId +'" data-id="'+ songId + '">Delete this song!</button>'+
  '</td>' +
  '</tr>');

  $('.song-delete').on('click', deleteSong);
}

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
    $('.notice').html(data.message);
  });
}

$(document).ready(function() {
  $('.song-delete').on('click', deleteSong);
  $('.delete-all').on('click', deleteAllSong);
  $('#new_song').bind('submit', submitSong);
});
