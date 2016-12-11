function Recipe(attributes) {
  this.id = attributes.id;
  this.title = attributes.title;
  this.yield = attributes.yield;
  this.content = attributes.content;
  this.ingredients = attributes.ingredients;
}

var ajaxResponse = function(data) {
  var liString = "";

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
}

Recipe.prototype.renderLi = function () {
  return Recipe.template(this);
};

$(document).ready(function() {
  // Render list of recipes:
  Recipe.templateSource = $('#index-template').html();
  Recipe.template = Handlebars.compile(Recipe.templateSource);

  $.get('/recipes.json').done(ajaxResponse); // end recipes index ajax


  // Filter Recipes by ingredient
  $('select').change(function(event) {
    var ingredient = $(this).val();

    $.ajax({
      url: '/recipes.json',
      method: 'GET',
      contentType: "application/json; charset=utf-8",
      data: {ingredient: ingredient}
    }).done(ajaxResponse)
  })
});
