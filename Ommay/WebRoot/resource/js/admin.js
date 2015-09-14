jQuery(document).ready(function() {

    addRow.addRowDoc();
	$('.nav-tabs').on('click','li a',function(){
		tg = $(this).data("target");
		if(tg=="#finance"){
			addRow.addRowFin();
		}else if(tg=="#mag"){
			addRow.addRowMag();
		}else if(tg=="#account-Rpt"){
			addRow.addRowAcc();
		}else if(tg=="#client"){
			addRow.addRowClient();
		}else if(tg=="#worker"){
			addRow.addRowWorker();
		}else{
			addRow.addRowDoc();
		}
	});

    /* 左侧标签栏 */
    var $li_item = $(".list-group-item");
        $li_item.bind("click", function(event){
            $(this).prevAll().removeClass("active");
            $(this).nextAll().removeClass("active");
            $(this).addClass("active");
            var content = this.innerHTML ;
            if (content == $li_item.eq(0).html()) {
                $("#userMag").css("display","block");
                $("#fill-user-info").css("display","none");
                console.log($(this).eq(0).outerText);
            } else if(content == $li_item.eq(2).html()){
                $("#userMag").css("display","none");
                $("#fill-user-info").css("display","block");
                event.preventDefault();
                
            }else if(content == $li_item.eq(1).html()){
             //   $("#userMag").css("display","none");
              //  $("#fill-user-info").css("display","none");
            }
        });

    /**
     * [判断用户名是否有重复]
     * @param  {[type]} event) {         var username [description]
     * @return {[type]}        [description]
     */
    $('#account1').blur(function(event) {
        /* Act on the event */
        var username = $('#account1').val();
        console.log(username);
    var url = "http://localhost:8080/Ommay/account/isAccountExist";
    url = url + '?accountName='+ username ;
        $.ajax({
          url: url,
          type: "get",
     success:function(date){
         if (!date){
             return true;
         }  else{
        	 AlertMes.MesFail("用户重名");
             $('#account1').val('').focus();
         }
         
    }
        });
    });


    $('#ad-submit').click(function(event) {
        /* Act on the event */
        if (checkResign.checkPwd()) {
            console.log("pwd");
            if( checkResign.checkRole() ){
            	return true;
            }else{
            	return false;
            }
        } else{
            //console.log("p-0");
            return false;
        };
    });
    
    
}); 
			
	/**
	 * 完善个人信息bug修复
	 */	

	$(function(){
		if( $('#fill-user-info').is(':visible') ){
			$('.list-group-item').eq(1).click(function(e){
				e.preventDefault();
				$('.list-group-item').eq(2).addClass('active').prev().removeClass('active').css('background-color','#fff');
				AlertMes.MesFail("请完善用户信息");
			})
		}
	})
	
 /**
     * [addRow 添加表格中的数据]
     */
    var addRow ={
        /**
         * [addRowEmpy 添加医生列表]
         * @type {[type]}
         */
        addRowDoc : function(){
            var item = "";
            $.ajax({
                url: 'http://localhost:8080/Ommay/account/flagUser/getFlagDate?flag=2',
                type: 'post',
            })
            .done(function(data) {
                var len = data.result.length;
                //console.log('医生 ---'+ data);
                
                for (var i = 0; i < len; i++) {
                    var email = data.result[i].emailDoctor ? data.result[i].emailDoctor : "暂无" ,
                    account = data.result[i].accountDoctor ? data.result[i].accountDoctor : "暂无",
                    name = data.result[i].nameDoctor ? data.result[i].nameDoctor : "暂无",
                    phone = data.result[i].phoneDoctor ? data.result[i].phoneDoctor : "暂无";                
                      item += "<tr><td>"+ (i+1) + "</td><td>" + account + "</td><td>" + phone +"</td><td>" + email + "</td><td>医生</td><td>success</td></tr>"  
                };
                $('#doctor').find('tbody').empty().append(item);
                table();
            })
            .fail(function() {
                console.log("error");
            })

            
        },
        
        /**
         * [addRowFin 添加财务列表]
         * @type {[type]}
         */
        addRowFin : function(){
            var item = "";
            $.ajax({
                url: 'http://localhost:8080/Ommay/account/flagUser/getFlagDate?flag=3',
                type: 'post',
            })
            .done(function(data) {
                var len = data.result.length;
                //console.log('财务'+data);
                
                for (var i = 0; i < len; i++) {
                    var email = data.result[i].emailFinance ? data.result[i].emailFinance : "暂无" ,
                    account = data.result[i].accountFinance ? data.result[i].accountFinance : "暂无",
                    name = data.result[i].nameFinance ? data.result[i].nameFinance : "暂无",
                    phone = data.result[i].phoneFinance ? data.result[i].phoneFinance : "暂无";                
                      item += "<tr><td>"+ (i+1) + "</td><td>" + account + "</td><td>" + phone +"</td><td>" + email + "</td><td>财务员</td><td>success</td></tr>"  
                };
                $('#finance').find('tbody').empty().append(item);
                table();
            })
            .fail(function() {
                console.log("error");
            })  
        },
        
        /**
         * [addRowMag 添加经理列表]
         * @type {[type]}
         */
        addRowMag : function(){
            var item = "";
            $.ajax({
                url: 'http://localhost:8080/Ommay/account/flagUser/getFlagDate?flag=5',
                type: 'post',
            })
            .done(function(data) {
                var len = data.result.length;
                //console.log(data.result[0].phoneManager);
                
                for (var i = 0; i < len; i++) {
                    var email = data.result[i].emailManager ? data.result[i].emailManager : "暂无" ,
                    account = data.result[i].accountManager ? data.result[i].accountManager : "暂无",
                    name = data.result[i].nameManager ? data.result[i].nameManager : "暂无",
                    phone = data.result[i].phoneManager ? data.result[i].phoneManager : "暂无";    
                    
                    item += "<tr><td>"+ (i+1) + "</td><td>" + account + "</td><td>" + phone +"</td><td>" + email + "</td><td>经理</td><td>success</td></tr>"  
                };
                $('#mag').find('tbody').empty().append(item);
                table();
            })
            .fail(function() {
                console.log("error");
            })  
        },
        
        /**
         * [addRowMag 添加业务员列表]
         * @type {[type]}
         */
        addRowWorker : function(){
            var item = "";
            $.ajax({
                url: 'http://localhost:8080/Ommay/account/flagUser/getFlagDate?flag=6',
                type: 'post',
            })
            .done(function(data) {
                var len = data.result.length;
                for (var i = 0; i < len; i++) {
                    var email = data.result[i].emailWorker ? data.result[i].emailWorker : "暂无" ,
                    account = data.result[i].accountWorker ? data.result[i].accountWorker : "暂无",
                    name = data.result[i].nameWorker ? data.result[i].nameWorker : "暂无",
                    phone = data.result[i].phoneWorker ? data.result[i].phoneWorker : "暂无";    
                    
                    item += "<tr><td>"+ (i+1) + "</td><td>" + account + "</td><td>" + phone +"</td><td>" + email + "</td><td>业务员</td><td>success</td></tr>"  
                };
                $('#worker').find('tbody').empty().append(item);
                table();
            })
            .fail(function() {
                console.log("error");
            })  
        },
        
        /**
         * [addRowAcc 增加客户代表列表]
         * @type {[type]}
         */
        addRowAcc : function(){
            $.ajax({
                url: 'http://localhost:8080/Ommay/account/flagUser/getFlagDate?flag=4',
                type: 'post',
            })
            .done(function(data) {
                var item = "";
                var len = data.result.length;
                //console.log(data);
                for (var i = 0; i < len; i++) {
                    var email = data.result[i].emailGroup ? data.result[i].emailGroup : "暂无" ,
                    account = data.result[i].accountGroup ? data.result[i].accountGroup : "暂无",
                    name = data.result[i].nameMaster ? data.result[i].nameMaster : "暂无",
                    phone = data.result[i].phoneMaster ? data.result[i].phoneMaster : "暂无",
                    workingPhone = data.result[i].workingPhoneMaster ? data.result[i].workingPhoneMaster : "暂无"
                      item += "<tr><td>"+ (i+1) + "</td><td>" + account + "</td><td>" + phone +"</td><td>" + workingPhone +"</td><td>"+ email + "</td><td>success</td></tr>"  
                };
                $('#account-Rpt').find('tbody').empty().append(item);
                table();
            })
            .fail(function() {
                console.log("error");
            }) 
        },


        /**
         * [addRowClient  增加会员列表]
         * @type {[type]}
         */
        addRowClient : function(){
            var item = "";
            $.ajax({
                url: 'http://localhost:8080/Ommay/account/flagUser/getFlagDate?flag=1',
                type: 'post',
            })
            .done(function(data) {
                var item = "";
                var len = data.result.length;
                //console.log(data);
                
                for (var i = 0; i < len; i++) {
                    var email = data.result[i].emailClient ? data.result[i].emailClient : "暂无" ,
                    account = data.result[i].accountClient ? data.result[i].accountClient : "暂无",
                    name = data.result[i].nameClient ? data.result[i].nameClient : "暂无",
                    phone = data.result[i].phoneClient ? data.result[i].phoneClient : "暂无",
                    		sexClient = data.result[i].sexClient ? data.result[i].sexClient : "暂无"
                      item += "<tr><td>"+ (i+1) + "</td><td>" + account + "</td><td>" + name +"</td><td>" + sexClient +"</td><td>"+ phone + "</td><td>"+ email+"</td><td>success</td></tr>"  
                };
                $('#client').find('tbody').empty().append(item);
                table();
            })
            .fail(function() {
                console.log("error");
            });

    } 
        }

    
    var checkResign = {

        checkPwd : function(){
            var pwd = $("#password").val();
            var pwd2 = $("#password2").val();
            if ( pwd === pwd2 ) {
                return true;
            } else{
            	AlertMes.MesFail("两次输入密码不正确");
                return false;
            };
        },

        checkRole : function(){
            var select_role = $("#accountFlag").val(); 
            if (select_role  > 0) {
                console.log(select_role);
                return true;   
            } else{
            	AlertMes.MesFail("角色没选择");
                return false;
            };
        },
    }