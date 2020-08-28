$(function(){
  $('.parent').hover(function() {
    $(this).children('.nav__content').show();
  }, function() {
    $(this).children('.nav__content').hide();
  });

  $('.child-name').hover(function() {
    $(this).children('.nav__content--grandchild').show();
  }, function() {
    $(this).children('.nav__content--grandchild').hide();
  });
});



// 新規出品ページのカテゴリ選択部分
$(function(){
    
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
  
    
  function appendChildrenBox(insertHTML){
    var childSelectHTML = `<div class="listing-select-wrapper" id="children_wrapper">
    <div class="listing-select-wrapper__box">
                              <select class="listing-select-wrapper__box--select" id="child_category" name="" required="true">
                              <option value="" data-category="---">---</option>
                                ${insertHTML}
                              </select>
                              </div>
                              </div>`;
                              $('.detail--category').append(childSelectHTML);
  }
  
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class="listing-select-wrapper" id="grandchildren_wrapper">
                              <div class="listing-select-wrapper__box">
                              <select class="listing-select-wrapper__box--select" id="grandchild_category" name="item[category_id]" required="true">
                                <option value="" data-category="---">---</option>
                                ${insertHTML}
                                </select>
                              </div>
                              </div>`;
    $('.detail--category').append(grandchildSelectHtml);
  }
  
  
  $('#parent_category').on('change', function() {
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != ""){
      $.ajax({
        url: '/items/get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }  else {
        $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  $('.detail--category').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      
    }
  });

  // 編集ページの子カテゴリー変更時
  $('.detail--category').on('change', '#item_category_id', function(){
    var childId = document.getElementById('item_category_id').value;
    if (childId != ""){
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
    }
    
  });
})
