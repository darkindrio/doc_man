function toggleLike(clicked_document_id) {
    $button = $('#'+clicked_document_id);
    $span = $('#span-'+clicked_document_id);
    $peopleLikes = $('#people-like-'+clicked_document_id);
    if($button.hasClass('isActive')){

        $button.addClass('notActive');
        $button.removeClass('isActive');
        $button.prop('title', 'Like Document');

        $span.addClass('s-notActive');
        $span.removeClass('s-isActive');

        $url = '/remove_like';
    } else {

        $button.addClass('isActive');
        $button.removeClass('notActive');
        $button.prop('title', 'Unlike Document');

        $span.addClass('s-isActive');
        $span.removeClass('s-notActive');

        $url = '/add_like';
    }
    $button.blur();

    $.ajax({
      type: "GET",
      dataType: "json",
      url: $url,
      data: {
          document_id: clicked_document_id// < note use of 'this' here
      },
      success: function(json) {
          $peopleLikes.html("Likes: " + json.peopleLikes);

      },
      error: function(json) {
          $peopleLikes.html("Likes: " + json.peopleLikes);
      }
  });
}
