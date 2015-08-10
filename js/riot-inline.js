(function(riot) {
  if (!!riot) return;
  /**
   * Mount a script tag into Riot tag.
   * Used when opts are complex
   *
   * Example:
   *    <script type="riot/inline" data-tag="x-greet">{"title": "Hello"}</script>
   *    <!-- will mounted as same as -->
   *    <x-greet title="Hello"></x-greet>
   */
  riot.inline = function(element) {
    var tags = element ? [element] :
      document.querySelectorAll('script[type=riot/inline]');
    var length = tags.length;
    for (var i = 0; i < length; i++) {
      riot.mount(
        document.createElement(element.getAttribute('data-tag')),
        JSON.parse(element.innerHTML) /* opts */
      );
      element.parentNode.insertBefore(root, element);
    }
  };
  
  // Mount
  riot.inline();

  // TODO find tags and autoload definitions, might be a filter from Python
  riot.mount('*');
})(riot);

