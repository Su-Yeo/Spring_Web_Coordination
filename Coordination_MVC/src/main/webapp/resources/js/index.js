/* JS for demo only */
var colors = ['ff0000', 'ff8000', 'ffff00', '40ff00', '0080ff', '7401df', '000000'];

colors.each(function (color) {
  $$('.color-picker')[0].insert(
    '<div class="square" style="background: #' + color + '"></div>'
  );
});
/*
$$('.color-picker')[0].on('click', '.square', function(event, square) {
  background = square.getStyle('background');
  $$('.custom-dropdown select').each(function (dropdown) {
    dropdown.setStyle({'background' : background});
  });
});
*/


/*
 * Original version at
 * http://red-team-design.com/making-html-dropdowns-not-suck
 */