// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(function(){
$(document).on('turbolinks:load', function(){
    $(function(){
  
      //プレビューのhtmlを定義
      function buildHTML(count) {
        var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
        return html;
      }
  
      
  
      // プレビューの追加
      $(document).on('change', '.hidden-field', function() {
        setLabel();
        //hidden-fieldのidの数値のみ取得
        var id = $(this).attr('id').replace(/[^0-9]/g, '');
        //labelボックスのidとforを更新
        $('.label-box').attr({id: `label-box--${id}`,for: `snkr_images_attributes_${id}_image`});
        //選択したfileのオブジェクトを取得
        var file = this.files[0];
        var reader = new FileReader();
        //readAsDataURLで指定したFileオブジェクトを読み込む
        reader.readAsDataURL(file);
        //読み込み時に発火するイベント
        reader.onload = function() {
          var image = this.result;
          //プレビューが元々なかった場合はhtmlを追加
          if ($(`#preview-box__${id}`).length == 0) {
            var count = $('.preview-box').length;
            var html = buildHTML(id);
            //ラベルの直前のプレビュー群にプレビューを追加
            var prevContent = $('.label-content').prev();
            $(prevContent).append(html);
          }
          //イメージを追加
          $(`#preview-box__${id} img`).attr('src', `${image}`);
          var count = $('.preview-box').length;
          id = id++;
          console(id);
          //プレビューが5個あったらラベルを隠す 
          if (count == 5) { 
            $('.label-content').hide();
          }
  
          //ラベルのwidth操作
          setLabel();
          //ラベルのidとforの値を変更
          if(count < 5){
            //プレビューの数でラベルのオプションを更新する
            $('.label-box').attr({id: `label-box--${count}`,for: `snkr_images_attributes_${count}_image`});
          }
        }

      });
  
     
    });
  });
});