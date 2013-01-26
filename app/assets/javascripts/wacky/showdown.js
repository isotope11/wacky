$(function(){
  if($('#showdown_preview')[0]){
    var editor = ace.edit("page_editor");
    var converter = new Showdown.converter();
    var textarea = $('#page_body');
    var previewArea = $('#showdown_preview');
    var updatePreview = function(){
      previewArea.html(converter.makeHtml(editor.getSession().getValue()));
    };
    editor.getSession().on('change', updatePreview);
    updatePreview();
  }
});
