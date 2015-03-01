// Place all the behaviors and hooks related to the matching controller here.
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

  var point1 = {
    x: Math.floor(.53 * width),
    y: Math.floor(.74 * height),
    value: 100
  };
  
  var point2 = {
    x: Math.floor(.56 * width),
    y: Math.floor(.74 * height),
    value: 100
  };

  points.push(point);
  points.push(point1);
  points.push(point2);

  var data = {
   max: max,
   data: points
 };

 heatmapInstance.setData(data);
});