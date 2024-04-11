<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>상세 화면</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="js/detail.js"></script>
  <script src="js/main.js"></script>
  <style>
    a {
      text-decoration: none;
      color: black;
    }

    p {
      margin: 0;
      padding: 1px;
    }

    .ex1 {
      height: auto;
    }

    .sticky1 {

      position: sticky;
      top: 70px;
      left: 1000px;
    }

    .rounded1 {
      border-radius: 20px;
    }

    .mt70 {
      margin-top: 70px;
    }

    .rb20 {
      border-radius: 0px 0px 20px 0px;
    }

    .rt20 {
      border-radius: 0px 20px 0px 0px;
    }

    .rs20 {
      border-radius: 20px 0px 0px 20px;
    }

    .ui-datepicker-trigger {
      display: none;
    }

    .btnall {
      background-color: #fe5c5f;
      border: #fe5c5f;
      color: white;
    }

    .btnall:hover {
      background-color: #fe5c5f;
      color: white;
    }

    .alignleft {
      float: left;
    }

    .alignright {
      float: right;
    }

    h5 {
      margin-bottom: 15px;
    }
    
    .btnreset{
	      all: unset; 
        }
  </style>
</head>
<body>
<body>
  <!-- 로그인 모달은 바디 최상단에 넣기!! -->
  <!-- 로그인 모달 -->
  <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h4>로그인</h4>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="login.jsp" method="post">
            <img class="mb-4" src="/static/img/brand_icon.png" alt="" width="40" height="40">
            <h3 class="h3 mb-3 fw-normal align-middle" style="display: inline-block;">올비앤비에 오신 것을 환영합니다.</h3>
            <div class="form-floating">
              <input type="text" class="form-control" id="login_email" placeholder="name@example.com">
              <label for="id">이메일</label>
            </div><br>
            <div class="form-floating">
              <input type="password" class="form-control" id="login_pwd1" placeholder="Password">
              <label for="pwd">비밀번호</label>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" style="background-color: #fe5c5f; border: #fe5c5f;" onclick="login_click()">로그인</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 회원 가입 모달 -->
  <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
  aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h4>회원가입</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="login.jsp" method="post">
          <img class="mb-4" src="/static/img/brand_icon.png" alt="" width="40" height="40">
          <h3 class="h3 mb-3 fw-normal align-middle" style="display: inline-block;">사용자 정보를 입력해주세요.</h3>
          <div class="form-floating">
            <input type="text" class="form-control" id="join_name" placeholder="name@example.com">
            <label for="name">이름</label>
          </div><br>
          <div class="form-floating">
            <input type="text" class="form-control" id="join_email" placeholder="name@example.com">
            <label for="email">이메일</label>
          </div><br>
          <div class="form-floating">
            <input type="password" class="form-control" id="join_pwd1" placeholder="Password">
            <label for="pwd">비밀번호</label>
          </div>
          <div class="form-floating">
            <input type="password" class="form-control" id="join_pwd2" placeholder="Password">
            <label for="pwd1">비밀번호 확인</label>
          </div>
          <div>
            <input type="text" readonly class="form-control-plaintext" id="staticEmail"
              value=" 비밀번호가 일치 합니다! or 일치하지 않습니다">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary"
          style="background-color: #fe5c5f; border: #fe5c5f;">회원가입</button>
      </div>
    </div>
  </div>
</div>
  <!-- 상단 메뉴화면 -->
  <nav class="navbar fixed-top bg-white">
    <div class="container-fluid">
      <a class="navbar-brand ms-5" href="hotelInform.do" style="color: #fe5c5f;">
        <img src="/static/img/brand_icon.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
        allbnb
      </a>
      <div class="justify-content-center" id="navbarNavAltMarkup">
        <button class="m-2 btnreset" onclick="hello_reserve()">숙소</button>
        <span class="m-2 disabled" style="color: lightgray;">체험</span>
        <span class="m-2 disabled" style="color: lightgray;">온라인 체험</span>
      </div>
      <div class="d-flex">
        <span class="navbar-text me-3 user-select-none">당신의 공간을 올비앤비하세요</span>
        <img src="/static/img/globe.svg" alt="인터넷아이콘">

        <!-- 사용자 버튼 -->
        <div class="dropdown ms-4 me-5 rounded">
          <a class="btn btn-secondary dropdown-toggle rounded-pill" href="#" role="button"
            style="background-color: #fe5c5f; border: #fe5c5f;" data-bs-toggle="dropdown" aria-expanded="false">
            사용자
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <button type="button" class="dropdown-item" data-bs-toggle="modal"
              data-bs-target="#staticBackdrop1" id="login_btn">로그인</button>
              
              <button type="button" class="dropdown-item" id="logout_btn" onclick="logout_click()">로그아웃</button>
              
            <button type="button" class="dropdown-item" data-bs-toggle="modal"
              data-bs-target="#staticBackdrop2" id="join_btn">회원가입</button>
              
              <button type="button" class="dropdown-item" data-bs-toggle="modal"
              data-bs-target="#staticBackdrop1" id="reserve_btn" onclick="hello_reserve()">예약정보</button>
            <li>
              <hr class="dropdown-divider">
            </li>
            <button class="dropdown-item" onclick="alert('서비스 개발중입니다.')">당신의 공간을 올비앤비하세요</button>
            <button class="dropdown-item" onclick="alert('서비스 개발중입니다.')">도움말 센터</button>
          </ul>
        </div>
      </div>
    </div>
    <!-- </div>   -->
  </nav>
  <hr>
  <!-- 이미지 모음 -->
  <div class="m-5">
    <div class="bg-white container mt70">
	<c:forEach items="${hotelList}" var="hotels" varStatus="status">
	<span hidden="hidden">${hotels.hotel_num}</span>
	<c:set var="hotel_number" value="${hotels.hotel_num}"/>	
      <h2 class="m-3"><strong>${hotels.hotel_title}</strong></h2>
      <div class="m-3 bg-white-subtle">
        <img src=/static/img/${hotels.thumbnail} style="width: 650px; height: 550px;" class="float-start p-1 rs20">
        <img src=/static/img/${hotels.img1} style="width: 300px; height: 275px;" class="p-1">
        <img src=/static/img/${hotels.img2} style="width: 300px; height: 275px;" class="p-1 rt20">
        <img src=/static/img/${hotels.img3} style="width: 300px; height: 275px;" class="p-1">
        <img src=/static/img/${hotels.img4} style="width: 300px; height: 275px;" class="p-1 rb20">
      </div>
      <div class="row">
        <div class="col-8">
          <!-- 부가 설명 -->
          <div class="m-3 ex1">
            <h5><strong>${hotels.hotel_name}</strong></h5>
            <p>${hotels.hotel_explain}</p>
            <hr>
            <!-- 호스트 정보 -->
            <div>
              <img src="/static/img/profile.png" alt="호스트" width="55px">
              <span style="font-size:large;"><strong>호스트 : ${hotels.host_name}</strong><br></span>
            </div>
            <hr>
            <h5><strong>호스팅 지역</strong></h5>
            <!-- 지역 api -->
            <div>
              <img src="/static/img/ex_map.png" class="img-fluid">
            </div>
            <!-- 숙소 편의 시설 -->
            <hr>
            <div class="row">
              <h5><strong>숙소 편의 시설</strong></h5>
              <div class="col">
                <p><img src="/static/img/bath-solid.svg" width="20px"> 욕조</p>
                <p><img src="/static/img/hand-sparkles-solid.svg" width="20px"> 청소용품</p>
                <p><img src="/static/img/dumbbell-solid.svg" width="20px"> 운동</p>
                <p><img src="/static/img/hot-tub-person-solid.svg" width="20px"> 온수</p>
                <p><img src="/static/img/wifi-solid.svg" width="20px"> 와이파이</p>
                <p><img src="/static/img/square-parking-solid.svg" width="20px"> 주차장</p>
              </div>
              <div class="col">
                <p><img src="/static/img/clapperboard-solid.svg" width="20px"> 넷플릭스</p>
                <p><img src="/static/img/music-solid.svg" width="20px"> 블루투스 스피커</p>
                <p><img src="/static/img/wind-solid.svg" width="20px"> 에어컨</p>
                <p><img src="/static/img/book-solid.svg" width="20px"> 도서</p>
                <p><img src="/static/img/fire-solid.svg" width="20px"> 소화기</p>
                <p><img src="/static/img/suitcase-medical-solid.svg" width="20px"> 구급 상자</p>
              </div>
            </div>
          </div>
        </div>
        <!-- 예약바 -->
        <div class="col-4">
          <form class="bg-white shadow rounded1 bg-body-tertiary p-4 sticky1" style="width: 400px; height: 500px;">
            <h4>₩<fmt:formatNumber value="${hotels.hotel_price}" pattern="#,###"/> / 박</h4>
            <hr>
            <div class="row">
              <div class="col">
                <label for="exampleFormControlInput1" class="form-label">체크인</label>
                <input type="text" class="form-control" id="datepicker1" placeholder="날짜 추가" onchange="call()">
                <span id="cin"></span>
              </div>
              <div class="col mb-4">
                <label for="exampleFormControlInput1" class="form-label">체크아웃</label>
                <input type="text" class="form-control" id="datepicker2" placeholder="날짜 추가" onchange="call()">
              </div>
              <div>
                <label for="exampleFormControlInput1" class="form-label">인원</label>
                <select id="sel_box" class="form-select" aria-label="Default select example" onchange="ser_percent()">
                  <option disabled="disabled" selected="selected" value="0">인원수를 선택해주세요</option>
                  <option value="0.25">1명</option>
                  <option value="0.3">2명</option>
                  <option value="0.35">3명</option>
                  <option value="0.4">4명</option>
                  <option value="0.5">5명</option>
                </select>
              </div>
            </div><br>
            <div>
              <button type="button" class="btn btnall container-fluid" onclick="gopayment()">예약</button>
            </div>
            <div class="mt-4">
              <div>
                <u>₩<span><u><fmt:formatNumber value="${hotels.hotel_price}" pattern="#,###"/></span>X<span id="days" onchange="datesum()"></u></span>박</u>
                <p hidden="hidden" id="hotel_day_sum">${hotels.hotel_price}</p>
                <c:set var="hotel_price11" value="${hotels.hotel_price}"/>
                <span class="float-end" id="hotel_result"></span>
              </div>
              <div class="d-block">
                <span class="float-start"><u>올비앤비 서비스 수수료</u></span>
                <span class="float-end" id="service_result"></span>
              </div>
            </div><br>
            <hr>
            <div>
              <span style="font-size: x-large;">총합계</span>
              <span style="font-size: x-large;" class="float-end" id="real_total">날짜를 선택하세요.</span>
            </div>
          </form>
        </div>
      </div>
	</c:forEach>

      <!-- 알아두어야할 사항 -->
      <hr>
      <div class="row m-2">
        <h5><strong>알아두어야할 사항</strong></h5>
        <div class="col">
          <h6>숙소 이용규칙</h6>
          <p>체크인 가능 시간 : 오후 4:00 이후</p>
          <p>체크인 아웃 가능 시간 : 오전 10:00 까지</p>
          <p>게스트 정원 4명</p>
        </div>
        <div class="col">
          <h6>안전 및 숙소</h6>
          <p>보안 카메라/ 녹화 장치</p>
          <p>근처에 호수, 강, 바다 등이 있음</p>
          <p>일산화탄소 경보기</p>
        </div>
        <div class="col">
          <h6>환불 정책</h6>
          <p>2월 23일 오전 4:51 전까지 무료로 취소하실 수 있습니다.</p>
        </div>
      </div>

      <!-- 하단 부가 설명바 -->
      <hr>
      <div class="row align-items-end">
        <div class="col">
          <ul class="nav flex-column">
            <p class="ps-3 fw-bolder">올비앤비 지원</p>
            <li class="nav-item">
              <a class="nav-link disabled" aria-current="page" href="#">도움말 센터</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">에어커버</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">차별 반대</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled">장애인 지원</a>
            </li>
          </ul>
        </div>
        <div class="col">
          <ul class="nav flex-column">
            <p class="ps-3 fw-bolder">호스팅</p>
            <li class="nav-item">
              <a class="nav-link disabled" aria-current="page" href="#">당신의 공간을 올비엔비하세요</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">호스트를 위한 에어커버</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">호스팅 자료</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled">책임감 있는 호스팅</a>
            </li>
          </ul>
        </div>
        <div class="col">
          <ul class="nav flex-column">
            <p class="ps-3 fw-bolder">올비앤비</p>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">뉴스룸</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">새로운 기능</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">채용정보</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled">투자자 정보</a>
            </li>
          </ul>
        </div>
      </div>
      <hr>
      <div class="d-flex ms-3 me-3">
        <div class="me-auto">© 2024 Allbnb,Inc. · 개인정보 처리방침 · 이용약관 · 사이트맵 · 한국의 변경된 환불 정책 · 회사 세부정보</div>
        <div><img src="/static/img/globe.svg" alt="인터넷아이콘">
          <span class="align-middle">₩ KRW</span>
          <img src="/static/img/square-facebook.svg" alt="페이스북 아이콘" width="30" height="24">
          <img src="/static/img/square-twitter.svg" alt="트위터 아이콘" width="30" height="24">
          <img src="/static/img/square-instagram.svg" alt="인스타 아이콘" width="30" height="24">
        </div>
      </div>
      <br>
    </div>
  </div>
  </div>
  <script>
    function gopayment(){
    	let localval = localStorage.getItem("my_email");
    	if(localval == null){
    		alert("로그인 후 이용해주세요.")
    	}else if(localval.length >= 1){
            let hotel_number1 = '<c:out value="${hotel_number}"/>';
            let hotel_price12 = '<c:out value="${hotel_price11}"/>';
            sessionStorage.setItem("hotel_num",hotel_number1);
            sessionStorage.setItem("check_in",startDate1);
        	sessionStorage.setItem("check_out",endDate1);
        	sessionStorage.setItem("guest",check_guest);
        	sessionStorage.setItem("hotel_onepay",hotel_price12);
        	sessionStorage.setItem("hotel_bak",timeDifference);
        	location.href="hotelminInform.do?hotel_num="+hotel_number1;
    	}
        
        
        
    };
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
</body>
</html>