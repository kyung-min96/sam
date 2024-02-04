
$(function(){

	
    var width = $(window).width();
    if(width >= 1050){
        $('#main-menu > li').mouseenter(function(){
            $(this).find('.sub-menu').stop().slideDown();
            $('#nav-drop').addClass('drop');
            
        });
        $('#main-menu > li').mouseleave(function(){
            $(this).find('.sub-menu').stop().slideUp();
            $('#nav-drop').removeClass('drop');
        });
        
    }
	

    else if(width < 1050){
    $('#main-menu > li').mouseenter(function(){
        $(this).find('.sub-menu').stop().slideDown();
    });
    $('#main-menu > li').mouseleave(function(){
        $(this).find('.sub-menu').stop().slideUp();
    });


    $('.trigger').change(function(){
        if($('.trigger').is(":checked")){
            $(this).toggleClass('active');
        $('#main-menu').toggleClass('active');
        }else{
            $(this).toggleClass('active');
            $('#main-menu').toggleClass('active');
            }
    });

    }
});
$(function(){
    $('#id-x').click(function(){
       alert('로그인후 글을 작성하실수 있습니다');
    });
 });
$(function(){
    $('.login_xbtn').click(function(){
       alert('로그인후 이용하실수있습니다.');
    });
 });
$(function(){
    $('.notsame').click(function(){
       alert('본인이 작성한 글만 수정 삭제가능합니다.');
    });
 });