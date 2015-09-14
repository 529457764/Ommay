

jQuery(document).ready(function($) {
    carousel();//设定轮播插件单个图片轮播时间
});



function carousel() {
        $('.carousel').carousel({interval: 5000});
}

