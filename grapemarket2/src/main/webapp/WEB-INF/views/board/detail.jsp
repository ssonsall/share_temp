<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
    Document Title
    =============================================
    -->
<title>detail</title>

<%@include file="../include/favicons.jsp"%>
<%@include file="../include/stylesheets.jsp"%>

</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="principal" />
	</sec:authorize>
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<!-- nav -->
		<%@include file="../include/nav.jsp"%>
		<div class="main">
			<section class="module">
				<div class="container">
					<div class="row">
						<!-- ìí í° ì¬ì§ -->
						<div class="col-sm-6 mb-sm-40">
							<img width="600px" id="mainImage" src="/upload/${board.image1}"
								alt="Single Product Image" />
							<!-- ìí ìì ì¬ì§ ìì-->
							<ul class="product-gallery">
								<li><img id="img1" onClick="changeImg(1)"
									src="/upload/${board.image1}" alt=" No Image" /></li>
								<li><img id="img2" onClick="changeImg(2)"
									src="/upload/${board.image2}" alt=" No Image" /></li>
								<li><img id="img3" onClick="changeImg(3)"
									src="/upload/${board.image3}" alt=" No Image" /></li>
								<li><img id="img4" onClick="changeImg(4)"
									src="/upload/${board.image4}" alt=" No Image" /></li>
								<li><img id="img5" onClick="changeImg(5)"
									src="/upload/${board.image5}" alt=" No Image" /></li>
							</ul>




							<script>
								function changeImg(id) {
									var img = document
											.getElementById("mainImage");
									if (id == 1) {
										img.src = "/upload/${board.image1}";
									} else if (id == 2) {
										img.src = "/upload/${board.image2}";
									} else if (id == 3) {
										img.src = "/upload/${board.image3}";
									} else if (id == 4) {
										img.src = "/upload/${board.image4}";
									} else if (id == 5) {
										img.src = "/upload/${board.image5}";
									}

								}
							</script>
						</div>
						<div class="col-sm-6">
							<div class="row">
								<div class="col-sm-12">
									<h1 style="font-size: 40px;" class="product-title font-alt">${board.title}</h1>
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="product_meta">
												Category · ${board.createDate}
												<!-- <a href="#"> enum 생성후 카테고리 입력 </a> -->
											</div>
										</div>
									</div>
									<h4 style="color: gray;">${board.user.username}</h4>
									<h4 style="color: gray;">${board.user.address}</h4>
								</div>
							</div>
							<div class="row mb-20">
								<div class="col-sm-12">

									<!-- 별모양 / 별점 -->
									<!-- <span><i class="fa fa-star star"></i></span><span><i
										class="fa fa-star star"></i></span><span><i
										class="fa fa-star star"></i></span><span><i
										class="fa fa-star star"></i></span><span><i
										class="fa fa-star star-off"></i></span><a
										class="open-tab section-scroll" href="#reviews">-2customer
										reviews</a> -->
								</div>
							</div>
							<div class="row mb-20">
								<div class="col-sm-12">
									<div class="price font-alt">
										<span class="amount">${board.price} WON</span>
									</div>
								</div>
							</div>



							<div class="row mb-20">
								<div class="col-sm-12">
									<div class="description">
										<p>${board.content}</p>
									</div>
								</div>
							</div>
							<div class="row mb-20">
								<!-- <div class="col-sm-4 mb-sm-20">
									<input class="form-control input-lg" type="number" name=""
										value="1" max="40" min="1" required="required" />
								</div> -->
								<div class="col-sm-8">

									<form action="/chat/chat" method="post">
										<input type="hidden" name="board" value="${board.id}" /> 
										<input type="hidden" name="buyerId" value="${principal.user.id}">
										<input type="hidden" name="sellerId" value="${board.user.id}">
										<input type="submit" value="채팅으로 거래하기" />
									</form>
								</div>
							</div>

						</div>
					</div>
					<div class="row mt-70">
						<div class="col-sm-12">
							<ul class="nav nav-tabs font-alt" role="tablist">
								<li class="active"><a href="#reviews" data-toggle="tab"><span
										class="icon-tools-2"></span>comment</a></li>
							</ul>
							<!-- ëê¸ êµ¬ì­ ìì-->
							<div class="comments_reviews" id="comments_reviews">

								<c:forEach var="comment" items="${comments}">

									<div class="comment clearfix">
										<div class="comment-avatar">
											<img src="" alt="avatar" />
										</div>
										<div class="comment-content clearfix">
											<div class="comment-author font-alt">
												<a href="#">${comment.user.username}</a>
											</div>
											<div class="comment-body">
												<p>${comment.content}</p>
											</div>
											<div class="comment-meta font-alt">
												Today, 14:55 -<span><i class="fa fa-star star"></i></span><span><i
													class="fa fa-star star"></i></span><span><i
													class="fa fa-star star"></i></span><span><i
													class="fa fa-star star"></i></span><span><i
													class="fa fa-star star-off"></i></span>
											</div>
										</div>
									</div>

								</c:forEach>
							</div>
							<!-- ëê¸ êµ¬ì­ ë -->

							<!-- ëê¸ ì°ê¸° ìì -->



							<div class="comment-form mt-30">
								<h4 class="comment-form-title font-alt">Add review</h4>


								<form id="comment-submit">
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="sr-only" for="name">Name</label> <input
													type="hidden" name="board" value="${board.id}" /> <input
													type="hidden" name="user" value="${principal.user.id}" />
												<input class="form-control" id="username" type="text"
													name="username" value="${principal.user.username}"
													placeholder="${principal.user.username}"
													readonly="readonly" />
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="sr-only" for="email">Name</label> <input
													class="form-control" id="email" type="text" name="email"
													placeholder="${principal.user.email}"
													value="${principal.user.email}" readonly="readonly" />
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<textarea class="form-control" id="comment_area"
													name="content" rows="4" placeholder="Review"></textarea>
											</div>
										</div>
										<div class="col-sm-12">
											<button onclick="commentWrite()" class="btn btn-round btn-d"
												type="button">Submit Review</button>
										</div>
									</div>
								</form>


								<script>
									
								</script>
							</div>
							<!-- ëê¸ ì°ê¸° ë -->
						</div>

					</div>
				</div>
			</section>
			<hr class="divider-w">
			<section class="module-small">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">Related Products</h2>
						</div>
					</div>
					<div class="row multi-columns-row">
						<div class="col-sm-6 col-md-3 col-lg-3">
							<div class="shop-item">
								<div class="shop-item-image">
									<img src="/assets/images/shop/product-11.jpg"
										alt="Accessories Pack" />
									<div class="shop-item-detail">
										<a class="btn btn-round btn-b"><span class="icon-basket">Add
												To Cart</span></a>
									</div>
								</div>
								<h4 class="shop-item-title font-alt">
									<a href="#">Accessories Pack</a>
								</h4>
								Â£9.00
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3">
							<div class="shop-item">
								<div class="shop-item-image">
									<img src="/assets/images/shop/product-12.jpg"
										alt="Menâs Casual Pack" />
									<div class="shop-item-detail">
										<a class="btn btn-round btn-b"><span class="icon-basket">Add
												To Cart</span></a>
									</div>
								</div>
								<h4 class="shop-item-title font-alt">
									<a href="#">Menâs Casual Pack</a>
								</h4>
								Â£12.00
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3">
							<div class="shop-item">
								<div class="shop-item-image">
									<img src="/assets/images/shop/product-13.jpg"
										alt="Menâs Garb" />
									<div class="shop-item-detail">
										<a class="btn btn-round btn-b"><span class="icon-basket">Add
												To Cart</span></a>
									</div>
								</div>
								<h4 class="shop-item-title font-alt">
									<a href="#">Menâs Garb</a>
								</h4>
								Â£6.00
							</div>
						</div>
						<div class="col-sm-6 col-md-3 col-lg-3">
							<div class="shop-item">
								<div class="shop-item-image">
									<img src="/assets/images/shop/product-14.jpg" alt="Cold Garb" />
									<div class="shop-item-detail">
										<a class="btn btn-round btn-b"><span class="icon-basket">Add
												To Cart</span></a>
									</div>
								</div>
								<h4 class="shop-item-title font-alt">
									<a href="#">Cold Garb</a>
								</h4>
								Â£14.00
							</div>
						</div>
					</div>
				</div>
			</section>
			<hr class="divider-w">
			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">Exclusive products</h2>
							<div class="module-subtitle font-serif">The languages only
								differ in their grammar, their pronunciation and their most
								common words.</div>
						</div>
					</div>
					<div class="row">
						<div class="owl-carousel text-center" data-items="5"
							data-pagination="false" data-navigation="false">
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img src="/assets/images/shop/product-1.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										Â£12.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img src="/assets/images/shop/product-3.jpg"
											alt="Derby shoes" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Derby shoes</a>
										</h4>
										Â£54.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img src="/assets/images/shop/product-2.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										Â£19.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img src="/assets/images/shop/product-4.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										Â£14.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img src="/assets/images/shop/product-5.jpg"
											alt="Chelsea boots" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Chelsea boots</a>
										</h4>
										Â£44.00
									</div>
								</div>
							</div>
							<div class="owl-item">
								<div class="col-sm-12">
									<div class="ex-product">
										<a href="#"><img src="/assets/images/shop/product-6.jpg"
											alt="Leather belt" /></a>
										<h4 class="shop-item-title font-alt">
											<a href="#">Leather belt</a>
										</h4>
										Â£19.00
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<%@include file="../include/footer.jsp"%>

		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<%@include file="../include/script.jsp"%>
</body>
</html>