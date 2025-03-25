# Add_DB_Test


## Changelog (변경 사항 기록)

**v1.1.0 (2024-01-25)**

*   **Added:** Aiven for MySQL 데이터 소스 통합 설정 추가.
*   **Added:** 예제 데이터베이스 스키마 (DDL) 추가.
*   **Added:** 예제 데이터 (DML) 추가.
*   **Added:** 예제 SQL 쿼리 추가.
*   **Updated:** MySQL (Local) 설정에서 데이터베이스 이름 사용 명시.
*   **Updated:** README 구조 및 설명 개선 (Changelog 추가, 섹션 명확화 등).

**v1.0.0 (2024-01-24)**

*   Initial release: MySQL (Local) 및 Supabase 데이터 소스 통합.
*   IntelliJ IDEA Empty 프로젝트 설정 방법 설명.
*   기본 사용법 안내.


## 프로젝트 개요

본 프로젝트는 IntelliJ IDEA 환경에서 생성한 **Empty 프로젝트**에 MySQL (로컬, Supabase, Aiven) 데이터베이스 소스를 통합한 결과를 보여줍니다.

## 목적

이 레포지토리는 IntelliJ Empty 프로젝트에 여러 MySQL 데이터베이스 (로컬, Supabase, Aiven)를 추가하고 연결하는 방법을 예시로 제공하며, 통합된 환경에서 데이터베이스 연동 및 활용 가능성을 제시하는 것을 목표로 합니다. **본 레포지토리는 데이터베이스 통합 과정을 완료한 결과물이며, 새로운 프로젝트에서 데이터베이스 통합을 따라 하기 위한 참고 자료로 활용될 수 있습니다.**

## 기술 스택

*   **개발 환경:** IntelliJ IDEA
*   **프로그래밍 언어:** None (SQL only for database interaction)
*   **데이터베이스:**
  *   MySQL (Local)
  *   Supabase (PostgreSQL 기반)
  *   Aiven for MySQL

## 프로젝트 설정 (참고용)

본 섹션은 이 레포지토리에서 MySQL, Supabase, Aiven 데이터 소스를 통합한 설정 과정을 설명합니다. 새로운 프로젝트에 동일한 설정을 적용하려면 아래 단계를 따르세요.

### 1. 인텔리제이 Empty 프로젝트 생성

1.  IntelliJ IDEA를 실행하고 "New Project"를 선택합니다.
2.  프로젝트 유형으로 "Empty Project"를 선택하고 프로젝트를 생성합니다.

### 2. 데이터베이스 설정 (IntelliJ Data Sources 설정)

IntelliJ IDEA의 Database 도구를 사용하여 MySQL, Supabase, Aiven 데이터 소스를 설정하는 방법입니다.

#### Supabase 설정

1.  Supabase 콘솔 ([https://supabase.com/dashboard](https://supabase.com/dashboard))에 접속합니다.
2.  해당 프로젝트를 선택합니다.
3.  좌측 메뉴에서 "Database"를 클릭합니다.
4.  상단의 "Connect" 버튼을 클릭합니다.
5.  "Connection String" 탭을 선택합니다.
6.  "Type" 드롭다운 메뉴에서 "JDBC"를 선택합니다.
7.  "Session pooler" 항목 아래의 URL을 복사합니다.
8.  IntelliJ IDEA로 돌아와서 우측의 "Database" 툴 창을 엽니다 (View > Tool Windows > Database).
9.  "+" 버튼을 클릭하고 "Data Source"를 선택한 후 "PostgreSQL"을 선택합니다.
10. 복사한 URL을 "URL" 필드에 붙여넣습니다.
11. Supabase 프로젝트의 비밀번호를 "Password" 필드에 입력합니다.
12. "Test Connection" 버튼을 클릭하여 연결을 확인합니다.
13. 연결이 성공하면 "OK" 버튼을 클릭하여 설정을 저장합니다.

#### MySQL 설정

1.  IntelliJ IDEA의 "Database" 툴 창에서 "+" 버튼을 클릭하고 "Data Source"를 선택한 후 "MySQL"을 선택합니다.
2.  "URL" 필드에 `jdbc:mysql://localhost:[port]`를 입력합니다. `[port]` 부분은 실제 MySQL 서버의 포트 번호로 변경해야 합니다 (일반적으로 3306).
3.  "User" 필드에 `root`를 입력합니다.
4.  MySQL 서버의 비밀번호를 "Password" 필드에 입력합니다.
5.  "Test Connection" 버튼을 클릭하여 연결을 확인합니다.
6.  연결이 성공하면 "OK" 버튼을 클릭하여 설정을 저장합니다.

#### Aiven for MySQL 설정

1.  Aiven 콘솔 ([https://console.aiven.io/](https://console.aiven.io/))에 로그인합니다.
2.  해당 MySQL 서비스를 선택합니다.
3.  "Overview" 페이지에서 "Service URI"를 찾습니다.  이 URI는 JDBC 연결에 사용됩니다.
4.  IntelliJ IDEA의 "Database" 툴 창에서 "+" 버튼을 클릭하고 "Data Source" -> "MySQL"을 선택합니다.
5.  "URL" 필드에 Aiven에서 복사한 "Service URI"를 붙여넣습니다.  단, `mysql://`  부분을 `jdbc:mysql://` 로 변경해야 합니다.
6.  "User" 및 "Password" 필드에 Aiven 서비스의 사용자 이름과 비밀번호를 입력합니다. (보통 Overview 페이지에서 찾을 수 있습니다.)
7.  "Test Connection" 버튼을 클릭하여 연결을 확인합니다.
8.  연결이 성공하면 "OK"를 클릭하여 설정을 저장합니다.

### 3. 의존성 관리 (현재 없음)

본 프로젝트는 아직 의존성 관리 도구를 사용하고 있지 않습니다. 일반적으로 Java 프로젝트에서는 Maven의 `pom.xml` 또는 Gradle의 `build.gradle` 파일을 통해 필요한 라이브러리 (예: MySQL Connector/J)를 관리합니다.

향후 프로젝트에 데이터베이스 연동 기능을 추가하려면, 프로젝트 구조에 맞는 의존성 관리 도구를 설정하고 필요한 라이브러리 의존성을 추가해야 합니다.

### 4. 프로젝트 실행

IntelliJ IDEA에서 프로젝트를 빌드하고 실행합니다. 데이터베이스 연결 및 작동 여부를 확인하기 위한 테스트 코드를 실행해 볼 수 있습니다.

## Example Database Schema (DDL)

다음은 이 프로젝트에서 사용된 예제 데이터베이스 스키마입니다. 각 데이터 소스에 이 스키마를 생성하여 테스트할 수 있습니다.

[ddlTest.sql](https://console.aiven.io/)

## 사용 방법

IntelliJ IDEA에서 프로젝트를 빌드하고 실행합니다. 데이터베이스 연결 및 작동 여부를 확인하기 위한 테스트 코드를 실행해 볼 수 있습니다.

* **데이터베이스 연결 확인:** IntelliJ IDEA의 Database 툴 창에서 설정된 데이터 소스를 통해 각 데이터베이스에 정상적으로 연결되었는지 확인할 수 있습니다.
* **SQL 쿼리 실행:** Database 툴 창에서 SQL 에디터를 사용하여 MySQL과 Supabase 데이터베이스에 대해 직접 쿼리를 실행하고 결과를 확인할 수 있습니다.
* **데이터베이스 스키마 탐색:** Database 툴 창을 통해 각 데이터베이스의 스키마 (테이블, 컬럼 등)를 시각적으로 확인할 수 있습니다.
* **코드 연동 준비:** 실제 애플리케이션 코드를 작성하여 데이터베이스와 상호작용하기 위한 기본적인 환경이 마련되었습니다.

**다음 단계:**

이 프로젝트를 참고하여 새로운 인텔리제이 Empty 프로젝트에 MySQL과 Supabase를 통합하고, 필요한 경우 의존성 관리 도구를 설정하여 데이터베이스 연동 코드를 개발해 나갈 수 있습니다.

## 기여 방법

프로젝트 개선에 기여하고 싶으신 분은 언제든지 Pull Request를 보내주세요.

1.  프로젝트를 Fork합니다.
2.  새로운 브랜치를 생성합니다 (`git checkout -b feature/your-contribution`).
3.  변경 사항을 커밋합니다 (`git commit -m 'Add some feature'`).
4.  Fork한 레포지토리로 푸시합니다 (`git push origin feature/your-contribution`).
5.  Pull Request를 생성합니다.

## 라이선스

(선택 사항) 필요에 따라 라이선스 정보를 추가합니다.

## 문의

프로젝트에 대한 문의사항은 [본인의 이메일 주소] 또는 GitHub Issues를 통해 연락 주시기 바랍니다.