function User(attributes) {
  this.id = attributes["id"];
  this.email = attributes["email"];
  this.favorites = attributes["favorites"];

  this.fav_ids = function() {
    if (this.favorites) {
      return favorites.map(function(fav) {
        return fav["id"];
      });
    }
  }
}
