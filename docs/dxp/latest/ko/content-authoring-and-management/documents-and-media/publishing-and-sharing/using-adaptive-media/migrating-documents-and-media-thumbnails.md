# 문서 및 미디어 축소판을 Adaptive Media로 마이그레이션

DXP는 적응형 미디어를 사용하여 문서 및 미디어의 이미지에 대한 썸네일을 자동으로 생성합니다. 이 기능은 DXP 7.1+부터 기본적으로 설치됩니다. 그러나 Adaptive Media를 지원하지 않는 레거시 버전을 사용 중이고 최신 DXP 버전으로 업그레이드했으며 Adaptive Media를 사용하여 문서 및 미디어 썸네일을 관리하려는 경우 계속 읽어 마이그레이션 프로세스에 대해 알아보세요.

```{note}
여기에 설명된 작업을 수행하려면 포털 관리자여야 합니다.
```

## 대체 이미지 해상도 추가

기존 문서 및 미디어 축소판을 마이그레이션하려면 다음 포털 속성에 지정된 값과 일치하는 최대 높이 및 최대 너비 값이 있는 적응형 미디어에 새 이미지 해상도를 추가해야 합니다.

* `dl.file.entry.thumbnail.max.height`
* `dl.file.entry.thumbnail.max.width`
* `dl.file.entry.thumbnail.custom1.max.height`
* `dl.file.entry.thumbnail.custom1.max.width`
* `dl.file.entry.thumbnail.custom2.max.height`
* `dl.file.entry.thumbnail.custom2.max.width`

이러한 속성 중 일부는 활성화되지 않을 수 있습니다. 활성화된 속성에 대해 Adaptive Media에서 이미지 해상도를 생성하기만 하면 됩니다.

새로운 이미지 해상도를 생성하려면 [이미지 해상도 추가](./adding-image-resolutions.md) 참조하십시오.

## 적응형 미디어 이미지 만들기

필요한 이미지 해상도가 존재하면 문서 및 미디어 축소판을 적응형 미디어 이미지로 변환할 수 있습니다.

문서 및 미디어 축소판을 Adaptive Media로 마이그레이션하는 방법에는 두 가지가 있습니다.

* 썸네일 이미지 해상도에 맞게 이미지 조정: 기존 썸네일의 크기를 적응형 미디어 이미지 해상도의 값으로 조정합니다. 이 작업은 이미지 수에 따라 시간이 걸릴 수 있습니다. 이는 이미지 수가 적거나 이미지를 처음부터 생성하려는 경우에만 권장됩니다. 이 접근 방식은 [누락된 적응 이미지 생성](./managing-image-resolutions.md#generating-missing-adapted-images) 에서 자세히 다룹니다.

* 기존 썸네일을 재사용하는 마이그레이션 프로세스 실행: 기존 썸네일을 Adaptive Media에 복사합니다. 이는 계산 비용이 많이 드는 크기 조정 작업을 방지하므로 성능이 더 좋습니다.

### 마이그레이션 프로세스 실행

마이그레이션 프로세스는 [Gogo 콘솔 명령 세트입니다](../../../../liferay-internals/fundamentals/using-the-gogo-shell/gogo-shell-commands.md) .

1. **글로벌 메뉴** &rarr; **제어판** &rarr; **Gogo Shell** 로 이동하세요.

   ![Navigate to the Gogo Shell.](./migrating-documents-and-media-thumbnails/images/01.png)

1. `thumbnails:check` 명령을 실행하세요. 각 인스턴스에 대해 마이그레이션 대기 중인 미리보기 이미지 수가 나열됩니다.

1. `thumbnails: migration` 명령을 실행합니다. 그러면 마이그레이션 프로세스가 실행되며, 이미지 수에 따라 완료하는 데 시간이 걸릴 수 있습니다.

1. `thumbnails:cleanUp` 명령을 실행하세요. 이렇게 하면 원본 문서 및 미디어 축소판이 모두 삭제되고 `thumbnails:check`에서 반환된 개수가 업데이트됩니다. 따라서 마이그레이션 명령을 실행하고 마이그레이션이 성공적으로 실행되었으며 마이그레이션 대기 중인 이미지가 없는지 **만** `thumbnails:cleanUp`을 실행해야 합니다.

## 문제 해결

마이그레이션 프로세스를 실행한 후 특정 시점에 Adaptive Media 배포를 취소하는 경우 문서 및 미디어 축소판을 다시 생성해야 합니다.

1. **글로벌 메뉴** &rarr; **제어판** &rarr; **서버 관리** 로 이동하세요.

   ![Navigate to the Server Administration.](./migrating-documents-and-media-thumbnails/images/03.png)

1. **문서 및 미디어의 미리보기 및 썸네일 파일 재설정** 옆에 있는 **실행** 을 클릭하세요.

   ![Navigate to the Gogo Shell.](./migrating-documents-and-media-thumbnails/images/02.png)

## 관련 주제

* [이미지 해상도 관리](./managing-image-resolutions.md)
* [적응형 미디어 구성 참조](./adaptive-media-configuration-reference.md)
