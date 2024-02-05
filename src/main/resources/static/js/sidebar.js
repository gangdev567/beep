/**
 * Sidebar.js
 * 
 * 이 스크립트는 토글 및 다크 모드 스위치가 있는 사이드바의 기능을 관리합니다.
 */

// 필요한 DOM 요소 선택
const body = document.querySelector("body"),
      sidebar = body.querySelector(".sidebar"),
      toggle = body.querySelector(".toggle"),
      modeSwitch = body.querySelector(".toggle-switch"),
      modeText = body.querySelector(".mode-text");

// 사이드바를 열고 닫기 위한 토글 버튼에 대한 이벤트 리스너
toggle.addEventListener("click", () => {
    sidebar.classList.toggle("close");
});

// 다크 모드 스위치에 대한 이벤트 리스너
modeSwitch.addEventListener("click", () => {
    // body에 다크 모드 클래스를 토글
    body.classList.toggle("dark");

    // 현재 모드에 기반하여 모드 텍스트 업데이트
    if (body.classList.contains("dark")) {
        modeText.innerText = "Light Mode";
    } else {
        modeText.innerText = "Dark Mode";
    }
});