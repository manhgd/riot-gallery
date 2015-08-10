window.onerror = function(message, url, line) {
  if (line == 0) return false;
  // TODO Log exception to backend
  // location.pathname + ' @ ' + url + ':' + line + ' ' + message
  // (Array.prototype.slice.call(arguments));
  return true;
};
