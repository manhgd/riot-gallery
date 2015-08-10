<!--
Show an animated image

opts: {
  indicator: 'Loading text'
} -->
<x-loading>
  <svg width="50px" height="50px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
    <rect x="0" y="0" width="100" height="100" fill="none" class="bk"></rect>
    <circle cx="62.0218" cy="50" r="25" fill="#0093AF">
      <animate attributeName="cx" values="25;75;25" keyTimes="0;0.5;1" dur="1s" repeatCount="indefinite"></animate>
    </circle>
    <circle cx="37.9782" cy="50" r="25" fill="#FCA9B1">
      <animate attributeName="cx" values="75;25;75" keyTimes="0;0.5;1" dur="1s" repeatCount="indefinite"></animate>
    </circle>
    <circle cx="62.0218" cy="50" r="25" fill="color">
      <animate attributeName="cx" values="25;75;25" keyTimes="0;0.5;1" dur="1s" repeatCount="indefinite"></animate>
      <animate attributeName="opacity" values="1;1;0;0" keyTimes="0;0.499;0.5;1" dur="1s" repeatCount="indefinite"></animate>
    </circle>
  </svg>
  <span>{ indicator }</span>
  <style scoped>
    :scope {
      display: inline-block;
      line-height: 50px;
    }
    svg {
      position: relative;
      bottom: -1em;
    }
    span {
      line-height: 50px;
    }
  </style>
  <script>
  this.indicator = opts.indicator || 'Sending...';
  </script>
</x-loading>
