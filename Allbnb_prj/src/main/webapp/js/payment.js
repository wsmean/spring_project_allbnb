window.onload=function(){
	let hotel_num1 = sessionStorage.getItem("hotel_num");
    let check_in1 = sessionStorage.getItem("check_in");
	let check_out1 = sessionStorage.getItem("check_out");
	let guest1 = sessionStorage.getItem("guest");
	let hotel_onepay1 = sessionStorage.getItem("hotel_onepay");
	let hotel_bak1 = sessionStorage.getItem("hotel_bak");
	let hotel_result1 = sessionStorage.getItem("hotel_result");
	let hotel_service1 = sessionStorage.getItem("hotel_service");
	let hotel_total1 = sessionStorage.getItem("hotel_total_comma");
	
	document.getElementById('h_day').innerHTML = check_in1+" ~ "+check_out1;
	document.getElementById('g').innerHTML = "게스트 "+guest1;
	document.getElementById('h_one').innerHTML = " X "+hotel_bak1+"박";
	document.getElementById('h_onesum').innerHTML = "₩"+hotel_result1;
	document.getElementById('h_service').innerHTML = "₩"+hotel_service1;
	document.getElementById('h_total').innerHTML = "₩"+hotel_total1;
}


function goreserve(){
    let hotel_num2 = sessionStorage.getItem("hotel_num");
    let email2 = localStorage.getItem("my_email");
    let check_in2 = sessionStorage.getItem("check_in");
    let check_out2 = sessionStorage.getItem("check_out");
    let total_price2 = sessionStorage.getItem("hotel_total");
    let hotel_bak2 = sessionStorage.getItem("hotel_bak");
    console.log("예약 정보");
    console.log(hotel_num2);
    console.log(email2);
    console.log(check_in2);
    console.log(check_out2);
    console.log(total_price2);
    console.log(hotel_bak2);
    console.log("끝");
    
    $.ajax({
		type : "get",
		async : false,
		dataType : "text",
		url : "http://localhost:8080/insertReserve.do",
		//보내는 데이터
		data: {
			r_hotel_num: hotel_num2,
			r_email: email2,
			r_check_in: check_in2,
			r_check_out: check_out2,
			r_total_price: total_price2,
			r_hotel_bak: hotel_bak2

		},
		//날라오는 데이터
		success : function(data, textStatus) {
			console.log("받은 data는  "+data);
			console.log("받은 textStatus는 :"+textStatus);
			
			alert("예약이 완료되었습니다!");				
		},
		error : function(data, textStatus) {
			console.log("에러가 발생")
		},
		complete : function(data, textStatus) {
			console.log("전송 완료되었습니다.")
		}

	});
	sessionStorage.clear();
    location.href='hotelInform.do';
    
};
