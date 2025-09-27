// Misc utility functions

function pasteUnicode(char) {
    document.getElementById("comment").innerHTML += char;
}

function copyText(stringy) {
  navigator.clipboard.writeText(stringy);
  // alert("Copied the text: " + stringy);
}

function inCopy() {
  var tooltip = document.getElementById("tooltiptext");
  tooltip.innerHTML = "Copied!";
}

function outCopy() {
  var tooltip = document.getElementById("tooltiptext");
  tooltip.innerHTML = "Copy to Clipboard";
}

// Sets a timeout in case the absurd webring iframe fails to load
function setIframeSrc() {
  var s = "https://ring.koek.club/site/5/button.html";
  var iframe1 = document.getElementById('webring-iframe');
  iframe1.src = s;
  setTimeout(function(){
      if (window.stop) {
          window.stop();
      } else {
          document.execCommand('Stop'); // MSIE
      }
  }, 5000);
}
setTimeout(setIframeSrc, 5000);
