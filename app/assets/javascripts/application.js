// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require jquery.instagram
//= require_tree .

$(function(){ $(document).foundation(); });


jQuery.fn.extend({
insertAtCaret: function(myValue){
  return this.each(function(i) {
    if (document.selection) {
      //For browsers like Internet Explorer
      this.focus();
      sel = document.selection.createRange();
      sel.text = myValue;
      this.focus();
    }
    else if (this.selectionStart || this.selectionStart == '0') {
      //For browsers like Firefox and Webkit based
      var startPos = this.selectionStart;
      var endPos = this.selectionEnd;
      var scrollTop = this.scrollTop;
      this.value = this.value.substring(0, startPos)+myValue+this.value.substring(endPos,this.value.length);
      this.focus();
      this.selectionStart = startPos + myValue.length;
      this.selectionEnd = startPos + myValue.length;
      this.scrollTop = scrollTop;
    } else {
      this.value += myValue;
      this.focus();
    }
  })
}
});

console.log("What's up? Type easterEgg.hi();")
var easterEgg = {
  hi: function() {
    $("body").prepend("<div id='nerd' style='width: 100%; height: 400px; position: relative;'><div style='text-align: center; width: 50%; height: 350px; overflow: auto; margin: auto; position: absolute; top: 0; left: 0; bottom: 0; right: 0;'><h1>Hello Fellow Nerd</h1><img src='http://24.media.tumblr.com/695a8517bdf3ab7acb878ced176a431e/tumblr_mr5a11unVz1r9b6k3o1_500.gif' /></div></div>");
    return ":p";
  },

  bye: function() {
    $("#nerd").remove();
    return " (╯°□°）╯︵ ┻━┻";
  }
};

