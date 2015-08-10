<!--
  Show list of thumbnails with captions, above is a big viewer.

  Features:
  * Preload on going-to view images

  opts: {
    images: [
      # Each item can be a string and an object
      {}
    ]
  }
-->
<x-gallery>
  <div class="viewer">
    <img src={ activeImage } if={ hasImage } />
    <div class="overlay">{ title }</div>
  </div>
  <div class="thumnails">
    <div class="thumnail" each={ img, i in opts.images }>
      <img data-index={ i } src={ parent.smallImage(img) }  onclick={ parent.changeImage } />
    </div>
  </div>

  <style scoped>
  :scope {
    display: block;
    padding: 10px;
    max-width: 640px;
    text-align: center;
    /*
    background: #777;
    color: #fff;
    */
  }
  .viewer {
    width: 100%;
    overflow: hidden;
  }
  .thumnail {
    width: 60px;
    overflow: hidden;
    display: inline-block;
    cursor: pointer;
  }

  .thumnail img {
    height: 60px;
    max-width: none !important;
    border: solid 2px #ccc;
  }

  .viewer img {
    width: auto;
    max-width: none !important;
  }

  @media (min-width: 640px) {
    .viewer img {
      height: 350px;
    }
  }
  @media (max-width: 640px) {
    .viewer img {
      height: 250px;
    }
  }
  /* TODO
  .viewer .overlay {
    background: #fff;
    position: relative;
    bottom: 0;
    opacity: 0.9;
  }
  */
  </style>

  <script>
  "use strict";
  this.images = opts.images;
  this.hasImage = this.images[0];
  
  this.smallImage = function(item) {
    return item.constructor === String ? item : item.small;
  };

  this.setImage = function(index) {
    var item = this.images[index];
    if (item.constructor == String) {
      this.title = '';
      this.activeImage = item;
    } else {
      this.activeImage = item.large;
      this.title = item.title;
    }
  };
  
  if (this.hasImage) {
    this.setImage(0);
    this.changeImage = (function(e) {
      var index = e.target.getAttribute('data-index');
      this.setImage(index);
      if ('ga' in window) {
        ga('send', 'event', 'gallery', location.pathname, this.images[index]);
      }
    }).bind(this);
  }
  window.addEventListener('DOMContentLoaded', (function() {
    // preload images
    var buffer = [];
    for (var i = 0; i < this.images.length; i++) {
      if (this.images[i].large) {
        buffer[i] = new Image();
        buffer[i].src = this.images[i].large;
      }
    }
  }).bind(this));
  </script>
</x-gallery>
