function Recipe(attributes) {
  this.id = attributes.id;
  this.title = attributes.title;
  this.yield = attributes.yield;
  this.content = attributes.content;
  this.ingredients = attributes.ingredients;
}

Recipe.prototype.renderLi = function () {
  return Recipe.template(this);
};

$(document).ready(function() {
  // var header;
  // var favoriteIds = [];

  Recipe.templateSource = $('#index-template').html();
  Recipe.template = Handlebars.compile(Recipe.templateSource);



  // $.get('/users/' + currentUserId + '/favorites_data').done(function(response) {
  //   currentUser = response;
  //   for ( element of currentUser.favorites ) {
  //    favoriteIds.push(element.id);
  //   }
  // }); // end current_user favorites ajax


  $.get('/recipes.json').done(function(data) {
    var liString = "";
    // header = '';
    // for (var index in data) {
    //   header += '<div class="row-fluid">' +
    //                  '<li class="list-group-item" style="height:50px;">' +
    //                     '<div class="col-md-8">' +
    //                       '<a href="/recipes/' + data[index].id + '" id="' + data[index].id + '" class="js-recipe-show">' + data[index].title + '</a>' +
    //                     '</div>'
    //   if (currentUser) {
    //     if (favoriteIds.includes(data[index].id)) {
    //       header  +=  '<div class="col-md-4">' +
    //                     '<a href="/recipes/' + data[index].id + '/unfavorite">' + "Unfavorite" + '</a>' +
    //                   '</div>'
    //     } else {
    //       header  +=  '<div class="col-md-4">' +
    //                     '<a href="/recipes/' + data[index].id + '/favorite">' + "Favorite" + '</a>' +
    //                   '</div>'
    //     }
    //   }
    // }

    // $('.list-group').html(
    //       header +
    //     '</li>' +
    //   '</div>'
    // )
    for (recipe of data) {
      var tempRecipe = new Recipe(recipe);
      if (currentUser.fav_ids().includes(tempRecipe.id)) {
        tempRecipe.fav = "unfavorite";
      } else {
        tempRecipe.fav = "favorite";
      }
      liString += tempRecipe.renderLi();
    }

    $('.list-group').html(liString);
  }); // end recipes index ajax
});
