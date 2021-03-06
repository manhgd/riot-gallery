<!--

Example::

  riot.mount('x-menu-bar', { items: [
    {title: 'Home', href: "/"}
  }]
-->
<x-menu-bar>
  <script>
  var self = this
  this.isActive = (window.innerWidth || document.body.clientWidth) <= 480
  
  require(['base'], function(dom) {
    self.menuToggle = function() {
      dom.toggle(self.nav)
    }
  })

  </script>

  <nav name="nav" hide={ isActive }>
    <div each={ item in opts.items }>
      <a if={ item.href } href={ item.href }>
        { item.title }
      </a>
      <span if={ item.handler } onclick={ item.handler }>
        { item.title }
      </span>
    </div>
  </nav>
  <toggle onclick={ menuToggle } show={ isActive }>
    <!-- Small screen menu button -->
    <svg width="24" height="20" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
      Menu
      <g>
      <rect height="3" width="24" y="0" x="0" fill="#000"/>
      <rect height="3" width="24" y="8" x="0" fill="#000"/>
      <rect height="3" width="24" y="16" x="0" fill="#000"/>
      </g>
    </svg>
  </toggle>

  <style scoped>
  :scope {
    display: block;
    font-family: sans-serif;
  }
  nav>div {
    display: inline-block;
  }
  nav a, nav span {
    display: inline-block;
    padding: 4pt 8pt;
    margin: 0.5pt;
    background: #f0f0f0;
    color: black;
    text-decoration: none
  }
  @media (max-width: 480px) {
    toggle {
      display: inline-block;
      padding: 4pt;
      position: fixed;
      top: 0;
      right: 0;
    }
    nav {
      position: fixed;
      top: 26px; /* should be same as toggle button height */
      right: 0;
    }
    nav a {
      border-top: solid 1px #eee;
      display: block;
      min-width: 150px;
    }
    :scope {
      text-align: right;
    }
  }
  @media (min-width: 481px) {
    toggle {
      display: none
    }
    a:hover {
      background: #333;
      color: white;
    }
  }
  </style>

  <yield/>
</x-menu-bar>
