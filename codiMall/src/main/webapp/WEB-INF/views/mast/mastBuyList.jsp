<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<style type="text/css">
table, table tr, tr td, th {
	border: 1px solid black;
}

tr, td, th {
	text-align: center;
}
</style>
<script type="text/javascript">

	$(function() {});


	function getBuyList() {
		$.ajax({
			url : "../json/productEachGet",
			type : "post",
			dataType : 'json',
			data : {
				product_num : product_num,
				productSize_size : selSize,
				productEach_color : selColor
			},
			success : function(data) {
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});
	}
</script>
</head>
<body>
	<h1>BUYLIST</h1>
	<h1>
		<a href="${pageContext.request.contextPath}/">HOME</a>
	</h1>
	<select id="sel_buy_state" name="buy_state">
		<option value="1">1배송준비</option>
		<option value="2">2배송중</option>
		<option value="3">3배송완료</option>
		<option value="0">all</option>
		<option value="4">4환불중</option>
		<option value="5">5환불완료</option>
	</select>
	<table id="table_buy_list">
		<tr>
			<th>buy_num</th>
			<th>id</th>
			<th>product_num</th>
			<th>product_name</th>
			<th>size</th>
			<th>color</th>
			<th>each</th>
			<th>price</th>
			<th>expressNum</th>
			<th>pay_date</th>
			<th>result_date</th>
			<th>state</th>
			<th>state1to2</th>
			<th>expressNumFix</th>	
		</tr>
		<c:forEach items="${list}" var="list1">
			<tr class="tr_buy_list">
				<td>${list1.buyDTO.buy_num}</td>
				<td>${list1.buyDTO.member_id}</td>
				<td>${list1.productDTO.product_num}</td>
				<td>${list1.productDTO.product_name}</td>
				<td>${list1.buyStateDTO.buyState_size}</td>
				<td>${list1.buyStateDTO.buyState_color}</td>
				<td>${list1.buyStateDTO.buyState_each}</td>
				<td>${list1.buyStateDTO.buyState_price}</td>
				<td>${list1.buyStateDTO.buyState_expressNum}</td>
				<td>${list1.buyStateDTO.buyState_pay_date}</td>
				<td>${list1.buyStateDTO.buyState_result_date}</td>
				<td>${list1.buyStateDTO.buyState_state}</td>
				<td><form
						action="${pageContext.request.contextPath}/mast/buyState1to2"
						method="post">
						<input class="hid_buy_num" type="hidden"
							value="${list1.buyDTO.buy_num}" name="buy_num">
						expressNum:<input type="number" name="buyState_expressNum"><Br>
						<input class="btn_add" type="button" value="ADD">
					</form></td>
				<td><form
						action="${pageContext.request.contextPath}/mast/expressNumFix"
						method="post">
						<input class="hid_buy_num" type="hidden"
							value="${list1.buyDTO.buy_num}" name="buy_num">
						expressNum:<input type="number" name="buyState_expressNum"><Br>
						<input class="btn_add" type="button" value="ADD">
					</form></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
