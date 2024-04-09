<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>메인 화면</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="js/main.js"></script>

  <style>
    a {
      text-decoration: none;
      color: black;
    }

    p {
      margin: 0;
    }

    .mt70 {
      margin-top: 120px;
    }

    /* 로그인 */
    .form-signin {
      width: 100%;
      max-width: 330px;
      padding: 15px;
      margin: auto;
    }

    .form-signin {
      font-weight: 400;
    }

    .form-signin .form-floating:focus-within {
      z-index: 2;
    }

    .form-signin input[type="email"] {
      margin-bottom: -1px;
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }

    .form-signin input[type="password"] {
      margin-bottom: 10px;
      border-top-left-radius: 0;
      border-top-right-radius: 0;
    }

    .btnall {
      background-color: #fe5c5f;
      border: #fe5c5f;
      color: white;
    }
    
    .btnreset{
	      all: unset; 
        }

    .btnall:hover {
      background-color: #fe5c5f;
      color: white;
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
    <!-- 여행지 선택 버튼 -->
    <div class="container-fluid justify-content-center mt-3">
      <div class="btn-group rounded-pill" role="group" aria-label="Button group with nested dropdown"
        style="background-color: #fe5c5f;">
        <div class="btn-group" role="group">
          <div class="form-floating">
            <select class="form-select rounded-pill" id="floatingSelect" aria-label="Floating label select example">
              <option name="floatingSelect" value="유럽">유럽</option>
              <option name="floatingSelect" value="아시아">아시아</option>
              <option name="floatingSelect" value="아프리카">아프리카</option>
              <option name="floatingSelect" value="아메리카">아메리카</option>
              <option name="floatingSelect" value="호주">호주</option>
            </select>
            <label for="floatingSelect">여행지</label>
          </div>
          <button class="btnall rounded-pill ps-3 pe-3" onclick="changeFn()"><img src="/static/img/find.svg" alt="찾기이미지" width="25px"></button>
          <%-- <form action="hotelCountryInform.do" method="post">
				<select name="searchCondition">
				<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}">${option.key}
				</c:forEach>
				</select> 
				<input type="submit"/>
		</form> --%>
        </div>
      </div>
    </div>
  </nav>
  <hr>

  <!-- 사진 및 구현 설명창 -->
  <div class="ms-5 me-5 mt70">
	<div class="row">      	
      <c:forEach items="${hotelList}" var="hotels" varStatus="status">
      	<div class="col pb-4">
			<a href="detail.do?hotel_title=${hotels.hotel_title}" style="width: 450px">
	          <img src=/static/img/${hotels.thumbnail} width="400" height="280" class="rounded" alt="숙소1">
	          <div class="m-2 d-inline">
	            <p class="fs-5">${hotels.hotel_title}</p>
	            <p class="fw-bold" id="main_num1">₩<fmt:formatNumber value="${hotels.hotel_price}" pattern="#,###"/> / 박</p>
	          </div>
	        </a>
		</div>
		<c:if test="${status.count % 4 == 0}">
			</div> 
			<div class="row">
		</c:if>
		</c:forEach>
      </div>
  </div>
  <hr>
  <!-- 하단 부가 설명바 -->
  <div class="row align-items-end ms-5">
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
  <div class="d-flex ms-5 me-5">
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
</body>
</html>