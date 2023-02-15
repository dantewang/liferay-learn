---
toc:
- ./using-oauth2/creating-oauth2-applications.md
- ./using-oauth2/authorizing-account-access-with-oauth2.md
- ./using-oauth2/oauth2-scopes.md
- ./using-oauth2/using-oauth2-to-authorize-users.md
---
# OAuth 2.0 사용

```{toctree}
:maxdepth: 3

using-oauth2/creating-oauth2-applications.md
using-oauth2/authorizing-account-access-with-oauth2.md
using-oauth2/oauth2-scopes.md
using-oauth2/using-oauth2-to-authorize-users.md
```

OAuth 2.0은 업계 표준 인증 프로토콜입니다. 사용자는 Liferay 기반 웹사이트에서 선택한 자격 증명을 다양한 클라이언트와 원활하게 공유할 수 있습니다. OAuth 2.0은 사용자 소유 리소스(예: 이메일 주소, 사용자 프로필 사진 또는 계정의 다른 항목) 및 기타 허가된 리소스에 대한 암호 없는 액세스 권한을 부여하여 작동합니다. OAuth 2.0의 디자인은 HTTPS를 통한 모든 인증 전송을 암호화하여 시스템 간에 전달되는 데이터가 가로채는 것을 방지합니다.

OAuth 2.0 앱 만들기로 바로 이동하거나 작동 방식을 알아보기 위해 계속 읽을 수 있습니다.

1. [OAuth 2.0 애플리케이션 생성](./using-oauth2/creating-oauth2-applications.md)
1. [범위 정의](./using-oauth2/oauth2-scopes.md)
1. [계정 액세스 권한 부여](./using-oauth2/authorizing-account-access-with-oauth2.md)

## OAuth 2.0의 흐름

OAuth 2.0은 가능한 한 웹 표준을 활용합니다. 전송은 HTTPS로 암호화됩니다. 토큰은 HTTP 헤더로 구현됩니다. 데이터는 웹 서비스를 통해 전달됩니다.

OAuth 2.0의 작동 방식은 다음과 같습니다.

![OAuth 2.0은 웹 표준을 활용합니다.](./using-oauth2/images/01.png)

1. 사용자는 Liferay 기반 웹 사이트의 자격 증명을 통해 인증을 지원하는 타사 애플리케이션에 액세스합니다. 애플리케이션(웹 또는 모바일)에서 사용자는 OAuth를 통해 인증을 요청하고 브라우저 또는 앱을 Liferay 기반 웹사이트로 보냅니다. _PKCE_ (아래 설명 참조)을 사용하는 경우 애플리케이션은 코드 검증기도 생성하고 여기에 변환을 적용하여 생성된 코드 챌린지를 보냅니다.

1. 사용자는 애플리케이션이 액세스 권한을 원하는 리소스를 인증하고 표시합니다. 사용자가 *Allow*을 클릭하여 권한을 부여하면 Liferay는 HTTPS를 통해 애플리케이션으로 전송되는 인증 코드를 생성합니다.

1. 그런 다음 애플리케이션은 보다 영구적인 인증 토큰을 요청하고 요청과 함께 코드를 전송합니다( _PKCE_ 코드 검증기와 함께).

1. 인증 코드가 일치하면(그리고 변환된 _PKCE_ 코드 검증기가 이전에 보낸 코드 챌린지와 일치하면) Liferay는 이 사용자 및 애플리케이션 조합에 대한 인증 토큰을 암호화 방식으로 생성합니다. HTTPS를 통해 애플리케이션에 토큰을 보냅니다. 이제 초기 승인이 완료되었습니다!

1. 응용 프로그램이 데이터를 검색해야 하는 경우 해당 데이터를 가질 수 있는 권한이 있음을 증명하는 요청과 함께 토큰을 보냅니다.

1. 토큰이 Liferay가 해당 사용자 및 애플리케이션에 대해 가지고 있는 것과 일치하면 데이터를 검색할 수 있는 액세스 권한이 부여됩니다.

그 설명은 많은 용어를 던집니다. 아래에 제공된 정의.

## OAuth 2.0 용어

**인증:** 시스템이 해당 자격 증명을 저장된 것과 일치시켜 사용자가 누구인지 확인할 수 있도록 자격 증명을 제공합니다. OAuth는 인증 프로토콜이 아닙니다.

**인증:** 다른 시스템에 저장된 리소스에 대한 액세스 권한을 부여합니다. OAuth는 인증 프로토콜입니다.

**애플리케이션:** 리소스에 대한 액세스 권한을 부여받아야 하는 모든 클라이언트(웹, 모바일 등). 사용자가 리소스에 대한 액세스 권한을 부여하려면 먼저 관리자가 애플리케이션을 등록해야 합니다.

**클라이언트:** *애플리케이션*과 거의 동의어입니다. 단, 애플리케이션은 웹 및 모바일과 같은 변형을 가질 수 있습니다. 이러한 변종은 클라이언트입니다.

**클라이언트 ID:** 인식할 수 있도록 클라이언트에 부여된 식별자입니다.

**Client Secret:** 클라이언트를 적법한 클라이언트로 식별하는 이전에 동의한 텍스트 문자열입니다.

**액세스 토큰:** 해당 사용자의 리소스에 액세스하기 위해 사용자/클라이언트 조합을 식별하는 암호화 생성 텍스트 문자열입니다.

**응답 유형:** OAuth 2.0은 여러 응답 유형을 지원합니다. 위의 그림과 설명은 가장 일반적인 인증 코드입니다. 다른 응답 유형은 *암호* (사용자 이름과 암호로 로그인) 및 *클라이언트 자격 증명* (헤드리스 사전 정의된 애플리케이션 액세스)입니다.

**범위:** 애플리케이션이 액세스하려는 항목을 정의하는 항목 목록입니다. 이 목록은 사용자가 리소스에 대한 액세스를 허용하거나 거부할 수 있도록 초기 권한 부여 요청 중에 전송되거나 애플리케이션 등록에서 선택한 범위로 기본 설정됩니다.

**콜백 URI:** 리디렉션 끝점 URI라고도 합니다. 인증이 완료되면 인증 서버(즉, Liferay)가 클라이언트를 이 사이트로 보냅니다.

## 다음 단계

* [OAuth2 애플리케이션 생성](./using-oauth2/creating-oauth2-applications.md)
* [OAuth2로 계정 액세스 권한 부여](./using-oauth2/authorizing-account-access-with-oauth2.md)
* [OAuth 2 범위](./using-oauth2/oauth2-scopes.md)
* [OAuth2를 사용하여 사용자 인증](./using-oauth2/using-oauth2-to-authorize-users.md)
