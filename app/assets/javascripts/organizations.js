$(document).on('page:load ready', function() {

  var nextPageUrl;

  var sortMostToLeast = $('button#sort');

  sortMostToLeast.on('click', function() {
    $.ajax({
      url: '/sort/organizations/most_to_least_funding',
      type: 'GET',
      dataType: 'script'
    });
  });

  $('.mdl-layout__content').on('scroll', function(e) {
    console.log("inside the scroll event");

    var page = $('.page-content');
    var viewport = $('.mdl-layout__content');
    var spinner = $('.spinner');
    var bottomOfViewport = viewport.scrollTop() + viewport.height();
    var distanceFromBottom = page.height() - bottomOfViewport;
    var proposedNextPageUrl = $('.pagination > a[rel = next]').attr('href');

    if( distanceFromBottom <= 200 && (nextPageUrl !== proposedNextPageUrl)) {
      console.log("near the bottom");
      nextPageUrl = proposedNextPageUrl;
      // spinner.addClass('is-active');

      $.ajax({
        url: nextPageUrl,
        type: 'GET',
        dataType: 'script'
        // success: function(result) {
          // console.dir(result);
          // $('.cards').append(result);
          // spinner.removeClass('is-active');
        // }
        // error: function(response) {
        //   spinner.hide();
        //   console.log(response);
        // }
      });
    }
  });
});