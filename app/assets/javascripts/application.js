// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function onPlayerReady(event) {
  event.target.loadPlaylist([gon.youtube]);
}
function onPlayerStateChange(event) {

}

var score = 0;
var count = 0;
function submit() {
  var band = gon.artists;
  var guess = document.getElementById('guess').value;
  console.log(guess);
  console.log(band[count]);
  if (guess.toLowerCase().replace(/\s+/g, '') == band[count].toLowerCase().replace(/\s+/g, '')) {
    if (score < (gon.youtube.length - 1)) {
      player.nextVideo();
      score++;
      count++;
      document.getElementById('guess').value = "";
      document.getElementById('score').innerHTML = score;
    } else {
      player.stopVideo();
      score = score + 100;
      document.getElementById('game_over').style.display = "block";

      var xmlhttp = new XMLHttpRequest();
      xmlhttp.open("POST", '/score', true);
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("score=" + score);
    }
  } else {
    player.stopVideo();
    document.getElementById('game_over').style.display = "block";

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST", '/score', true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("score=" + score);
  }
  console.log(score);
}

document.onkeypress = function(e) {
  e = e || window.event;
  var charCode = (typeof e.which == "number") ? e.which : e.keyCode;
  if (charCode == 13) {
    submit();
  }
}

function reloader() {
  location.reload(true);
}

function hider() {
  $(".hider").toggle();
}




