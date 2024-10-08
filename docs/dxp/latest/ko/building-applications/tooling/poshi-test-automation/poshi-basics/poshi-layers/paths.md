# 경로

경로는 테스트가 상호 작용하는 페이지의 요소입니다.  요소는 버튼, 텍스트 필드, 링크, 이미지, 단락 또는 테스트 중에 어설션, 클릭 또는 입력해야 하는 거의 모든 것이 될 수 있습니다. 각 경로는 다음에 의해 정의됩니다.

**로케이터 키** : 요소가 무엇인지 설명하는 레이블입니다(예: EDIT). 로케이터 키는 모두 대문자이며 공백 대신 밑줄을 사용합니다.

**XPath 식별자** : HTML 페이지의 특정 요소를 가리키는 주소입니다(예: `//button[contains(.,'Edit')]`).

경로 파일은 렌더링될 때 로케이터 이름과 로케이터가 포함된 테이블을 표시하는 HTML로 작성됩니다. 경로 파일을 테스트 모음이 상호 작용할 수 있는 테스트 개체의 라이브러리로 생각하십시오.

```
<html>
<head>
<title>Button</title>
</head>
...
<tbody>
<tr>
    <td>EDIT</td>
    <td>//button[contains(.,'Edit')]</td>
    <td></td>
</tr>
<tr>
    <td>EDIT_PENCIL</td>
    <td>//a[contains(@class,'btn')]//i[contains(@class,'icon-pencil')]</td>
    <td></td>
</tr>
<tr>
    <td>EDIT_ROW</td>
    <td>//*[@data-qa-id='row' and contains(.,'${key_rowEntry}')]//*[normalize-space(text())='Edit']</td>
    <td></td>
</tr>
...
</tbody>
</table>
</body>
</html>
```

## 경로 파일 사용의 이점

**재사용성 향상** : 동일한 요소와 상호작용하는 여러 테스트를 작성할 때 각 상호작용에 대해 하드코딩하는 대신 로케이터를 공유하고 재사용할 수 있습니다.

**테스트 유지 비용 절감** : 여러 테스트에서 로케이터를 사용하고 UI 변경으로 인해 xpath가 변경되는 경우 로케이터의 모든 인스턴스를 검색하는 대신 경로 파일만 변경하면 됩니다.

## 모범 사례

**경로 파일을 구체적이지만 재사용 가능하게 만드십시오.** : 경로 파일은 올바른 요소를 설명하고 찾을 수 있을 만큼 구체적이어야 하지만 테스트 중인 시스템 전체에서 재사용할 수 있을 만큼 충분히 일반적이어야 합니다. 위의 `EDIT_ROW` 로케이터에서와 같이 [변수](./variables.md)을 사용하면 로케이터를 구체적이고 재사용 가능하게 만드는 데 도움이 될 수 있습니다.

**경로 파일 구성** : 경로 파일을 구성하는 방법에는 여러 가지가 있습니다. 몇 가지 제안은 다음과 같습니다.

  * **By Elements** : 이러한 경로는 버튼, 체크박스, 텍스트 입력 등과 같이 테스트 중인 시스템 전체에서 재사용되는 UI의 매우 기본적인 부분인 경우가 많습니다.

  * **By Sections** : 이 경로는 CKEditor, 메뉴 표시줄, 도구 모음 등과 같이 테스트 중인 시스템의 더 복잡하지만 여전히 재사용 가능한 섹션입니다.

  * **구성 요소/포틀릿 기준** : 이러한 경로는 사용자 및 시스템 관리의 사용자 상태 필드와 같이 구성 요소에 따라 다릅니다.
