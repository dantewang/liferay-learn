---
toc:
  - ./managing-user-data/exporting-user-data.md
  - ./managing-user-data/sanitizing-user-data.md
  - ./managing-user-data/configuring-the-anonymous-user.md
---
# 사용자 데이터 관리(GDPR)

```{toctree}
:maxdepth: 3

managing-user-data/exporting-user-data.md
managing-user-data/sanitizing-user-data.md
managing-user-data/configuring-the-anonymous-user.md
```

Liferay의 UAD(사용자 관련 데이터) 프레임워크는 GDPR(일반 데이터 보호 규정)의 기술적으로 까다로운 두 가지 요구 사항을 충족하는 데 도움이 됩니다.

- 데이터 이식성에 대한 [권리](./managing-user-data/exporting-user-data.md)
* [잊혀질 권리](./managing-user-data/sanitizing-user-data.md)

다음 Liferay 애플리케이션에는 UAD 프레임워크가 적용되어 있습니다.

| 라이프레이 애플리케이션 | 라이프레이 7.2(DXP & CE) | 라이프레이 7.3(DXP & CE) | 라이프레이 7.4 |
|:------------ |:------------------- |:------------------- |:--------- |
| 공지           | 그렇다                 | 그렇다                 | 그렇다       |
| 블로그          | 그렇다                 | 그렇다                 | 그렇다       |
| 북마크(사용되지 않음) | 그렇다                 | 그렇다                 | 그렇다       |
| 연락 센터        | 그렇다                 | 그렇다                 | 그렇다       |
| 문서 및 미디어     | 그렇다                 | 그렇다                 | 그렇다       |
| 폼            | 부정                  | 그렇다                 | 그렇다       |
| 게시판          | 그렇다                 | 그렇다                 | 그렇다       |
| 객체           | 부정                  | 부정                  | 그렇다       |
| 웹 콘텐츠        | 그렇다                 | 그렇다                 | 그렇다       |
| Wiki         | 그렇다                 | 그렇다                 | 그렇다       |

```{important}
Liferay DXP의 사용자 관리 기능을 통해 웹 사이트 사용자의 개인 데이터를 처리하는 회사는 GDPR 요구 사항을 해결할 수 있습니다. 그러나 여기에서 논의된 도구와 GDPR 요구 사항을 직접적으로 해결하는 것을 목표로 하는 도구를 포함하여 문서의 다른 곳에서 설명한 도구는 GDPR의 법적 요구 사항 준수를 보장하지 않습니다. 웹 사이트에서 사용자 개인 데이터를 처리하고 GDPR의 관할 하에 있는 각 회사 또는 개인은 GDPR을 완전히 준수하는 데 필요한 정확한 단계를 신중하게 결정해야 합니다.
```
