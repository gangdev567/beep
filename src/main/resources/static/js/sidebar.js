/**
 * Sidebar.js
 * 
 * 이 스크립트는 토글 및 다크 모드 스위치가 있는 사이드바의 기능을 관리
 */

// 필요한 DOM 요소 선택
const body = document.querySelector("body"),
      sidebar = body.querySelector(".sidebar"),
      toggle = body.querySelector(".toggle"),
      modeSwitch = body.querySelector(".toggle-switch"),
      modeText = body.querySelector(".mode-text");

// 로컬 스토리지에서 저장된 테마 모드를 가져옴
const savedTheme = localStorage.getItem("theme");

// 페이지 로드 시 초기 테마 모드 설정
if (savedTheme) {
    body.classList.add(savedTheme);
} else {
    // 만약 로컬 스토리지에 저장된 테마가 없다면 기본값은 'light'
    body.classList.add("light");
}

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

    // 테마 모드를 로컬 스토리지에 저장
    const currentTheme = body.classList.contains("dark") ? "dark" : "light";
    localStorage.setItem("theme", currentTheme);
});