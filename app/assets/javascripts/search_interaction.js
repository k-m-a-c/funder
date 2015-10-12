$(document).on('page:load ready', function() {

  var search = $('.mdl-textfield--expandable');
  var title = $('.mdl-layout-title');

  search.on('click', function() {
    title.fadeOut('fast');
  });
});