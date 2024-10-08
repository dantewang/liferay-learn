# 미리 정의된 요소 변수 참조

요소 소스 편집기에서 원하는 사이트에 커서를 놓고 왼쪽 사이드바에서 변수를 클릭하여 삽입합니다. Custom JSON Element에서 변수를 편집기에 직접 입력해야 합니다. 각 변수의 구문은 아래 표에 나와 있습니다.

| 변수 | 유형: 정의 | 구문 |
| :--- | :--- | :--- |
| | <a href="#context" id="context">**CONTEXT**</a> | |
| 회사 아이디 | 번호: 현재 인스턴스의 회사 ID| `${context.company_id}` |
| 스테이징 그룹임 | 부울: 현재 사이트가 준비되었는지 여부 | `${context.is_staging_group}` |
| 언어 | 텍스트: 현재 언어의 2글자 코드(예: `en`) | `${컨텍스트.언어}` |
| 언어 ID | 텍스트: 현재 언어의 4글자 언어 코드(예: `en_US`) | `${context.language_id}` |
| 레이아웃 이름 현지화 | 텍스트: 페이지의 현지화된 이름 | `${context.layout-name-localized}` |
| 페이지 레이아웃 ID | 번호: 페이지의 ID | `${context.plid}` |
| 간행물 ID | 번호: 간행물 ID | `${context.publication_id}` |
| 범위 그룹 ID | 현재 사이트의 ID | `${context.scope_group_id}` |
| | <a href="#time" id="time">**TIME**</a> | |
| 현재 날짜 | 날짜: 현재 날짜 | `${time.current_date}` |
| 현재 날짜 | 번호: 날짜 | `${time.current_day_of_month}` |
| 현재 요일 | 번호: 요일(**1 = Monday**) | `${time.current_day_of_week}` |
| 올해의 현재 날짜 | 번호: 올해의 날 | `${time.current_day_of_year}` |
| 현재 시간 | 번호: 현재 시간 | `${time.current_hour}` |
| 올해 | 번호: 현재 연도 | `${time.current_year}` |
| 시간 | 시간: 시간 | `${time.time_of_day}` |
| 시간대 이름 현지화 | 텍스트: 로케일에 맞게 현지화된 시간대 | `${time.time_zone_name_localized}` |
| | <a href="#user" id="user">**USER**</a> | |
| 활성 세그먼트 항목 ID | 번호: 사용자의 세그먼트 ID | `${user.active_segment_entry_ids}` |
| 나이 | 숫자: 사용자의 연령(년 수) | `${사용자.나이}` |
| 자산 범주 ID(**Available 7.4 U41+**) | 번호: 사용자 카테고리의 ID | `${user.asset_category_ids}` |
| 자산 태그 이름(**사용 가능한 7.4 U41+**) | 텍스트: 사용자의 태그 | `${user.asset_tag_names}` |
| 생일 | 날짜: 사용자의 생년월일 | `${사용자.생일}` |
| 생성 날짜 | 날짜: Liferay에서 사용자 계정이 생성된 날짜 | `${user.create_date}` |
| 현재 사이트 역할 ID | 숫자: 사용자의 사이트 역할 ID | `${user.current_site_role_ids}` |
| 이메일 도메인 | 텍스트: 사용자의 이메일 도메인 | `${사용자.이메일_도메인}` |
| 이름 | 텍스트: 사용자의 이름 | `${user.first_name}` |
| 전체 이름 | 텍스트: 사용자의 전체 이름 | `${user.full_name}` |
| 그룹 ID | 번호: 사용자가 회원인 사이트의 ID | `${user.group_ids}` |
| 사용자 아이디 | 번호: 사용자의 ID | `${사용자.ID}` |
| 여성 | 부울: 사용자가 여성이면 참 | `${user.is_female}` |
| 성별은 X인가 | 부울: 사용자가 성별 X인 경우 참 | `${user.is_gender_x}` |
| 남성입니다 | 부울: 사용자가 남성이면 참 | `${user.is_male}` |
| Omniadmin | 부울: 사용자가 Omni Admin 사용자(기본 인스턴스의 기본 사용자)인 경우 참 | `${user.is_omniadmin}` |
| 로그인됨 | 부울: 사용자가 로그인한 경우 참 | `${user.is_signed_in}` |
| 직위 | 텍스트: 사용자의 직책 | `${user.job_title}` |
| 언어 ID | 텍스트: 사용자의 언어 코드(예: `en_US`) | `${사용자.언어_ID}` |
| 성 | 텍스트: 사용자의 성 | `${사용자.성명}` |
| 상위 자산 범주 ID(**Available 7.4 U41+**) | 번호: 사용자 카테고리의 모든 상위 카테고리 ID | `${user.parent_asset_category_ids}` |
| 일반 역할 ID | 숫자: 사용자의 일반 역할에 대한 역할 ID | `${user.regular_role_ids}` |
| 사용자 그룹 ID | 번호: 사용자가 속한 사용자 그룹의 ID | `${user.user_group_ids}` |
| | <a href="#conditional-elements" id="conditional-elements">**CONDITIONAL ELEMENTS**\*</a> | |
| IP 스택 시티 | 텍스트: 검색 IP 주소가 발생한 도시 | `${ipstack.city}` |
| IP 스택 대륙 코드 | 텍스트: 검색 IP 주소가 발생한 대륙 코드(예: 북미의 경우 NA) | `${ipstack.continent_code}` |
| IP 스택 대륙 이름 | 텍스트: 대륙 이름 | `${ipstack.continent_name}` |
| IP 스택 국가 코드 | 텍스트: 국가 코드(예: 미국의 경우 US) | `${ipstack.country_code}` |
| IP 스택 국가명 | 텍스트: 국가 이름 | `${ipstack.country_name}` |
| IP 스택 위도 | 숫자: 십진법 위도 | `${ipstack.latitude}` |
| IP 스택 경도 | 숫자: 십진법 경도 | `${ipstack.경도}` |
| IP 스택 지역 코드 | 텍스트: 지역 코드(예: 캘리포니아의 경우 CA) | `${ipstack.region_code}` |
| IP 스택 영역 이름 | 텍스트: 지역 이름 | `${ipstack.region_name}` |
| IP 스택 우편번호 | 번호: 우편번호 | `${ipstack.zip}` |
| 날씨 지도 열기 온도 | 번호: 온도 | `${openweathermap.temp}` |
| 날씨 지도 열기 날씨 설명 | 텍스트: 날씨에 대한 설명(예: "맑은 하늘") | `${openweathermap.weather_description}` |
| 날씨 지도 열기 날씨 ID | 숫자: [날씨 설명에 해당하는 ID](https://openweathermap.or

**\*** [Liferay Commerce Enterprise 활성화](https://learn.liferay.com/w/commerce/installation-and-upgrades/activating-liferay-commerce-enterprise) 활성화하여 Commerce 관련 변수에 액세스합니다.

**\*** 먼저 각 서비스를 활성화하여 ipstack 및 OpenWeatherMap 변수에 액세스합니다. 시스템 또는 인스턴스 설정 &rarr; 플랫폼 &rarr; 검색 경험을 방문하십시오. 사용 확인란을 클릭하고 구성 중인 서비스에 대한 구성을 저장합니다. OpenWeatherMap 서비스는 활성화된 ipstack 서비스에 따라 달라집니다. ipstack 서비스를 사용하는 예는 [개인화 검색 경험](../personalizing-the-search-experience.md) 참조하십시오.

**\*\*** 이러한 기본 변수 외에도 사용자 엔터티의 [사용자 정의 필드](../../../../../system-administration/configuring-liferay/adding-custom-fields.md) 요소의 변수로 참조할 수 있습니다. 예를 들어 이름이 **Employee** 인 사용자 정의 필드는 `user.custom.field.employee` 이 인 요소에서 참조됩니다.

## 관련 주제

* [요소 만들기](./creating-elements.md)
* [청사진 구성 참조 검색](../search-blueprints-configuration-reference.md)
* [요소 관리](./managing-elements.md)