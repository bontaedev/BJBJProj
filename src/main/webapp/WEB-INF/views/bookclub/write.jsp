<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>BookClub 모집</title>
<style>
#room_people {
	width: 25%;
}

#meet_week {
	width: 25%;
}

#place {
	width: 25%;
}

#open_date {
	
}

#close_date {
	
}

.writing {
	text-align: right;
}

h3 {
	margin-bottom: 50px;
}

.row:not(#head) {
	margin-bottom: 20px;
}

.radioBox {
	margin: auto;
}

#content {
	height: 200px;
	resize: none;
}

#head {
	border-bottom: 1px solid lightgray;
	text-align: left;
	margin: 0;
}

#p1 {
	margin-top: 15px;
}
</style>
</head>
<body>
	<form action="/club/write" id="submitForm" method="post"
		enctype="multipart/form-data">
		<div class="container">

			<div class="row">
				<div class="col">
					<h3 id="head">BookClub</h3>
				</div>
			</div>

			<div class="row">
				<div class="col d-flex justify-content-left">
					<h4>BookClub 모집</h4>
				</div>
			</div>

			<div class="row">
				<div class="col-3 writing">
					<label for="title" class="form-label">모임 제목</label>
				</div>
				<div class="col">
					<input type="text" class="form-control" id="room_title"
						name="room_title" placeholder="제목을 입력하세요.">
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="file" class="form-label">도서 이름</label>
				</div>
				<div class="col">
					<input type="file" class="form-control" id="files" name="files"
						multiple>
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모임 장소</label>
				</div>
				<div class="col radioBox">
					<input type="radio" class="tag" name="tag" value="온라인">온라인
					<input type="radio" class="tag" name="tag" value="오프라인" checked>오프라인
					<input type="radio" class="tag" name="tag" value="온/오프라인">온/오프라인
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모임 횟수</label>
				</div>
				<div class="col">
					<select class="form-select" id="meet_week" name="meet_week"
						aria-label="Default select example">
						<option value="1">주 1회</option>
						<option value="2">주 2회</option>
						<option value="3">주 3회</option>
						<option value="4">주 4회</option>
						<option value="5">주 5회</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모집 인원</label>
				</div>
				<div class="col">

					<select class="form-select" id="room_people" name="room_people"
						aria-label="Default select example">
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모임 지역</label>
				</div>
				<div class="col">
					<select class="form-select" id="place" name="place"
						aria-label="Default select example">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="대전">대전</option>
						<option value="부산">부산</option>
						<option value="기타">기타(모집 상세에 기입)</option>
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모임 기간</label>
				</div>
				<div class="col">
					<input type="text" id="open_date" class="form-control"
						name="open_date" value="202-07-11" />
				</div>

				<div class="col">
					<input type="text" id="close_date" class="form-control"
						name="close_date" value="202-07-11" />
				</div>
			</div>



			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모집 상세</label>
				</div>
				<div class="col">
					<textarea class="form-control" id="room_detail" name="room_detail"
						rows="5" placeholder="내용을 입력해주세요."></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col d-flex justify-content-end btnBox">
					<p id="p1">* 모집 기간은 등록일로부터 2주입니다</p>
					<button type="button" class="btn btn-secondary m-1 btn-lg"
						id="toCancle">취소</button>
					<button type="button" class="btn btn-primary m-1 btn-lg" id="write">등록</button>
				</div>
			</div>
		</div>
	</form>
	<script>
		// 뒤로 가기 버튼
		document.getElementById("toCancle").onclick = function() {
			location.href = "/club/toClub";
		}

		// 등록 버튼 클릭
		$("#write").on("click", function() {
			var con = confirm("모집 기간은 등록일로부터 2주입니다. 등록하시겠습니까?");
			if (con) {
				$("#submitForm").submit();
			}
		})

		//DatePicker
		$("#open_date").datepicker();
		$("#close_date").datepicker();
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd' // Input Display Format 변경
			,
			showOtherMonths : true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,
			showMonthAfterYear : true // 년도 먼저 나오고, 뒤에 월 표시
			,
			changeYear : true // 콤보박스에서 년 선택 가능
			,
			changeMonth : true
		// 콤보박스에서 월 선택 가능
		})
	</script>
</body>
</html>