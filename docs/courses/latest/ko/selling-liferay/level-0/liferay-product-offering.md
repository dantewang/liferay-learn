---
toc:
  - ./liferay-product-offering/determining-which-deployment-option-is-best-for-your-customer.md
visibility:
  - Employee
  - Partner
---
# Liferay 제품 제공

여기에서는 Liferay 제품 제공 기본 사항에 대해 알아봅니다.

* Liferay는 단일 제품인 Liferay DXP를 개발합니다.
* 세 가지 제품 배포 서비스가 있습니다.
  * 라이프레이 익스피리언스 클라우드(LXC) [SaaS]
  * Liferay Experience Cloud - 자체 관리형 [PaaS]
  * DXP - 자체 호스팅
* 우리의 영업 접근 방식은 SaaS 우선입니다

## 배경

네 가지 배경 정보를 알아두는 것이 중요합니다.

1. Liferay의 제품은 Liferay DXP로, 이전에 별도의 세 가지 구성 요소로 구성된 단일 제품입니다.

1. Liferay DXP에는 핵심 디지털 경험 플랫폼, 상거래 및 분석이라는 세 가지 주요 기능 세트가 포함되어 있습니다.

1. **모든** 기능은 현재 Liferay DXP에 가입한 고객이 사용할 수 있습니다. 이전에는 세 가지 기능 세트가 별도의 제품이었습니다.

1. 선택한 배포 접근 방식은 제공되는 기능에 영향을 주지 않습니다.

![The Liferay Product line has three capability sets.](./liferay-product-offering/images/01.png)

```{note}
* 이 모듈의 라이브 워크숍에서 [녹화](https://learn.liferay.com/c/portal/login?p_l_id=3026&redirect=%2Fweb%2Fguest%2Fd%2Fl0-2a-liferay-offering) 를 시청하세요.
* 라이브 워크숍에 사용된 프레젠테이션의 [PDF](https://learn.liferay.com/c/portal/login?redirect=%2Fdocuments%2Fd%2Fguest%2Fl0-2a-liferay-offering-pdf) 를 다운로드하세요.
* 이 모듈에 언급된 [판매 결정 흐름](https://learn.liferay.com/c/portal/login?redirect=%2Fdocuments%2Fd%2Fguest%2Fnew-customer-new-project-sales-decision-flow) 을 다운로드하세요.
```

## 모든 배포 접근 방식 지원

Liferay는 항상 선택한 소프트웨어 스택 및 인프라에 대한 고객 투자를 보호해 왔습니다. 결과적으로 Liferay는 고객이 자신의 요구 사항에 맞는 접근 방식을 선택할 수 있도록 세 가지 제품 배포 서비스를 제공합니다.

1. **Liferay Experience Cloud** 는 SaaS(Software-as-a-Service) 배포 모델을 제공합니다.

1. **Liferay Experience Cloud 자체 관리형** 은 PaaS(Platform-as-a-Service) 배포 모델을 제공합니다.

1. **Liferay DXP 셀프 호스팅** 을 통해 고객은 Liferay DXP 구현을 호스팅하는 방법과 사이트를 정확히 선택할 수 있습니다.

이러한 배포 유연성은 SaaS 배포 옵션 외에는 아무것도 제공하지 않는 많은 경쟁업체에 비해 중요한 차별화 요소입니다.

```{note}
Liferay Experience Cloud의 배포 방법은 SaaS이지만 턴키 애플리케이션은 아닙니다. 이는 고객, 파트너 및 GS가 고객의 비즈니스 문제를 해결하는 데 필요한 맞춤형 솔루션을 구축하는 완전한 디지털 경험 플랫폼입니다.
```

![Liferay has three product deployment offerings.](./liferay-product-offering/images/02.png)

일상적인 활동은 각 배포 접근 방식에 따라 다릅니다. 각 활동이 중요하지만 실제 비즈니스 애플리케이션을 제공하는 것이 가장 큰 가치를 갖습니다. 이와 대조적으로 가치가 낮은 활동 중 일부는 시간이 많이 걸리고 어려울 수 있습니다. 선택한 배포 접근 방식에 따라 이러한 활동을 Liferay로 오프로드하여 고객이 가장 중요한 작업에 집중할 수 있습니다.

### DXP 자체 호스팅

전통적으로 Liferay DXP가 판매된 방식은 다음과 같습니다. 고객은 Liferay DXP 번들 또는 Liferay DXP Docker 이미지를 다운로드한 후 다른 모든 것에 대한 책임을 집니다.

여기에 얼마나 많은 작업이 필요한지 과소평가해서는 안 됩니다. 고객은 예상되는 최대 사용 로드를 지원하기에 충분한 Liferay 인스턴스를 배포해야 하며, 둘 이상의 인스턴스가 필요한 경우 로드 밸런싱을 설계해야 하며, 인프라, 배포 방법 및 사이트를 선택해야 합니다. 온프레미스, 프라이빗 클라우드, 퍼블릭 클라우드—그리고 데이터베이스 서버와 같은 플랫폼 소프트웨어를 선택해야 합니다.

그런 다음 해당 인프라와 플랫폼 소프트웨어를 유지 관리하고 DXP를 패치하고 업그레이드해야 합니다.

마지막으로 DXP를 기반으로 솔루션을 구축해야 합니다.

![Liferay DXP Infrastructure contains several components that when self-hosted, require much maintenance.](./liferay-product-offering/images/03.png)

**가치가 낮은 활동**

| 책임                    | 라이프레이 | 고객 |
| --------------------- | ----- | -- |
| 제품                    | ✔     |    |
| 구독(지원, 보증, 면책 등)      | ✔     |    |
| 인프라(SLA 포함 가동 시간)     |       | ✔  |
| 애플리케이션 가동 시간 SLA      |       | ✔  |
| 플랫폼 서비스(데이터베이스, 검색 등) |       | ✔  |
| 아키텍처 및 고가용성           |       | ✔  |
| 업그레이드                 |       | ✔  |
| 업데이트                  |       | ✔  |
| 패치, 보안 핫픽스            |       | ✔  |
| 소프트웨어 문제 해결           |       | ✔  |
| 보안 스캐닝 / SAST / DAST  |       | ✔  |

**가치 높은 활동**

| 책임        | 라이프레이 | 고객 |
| --------- | ----- | -- |
| 애플리케이션 전달 |       | ✔  |

### Liferay Experience Cloud 자체 관리형

Liferay Experience Cloud 자체 관리(이전 DXP Cloud)는 서비스로서의 플랫폼(Platform-as-a-Service) 제품입니다. Liferay는 소프트웨어 자체는 물론 인프라, 모든 플랫폼 서비스 등을 제공합니다.

또한 Liferay Experience Cloud 자체 관리형에는 백업 및 VPN 서비스 등을 포함하는 사전 정의된 제안이 있습니다. 또한 OOTB 고가용성, 자동 확장 기능, 자동 장애 조치 기능을 통해 확장되며 로드 밸런싱을 제공합니다.  이러한 활동은 매우 중요하지만 구현하기가 어렵거나 비용이 많이 들 수 있습니다.

![Liferay Experience Cloud Self Managed provides many infrastructure services to the customer.](./liferay-product-offering/images/04.png)

Liferay는 또한 99.95%의 인프라 가동 시간 SLA를 제공하고, 플랫폼 서비스에 대한 정기적인 업데이트를 수행하며, 빌드 관리와 함께 전체 DevSecOps CI/CD 파이프라인을 제공합니다.

그러나 업데이트, 패치, 업그레이드 및 최종적으로 가치가 높은 애플리케이션 제공 작업과 같이 시간이 많이 걸리고 상대적으로 가치가 낮은 고객의 책임 활동이 여전히 있습니다.

**가치가 낮은 활동**

| 책임                    | 라이프레이 | 고객 |
| --------------------- | ----- | -- |
| 제품                    | ✔     |    |
| 구독(지원, 보증, 면책 등)      | ✔     |    |
| 인프라(SLA 포함 가동 시간)     | ✔     |    |
| 애플리케이션 가동 시간 SLA      | ✔     |    |
| 플랫폼 서비스(데이터베이스, 검색 등) | ✔     |    |
| 아키텍처 및 고가용성           | ✔     |    |
| 업그레이드                 |       | ✔  |
| 업데이트                  |       | ✔  |
| 패치, 보안 핫픽스            |       | ✔  |
| 소프트웨어 문제 해결           |       | ✔  |
| 보안 스캐닝 / SAST / DAST  |       | ✔  |

**가치 높은 활동**

| 책임        | 라이프레이 | 고객 |
| --------- | ----- | -- |
| 애플리케이션 전달 |       | ✔  |

### Liferay Experience Cloud

최종 제품 배포 서비스는 Liferay Experience Cloud입니다. 이는 고객이 실제로 중요한 업무, 즉 비즈니스 애플리케이션 생성, 실행 및 유지 관리에 집중할 수 있도록 해주는 SaaS 제품입니다.

Liferay Experience Cloud SaaS를 통해 Liferay는 Liferay DXP를 유지하는 데 필요한 모든 인프라와 모든 저부가가치 활동을 제공하고 관리합니다. Liferay는 분기별로 제품 업데이트를 적용하여 고객 데이터에 대해 테스트하고 SAST 및 DAST 보안 검색을 수행합니다.

주목해야 할 중요한 점은 배포 모델이 SaaS이지만 이는 턴키 애플리케이션이 아니라는 것입니다. 고객은 DXP가 제공하는 모든 기본 기능을 포함하여 사용할 수 있는 전체 Liferay DXP 인스턴스를 보유하고 있으며 해당 기반 위에 맞춤형 애플리케이션을 구축할 수 있습니다. 또한 파트너 및 Liferay의 글로벌 서비스 조직과 계속 협력하여 이러한 애플리케이션을 구축하는 데 도움을 줄 수 있습니다.

**가치가 낮은 활동**

| 책임                    | 라이프레이 | 고객 |
| --------------------- | ----- | -- |
| 제품                    | ✔     |    |
| 구독(지원, 보증, 면책 등)      | ✔     |    |
| 인프라(SLA 포함 가동 시간)     | ✔     |    |
| 애플리케이션 가동 시간 SLA      | ✔     |    |
| 플랫폼 서비스(데이터베이스, 검색 등) | ✔     |    |
| 아키텍처 및 고가용성           | ✔     |    |
| 업그레이드                 | ✔     |    |
| 분기별 업데이트              | ✔     |    |
| 패치, 보안 핫픽스            | ✔     |    |
| 소프트웨어 문제 해결           | ✔     |    |
| 보안 스캐닝 / SAST / DAST  | ✔     |    |

**가치 높은 활동**

| 책임        | 라이프레이 | 고객 |
| --------- | ----- | -- |
| 애플리케이션 전달 |       | ✔  |

이러한 배경 지식을 바탕으로 고객에게 가장 적합한 배포 옵션을 결정하는 방법을 배울 수 있습니다.

[가자!](./liferay-product-offering/determining-which-deployment-option-is-best-for-your-customer.md)
