<!--


-->
<x-rate>
  <span each={ stars } onclick={ parent.rate(level) } class={ level: true, rated: rating >= level }>
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 32 32">
  <path fill="gainsboro" d="M32 12.408l-11.056-1.607-4.944-10.018-4.944 10.018-11.056 1.607 8 7.798-1.889 11.011 9.889-5.199 9.889 5.199-1.889-11.011 8-7.798z"></path>
  </svg>
  </span>
  <input type="hidden" name={ name } value={ rating }>
  <style scoped>
  .rated svg>path {
    fill: gold;
  }
  .level {
    cursor: pointer;
  }
  </style>
  <script>
  opts.max = opts.max || 5;
  opts.fx = opts.fx || function(tag) {
    if ('ga' in window) {
      ga('send', 'event', 'rating', location.pathname, tag.rating);
    }
  };
  this.rating = opts.rating || 0;
  this.name = opts.name || 'rating';
  this.stars = [];
  for (var i = 1; i <= opts.max; i++) {
    this.stars[this.stars.length] = {
      level: i,
    };
  }
  this.rate = function(level) {
    return (function() {
      this.rating = level;
      this.update();
      if (opts.fx) opts.fx(this);
    }).bind(this);
  }
  </script>
</x-rate>
