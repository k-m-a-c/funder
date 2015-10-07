
$(document).on('page:load ready', function() {
  // var nextPageUrl;
  $('.mdl-layout__content').on('scroll', function() {
    console.log("inside the scroll event");

    // var spinner = $('.spinner');
    // spinner.hide();

    var nextPageUrl;
    var container = $('.mdl-layout__content');
    var bottomOfWindow = container.scrollTop() + container.height();
    var distanceFromBottom = $(document).height() - bottomOfWindow;
    var proposedNextPageUrl = $('.page > a[rel = next]').attr('href');

    if( distanceFromBottom <= 200 && (nextPageUrl !== proposedNextPageUrl)) {
      nextPageUrl = proposedNextPageUrl;
      // spinner.show();

      $.ajax({
        url: nextPageUrl.attr('href'),
        type: 'GET',
        dataType: 'html',
        success: function(result) {
          $('.cards').append(result);
          // spinner.hide();
          console.log(result);
        },
        error: function(response) {
          // spinner.hide();
          console.log(response);
        }
      });
    }
  });
});