import noUiSlider from 'nouislider';
export const slider = () => {
  // let slider = document.getElementById("myRange");
  // let output = document.getElementById("demo");
  // output.innerHTML = slider.value;

  // slider.oninput = function() {
  //   output.innerHTML = this.value;
  // };
  var stepSlider = document.getElementById('slider');

  noUiSlider.create(stepSlider, {
      start: [4000],
      step: 100,
      connect: 'lower',
      range: {
          'min': [450],
          'max': [2600]
      }
  });
  var stepSliderValueElement = document.getElementById('slider-step-value');

  stepSlider.noUiSlider.on('update', function (values, handle) {
      stepSliderValueElement.innerHTML = values[handle];
  });
};