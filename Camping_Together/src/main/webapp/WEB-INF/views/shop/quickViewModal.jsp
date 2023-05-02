<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/shop/shopMainList.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<!-- quick view modal -->
	<div class="modal fade" id="quickViewModal" tabindex="-1" aria-labelledby="quickViewModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title" id="quickViewModalLabel"></div>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="modal-photo-slick"></div>
					<div class="modal-shop-info">
						<div class="product-info">
							<div>
								<div class="p-title">판매가</div>
								<div>
									<div class="modal-shop-price"></div>
								</div>
							</div>
							<div>
								<div class="p-title">배송방법</div>
								<div id="shopD">택배</div>
							</div>
							<div>
								<div class="p-title">배송비</div>
								<div>
									<div class="modal-shop-delivary"></div>
								</div>
							</div>
							<div>
								<div class="p-title">남은수량</div>
								<div>
									<div class="modal-shop-count"></div>
								</div>
							</div>
						</div>
						<div class="modal-view-btn-wrap">
							<button class="btn1 modal-view-btn">View More Info</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>