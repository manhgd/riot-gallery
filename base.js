define('tag', function() {
  return {
    load: function(resource, require, done) {
      riot.compile('/static/' + resource + '.tag', done)
    }
  }
})

define('dom', function() {
  return {
    toggle: function(domNode) {
      if (domNode && domNode.style) {
        domNode.style.display = (domNode.style.display == 'none') ? 'block' : 'none'
      }
    }
  }
})
