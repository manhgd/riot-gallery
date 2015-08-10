<!--
Tick box with persistent using localStorage
opts: {
  
}
-->
<raw>
  this.root.innerHTML = opts.content
</raw>

<x-tick>
  <svg onclick={ changeTick } if={ ticked } version="1.1" width="20" height="20" viewBox="0 0 32 32">
  <path fill="#0093af" d="M28 0h-24c-2.2 0-4 1.8-4 4v24c0 2.2 1.8 4 4 4h24c2.2 0 4-1.8 4-4v-24c0-2.2-1.8-4-4-4zM14 24.828l-7.414-7.414 2.828-2.828 4.586 4.586 9.586-9.586 2.828 2.828-12.414 12.414z"></path>
  </svg>

  <svg onclick={ changeTick } if={ !ticked } version="1.1" width="20" height="20" viewBox="0 0 32 32">
<path fill="#0093af" d="M28 0h-24c-2.2 0-4 1.8-4 4v24c0 2.2 1.8 4 4 4h24c2.2 0 4-1.8 4-4v-24c0-2.2-1.8-4-4-4zM28 28h-24v-24h24v24z"></path>
</svg>

  <raw class={ ticked: ticked } onclick={ changeTick } content={ opts.title } />

  <script>
  var self = this
  this.tickKey = opts.key || sha1(location.pathname + opts.title)
  this.ticked = localStorage.getItem(this.tickKey)
  this.changeTick = function() {
    self.ticked = ! self.ticked
    // Persistent
    if (self.ticked) {
      localStorage.setItem(self.tickKey, 'x')
    } else {
      localStorage.removeItem(self.tickKey);
    }
  }
  </script>

  <style scoped>
  :scope {
    cursor: pointer;
  }
  .ticked {
    color: #999;
  }
  span {
    display: inline-block;
    line-height: 20px;
  }
  span:hover {
    color: #0093af;
  }
  span, svg {
    vertical-align: middle;
  }
  svg:hover {
    opacity: 0.8;
  }
  </style>
</x-tick>
