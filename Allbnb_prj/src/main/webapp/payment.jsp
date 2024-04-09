<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>결제 화면</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="js/detail.js"></script>
  <script src="js/payment.js"></script>
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

    h5 {
      margin-bottom: 15px;
    }
    .fss{
        font-size: small;
    }


.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #fe5c5f;;
}
.select input[type=radio]:checked+label{
    background-color: lightsalmon;
    color: #fff;
    border-radius: 10px;
}
  </style>
</head>
<body>
  <!-- 상단 메뉴화면 -->
  <div class="container-fluid p-4">
        <a href="hotelInform.do" style="color: #fe5c5f;">
          <img src="/static/img/brand_icon.png" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
          allbnb
        </a>
    </div>
    <hr style="margin: 0;">
  <!-- 확인 및 결제 -->
  <div class="m-5">
    <div class="bg-white container">
        <div class="ms-3">
        <c:forEach items="${hotelList}" var="hotels" varStatus="status">
            <button class="btnreset fw-bold fs-1 " onclick="location.href='detail.do?hotel_title=${hotels.hotel_title}'"><img src="/static/img/chevron-left.svg" width="14px"></button>
            <h3 class="d-inline">확인 및 결제</h3>
        </div>
      <div class="row">
        <div class="col-7">
          <!-- 예약 정보 -->
          <div class="m-3">
            <h5 class="fw-semibold">예약 정보</h5>
            <div class="mb-4">
                <div>
                    <p class="fw-bold">날짜</p>
                    <p class="fw-normal" id="h_day"></p>
                </div><br>
                <div>
                    <p class="fw-bold">게스트</p>
                    <p class="fw-normal" id="g"></p>
                </div>
            </div>
            <hr>
            <!-- 결제 수단 -->
            <div class="mb-2">
                <div class="mb-3">
                    <span class="fs-5 fw-semibold">결제 수단</span>
                    <span class="float-end">
                        <img src="/static/img/visa.svg" width="25px">
                        <img src="/static/img/amex.svg" width="25px">
                        <img src="/static/img/logo_master.svg" width="25px">
                    </span>
                </div>
                <div class="select">
                    <input type="radio" id="select" name="shop"><label for="select"><img class="p-2" src="/static/img/credit-card.svg" width="50px"></label>
                    <input type="radio" id="select2" name="shop"><label for="select2"><img class="p-2" src="/static/img/won-sign.svg" width="45px"></label>
                </div>            
            </div>
            <hr>
            <!-- 환불 정책 -->
            <div class="mb-4">
            <h5 class="fw-semibold">환불 정책</h5>
            <p class="fw-normal">체크인 날짜 기준 5영업일 전에 취소하면 부분 환불을 받으실 수 있습니다.<br> 그 이후에 취소하면 예약 대금이 환불되지 않습니다.</p>
            </div>
            <hr>
            <!-- 기본 규칙 -->
            <h5 class="fw-semibold">기본 규칙</h5>
            <p class="fw-normal">훌륭한 게스트가 되기 위한 몇 가지 간단한 규칙을 지켜주실 것을 모든 게스트에게 당부드리고 있습니다.</p>
            <ul>
                <li>숙소 이용규칙을 준수하세요.</li>
                <li>호스트의 집도 자신의 집처럼 아껴주세요.</li>
            </ul>
            
            <hr>
            <!-- 정책 -->
            <div class="mb-4">
                <span style="font-size: x-small;">아래버튼을 선택하면 <u><strong>호스트가 설정한 숙소 이용규칙, 게스트에세 적용되는 기본 규칙, 에어비앤비 재예약 및 환불 정책</strong></u>에 동의하며, 피해에 대한 책임이 본인에게 있을 경우 에어비앤비가 <u><strong>결제 수단으로 청구</strong></u>의 조치를 취할 수 있다는 사실에 동의하는 것입니다.</span>
            </div>
            <div class="mb-5">
                <button class="btn btnall" onclick="goreserve()">확인 및 결제</button>
            </div>
          </div>
        </div>
        <!-- 영수증바 -->
        <div class="col-5">
          <form class="bg-white rounded1 p-4 sticky1 border" style="width: 400px; height: 420px;">
            <div class="mb-3">
				
                <img class="rounded-2 me-3 float-start" src=/static/img/${hotels.thumbnail} width="90px" height="80px">
                <span class="fw-semibold mb-">${hotels.hotel_title}</span><br>
                <div class="fss">${hotels.hotel_explain}</div>
				
            </div>
            <hr>
            <div>
              <h5 class="fw-semibold">요금 세부정보</h5>
            <div class="mt-4">
              <div>
                <span><u>₩<fmt:formatNumber value="${hotels.hotel_price}" pattern="#,###"/></span>
                <span id="h_one"></span></u>
                <span class="float-end" id="h_onesum"></span>
              </div>
              <div class="d-block">
                <span class="float-start"><u>올비앤비 서비스 수수료</u></span>
                <span class="float-end" id="h_service"></span>
              </div>
            </div><br>
            </div>
            <hr>
            <div>
              <span class="fs-5 fw-semibold">총합계</span>
              <span class=" fs-5 float-end" id="h_total"></span>
            </div>
            </c:forEach>
            <hr>
            <div>
                <p class="fw-light fss">해외에서 결제가 처리되기 때문에 카드 발행사에서 추가 수수료를 부과할 수 있습니다.</p>
            </div>
          </form>
        </div>
      </div>
    </div>
</div>  
      <hr style="margin: 0;">
      <div class="d-flex ms-5 mt-4 mb-4 me-5">
        <div class="me-auto">© 2024 Allbnb,Inc. · 개인정보 처리방침 · 이용약관 · 사이트맵 · 한국의 변경된 환불 정책 · 회사 세부정보</div>
        <div><img src="/static/img/globe.svg" alt="인터넷아이콘">
          <span class="align-middle">₩ KRW</span>
          <img src="/static/img/square-facebook.svg" alt="페이스북 아이콘" width="30" height="24">
          <img src="/static/img/square-twitter.svg" alt="트위터 아이콘" width="30" height="24">
          <img src="/static/img/square-instagram.svg" alt="인스타 아이콘" width="30" height="24">
        </div>
      </div>
  </div>

  <script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
</body>
</html>