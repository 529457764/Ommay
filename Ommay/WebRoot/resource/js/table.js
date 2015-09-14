function table() {
    $(document).ready(function () {
//    	target = "#doctor";
//    	function setTg(target){
//    		this.target = target;
//    		console.log(target);
//    	}
//    	$('.nav-tabs').on('click','li a',function(){
//    		target = $(this).data("target");
//    		this.target = target;
//    		setTg(target);
//    		curPage = 1;
//    	});
    	var target;
    	target=$('.nav-tabs li.active a').data("target");
    	
        var pageSize = 4;//每页显示的记录条数
        var len;        //数据量总条目
        var page;   
        len = $(target+" tbody tr").length;
        page = len % pageSize == 0 ? len / pageSize : Math.floor(len / pageSize) + 1;//根据记录条数，计算页数
        //  alert("page==="+page);
        curPage = 1;
        $(target+" tbody tr").hide();
        console.log(target+"---"+len+"---"+page);
        $(target+' tbody tr').each(function (i) {
            if (i >= 0 && i < pageSize)//显示第page页的记录
            {   $(this).show();
            } 
        });
        $(target+" #product_home_page").click(function () {
            curPage=1;
            $(target+" tbody tr").hide();
            $(target+" tbody tr").each(function (i) {
                if (i >= 0 && i < pageSize)//显示第page页的记录
                    $(this).show();
            });
            console.log("首页");
        });
        $(target+" #product_down_page").click(function () {
            
            console.log(curPage);
            var tmp;
            if((len / pageSize) > Math.floor(len / pageSize) ){
            	tmp = Math.floor(len / pageSize) +1 ;
            }else{
            	tmp = Math.floor(len / pageSize);
            }
            if( curPage < tmp){
                $(target+" tbody tr").hide();
                var beg = curPage * pageSize - 1;
                var last = beg + pageSize;
                curPage ++;
                $(target+" tbody tr").each(function (i) {
                    if (i > beg && i <= last) {
                        $(this).show();
                    }
                });
            }else{
                AlertMes.MesFail("最后一页");
            }
            
        })
        $(target+" #product_up_page").click(function () {
            console.log(curPage);
           if( curPage > 1){
                $(target+" tbody tr").hide();
                --curPage;
                var last = curPage * pageSize - 1;
                var beg = last - pageSize;
                
                $(target+" tbody tr").each(function (i) {
                    if (i > beg && i <= last) {
                        $(this).show();
                    }
                });
            }else{
                AlertMes.MesFail("当前首页");
            }
        });
        $(target+" #product_end_page").click(function () {
        	console.log(curPage);
            $(target+" tbody tr").hide();
            curPage = Math.floor(len / pageSize)+1 ;
            $(target+" tbody tr").each(function (i) {
            	page = len/pageSize ;
            	var last = "";
            	if(len%pageSize==0){
            		last = len - pageSize;
            	}else{
            		last = len - len%pageSize;
            	}
                console.log(len+"--"+last);
                if (i >= last && i < len)//显示第page页的记录
                    $(this).show();
            });
    });
    
    });
}