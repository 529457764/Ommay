$(document).ready(function () { 
		
		/**
		 * 判断列表是否为空
		 */
		
		chkListEpy();
		
		/*判断是否有会员列表*/
		
		chkClinetName();
        
        $('#show-client-list').show().siblings('div').hide();
  
        /*
         * 获取信息列表
         * */
        $.ajax({
            url: 'http://localhost:8080/Ommay/check/UserMessage/getUserMessage',
            type: 'post',
        })
        .done(function(data) {
            //var data = $.parseJSON(data);
            console.log(data);
            var email = data.result[0].emailDoctor,
                account = data.result[0].accountDoctor,
                name = data.result[0].nameDoctor,
                phone = data.result[0].phoneDoctor;
            $('#user-ID').html(account);
            $('.user-ID #user-ID').html(account);
            $('#email').html(email);
            //$('#name').html(name);
            $('.user-name #user-name').html(name);
            $('#phone').html(phone);
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });
        
        /*
         * 点击姓名发送ID
         * */
        $('#show-client-list .td-active').click(function(event) {
            /* Act on the event */
        	
            var username = $('#show-client-list .td-active').html();
            //console.log(username);
         
        var url = "http://localhost:8080/Ommay/doctor/getSingleClientTestList";
        url = url + '?accountName='+ username ;
        var str = "" , item = "" ,inc = "" ,
    	operator = "" ,
    	status = "" ,
    	testTimes = "" ,
    	updateTime = "",
    	uid = "" ;
            $.ajax({
              url: url,
              type: "get",
         success:function(data){
             if (data){
                //console.log(data);
                var len = data.result.length
                	;
                for( var i = 0 ; i < len ; i++ ){
                	datas = data.result[i];
                	inc = datas.inc;
                	operator = datas.operator;
                	status = datas.status;
                	testTimes = datas.testTime;
                	updateTime = datas.updateTime;
                	uid = datas.uidIndent;
                	inc = datas.inc;
                	item = '<tr><td>' + (i+1) + '</td><td>' + uid + "</td><td>" + testTimes +'</td><td>' +
                	status + '</td><td>' + updateTime + '</td><td>' + operator + '</td><tr>';
                	str = str + item ;
                }
                $('#chkUpList table').find('tbody').empty().append(str);
                chkPhysicalStat();
               
             }  else{
                 console.log('error');
             }
             
        }
            });
            //console.log(inc);
          $('#client-result-list .header-title h4 span').html(username);
          $('#client-result-list .header-content .client-name').html(username);
          
          
        });

       
        $(document).on('click','.search-client>a',function(){
        $('.tab-content>'+$(this).attr('data-target')).show().siblings('div').hide();});
        
        
        /*
         * 发送体检结果给后台
         * 
         * */
        $(document).on('click','#result-submit',function(){
        	var $td = $('#insert-result tbody tr td');
            var $len = $('#insert-result tbody tr').length;
            //console.log($len);
            var uid , result , flag = true;
            url = "http://localhost:8080/Ommay/doctor/saveResult?result=";
            for(var i = 0 ; i<$len ; i++){
            	uid = $td.eq(i*3).html();
            	result = $td.eq(i*3+2).find('input').val();
            	if(result == null){
            		flag=false;
            	}
            	url += uid + '_' + result +'-';
            }
            if(flag){
            	$.ajax({
                	url:url,
                	type:'post',
                	success:function(data){
                		//console.log("data"+data);
                		if(data){
                			AlertMes.MesSuccess('提交成功');
                			setTimeout(function(){
                				 window.location.reload();
                			},3000);
                		}else{
                			AlertMes.MesFail('提交失败，请重试');
                		}
                	}
                })
            }else{
            	AlertMes.MesFail('提交失败，有体检结果未填写');
            }
            
        } );
});

    var chkPhysicalStat = function(){
        var $td = $('#chkUpList tbody td'),
            len = $('#chkUpList tbody tr').length;
        for (var i = len - 1; i >= 0; i--) {
            var $action = $td.eq(i*6+3);
            var content = $action.html();
            //console.log(content);
            if( content == "等待体检" ){
                $action.addClass('td-active');
                $action.click(function(event) {
                    /* Act on the event */
                    $('#client-result-list').css("display","none");
                    $('#insert-result').css("display","block");     
                });
                //console.log(content);
            }else if( content == "查询结果" ){
                $action.addClass('td-active');
                $action.click(function(event) {
                    /* Act on the event */
                    $('#client-result-list').css("display","none");
                    $('#client-result-before').css("display","block");     
                    var uid = $('#show-client-list table tbody tr td').eq(1).html();
                    var url = "http://localhost:8080/Ommay/doctor/getIndentDetail?uidIndent="+ uid ;
                    console.log(url);
                    var result,uid,type,item="", str="";
                    $.ajax({
                    	url:url,
                    	type:'post',
                    	success:function(data){
                    		console.log(data);
                    		var len = data.result.length;
                    		for(var i = 0 ; i < len ; i++){
                    			result = data.result[i].result;
                    			type = data.result[i].type;
                    			uid = data.result[i].uidOrderDetail;
                    			item = "<tr><td>" + uid + "</td><td>" + type + "</td><td>" +
                    					result + "</td></tr>";
                    			str += item ;
                    		}
                    		$('#client-result-before table tbody').empty().append(str);
                    		$('#client-result-before .header-title h4 span').html(data.result[0].name);
                    		$('#client-result-before .header-content .client-sal').html(data.result[0].operator);
                    		$('#client-result-before .header-content .check-time').html(data.result[0].time);
                    		$('#client-result-before .client-name').html(data.result[0].name);
                    		var username = $('.dropdown  span').html();
                    		$('#client-result-before .check-doctor').html(username);
                    		
                    	}
                    })
                });
            }else{
                //console.log("其它");
            }
        };
    }

    var chkClinetName = function(){
        var $td = $('.show-cl-list tbody tr td');
        var $len = $('.show-cl-list tbody tr').length;
        var $action;
        for (var i = $len - 1; i >= 0; i--) {
            $action = $td.eq(i*7+2);
            if($action.html()!="无"){
            	$action.addClass('td-active').click(function(event) {
                    /* Act on the event */
                    $('#client-result-list').show().siblings('div').hide();
                    
                });
            }
            
        };
        for (var i = $len - 1; i >= 0; i--) {
            $action = $td.eq(i*7+4);
                var content = $action.html();
                //console.log(content);
                if( content == "等待体检" ){
                    $action.addClass('td-active');
                    $action.click(function(event) {
                        /* Act on the event */
                    $('#insert-result').show().siblings('div').hide();     
                    });
                    var uid = $('#show-client-list table tbody tr td').eq(1).html();
                    var url = "http://localhost:8080/Ommay/doctor/getIndentDetail?uidIndent="+ uid ;
                    console.log(url);
                    var result,uid,type,item="", str="";
                    $.ajax({
                    	url:url,
                    	type:'post',
                    	success:function(data){
                    		console.log(data);
                    		var len = data.result.length;
                    		for(var i = 0 ; i < len ; i++){
                    			type = data.result[i].type;
                    			uid = data.result[i].uidOrderDetail;
                    			item = "<tr><td>" + uid + "</td><td>" + type + "</td><td><input type='\"text\"' placeholder='\"请输入体检结果\"' /></td></tr>";
                    			str += item ;
                    		}
                    		$('#insert-result table tbody').empty().append(str);
                    		$('#insert-result .header-title h4 span').html(data.result[0].name);
                    		$('#insert-result .header-content .client-sal').html(data.result[0].operator);
                    		$('#insert-result .header-content .check-time').html(data.result[0].time);
                    		$('#insert-result .client-name').html(data.result[0].name);
                    		var username = $('.dropdown  span').html();
                    		$('#insert-result .check-doctor').html(username);
                    		
                    	}
                    })
                    
                    
                    
                    
                }else if( content == "查询结果" ){
                    $action.addClass('td-active');
                    $action.click(function(event) {
                        /* Act on the event */
                    $('#client-result-before').show().siblings('div').hide();
                    /*
                     * 获取uid
                     * */
                    var uid = $('#show-client-list table tbody tr td').eq(1).html();
                    var url = "http://localhost:8080/Ommay/doctor/getIndentDetail?uidIndent="+ uid ;
                    console.log(url);
                    var result,uid,type,item="", str="";
                    $.ajax({
                    	url:url,
                    	type:'post',
                    	success:function(data){
                    		console.log(data);
                    		var len = data.result.length;
                    		for(var i = 0 ; i < len ; i++){
                    			result = data.result[i].result;
                    			type = data.result[i].type;
                    			uid = data.result[i].uidOrderDetail;
                    			item = "<tr><td>" + uid + "</td><td>" + type + "</td><td>" +
                    					result + "</td></tr>";
                    			str += item ;
                    		}
                    		$('#client-result-before table tbody').empty().append(str);
                    		$('#client-result-before .header-title h4 span').html(data.result[0].name);
                    		$('#client-result-before .header-content .client-sal').html(data.result[0].operator);
                    		$('#client-result-before .header-content .check-time').html(data.result[0].time);
                    		$('#client-result-before .client-name').html(data.result[0].name);
                    		var username = $('.dropdown  span').html();
                    		$('#client-result-before .check-doctor').html(username);
                    		
                    	}
                    })
                    
                });
                }else{

                }
        }
}
    
    function chkListEpy(){
    	var it = $('.list-group .list-group-item').eq(1).hasClass('active');
    	if(it){
    	var item = $('#show-client-list table tbody tr').length;
    	if(item<=0){
    		AlertMes.MesFail("无此订单");
    	}
    	}
    }