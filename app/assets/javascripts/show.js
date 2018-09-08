$(function(){
  //ページを表示させる箇所の設定
  var $content = $('.pageDisplay');
  //ボタンをクリックした時の処理
  $(document).on('click', '.profile-navi a', function(event) {
    event.preventDefault();
    //.profile aのhrefにあるリンク先を保存
    var link = $(this).attr("href");
    //リンク先が今と同じであれば遷移しない
    if(link == lastpage){
      return false;
    }else{
      $content.fadeOut(60, function() {
        getPage(link);
      });
      //今のリンク先を保存
      lastpage = link;
    }

  });
  //初期設定
  var lastpage = document.location.href;

  //ページを取得してくる
    function getPage(elm){
      $.ajax({
            type: 'GET',
            url: elm,
            dataType: 'html',
            success: function(data){
                $content.html(data).fadeIn(60);
            },
            error: function() {
                       alert('問題がありました');
                   }
      });
    }
});
