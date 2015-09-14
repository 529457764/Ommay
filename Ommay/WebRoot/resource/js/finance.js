$(document).ready(function () { 
        var $li_item = $(".list-group-item");
        $('#charge-model').show().siblings('div').hide();
        $('#charge-model #search-id').show().siblings('div').hide();
//        $li_item.on("click", function(){
//            $(this).prevAll().removeClass("active");
//            $(this).nextAll().removeClass("active");
//            $(this).addClass("active");
//            var content = this.innerHTML;
//            $('.panel-heading').html("<h4>"+content+"</h4>");
//            $('.panel-body>'+$(this).attr('data-target')).show().siblings('div').hide();
//        });

        $(document).on('click','#charge-model .search-client>a',function(){
        $('.charge-body>'+$(this).attr('data-target')).show().siblings('div').hide();
            console.log('.charge-body>'+$(this).attr('data-target'));
        });

            /* Act on the event */
            $.ajax({
                url: 'http://localhost:8080/Ommay/check/UserMessage/getUserMessage',
                type: 'post',
            })
            .done(function(data) {
                //var data = $.parseJSON(data);
                console.log(data);
            	var email = data.result[0].emailFinance,
            		account = data.result[0].accountFinance,
            		name = data.result[0].nameFinance,
                    phone = data.result[0].phoneFinance;
                $('#user-ID').html(account);
            	$('.user-ID #user-ID').html(account);
            	$('#email').html(email);
                $('#name').html(name);
                $('.user-name #user-name').html(name);
                $('#phone').html(phone);
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
            
        });
        //AlertMes.MesSuccess('登陆成功');
        //AlertMes.MesFail('登陆失败');
    

