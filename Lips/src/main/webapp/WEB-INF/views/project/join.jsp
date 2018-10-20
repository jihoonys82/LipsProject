<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>

.joinintro {

    top: 5em;
    position: relative;
    font-weight: bold;
    font-size: 1.2em;
}

.joinform {

 	top: 17em;
    position: relative;
}

.joininput {

    height: 2.5em!important;
    width: 50%;
}

.joinbtn{
	display: block!important;
    top: 5em;
    margin: 0 auto!important;

}
</style>

<div class="alignCenter joinintro">

  <div style="margin :3em;"> 초대코드를 입력하세요 </div>

	
	
	<form action="/project/join" method="POST" class="joinfrom">
	<input type="text" name="invitecode" id="joininvite" class="input joininput">

	
	<input type="submit" value="Join" class="btn focus joinbtn">
	</form>


</div>