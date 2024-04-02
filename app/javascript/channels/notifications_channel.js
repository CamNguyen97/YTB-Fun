import consumer from "channels/consumer";

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    console.log("connected to notifications channel");
  },

  disconnected() {
  },

  received(data) {
    var postAlert = document.getElementById("post-alert");
    var postAlertDes = document.getElementById("post-alert-des");

    postAlert.classList.remove("d-none");
    postAlertDes.innerHTML = "User " + data.shared_by + " has shared a Youtube movie: " + data.title;

    setTimeout(function() {
      postAlert.classList.add("d-none");
    }, 15000);
  }
});
