<!--
Show a button in touch device to quickly scroll to next page,
adapt to text to easily continue reading
-->

<x-quick-scroll>
  <next name="btnNext" ontouchend={ scrollNext } onclick={ scrollNext }>
    <svg g version="1.1" xmlns="http://www.w3.org/2000/svg" width="32px" height="32px" viewBox="0 0 460 460">
      <path fill="#0093af" d="M225.923,354.706c-8.098,0-16.195-3.092-22.369-9.263L9.27,151.157c-12.359-12.359-12.359-32.397,0-44.751
          c12.354-12.354,32.388-12.354,44.748,0l171.905,171.915l171.906-171.909c12.359-12.354,32.391-12.354,44.744,0
          c12.365,12.354,12.365,32.392,0,44.751L248.292,345.449C242.115,351.621,234.018,354.706,225.923,354.706z"/>
    </svg>
  </next>
  <style scoped>
  next {
    display: block;
    position: fixed;
    width: 60px;
    height: 60px;
    bottom: -10px;

    opacity: 0.4;
    right: 0;
  }
  </style>
  <script>
  var scrollByAnimated = function(scrollY, duration) {
    // gist here https://gist.github.com/loadedsith/857540fd76fe9c0609c7
    var startTime = new Date().getTime();

    var startY = window.scrollY;
    var endY = startY + scrollY;
    var currentY = startY;
    var directionY = scrollY > 0 ? 'down' : 'up';

    var animationComplete;
    var count = 0;

    var animationId;

    if (duration === undefined) {
      duration = 250; //ms
    }

    //grab scroll events from the browser
    var mousewheelevt=(/Firefox/i.test(navigator.userAgent))
      ? "DOMMouseScroll" : "mousewheel" // FF doesn't recognize mousewheel as of FF3.x

    //stop the current animation if its still going on an input from the user
    var cancelAnimation = function () {
      if (animationId !== undefined) {
        window.cancelAnimationFrame(animationId)
        animationId=undefined;
      }

    }

    if (document.attachEvent) {
      //if IE (and Opera depending on user setting)
      document.attachEvent("on"+mousewheelevt, cancelAnimation)
    } else if (document.addEventListener) {
      //WC3 browsers
      document.addEventListener(mousewheelevt, cancelAnimation, false)
    }

    var step = function (a,b,c) {
      var now = new Date().getTime();
      var completeness = (now - startTime) / duration;
      window.scrollTo(0, Math.round(startY + completeness * scrollY));
      currentY = window.scrollY;
      if (directionY === 'up') {
        if (currentY === 0) {
          animationComplete = true;
        }else{
          animationComplete = currentY<=endY;
        }
      }
      if (directionY === 'down') {
        /*limitY is cross browser, we want the largest of these values*/
        var limitY = Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);
        if (currentY + window.innerHeight === limitY) {
          animationComplete = true;
        }else{
          animationComplete = currentY>=endY;
        }
      }

      if (animationComplete===true) {
        /*Stop animation*/
        return;
      }else{
        /*repeat animation*/
        if (count > 500) {
          return;
        }else{
          count++;
          animationId = window.requestAnimationFrame(step);
        }
      }
    };
    /*start animation*/
    step();
  };
  if ('ontouchend' in window) {
    var header = document.getElementsByTagName('header')[0],
      headerMargin = 50;
    if (typeof header !== 'undefined') {
      headerMargin = header.clientHeight;
    }
    this.btnNext.style.right = (window.screen.width / 2 - 30) + 'px';
    this.scrollNext = function() {
      var offset = window.screen.height - 2 * headerMargin;
      if (false && 'requestAnimationFrame' in window) {
        scrollByAnimated(offset, 300);
      } else {
        window.scrollBy(0, offset);
      }
      ga('send', 'event', 'next', location.pathname);
    };
  } else {
    this.btnNext.style.display = 'none';
  }
  </script>
</x-quick-scroll>
