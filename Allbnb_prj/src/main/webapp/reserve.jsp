<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>예약 화면</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="js/detail.js"></script>
    <script src="js/main.js"></script>
    
    <style>
        a{
            text-decoration: none;
            color: black;
        }

        p{
            margin: 0;
            padding: 1px;
        }

        .ex1{
          height: auto;
        }
        .sticky1{

          position:sticky;
          top: 70px;
          left: 1000px;
        }
        .rounded1{
          border-radius: 20px;
        }
        .mt70{
          margin-top: 70px;
        }
        .rb20{
          border-radius: 0px 0px 20px 0px;
        }
        .rt20{
          border-radius: 0px 20px 0px 0px;
        }
        .rs20{
          border-radius: 20px 0px 0px 20px;
        }
        .ui-datepicker-trigger {
        display: none;
        }
        .btnall{
          background-color: #fe5c5f;
          border: #fe5c5f;
          color: white;
        }

        .btnall:hover{
          background-color: #fe5c5f;
          color: white;
        }
        .alignleft {
          float: left;
        }
        .alignright {
          float: right;
        }
        .btnreset{
	      all: unset; 
        }
        .pzero{
          padding:0px;
        }
        .btnh:hover{
            text-shadow: 3px 3px 5px rgba(0, 0, 0, 0.3);
        }
    </style>
  </head>
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
              <label for="login_email">이메일</label>
            </div><br>
            <div class="form-floating">
              <input type="password" class="form-control" id="login_pwd1" placeholder="Password">
              <label for="login_pwd1">비밀번호</label>
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
          <form id="login_form" method="post">
            <img class="mb-4" src="/static/img/brand_icon.png" alt="" width="40" height="40">
            <h3 class="h3 mb-3 fw-normal align-middle" style="display: inline-block;">사용자 정보를 입력해주세요.</h3>
            <div class="form-floating">
              <input type="text" class="form-control" id="join_name" placeholder="name@example.com">
              <label for="name">이름</label>
            </div>
            
            <div class="form-floating">
              <input type="text" class="form-control" id="join_email" placeholder="name@example.com">
              <label for="join_email">이메일</label>
            </div><button id ="id_check" type="button" class="btn btn-primary container-fluid" onclick="check_id()" style="background-color: #fe5c5f; border: #fe5c5f;">중복확인</button><br>
            <div class="form-floating">
              <input type="password" class="form-control" id="join_pwd1" placeholder="Password" oninput="password_check()">
              <label for="pwd1">비밀번호</label>
            </div>
            <div class="form-floating">
              <input type="password" class="form-control" id="join_pwd2" placeholder="Password" oninput="password_check()">
              <label for="pwd2">비밀번호 확인</label>
            </div>
                <span id="pwConfirm">비밀번호</span>
            
            <input type="hidden" name="checked_id" value="">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary"
            style="background-color: #fe5c5f; border: #fe5c5f;" onclick="join_members()">회원가입</button>
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
    
  </nav>
      <hr>
  <!-- 이미지 모음 -->
      <div class="m-5">
        <div>
          <h1 class="fw-bold p-3">여행</h1>
        </div>
        <div class="p-3">
          <nav id="tab-button-nav">
            <button class="tab-button fs-5 fw-bold btnreset me-3 btnh" data-tab-section="tab-section-1">예정된 예약</button>
            <button class="tab-button fs-5 btnreset me-3 btnh" data-tab-section="tab-section-2">이전 예약</button>
          </nav>
        </div>
        <hr>
      <section id="tab-section-1" class="tab-section">
        <div>
        <!-- 예약 모음 -->
          <div class="mt-5 mb-5 ps-3 row row-cols-1">
          <c:forEach items="${showList}" var="show" varStatus="status">
          <div class="card col me-5 pzero" style="width: 400px;">
            <img src=/static/img/${show.thumbnail} class="card-img-top" alt="..."  width="398" height="230">
            <div class="card-body">
              <h5 class="card-title">${show.hotel_title}</h5>
              <p class="card-text text-truncate">${show.hotel_explain}</p>
              <div class="pt-2">
                <p  class="fs-6" style="color: lightgray;">${show.check_in} ~ ${show.check_out}</p>
              </div>
            </div>
            <hr style="margin-bottom: 0px;">
            <div class="card-body ">
            <span hidden="hidden" id="showhotelnum">${show.reserve_num}</span>
              <button class="btnall rounded container-fluid p-3 reserve_cancel">예약 취소</button>
            </div>
          </div>
          	<c:if test="${status.count % 4 == 0}">
          		</div>
          		<div class="mt-5 mb-5 ps-3 row row-cols-1">
          	</c:if>
	        </c:forEach>
          </div>
        </div>
      </section>
      <!-- 이전 예약 화면 -->
      <section id="tab-section-2" class="tab-section" hidden>
        <div>
          <div class="mt-5 mb-5 ps-3 row row-cols-1">
            <div class="card col me-5 pzero" style="width: 400px;">
              <img src="/static/img/d_ex3.png" class="card-img-top" alt="..." height="230">
              <div class="card-body">
                <h5 class="card-title">대한민국 서울시</h5>
                <p class="card-text text-truncate">아름다운 스트라타들, 수백 마일의 숲과 언덕 산책로, 현지 레스토랑, 발모랄과 세인트 앤드류스에 쉽게 접근할 수 있는 로맨틱한 스코틀랜드 성의 1층 아파트로 조용한 사색을 즐기거나 야외 활동을 즐길 수 있는 곳입니다.</p>
                <div class="pt-2">
                  <p  class="fs-6" style="color: lightgray;">2월 14일 ~ 2월 22일</p>
                </div>
              </div>
              <hr style="margin-bottom: 0px;">
              <div class="card-body bg-body-secondary">
                <p class="fs-6">예약 만료</p>
              </div>
            </div>
            </div>
          </div>
        </div>  
      </section>      
  <!-- 하단 부가 설명바 -->
      <div class="m-5">
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
      </div>  
        <br>
      </div>
    </div>
  </div>

  <script>

  
    const $nav = document.querySelector('#tab-button-nav')
    const $sections = document.querySelectorAll('.tab-section');

    $nav.addEventListener('click', (e) => {
      if (!e.target.classList.contains('tab-button')) {
        return;
      }
      
      const focusedTabId = e.target.dataset.tabSection;

      $sections.forEach(($section) => {
        if ($section.id === focusedTabId) {
          $section.removeAttribute('hidden');
        } else {
          $section.setAttribute('hidden', true);
        }
      });
    });
  </script>
  <script>
    $(".reserve_cancel").each(function(index, item){
	  item.addEventListener('click', function (event){
		  console.log("index: "+index);
		  if(confirm("예약 취소시 모든 정보는 날라갑니다.")){
			  alert("예약이 취소되었습니다.")
			  const reserve_number2= $(this).parent().find('#showhotelnum').html();
			  const email11=localStorage.getItem("my_email");
			  console.log("예약 번호는?:"+reserve_number2);
			  location.href="deleteReserve.do?reserve_num="+reserve_number2+"&email="+email11;
		  }
	  });
	});
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  </body>
</html>