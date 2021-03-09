import 'nouislider/distribute/nouislider.css';
import noUiSlider from 'nouislider/distribute/nouislider.js';

[110, 172, 230, 250, 255, 275, 300, 345, 346, 350, 355, 370, 390, 470, 500, 520, 806, 810, 1055, 1335, 1521]

export const slider = () => {
  const  range = {
      'min': [110],
      '10%': [172],
      '15%': [230],
      '20%': [250],
      '25%': [255],
      '30%': [275],
      '35%': [300],
      '40%': [345],
      '45%': [346],
      '50%': [350],
      '55%': [355],
      '60%': [370],
      '65%': [390],
      '70%': [470],
      '75%': [500],
      '80%': [806],
      '85%': [810],
      '90%': [1055],
      '95%': [1335],
      'max': [1521],
  }
  const slider = document.getElementById('slider');
  noUiSlider.create(slider, {
      start: [110],
      tooltips: true,
      snap: true,
      connect: 'lower',
      range: range,
      pips: {
        mode: 'positions',
        values: [5, 20, 40, 60, 80, 100],
        density: 5,
        stepped: true
    },

    format: {
      // 'to' the formatted value. Receives a number.
      to: function (value) {
          return value + 'lm'
      },
      // 'from' the formatted value.
      // Receives a string, should return a number.
      from: function (value) {
          return Number(value.replace(',-', ''));
      }
  }

  });

  const stepSliderValueElement = document.getElementById('slider-step-value');
  const brightness = document.getElementById('brightness');

  slider.noUiSlider.on('update', function (values, handle) {
      // stepSliderValueElement.innerHTML = values[handle];
      brightness.value = values[handle];
  });
};
