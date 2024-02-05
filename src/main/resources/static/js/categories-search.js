/**
 * category.js
 * categories.html 적용
 * 
 */

async function searchKeyword() {
    // 검색 키워드 가져오기
    const searchKeyword = document.getElementById("searchKeyword").value;

    try {
        // Fetch API를 사용한 비동기 요청
        const response = await fetch(`/categories/api/search?keyword=${encodeURIComponent(searchKeyword)}`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        if (response.ok) {
            // 성공적으로 응답받은 경우 결과를 화면에 표시
            const searchData = await response.json();
            displaySearchResults(searchData);
        } else {
            // 에러 발생 시 메시지 출력
            console.error("에러: " + response.statusText);
        }
    } catch (error) {
        console.error("에러: " + error.message);
    }
}

function displaySearchResults(results) {
    const resultContainer = document.getElementById("searchResults");
    resultContainer.innerHTML = ""; // 결과를 초기화

    // 결과 반복문으로 처리
    for (let i = 0; i < results.length; i++) {
        const category = results[i];

        // 카드 생성 및 속성 설정
        const card = document.createElement("div");
        card.className = "col-lg-2 col-md-4 mb-4";
        card.innerHTML = `
            <div class="card category-card">                
                    <img src="${category.imageUrl}" class="img-fluid card-img-top category-image" alt="Category Image">
                    <div class="card-body">
                        <h5 class="card-title category-title text-left text-truncate fs-5">${category.categoryName}</h5>
                        <h5 class="card-title category-title text-left text-truncate fs-6">
                            <span class="totalViewSpan"></span>
                        </h5>
                    </div>                
            </div>
        `;

        // 시청자 수를 동적으로 설정
        const totalViewSpan = card.querySelector(".totalViewSpan");
        totalViewSpan.innerText = category.totalView != null ? '시청자 ' + category.totalView + ' 명' : '시청자 0명';

        // 결과를 화면에 추가
        resultContainer.appendChild(card);
    }
}