<!--
opts: {
  title: "Label text",
  name: "form_input_name",
  value: "assigned_value",
  ticked: false
}
--><raw>
  this.root.innerHTML = opts.content
</raw>

<x-checkbox>
  <svg onclick={ changeTick } if={ ticked } version="1.1" width="20" height="20" viewBox="0 0 32 32">
  <path fill="#46c9be" d="M28 0h-24c-2.2 0-4 1.8-4 4v24c0 2.2 1.8 4 4 4h24c2.2 0 4-1.8 4-4v-24c0-2.2-1.8-4-4-4zM14 24.828l-7.414-7.414 2.828-2.828 4.586 4.586 9.586-9.586 2.828 2.828-12.414 12.414z"></path>
  </svg>

  <svg onclick={ changeTick } if={ !ticked } version="1.1" width="20" height="20" viewBox="0 0 32 32">
  <path fill="#46c9be" d="M28 0h-24c-2.2 0-4 1.8-4 4v24c0 2.2 1.8 4 4 4h24c2.2 0 4-1.8 4-4v-24c0-2.2-1.8-4-4-4zM28 28h-24v-24h24v24z"></path>
  </svg>

  <raw class={ ticked: ticked } onclick={ changeTick } content={ opts.title } />
  <input if={ ticked } type="hidden" name={ opts.name } value={ opts.value }>
  <script>
  this.ticked = opts.ticked || false;
  this.changeTick = (function() {
    this.ticked = ! this.ticked;
  }).bind(this);
  </script>

  <style scoped>
  :scope {
    cursor: pointer;
  }
  span {
    display: inline-block;
    line-height: 1.2em;
  }
  span:hover {
    color: #46c9be;
  }
  span, svg {
    vertical-align: middle
  }
  svg:hover {
    opacity: 0.8;
  }
  </style>
</x-checkbox>
