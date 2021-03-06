<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header-area</title>

<!-- Style CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css?ver=2">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/animate.css?ver=2">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css?ver=2">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css?ver=2">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.css?ver=2">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/classy-nav.css?ver=2">
</head>

<body>

   <!-- 로그인 모달창 -->
    <div class="subscribe-newsletter-area">
        <div class="modal fade" id="subsModal" tabindex="-1" role="dialog" aria-labelledby="subsModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="modal-body">
                       <!--  <h5 class="title">Login</h5> -->
                        <form action="Login_Login" class="newsletterForm" method="post">
                            ID <input type="text" name="id" id="id" placeholder="아이디" required>
                            PASSWORD <input type="password" name="password" id="password" placeholder="비밀번호" required>
                            <button type="submit" class="btn original-btn">Login</button>
                        </form>
                    </div>
                   <a href="Join_Naverlogin" class="btn original-btn">네이버 로그인 하러가기</a>
                    <a href="/petmily/find_id_fromJSP" class="btn original-btn">아이디 찾기</a>
                     <a href="/petmily/find_pw_fromJSP" class="btn original-btn">비밀번호 찾기</a>
                            <input type="button" class="btn original-btn" onclick="join();" value="회원가입">
                </div>
            </div>
        </div>
    </div>
    
	<header class="header-area">
	


		<!-- Top Header Area -->
		<div class="top-header">
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<!-- Breaking News Area -->
					<div class="col-12 col-sm-8">
						<div class="breaking-news-area">
							<div id="breakingNewsTicker" class="ticker">
								<ul>
									<li><a href="#">최대 20%할인!</a></li>
									<li><a href="#">새로운 펫 입소</a></li>
									<li><a href="#">펫 분양시 사은품 증정!</a></li>
									<li><a href="#">두 마리 입양시 추가할인</a></li>
									<li><a href="#">04.25 ~ 10.18 멤버쉽</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- Top Menu Area -->
					<div class="col-12 col-sm-4">
						<div class="top-social-area" style="width: 400px;">

							<c:choose>

								<c:when test="${not empty sessionScope.sessionId}">
									<a>'${sessionScope.sessionId}'님 환영합니다! </a>
									<a href="Login_LoginOut">로그아웃</a>
									<a href="Mypage" class="btn subscribe-btn" title="마이페이지">Mypage</a>
								</c:when>
								<c:otherwise>
									<a href="JoinForm" class="btn subscribe-btn"
										data-placement="bottom" title="회원가입">Join</a>
									<a href="#" class="btn subscribe-btn" data-toggle="modal"
										data-target="#subsModal" title="로그인">Login</a>
								</c:otherwise>
							</c:choose>


						</div>
					</div>
				</div>
			</div>
		</div>

    
		<!-- Logo Area -->
		<div class="logo-area text-center">
			<div class="container h-100">
				<div class="row h-100 align-items-center">
					<div class="col-12">
						<a href="http://localhost:8090/petmily/" class="original-logo"><img
							src="${pageContext.request.contextPath}/resources/logo/mainlogo.png"></a>
					</div>
				</div>
			</div>
		</div>

		<!-- Nav Area -->
		<div class="original-nav-area" id="stickyNav">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Classy Menu -->
					<nav class="classy-navbar justify-content-between">

						<!-- Subscribe btn -->
						<div class="subscribe-btn">
							<a href="#" class="btn subscribe-btn" data-toggle="modal"
								data-target="#subsModal">1:1 문의</a>
						</div>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu" id="originalNav">
							<!-- close btn -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Nav Start -->
							<div class="classynav">
								<ul>
									<c:if test="${sessionScope.sessionId eq 'admin'}">
										<li><a href="#">Admin</a>
											<ul class="dropdown">
												<li><a href="aboutUs">펫 용품 등록</a></li>
												<li><a href="admin_pet">펫 등록</a></li>
												<li><a href="#">전체 회원 리스트</a></li>
												<li><a href="#">예약 신청 게시판</a></li>
											</ul></li>
									</c:if>


									<li><a href="#">About</a>
										<ul class="dropdown">
											<li><a href="aboutUs">회사 소개</a></li>
										</ul></li>

									<li><a href="#">Pets</a>
										<ul class="dropdown">
										<li><a href="AdoptionprocedureJsp">분양안내</a></li>
											<li><a href="#">입양 절차</a></li>

											<li><a href="#">입양 신청</a></li>

																	<li><a href="Pet_Dog_List?page=1">강아지</a>
												<ul class="dropdown">
													<li><a href="Pet_Dog_Big?page=1">대형견</a></li>
													<li><a href="Pet_Dog_Medium?page=1">중형견</a></li>
													<li><a href="Pet_Dog_Small?page=1">소형견</a></li>
												</ul>
											<li><a href="Pet_Cat_List?page=1">고양이</a></li>

											<li><a href="Pet_Reptile_List?page=1">파충류</a></li>
										</ul></li>
									<li><a href="contact.html">Pet Shop</a>
										<ul class="dropdown">
											<li><a href="#">사료</a>
												<ul class="dropdown">
													<li><a href="#">강아지 사료</a></li>
													<li><a href="#">고양이 사료</a></li>
													<li><a href="#">파충류 사료</a></li>
												</ul></li>
											<li><a href="Item_puffy">강아지 용품</a>
												<ul class="dropdown">
													<li><a href="#">강아지 장난감</a></li>
													<li><a href="#">강아지 미용용품</a></li>
													<li><a href="#">강아지 옷/잡화</a></li>
												</ul></li>

											<li><a href="Item_cat">고양이 용품</a>
												<ul class="dropdown">
													<li><a href="#">고양이 장난감</a></li>
													<li><a href="#">고양이 미용용품</a></li>
													<li><a href="#">고양이 옷/잡화</a></li>
												</ul></li>

											<li><a href="#">파충류 용품</a>
												<ul class="dropdown">
													<li><a href="#">파충류 장난감</a></li>
													<li><a href="#">파충류 미용용품</a></li>
													<li><a href="#">파충류 옷/잡화</a></li>
												</ul></li>
										</ul></li>

									<li><a href="contact.html">Story</a>
										<ul class="dropdown">
											<li><a href="#">Q & A</a></li>
											<li><a href="ar_board">입양 후기</a></li>
										</ul></li>

									<li><a href="#">All Menu</a>
										<div class="megamenu">
											<ul class="single-mega cn-col-4">
									<li class="title">About</li>
												<li><a href="#"><strong>회사 지점위치</strong></a></li>
												<li><a href="Notice_List"><strong>공지사항</strong></a></li>
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="title">Pets</li>
												<li><strong>강아지</strong></li>
												<li><a href="#"> > 대형견</a></li>
												<li><a href="#"> > 중형견</a></li>
												<li><a href="#"> > 소형견</a></li>
												<li><a href="#"><strong>고양이</strong></a></li>
												<li><a href="#"><strong>파충류</strong></a></li>
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="title">Pet Shop</li>
												<li><strong>사료</strong></li>
												<li><a href="#"> > 강아지 사료</a></li>
												<li><a href="#"> > 고양이 사료</a></li>
												<li><a href="#"> > 파충류 사료</a></li>
												<li><strong>강아지 용품</strong></li>
												<li><a href="#"> > 강아지 장난감</a></li>
												<li><a href="#"> > 강아지 미용용품</a></li>
												<li><a href="#"> > 강아지 옷/잡화</a></li>
												<li><strong>고양이 용품</strong></li>
												<li><a href="#"> > 고양이 장난감</a></li>
												<li><a href="#"> > 고양이 미용용품</a></li>
												<li><a href="#"> > 고양이 옷/잡화</a></li>
												<li><strong>파충류 용품</strong></li>
												<li><a href="#"> > 파충류 장난감</a></li>
												<li><a href="#"> > 파충류 미용용품</a></li>
												<li><a href="#"> > 파충류 옷/잡화</a></li>
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="title">Story</li>
												<li><a href="#"><strong>Q & A</strong></a></li>
												<li><a href="ar_gowrite"><strong>입양 후기</strong></a></li>
											</ul>
										</div></li>
								</ul>

								<!-- Search Form  -->
								<div id="search-wrapper">
									<form action="#">
										<input type="text" id="search"
											placeholder="Search something...">
										<div id="close-icon"></div>
										<input class="d-none" type="submit" value="">
									</form>
								</div>
							</div>
							<!-- Nav End -->
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
</body>
</html>