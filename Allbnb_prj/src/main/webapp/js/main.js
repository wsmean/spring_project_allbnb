window.onload=function(){

	const localyes = localStorage.getItem("my_email");
		
	if(localyes == null){
		$("#logout_btn").hide();
		$("#reserve_btn").hide();	
	}else if (localyes.length >= 1){
		$("#login_btn").hide();
		$("#join_btn").hide();	
	}
}





function changeFn(){
		const floatingSelect  = document.getElementById("floatingSelect");
		const value = (floatingSelect.options[floatingSelect.selectedIndex].value);
		//alert("value = "+value);
		
		location.href="/hotelCountryInform.do?country_name="+value
};

function hello_reserve(){
	const localyes1 = localStorage.getItem("my_email");
	if(localyes1 == null){
		alert("로그인 후 이용해주세요!")
		location.href="hotelInform.do"	
	}else if (localyes1.length >= 1){
		location.href="showReserve.do?email="+localyes1;	
	}
	
	
}

//아이디 중복 확인
function check_id(){
	
	join_e= $("#join_email").val();
	console.log("중복 확인에서 받은 id: "+join_e);
	
	$.ajax({
		type : "get",
		async : false,
		dataType : "text",
		url : "http://localhost:8080/join_check.do",
		//보내는 데이터
		data: {
			email_: join_e,
		},
		//날라오는 데이터
		success : function(data, textStatus) {
			console.log("받은 data는  "+data);
			console.log("받은 textStatus는 :"+textStatus);
			
			if(data === "true"){
				alert("이메일 사용 불가 합니다");
				$("#join_email").val("");
				//$("input[name=checked_id]").val('no');
			}else{
				alert("이메일 사용 가능");
				$("input[name=checked_id]").val('yes');
				
			}				
		},
		error : function(data, textStatus) {
			console.log("에러가 발생")
		},
		complete : function(data, textStatus) {
			console.log("전송 완료되었습니다.")
		}

	});
}

//회원 가입 정보ajax
function join_members(){
	console.log("여기 들어왓나")
	 console.log("이름 : "+$("#join_name").val());
	 console.log("이메 : "+$("#join_email").val());
	 console.log("비밀번호 : "+$("#join_pwd1").val());
	 console.log("비밀번호1 : "+$("#join_pwd2").val());
	 
	 if($("#join_name").val() === "" ||
        $("#join_email").val() === "" ||
        $("#join_pwd1").val() === "" ||
        $("#join_pwd2").val() === ""
        ){
        	alert('정보가 다 입력되지 않았습니다.');
        	//만약 아이디 중복 확인을 눌렀을 때 yes면 밑에 줄력
         }else if($("input[name=checked_id]").val()==""){
         	alert('아이디 중복 확인을 해주세요');
         }else if($('#pwConfirm').text()=='비밀번호 틀림'){
         	alert('비밀번호가 일치하지 않습니다');
         }else if($("input[name=checked_id]").val()=="yes") { 
	 
	$.ajax({
                type : "post",
                async : false,
                dataType : "text",
                url : "http://localhost:8080/insert_join.do",
                data : {
                    user_name: $("#join_name").val(),
                    user_email: $("#join_email").val(),
                    user_pwd: $("#join_pwd2").val(),
                },
                success: function(data, textStatus) {
                console.log("성공");
                },
                error: function(data, textStatus) {
                    console.log("에러가 발생")
                },
                complete: function(data, textStatus) {
                    console.log("전송 완료되었습니다.")
                }
            });	 
            
               if(confirm("계정 생성을 하시겠습니까?")){
		            alert("계정 생성이 완료 되었습니다.");
		            location.reload(true);
		            //location.href="localhost:8080/hotelInform.do"
		        }else{
		            alert("계정 생성이 취소되었습니다.");
		            
		        }          
        }
}

//패스워드 확인
function password_check(){
    	if($('#join_pwd1').val() == $('#join_pwd2').val()){
    		$('#pwConfirm').text('비밀번호 일치').css('color','green')
    	}else{
    		$('#pwConfirm').text('비밀번호 틀림').css('color','red')
    		// password1에서 텍스트를 뗐
    	}
    	
    }
    
    
//로그인  
function login_click(){
	//
	
	email= $("#login_email").val();
	pwd1= $("#login_pwd1").val();
	console.log(email);
	console.log(pwd1);
	
	//로그인id, pw이 db에 있으면 승인 아니면 알림("아이디 정보가 없습니다")
	$.ajax({
		type : "get",
		async : false,
		dataType : "text",
		url : "http://localhost:8080/login.do",
		//보내는 데이터
		data: {
			email_: email,
			pwd_: pwd1
		},
		//날라오는 데이터
		success : function(data, textStatus) {
			console.log("받은 data는  "+data);
			console.log("받은 textStatus는 :"+textStatus);
			
			if(data == "login_true"){
				alert("로그인 성공!");
				//로컬에 아이디 정보 저장하기
				localStorage.setItem('my_email',email);
				location.reload(true);
				
			}else{
				alert("정보 없습니다.\n 회원가입을 진행해주세요");
				$("#login_email").val("");
				$("#login_pwd1").val("");
			}
							
		},
		error : function(data, textStatus) {
			console.log("에러가 발생")
		},
		complete : function(data, textStatus) {

		}
	});
}

//로그아웃
function logout_click(){
	alert("로그아웃됨");
	localStorage.clear();
	location.href='hotelInform.do';
	
}
    