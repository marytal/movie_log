function Movie(json) {
  var self = this;

  self.id = json.id;//ko.observable(json.id);
  self.title = ko.observable(json.title);
  self.description = ko.observable(json.description);
  self.length = ko.observable(json.length);
  self.year = ko.observable(json.year);
  self.date_watched = ko.observable(json.date_watched);
  self.watched_with = ko.observable(json.watched_with);
  self.your_rating = ko.observable(json.your_rating);
  self.average_rating = ko.observable(json.average_rating);
  self.notes = ko.observable(json.notes);
  self.poster = ko.observable(json.poster);


  self.show_url = "/movies/" + self.id;


}

// function View(movieId) {
//   var self = this;

//   self.movie = ko.observable();

//   $.get('/movies/' + movieId + '.json', function(movie) {
//     var new_movie = new Movie(movie); 
//     self.movie(new_movie);

//   });
// }




// function initialize(movieId) {
//   var view = new View(movieId);
//   window.view = view;

//   ko.applyBindings(view);
// }