
    var AlertMes = {
    
        MesSuccess : function(message){
        var item = '<div class="alertMes"><p></p></div>';
        var mes = message;
        $('body').append(item);
        $('.alertMes').fadeOut(2000);
        $('.alertMes p').html(mes);
        $('.alertMes').addClass('success');
    },
        MesFail : function(message){
        var item = '<div class="alertMes"><p></p></div>';
        var mes = message;
        $('body').append(item);
        $('.alertMes').fadeOut(2000);
        $('.alertMes p').html(mes);
        $('.alertMes').addClass('fail');
        }
}