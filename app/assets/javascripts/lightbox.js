// Functions to open and customize lightbox

var onOpenLightbox = function(e) {
  var lightbox = document.getElementById("lightbox");
  lightbox.className = "visible";
  var body = document.getElementById("everything_except_lightbox");
  body.className = "faded";

}

var customizeLightbox = function(clicked_image) {
  var lightbox = document.getElementById("lightbox");
  lightbox.getElementsByTagName("img")[0].src = clicked_image.src;
  onOpenLightbox("");
}

// var findTargetID = function(e) {
//   var clicked_image = document.getElementById(e.target.id);
//   customizeLightbox(clicked_image);
// }


// Functions to close lightbox

var onCloseLightbox = function(e) {
  var lightbox = document.getElementById("lightbox");
  lightbox.className = "invisible";
  var body = document.getElementById("everything_except_lightbox");
  body.className = "visible";
}






//Event Listeners

// To close lightbox
// moved to users/show

// To open lightbox

// var background_images = document.querySelectorAll(".background")
// for(var i = 0; i < background_images.length; i++){
//   background_images[i].addEventListener('click', findTargetID);
// }

