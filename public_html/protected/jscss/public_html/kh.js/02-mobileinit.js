// 参考: http://d.hatena.ne.jp/pikotea/20120405/1333631161

$(document).bind('mobileinit', function() {
    $.mobile.defaultPageTransition = 'none';  
});

$(document).delegate('a', 'vclick', function(e) {
    e.preventDefault();
    var link = $(this);
    $.mobile.changePage(link.attr('href'), {
        transition: link.jqmData('transition')
    });
});
