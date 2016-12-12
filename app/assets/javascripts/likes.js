$(document).ready(function() {

  $('.like_post').on('click', function(event){
      event.preventDefault();

      var likeCount = $(this).siblings('.vote-count');

      $.post(this.href, function(response){
        likeCount.text('whatever');

    });

  });
});
