$(function() {
    //input을 datepicker로 선언
    $("#datepicker1,#datepicker2").datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
        ,changeYear: true //option값 년 선택 가능
        ,changeMonth: true //option값  월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
        ,buttonText: "선택" //버튼 호버 텍스트              
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    });                    
    
    //초기값을 오늘 날짜로 설정해줘야 합니다.
    $('#datepicker1').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후) 
           
});



let startDate;
let endDate;
let timeDifference;
let daysDifference;
let hotel_d_sum;
let result;
let sel;
let service_total;
let really_total;
let check_guest;

let startMonth;
let startday;
let startDate1;

let endMonth;
let endday;
let endDate1;


function call(){
	startDate = new Date(document.getElementById("datepicker1").value);
	endDate = new Date(document.getElementById("datepicker2").value);

	
	
	// 두 날짜 간의 차이 계산
	timeDifference = endDate.getDate() - startDate.getDate();
			
	console.log(timeDifference);
	//daysDifference = Math.ceil(timeDifference / (1000 * 3600 * 24));

	// 결과 출력
	if(startDate && endDate){
		console.log("두 날짜 간의 차이는 " + timeDifference + "일입니다.");
		document.getElementById('days').innerHTML = timeDifference;
		
		}
		
	console.log($('#hotel_day_sum').text())
	hotel_d_sum = $('#hotel_day_sum').text();
	
	//let nocomma=hotel_d_sum.replace(/,/g/ "");
	
	//console.log("바뀐 거:"+nocomma);
	result = hotel_d_sum * timeDifference
	let comma_result0 = result.toLocaleString('ko-KR');
	document.getElementById('hotel_result').innerHTML = "₩"+comma_result0;
	console.log("호텔 숙박료: "+$('#hotel_result').text())
	

	really_total = service_total + result;
	document.getElementById('real_total').innerHTML = "인원수를 선택하세요.";
	//document.getElementById('real_total').innerHTML = "₩"+really_total;
	
	startMonth = ('0'+(startDate.getMonth()+1)).slice(-2);
	startday = ('0'+startDate.getDate()).slice(-2);
	startDate1 = startMonth+'월 ' +startday+'일';
	console.log(startDate1);
	

	endMonth = ('0'+(endDate.getMonth()+1)).slice(-2);
	endday = ('0'+endDate.getDate()).slice(-2);
	endDate1 = endMonth+'월 ' +endday+'일';
	console.log(endDate1);
	

	sessionStorage.setItem("hotel_result",comma_result0);
	
	
	
}





function ser_percent(){

	sel = $("#sel_box option:selected").val();
	service_total = Math.ceil(result*sel);
	let comma_result1 = service_total.toLocaleString('ko-KR');
	document.getElementById('service_result').innerHTML = "₩"+comma_result1;
	really_total = service_total + result;
	really_total1 = service_total + result;
	let comma_result2 = really_total1.toLocaleString('ko-KR');
	document.getElementById('real_total').innerHTML = "₩"+comma_result2;
	check_guest = $("#sel_box option:selected").text();
	
	sessionStorage.setItem("hotel_service",comma_result1);
    sessionStorage.setItem("hotel_total",really_total);
    sessionStorage.setItem("hotel_total_comma",comma_result2);
	
}





	