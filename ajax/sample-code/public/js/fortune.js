$("#new-fortune").on("click", function() {
  $.get("/new-fortune.json", function(newFortune) {
    $("#fortune").text(newFortune["fortune"]);
  });
});
