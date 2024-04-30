$(function(){
  $('#fav-btn').on('click', function() {
    $.ajax({
      

    })
  });
});

  $(".favorite-btn").html("<%= j(render 'favorites/favorite-btn', book: @book) %>");