/*// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  var heatmapInstance = h337.create({
    container: document.getElementById('heatmapContainer')
  });

  var points = [];
  var max = 0;
  var width = 840;
  var height = 400;
  var len = 200;

  var point = {
  	x: Math.floor(.5 * width),
  	y: Math.floor(.7 * height),
  	value: 100
  };
  
  points.push(point);

  var data = {
   max: max,
   data: points
 };

 heatmapInstance.setData(data);
});*/