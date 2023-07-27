# 검색 인프라 업그레이드

Liferay를 업그레이드하는 동안 Elasticsearch를 사용할 때 검색 환경을 고려해야 합니다. 정확한 단계는 기존 검색 엔진 설치 및 Liferay 버전에 따라 다르지만 [기존 인덱스 백업](./backing-up-elasticsearch.md)부터 시작해야 합니다.

* [검색 엔진 호환성 매트릭스 참조](https://help.liferay.com/hc/ko/articles/360016511651) : 항상 지원되는 최신 Elasticsearch 버전을 실행하는 것이 좋습니다.
* Liferay 7.4부터 Liferay 엔터프라이즈 검색(LES) 애플리케이션이 Liferay DXP와 함께 번들로 제공됩니다. 추가 설치 단계가 필요하지 않습니다. 자세한 내용은 [Liferay Enterprise 검색 활성화](../../../liferay-enterprise-search/activating-liferay-enterprise-search.md) 참조하십시오.
* 이미 지원되는 Elasticsearch 버전을 사용 중인 경우 기존 Elasticsearch 인스턴스를 업데이트하지 않고 계속 사용할 수 있습니다.
* Liferay 7.4부터 검색 조정(동의어 집합 및 결과 순위) 인덱스는 데이터베이스 테이블에서 지원됩니다. Liferay 업그레이드 중에 검색 엔진이 Liferay에 연결되면 데이터가 데이터베이스로 전파됩니다. 새 Elasticsearch 인스턴스를 설정하는 경우 [검색 튜닝 인덱스를 백업 및 복원한 다음 [Groovy 스크립트를 실행하여](#importing-the-search-tuning-indexes-in-7-4) 수동으로 인덱스 데이터를 새 데이터베이스 테이블로 가져와야 합니다](./backing-up-elasticsearch.md)

## 업그레이드 단계

```{important}
이 단계를 진행하기 전에 [검색 색인을 백업](./backing-up-elasticsearch.md)하십시오.
```

1. 시스템이 지원되는 최소 Elasticsearch 버전 이상인지 확인하십시오. 그렇지 않은 경우 [최신 지원되는 Elasticsearch](https://help.liferay.com/hc/ko/articles/360016511651) by [업그레이드로 이동합니다.](upgrading-to-elasticsearch-8.md). 새 Elasticsearch 클러스터를 설치하고 업그레이드된 Liferay에 연결할 수 있지만 Elasticsearch 클러스터에 Liferay DXP 7.2 및 7.3의 Liferay 검색 튜닝 기능에 대한 인덱스와 같이 기본 스토리지로 사용되는 인덱스가 포함된 경우 일부 데이터가 손실될 수 있습니다. [기본 스토리지에 사용되는 인덱스 백업 및 복원](backing-up-elasticsearch.md#backing-up-and-restoring-indexes-used-for-primary-storage) 및 [7.4의 검색 튜닝 인덱스 가져오기기를 참조하십시오.](#importing-the-search-tuning-indexes-in-7-4) .

1. [Liferay를 Elasticsearch](../connecting-to-elasticsearch.md) 에 연결하고 [보안](../securing-elasticsearch.md)구성합니다.

1. [Liferay를 업그레이드하십시오.](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics.md)

1. [검색 색인 및 맞춤법 검사 사전을 다시 인덱싱합니다.](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics/post-upgrade-considerations.md)
   
   [Workflow Metrics 인덱스를 다시 인덱싱하는 것을 잊지 마십시오.](../../../../process-automation/workflow/using-workflows/using-workflow-metrics.md#re-indexing-workflow-metrics)

1. [업그레이드된 시스템에서 검색 환경](#test-the-upgraded-search-experience) 테스트하여 모든 것이 예상대로 작동하는지 확인합니다.

Liferay 7.4를 사용 중이고 Liferay 엔터프라이즈 검색 애플리케이션을 사용하는 경우 Liferay DXP</a>과 함께 로 제공되므로 설치 단계가 필요하지 않습니다. Liferay 7.2 또는 7.3을 사용 중인 경우 계속 읽어 애플리케이션을 설치하세요.</p> 

## Liferay 7.2 및 7.3에서 Liferay 엔터프라이즈 검색 업그레이드

LES 및 해당 앱은 Liferay 7.4와 함께 번들로 제공되기 때문에 이러한 단계는 Liferay 7.2 또는 7.3으로 업그레이드하는 경우에만 필요합니다. [기본 업그레이드 단계](#upgrade-steps) 를 따른 다음 다음 선택적 단계를 따릅니다. 

1. 현재 [Kibana 및 Monitoring](../../../liferay-enterprise-search/monitoring-elasticsearch.md)을 사용 중인 경우 Elasticsearch 버전과 일치하는 Kibana 버전을 설치합니다.

1. 설정 및 버전에 적용 가능한 LES 애플리케이션을 설치하고 구성합니다. 자세한 내용은 [LES 호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360016511651#Liferay-Enterprise-Search) 을 참조하십시오.

## 업그레이드된 검색 환경 테스트

업그레이드된 검색 환경을 수동으로 테스트하여 의존하는 기능이 예상대로 작동하는지 확인하세요. 무언가가 작동하지 않거나 예상과 다르게 작동하는 경우 주요 변경 사항 문서를 검토하십시오.

- [Liferay 7.4 주요 변경 사항](./../../../../liferay-internals/reference/7-4-breaking-changes.md)
- [Liferay 7.3 주요 변경 사항](./../../../../liferay-internals/reference/7-3-breaking-changes.md)
- [Liferay 7.2 주요 변경 사항](./../../../../liferay-internals/reference/7-2-breaking-changes.md)

## Liferay 7.2 이후 이름이 변경된 LES 애플리케이션

> **LES 가입자**

이러한 LES 앱은 기능을 더 잘 반영하고 LES 앱으로서의 정체성을 강조하기 위해 7.3 수명 주기에서 이름이 변경되었습니다.

| 기능                      | 이전 앱 이름                                        | 새 앱 이름                      | 7.2 구성 파일                                                                                                                  | 7.3/7.4 구성 파일                                                                                                  |
|:----------------------- |:---------------------------------------------- |:--------------------------- |:-------------------------------------------------------------------------------------------------------------------------- |:-------------------------------------------------------------------------------------------------------------- |
| Elasticsearch 클러스터 모니터링 | X-Pack 모니터링에 대한 Liferay 커넥터[Elastic Stack 6.x] | Liferay 엔터프라이즈 검색 모니터링      | `com.liferay.portal.search.elasticsearch6.xpack.monitoring.web.internal.configuration.XPackMonitoringConfiguration.config` | `com.liferay.portal.search.elasticsearch.monitoring.web.internal.configuration.MonitoringConfiguration.config` |
| Elasticsearch 클러스터 보안   | X-Pack 보안에 대한 Liferay 커넥터[Elastic Stack 6.x]   | Liferay 엔터프라이즈 검색 보안        | 조치가 필요하지 않습니다. 이 앱은 DXP 7.4에서 사용할 수 없습니다. 그 기능은 Elasticsearch 커넥터에 통합되어 있습니다.                                              |                                                                                                                |
| 기계 학습을 사용하여 검색 알고리즘 최적화 | 순위를 매기는 Elasticsearch 학습에 대한 Liferay 커넥터       | Liferay Enterprise 검색 순위 학습 | 변경 사항 없음.                                                                                                                  |                                                                                                                |

Liferay 7.3 및 7.4 위젯과 구성 이름은 동일합니다.

Liferay 7.2에서 업그레이드하는 경우 앱 및 구성의 이름을 바꾸면 다음과 같은 업그레이드 영향이 있습니다.

1. LES Monitoring 위젯의 이름은 이제 **Elasticsearch Monitoring** 입니다. 시작하는 동안 모듈 업그레이드 단계가 실행되어 **Liferay Enterprise Search Monitoring** 이 배포되면 앱 이름이 변경됩니다. 조치가 필요하지 않습니다.
1. 1. 구성 파일 이름이 `com.liferay.portal.search.elasticsearch6.xpack.monitoring.web.internal.configuration.XPackMonitoringConfiguration.config`에서 `com.liferay.portal.search.elasticsearch.monitoring.web.internal.configuration.MonitoringConfiguration`으로 변경됩니다. 속성은 이전과 동일합니다. 포털을 시작하는 동안 모듈 업그레이드 단계가 실행되어 구성의 이름이 변경됩니다. 별도의 조치는 필요하지 않습니다.

1. 모니터링 위젯에 대한 Kibana 기본 경로가 변경되었습니다. `kibana.yml`에서 원래 설정을 변경해야 합니다. 

   ```yaml
   server.basePath: "/o/portal-search-elasticsearch-xpack-monitoring/xpack-monitoring-proxy"
   ```

에 

   ```yaml
   server.basePath: "/o/portal-search-elasticsearch-monitoring/monitoring-proxy"
   ```

## 7.4에서 검색 튜닝 인덱스 가져오기

다음 Liferay DXP 검색 조정 인덱스는 Elasticsearch 클러스터에 있습니다. 

* `liferay-[companyId]-search-tuning-rankings`
* `liferay-[companyId]-search-tuning-synonyms`

사전 업그레이드 시스템에서 검색 튜닝 기능을 사용하고 있었지만 업그레이드 후 클러스터에 검색 튜닝 인덱스 문서가 없는 경우 사전 업그레이드 클러스터에서 검색 튜닝 인덱스 [](./backing-up-elasticsearch.md) 먼저 백업하고 복원해야 합니다. 그런 다음 Groovy 스크립트를 실행하여 색인 데이터를 새 데이터베이스 테이블로 수동으로 가져옵니다. 이는 사전 업그레이드 클러스터를 업그레이드하는 대신 새 Elasticsearch 클러스터에 연결하는 경우에 발생할 수 있습니다.

Groovy 가져오기 스크립트를 실행하려면

1. 스크립팅 콘솔로 이동합니다. 제어판 &rarr; 서버 관리에서 스크립트 탭으로 이동합니다.

1. 다음 스크립트를 실행하여 결과 순위 데이터를 해당 데이터베이스 테이블로 가져옵니다. 

   ```groovy
   import com.liferay.portal.instances.service.PortalInstancesLocalService;
   import com.liferay.portal.search.tuning.rankings.storage.RankingsDatabaseImporter;
   import com.liferay.registry.Registry;
   import com.liferay.registry.RegistryUtil;

   Registry registry = RegistryUtil.getRegistry();

   PortalInstancesLocalService portalInstancesLocalService = registry.getServices(PortalInstancesLocalService.class, null)[0];
   RankingsDatabaseImporter rankingsDatabaseImporter = registry.getServices(RankingsDatabaseImporter.class, null)[0];

   for (long companyId : portalInstancesLocalService.getCompanyIds()) {
    rankingsDatabaseImporter.populateDatabase(companyId);
   }
   ```

1. 다음 스크립트를 실행하여 동의어 집합 데이터를 해당 데이터베이스 테이블로 가져옵니다. 

   ```groovy
   import com.liferay.portal.instances.service.PortalInstancesLocalService;
   import com.liferay.portal.search.tuning.synonyms.storage.SynonymSetsDatabaseImporter;
   import com.liferay.registry.Registry;
   import com.liferay.registry.RegistryUtil;

   Registry registry = RegistryUtil.getRegistry();

   PortalInstancesLocalService portalInstancesLocalService = registry.getServices(PortalInstancesLocalService.class, null)[0];
   SynonymSetsDatabaseImporter synonymSetsDatabaseImporter = registry.getServices(SynonymSetsDatabaseImporter.class, null)[0];

   for (long companyId : portalInstancesLocalService.getCompanyIds()) {
    synonymSetsDatabaseImporter.populateDatabase(companyId);
   }
   ```

1. 동의어 집합 및 결과 순위를 테스트하여 모든 것이 예상대로 작동하는지 확인하십시오.

## 관련 항목

* [Elasticsearch 업그레이드](../getting-started-with-elasticsearch.md)
* [Elasticsearch 시작하기](../getting-started-with-elasticsearch.md)
* [Elasticsearch 설치](../installing-elasticsearch.md)
* [Elasticsearch에 연결](../connecting-to-elasticsearch.md)
* [Elasticsearch 보안](../securing-elasticsearch.md)
* [라이프레이 업그레이드](../../../../installation-and-upgrades/upgrading-liferay/upgrade-basics.md)
