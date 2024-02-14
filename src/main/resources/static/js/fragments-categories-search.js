document.addEventListener('DOMContentLoaded', function() {
    const categoryInput = document.getElementById('categoryInput');
    const categoryList = document.getElementById('categoryList');
    
    categoryInput.addEventListener('input', function() { // 입력란에 입력 이벤트를 감지합니다.
        const keyword = categoryInput.value; // 입력된 키워드를 가져옵니다.

        // AJAX 요청을 생성합니다.
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'categories/api/search?keyword=' + keyword, true); // GET 요청을 생성합니다.

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) { // 요청 상태가 완료되면 실행됩니다.
                if (xhr.status === 200) { // 요청이 성공했을 경우
                    const categories = JSON.parse(xhr.responseText); // JSON 형식의 응답을 파싱합니다.
                    displayCategories(categories); // 검색된 카테고리를 표시합니다.
                } else { // 요청이 실패했을 경우
                    console.error('Request failed: ' + xhr.status); // 에러 메시지를 콘솔에 출력합니다.
                }
            }
        };

        xhr.send(); // AJAX 요청을 보냅니다.
    });

    // 선택된 카테고리 스타일 변경
    function selectCategory(categoryId) {
        // 이전에 선택된 카테고리 스타일 초기화
        const previousSelectedCategory = categoryList.querySelector('.selected');
        if (previousSelectedCategory) {
            previousSelectedCategory.classList.remove('selected');
        }

        // 현재 선택된 카테고리에 스타일 적용
        const selectedCategory = categoryList.querySelector(`[data-id="${categoryId}"]`);
        if (selectedCategory) {
            selectedCategory.classList.add('selected');
        }

        // 카테고리가 선택되었을 때 할 작업을 여기에 추가합니다.
        console.log('Selected category ID:', categoryId);

        // 선택된 카테고리의 ID를 숨겨진 입력 필드에 설정합니다.
        document.getElementById('categoryId').value = categoryId;
    }

    // 검색된 카테고리를 표시하는 함수
    function displayCategories(categories) {
        // 이전에 표시된 카테고리를 모두 삭제합니다.
        categoryList.innerHTML = '';

        // 검색된 카테고리를 반복하여 표시합니다.
        categories.forEach(function(category) {
            const categoryItem = document.createElement('div');
            categoryItem.classList.add('category-item');
            categoryItem.dataset.id = category.categoryId; // 데이터 속성에 카테고리 ID를 저장합니다.

            // 카테고리 이미지 추가
            const categoryImage = document.createElement('img');
            categoryImage.src = category.categoryImageUrl;
            categoryImage.alt = category.categoryName;
            categoryImage.width = 40; // 이미지 너비 설정
            categoryImage.height = 40; // 이미지 높이 설정
            categoryItem.appendChild(categoryImage);

            // 카테고리 이름 추가
            const categoryName = document.createElement('span');
            categoryName.textContent = category.categoryName;
            categoryItem.appendChild(categoryName);

            categoryItem.addEventListener('click', function() {
                selectCategory(category.categoryId);
            });
            categoryList.appendChild(categoryItem);
        });
    }
});