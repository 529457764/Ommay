$(function(){
    var listItem = $(".list-group-item");    		
    for(var i=0; i<listItem.size(); i++) {
    	if(listItem.eq(i).attr("data-url") === $("#showBox").attr("data-box")) {
    		listItem.eq(i).addClass("active");
    	}
    }
    var $box = $("#showBox");
    $box.addClass("show");
});

function showPage(item, box, path, type) {
	box.removeClass("show").css({"opacity": "0"});
	item.prevAll().removeClass("active");
	item.nextAll().removeClass("active");
	item.addClass("active");
	var url = item.attr("data-url");
	box.empty();
	box.load(path + url + type);
	function show (box) {
		box.addClass("show").css({"opacity": "1"});
	}
	setTimeout(function(){
		show(box);
	}, 100);
}

function display(item, box) {
	box.removeClass("show").css({"opacity": "0"});
	item.prevAll().removeClass("active");
	item.nextAll().removeClass("active");
	item.addClass("active");

	var url = item.attr("data-url");
	box.empty();
	//box.load(path + url + type);
	box.load(url);
	
	function show (box) {
		box.addClass("show").css({"opacity": "1"});
	}
	setTimeout(function(){
		show(box);
	}, 100);
}

//author Doson
function loadPage(item, box,url) {
	box.removeClass("show").css({"opacity": "0"});
	item.prevAll().removeClass("active");
	item.nextAll().removeClass("active");
	item.addClass("active");
	box.empty();
	box.load(url);
	function show (box) {
		box.addClass("show").css({"opacity": "1"});
	}
	setTimeout(function(){
		show(box);
	}, 100);
}