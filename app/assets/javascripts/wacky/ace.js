$(function(){
  var editor = ace.edit("page_editor");
  var textarea = $('#page_body').hide();
  editor.getSession().setValue(textarea.val());
  editor.getSession().on('change', function(){
      textarea.val(editor.getSession().getValue());
  });
  editor.setTheme("ace/theme/solarized_dark");
  editor.getSession().setMode("ace/mode/markdown");
  require(['ace/keyboard/vim'], function(vimMode){
    editor.setKeyboardHandler(vimMode.handler);
  });
});
