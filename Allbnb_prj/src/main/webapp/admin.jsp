<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>관리자 화면</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript">

	  function join_out_btn(email_out){
		  console.log(email_out);
	      	const delete_ok= confirm("삭제하시겠습니까?\n삭제시 모든 정보가 사라집니다.");
	      		if(delete_ok){
	      			  alert("삭제가 완료되었습니다.");
	                  location.href="deleteMembers.do?email="+email_out; 
	              }else{
	                  alert('삭제가 취소 되었습니다.');
	          }
	      };
  </script>
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

    .btnreset {
      all: unset;
    }

    .pzero {
      padding: 0px;
    }

    table,
    th,
    td {
      border: 1px solid white;
      border-collapse: collapse;
    }

    th {
      background-color: #fcafb0;
      padding: 15px;
      color: white;
    }

    td {
      font-size: large;
      padding: 15px;
    }

    tr:nth-child(even) {
      background-color: #fcafb023;
    }

    .btnh:hover {
      text-shadow: 3px 3px 5px rgba(0, 0, 0, 0.2);
    }
  </style>
</head>
<body>
	<!-- 로그인 모달은 바디 최상단에 넣기!! -->
  <!-- 로그인 모달 -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">로그인</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          ...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" style="background-color: #fe5c5f; border: #fe5c5f;">로그인</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 회원 가입 모달 -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          ...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>
  </div>
  <!-- 상단 메뉴화면 -->
  <nav class="navbar fixed-top bg-white">
    <div class="container-fluid">
      <a class="navbar-brand ms-5" href="main.html" style="color: #fe5c5f;">
        <img src="img/brand_icon.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
        allbnb
      </a>
      <!-- 사용자 버튼 -->

      <div class="dropdown ms-4 me-5 rounded">
        <a class="btn btn-secondary dropdown-toggle rounded-pill" href="#" role="button"
          style="background-color: #fe5c5f; border: #fe5c5f;" data-bs-toggle="dropdown" aria-expanded="false">
          관리자
        </a>
        <ul class="dropdown-menu dropdown-menu-end">
          <button type="button" class="dropdown-item" data-bs-toggle="modal"
            data-bs-target="#staticBackdrop1">로그아웃</button>
          <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">회원
            관리</button>
        </ul>
      </div>
    </div>
    </div>
  </nav>
  <hr>
  <div class="m-5">
    <div>
      <h1 class="fw-bold p-3">관리자</h1>
    </div>
    <div class="p-3">
      <nav id="tab-button-nav">
        <button class="tab-button fs-5 fw-bold btnreset me-3 btnh" data-tab-section="tab-section-1">회원 관리</button>
        <button class="tab-button fs-5 btnreset me-3 btnh" data-tab-section="tab-section-2">수익</button>
      </nav>
    </div>
    <hr>
    <!-- 회원 관리 테이블 -->
    <section id="tab-section-1" class="tab-section">
      <div>
        <div class="p-3">
          <table class="container-fluid">
            <tr class="fs-5 text-center">
              <th>번호</th>
              <th>이름</th>
              <th>이메일</th>
              <th>가입일</th>
              <th>관리</th>
            </tr>
            <c:forEach items="${membersList}" var="members">
            <c:set var="i" value="${i+1}"/>
					<tr>
						<td>${i}</td>
						<td>${members.name}</td>
						<td id="out_email">${members.email}</td>
						<td>${members.join_date}</td>
						<td><button class="btnall rounded container-fluid" onclick="join_out_btn('${members.email}')">탈퇴</button></td>
					</tr>
			</c:forEach>
          </table>
        </div>
      </div>
      <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
    </section>
    <!-- 수익 내역 테이블 -->
    <section id="tab-section-2" class="tab-section" hidden>
      <div>
        <div class="p-3">
          <table class="container-fluid">
            <tr class="fs-5 text-center">
              <th>번호</th>
              <th>예약일</th>
              <th>장소</th>
              <th>숙소 가격</th>
              <th>수수료</th>
              <th>총 수익</th>
            </tr>
            <tr>
              <td>1</td>
              <td>2월 2일 ~ 2월 4일</td>
              <td>스코틀랜드 하이랜드 캐슬, 블랙크레이그 가든 아파트</td>
              <td>371,000원</td>
              <td>28,000원</td>
              <td>28,000원</td>
            </tr>
            <tr>
              <td>1</td>
              <td>2월 2일 ~ 2월 4일</td>
              <td>스코틀랜드 하이랜드 캐슬, 블랙크레이그 가든 아파트</td>
              <td>2명</td>
              <td>28,000원</td>
              <td>56,000원</td>
            </tr>
            <tr>
              <td>1</td>
              <td>2월 2일 ~ 2월 4일</td>
              <td>스코틀랜드 하이랜드 캐슬, 블랙크레이그 가든 아파트</td>
              <td>2명</td>
              <td>28,000원</td>
              <td>84,000원</td>
            </tr>
            <tr>
              <td>1</td>
              <td>2월 2일 ~ 2월 4일</td>
              <td>스코틀랜드 하이랜드 캐슬, 블랙크레이그 가든 아파트</td>
              <td>2명</td>
              <td>28,000원</td>
              <td>112,000원</td>
            </tr>
          </table>
        </div>
      </div>
    </section>

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
      <div><img src="img/globe.svg" alt="인터넷아이콘">
        <span class="align-middle">₩ KRW</span>
        <img src="img/square-facebook.svg" alt="페이스북 아이콘" width="30" height="24">
        <img src="img/square-twitter.svg" alt="트위터 아이콘" width="30" height="24">
        <img src="img/square-instagram.svg" alt="인스타 아이콘" width="30" height="24">
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
</body>
</html>