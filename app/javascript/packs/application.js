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



    $(function () {

        var dataBox = new DataTransfer();
          //querySelectorでfile_fieldを取得
            var file_field = document.querySelector('input[type=file]')
        
         $( '#post_pre' ).on("change", function () { 
          var files = $('input[type="file"]').prop('files')[0];
        
          $.each(this.files, function(i, file){// i:数値、file:値
           var fileReader = new FileReader();
            //DataTransferオブジェクトに対して、fileを追加
            dataBox.items.add(file)
            //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
            file_field.files = dataBox.files
           var num = $('.post_pre1').length + 1 + i;
            fileReader.readAsDataURL( file );
        
           fileReader.onloadend = function() {
            var src = fileReader.result
            var html=`<div class="post_preview" id="POST_PREVIEW"><img src="${src}" class="pre1 post_pre1" width="200px" height="200px"></img></div>`
            $('#POST_CONTAINER').before(html);
           };
        
           $('.post_container').attr('class', `item-num-${num}`)
          });
         });
        });

        $(function () {
          $( '#post_pre' ).on("change", function () {
          var selectedFile = this.files[0];
          var fileReader = new FileReader();
          fileReader.onload = function( event ) {
              var loadedImageUri = event.target.result;
              $( '#POST_PREVIEW7' ).empty();
              $( '#POST_PREVIEW7' ).append( '<img src="' + loadedImageUri + '" class="pre1 post_pre1 post_user" width="200px" height="200px">' )
              };
              fileReader.readAsDataURL( selectedFile );
             });

            
          });
          $(function () {
            $( '.modal' ).on("click", function () {   
              $(".ccc").fadeToggle(100);
            });
            $( '.modal2' ).on("click", function () {   
              $(".modal_item").fadeToggle(100);
            });

            
             });


          
      