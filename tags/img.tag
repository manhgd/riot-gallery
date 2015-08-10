<!--
Loads image varies by device

Opts: {
  src: '/path/image.jpg',
  pattern: {
    normal: 'normal/path',
    mobile: 'mobile/path',
    x2: 'big-size/path'
  }
} -->
<x-img>
  <img name="image">
  <style scoped>
  :scope {
    display: block;
  }
  </style>
  <script>
  var isLimited = (document.body.clientWidth < 660 ||
    navigator.userAgent.match(/iPad|iPhone|iPod|Blackberry|Android|[Mm]ini|[Mm]obile/));
  var originalSrc = opts.src;
  for (var key in this.opts) {
    if (!this.opts.hasOwnProperty(key)) continue;
    this.image.setAttribute(key, this.opts[key]);
  }
  if (isLimited) {
    this.image.setAttribute('src', originalSrc.replace(
      opts.pattern.normal, opts.pattern.normal.mobile
    ));
    this.image.setAttribute('srcset', originalSrc.replace(
      opts.pattern.normal, opts.pattern.x2
    ) + " 2x");
  }
  </script>
</x-img>
