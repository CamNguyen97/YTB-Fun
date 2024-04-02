// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels"

$(document).ready(function() {
  $("#youtubeForm").submit(function(event) {
    event.preventDefault();

    var urlField = $("#youtubeUrl");
    var url = urlField.val().trim();
    var urlError = $("#urlError");
    var alertBox = $("#alertBox");
    var alertMessage = $("#alertMessage");

    if (!isValidYouTubeUrl(url)) {
      urlError.text("Please enter a valid YouTube URL");
      alertMessage.text("Please enter a valid YouTube URL");
      alertBox.css("display", "block");
      return;
    }

    $(this).submit();
  });

  function isValidYouTubeUrl(url) {
    var pattern = /^(https?\:\/\/)?(www\.youtube\.com|youtu\.?be)\/.+$/;
    return pattern.test(url);
  }

  $("#youtubeUrl").on("input", function() {
    var urlError = $("#urlError");
    var alertBox = $("#alertBox");
    var alertMessage = $("#alertMessage");
    urlError.text("");
    alertBox.css("display", "none");
  });
});

