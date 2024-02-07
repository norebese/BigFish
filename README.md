# BigFish
Java Spring 낚시터 예약 등 종합 낚시사이트

## 기술 스택
`Front-End` 

<img src="https://img.shields.io/badge/html5-000000?style=flat-square&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/javascript-3178C6?style=flat-square&logo=javascript&logoColor=white"/>

`Back-end`

<img src="https://img.shields.io/badge/oracle-E0234E?style=flat-square&logo=oracle&logoColor=white">
<img src="https://img.shields.io/badge/spring-6DB33F?style=flat-square&logo=spring&logoColor=white">

`Communication`
<img src="https://img.shields.io/badge/notion-000000?style=flat-square&logo=notion&logoColor=white">
<img src="https://img.shields.io/badge/github-181717?style=flat-square&logo=github&logoColor=white">

## 사용 라이브러리및 API
- TEXT 에디터 : Summernote
- 다음 카카오 주소 및 지도 API
- 카카오 Pay
- 기상청_동네예보 통보문 조회서비스
- 로그인 : NAVER 로그인 및 정보 가져오기
- Chat-GPT : OPENAI API
- 국세청_사업자등록정보 진위확인 및 상태조회서비스

## 실행 방법
1. apache-tomcat-8.5.94 설치

2. java-1.8.0 설치

3. apache-maven-3.9.5 설치

4. sts-3.9.13.RELEASE 설치
   
5. 프로젝트 클론 및 실행

## 🎣프로젝트 소개
이 프로젝트는 낚시를 좋아하는 사람들을 위한 기존 사이트를 참고하여 새로운 UI와 기능을 추가해보았습니다.

ERD
<img src="src/main/webapp/resources/images/readme images/bigFish erd.png" height="300">

주요 기능 및 특징

### 바다 날씨 정보 제공: 공공데이터를 활용하여 실시간으로 바다 날씨 정보를 제공, 안전한 낚시 활동을 지원합니다.
<img src="src/main/webapp/resources/images/readme images/sea api.png" height="300">

### 예약 시스템: 사용자가 선호하는 가게를 선택하고, 편리한 예약 시스템을 통해 원하는 날짜와 이용권을 선택하여 예약을 진행할 수 있습니다.
<img src="src/main/webapp/resources/images/readme images/reservation.png" height="300">

### 마이페이지 기능: 사용자 및 사업자는 각자의 마이페이지에서 예약 현황을 확인할 수 있으며, 사업자는 예약 승인 및 취소를 관리할 수 있습니다.
<img src="src/main/webapp/resources/images/readme images/mypage reservation.png" height="300">

### 다이렉트 1:1 채팅: 사용자와 사업자 간의 소통을 강화하기 위해 다이렉트 1:1 채팅 기능을 도입하여 직접적인 상담이 가능합니다.
<img src="src/main/webapp/resources/images/readme images/chat.png" height="300">

### 낚시 용품 쇼핑몰: 다양한 낚시 용품을 판매하는 쇼핑몰을 운영하여 사용자들이 필요한 장비를 쉽게 구매할 수 있도록 지원합니다.
<img src="src/main/webapp/resources/images/readme images/shop list.png" height="300">

### 어종 정보 백과사전: 낚시에 관련된 다양한 어종 정보를 제공하여 사용자들이 더욱 풍부한 지식을 쌓을 수 있도록 돕습니다.
<img src="src/main/webapp/resources/images/readme images/fish info.png" height="300">

### 낚시 빅선생: 빅선생은 GPT를 활용한 인공지능 도우미로 사용자에게 낚시에 대한 정보를 제공합니다.
<img src="src/main/webapp/resources/images/readme images/gpt chat.png" height="300">

## ⏱개발 기간
* 언제부터 언제까지
  * 1차 개발 기간 : 2023년 12월 4일 ~ 2023년 12월 15일
  * 2차 개발 기간 : 2023년 12월 15일 ~ 2024년 1월 3일

## 👨‍👨‍👦‍👦팀원 구성
* 고이환
  * 일정&문서 관리 및 학습 동영상, 쇼핑몰, 통합검색 제작
* 김동인
  * 조장 및 메인페이지, 바다 및 민물 낚시 예약 제작
* 이선우
  * DB 관리 및 공지사항&FAQ, 어종정보, 페이지 네비게이터 제작
* 전재현
  * 형상 관리 및 회원 기능, 채팅, 낚시 빅선생(ChatGPT) 제작
* 전현규
  * 이슈 관리 및 자유게시판, 조황게시판, 쇼핑몰 결제 기능 제작
