# 썸네일 미리보기를 테마에 묶기

테마의 썸네일은 테마가 사이트에 적용될 때 어떻게 보이는지 시각적으로 표현한 것입니다. 축소판은 사이트 페이지의 테마를 선택할 때 테마 선택 메뉴에 표시됩니다. 썸네일 세트가 없는 사용자 지정 테마에는 자리 표시자 이미지가 있습니다.

![자리 표시자 이미지가 있는 사용자 지정 테마입니다.](./bundling-a-thumbnail-preview-into-your-theme/images/01.png)

## 썸네일 추가

썸네일을 만들고 테마에 묶으려면 다음 단계를 따르세요.

1. 썸네일에 사용할 테마의 스크린샷을 찍습니다.

1. 테마의 `src/images/` 폴더에 `thumbnail.png` 이라는 이름으로 이미지를 저장합니다. 이 폴더가 아직 존재하지 않으면 새로 만드십시오.

1. 테마 재배포:

    ```bash
    gulp deploy
    ```

1. Liferay 로그에서 배포를 확인합니다.

    ```
    STARTED my-liferay-theme_1.0.0
    ```

1. 테마가 배포되면 **사이트 메뉴**(![Site Menu](../../../../../images/icon-product-menu.png))을 열고 **사이트 빌더** 를 확장한 다음 **페이지** 으로 이동합니다.

1. 애플리케이션 표시줄에서 **작업** 버튼(![Actions](../../../../../images/icon-actions.png))을 클릭하고 구성(![Configuration icon](../.././../../../images/icon-settings.png))을 선택합니다.

1. **현재 테마 변경** 버튼을 클릭하여 섬네일과 함께 사용 가능한 모든 테마를 보고 변경 사항을 확인합니다.

![선택한 이미지는 테마를 선택할 때 축소판으로 표시됩니다.](./bundling-a-thumbnail-preview-into-your-theme/images/02.png)

```{note}
새 섬네일을 화면에 표시하려면 브라우저의 캐시를 지워야 할 수도 있습니다.
```

이제 선택한 파일이 테마 선택 화면에 축소판으로 표시됩니다.
