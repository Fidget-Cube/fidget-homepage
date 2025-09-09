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
