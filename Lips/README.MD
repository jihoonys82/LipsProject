# Spring-Security

## Spring-Security Ver
 SpringSecurity 5.0.8 RELEASE

## Spring-Security Tags

### .jsp
  + jsp 에서 유저정보 호출하기
    1. jsp 상단에 taglib을 추가한다.
    <pre><code><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %></pre></code>

    2. EL로 값을 가져올 경우
    <pre><code>${sessionScope.user.userId}  =>  &ltsec:authentication property="principal.userId"/&gt </pre></code>

    3. 사용자의 권한을 확인할 경우
    <pre><code>${sessionScope.user.userLevel eq 2}  =>  &ltsec:authorize access="hasAuthority('USER')"&gt</pre></code>
      - 세션 유저객체의 레벨을 확인함        =>      토큰이 접근 권한을 가지고 있는지 확인

      <h3> 예외</h3>
    <pre><code>${sessionScope.login eq true}</pre></code>
    <h4>
    sessionScope.login 값은 SpringSecurity에서 지원한다.<br>
    따라서 이전에 사용하던 형식 그대로 사용가능하다.
    (하지만 어디서 충돌이 생길지 모르니 sec 태그로 변경 추천)<br>
    </h4>

    4. 사용자 권한 확인 메소드
      - hasRole('권한') , hasAuthority('권한')
        해당 권한을 가졌는지 검사한다.
      - hasAnyRole('권한1,권한2') , hasAnyAuthority('권한1 , 권한2')
        지정한 권한 중 하나라도 가졌는지 검사한다. 각 권한은 콤마로 split 된다.
      - permitAll
        모두 허용한다.
      - denyAll
        모두 거부한다.
      - isAnonymous()
        임의 사용자인지 검사한다.(비로그인 유저)
      - isAuthenticated()
        인증된 사용자인지 검사한다. 기억된 사용자도 인증 사용자로 처리한다.
      - isRememberMe()
        기억된 사용자인지 검사한다.
      - isFullyAuthenticated()
        완전한 인증을 거친 사용자인지 검사한다. 기억된 사용자인 경우 완전한 인증을 거치지 않은 것으로 판단한다.
      - hasIpAddress('IP format')
        클라이언트가 지정한 IP인지 검사한다.

       * 모든 메소드의 앞에 !을 붙여 반대상황을 체크할 수 있다.
       ex) !hasRole('ADMIN') = ADMIN 권한을 가지고있지 않은 사용자

### .java
  + Controller에서 유저정보 호출하기
    ex)
    <pre><code>
    Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String userNick;

    if(user instanceof User) {
			userNick = ((User)user).getNick();
		}else {
			userNick = user.toString();
		}
		logger.info(userNick+"님 환영합니다");
    </pre></code>
    - SecurityContextHolder가 받은 요청의 Authentication객체의 값을 받는다.
      전달받은 값이 User와 같은 타입의 객체일 경우 (User) 로 캐스팅 하여 사용한다.
      
      <h2>유저객체 변경사항 10-17 17:00 commit 이후 적용</h2>
      <pre><code>
      	User user = new GetUserByToken();
      </code></pre>
      
      객체 생성하여 사용가능
