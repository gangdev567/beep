/**
 * checkUsername.js
 * 회원가입시 사용자 아이디 중복 여부를 확인하여 유효성 검사.
 */

    document.addEventListener("DOMContentLoaded", function () {
        const usernameInput = document.querySelector("#usernameInput");
        const checkUsernameButton = document.querySelector("#checkUsernameButton");

        checkUsernameButton.addEventListener("click", async function () {
            const username = usernameInput.value;

            // 사용자가 아이디를 입력하지 않은 경우 경고창 표시
            if (!username) {
                Swal.fire({
                    icon: "warning",
                    title: "아이디를 입력해주세요!",
                    text: "아이디를 비워둘 수 없습니다.",
                });
                return; // 함수 종료
            }

            const uri = `/user/signup/checkusername?username=${username}`;

            try {
                const response = await axios.get(uri);
                const result = response.data;

                if (result === "Y") {
                    Swal.fire({
                        icon: "error",
                        title: "이미 존재하는 사용자 아이디거나 사용할 수 없는 아이디입니다!",
                        text: "다른 아이디를 입력해주세요.",
                    });
                } else if (result === "N") {
                    Swal.fire({
                        icon: "success",
                        title: "사용할 수 있는 아이디입니다!",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    // 여기에 중복이 아닌 경우 추가적인 작업을 할 수 있습니다.
                } else {
                    // 처리할 예외 상황이 있다면 여기에 추가
                }
            } catch (error) {
                console.error("Error:", error);
            }
        });
    });