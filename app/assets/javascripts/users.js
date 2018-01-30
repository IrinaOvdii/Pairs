function toggleAdmin() {
  $(this).parent().parent().toggleClass("success");
}

$(document).ready(function() {
  $("input[type=checkbox]").bind('change', toggleDone);
});
