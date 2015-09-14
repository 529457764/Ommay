function calendar($year, $month, $day) {
	var year = $year.val();
	var month = $month.val();
	var day = $day.val();
	var totalDay = 0;
	if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 ) {
		totalDay = 31;
	}
	if(month == 4 || month == 6 || month == 9 || month == 11) {
		totalDay = 30;
	}
	if (month == 2) {
		if ((year%4 ==0) && (year%100 != 0) || (year%400 == 0)) {
			totalDay = 29;
		} else {
			totalDay = 28;
		}
	}
	$day.empty();
	var dayStr = '';
	for (var i = 1; i <= totalDay; i++) {
		dayStr+='<option value="'+i+'">'+i+'日</option>'	
	}
	$day.append(dayStr);
}
$(document).ready(function(){
	$.ajax({
        url: 'http://localhost:8080/Ommay/check/UserMessage/getUserMessage',
        type: 'post',
    })
    .done(function(data) {
        //var data = $.parseJSON(data);
        console.log(data);
        var email = data.result[0].emailManager ? data.result[0].emailManager : data.result[0].emailWorker,
            account = data.result[0].accountManager ? data.result[0].accountManager : data.result[0].accountWorker,
            name = data.result[0].nameManager ? data.result[0].nameManager : data.result[0].accountWorker,
            phone = data.result[0].phoneManager ? data.result[0].phoneManager : data.result[0].phoneWorker;
        $('#user-ID').html(account);
        $('.user-ID #user-ID').html(account);
        $('#email').html(email);
        $('#name').html(name);
        $('.user-name #user-name').html(name);
        $('#phone').html(phone);
        $('.dropdown .dropdown-toggle span').html(account);
    })
    .fail(function() {
        console.log("error");
    })
    .always(function() {
        console.log("complete");
    });
})