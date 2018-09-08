$(function() {
var dropdown = $('.dropdown');
$('li', dropdown)
.mouseover(function(e) {
$('ul', this).stop().slideDown(10);
})
.mouseout(function(e) {
$('ul', this).stop().slideUp(100);
});
});
