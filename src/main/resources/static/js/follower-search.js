/**
 * follower-search.js
 * 폐기예정
 */
/*
document.addEventListener('DOMContentLoaded', () => {

});

async function searchFollowersByKeyword() {
    const keywordInput = document.getElementById('followersKeyword').value;
    try {
        const response = await fetch(`/api/follower/search?keyword=${encodeURIComponent(keywordInput)}`, {

            method: 'GET',
            headers: {
                'Content-Type': 'application/jason'
            }
        });

        if (response.ok) {
            const searchData = await response.json();
            displayFollowersResults(searchData);

        } else {
            console.error("에러: " + response.statusText);
        }

    } catch (error) {
        console.log(error);
    }
} 

function displayFollowersResults(results) {
    const tableBody = document.querySelector('#followersTable tbody');
    tableBody.innerHTML = ''; // 테이블 몸통을 비워줍니다.

    results.forEach(follower => {
        const row = document.createElement('tr');

        const imgCell = document.createElement('td');
        const img = document.createElement('img');
        img.src = follower.userProfileImageUrl;
        img.alt = 'img';
        img.style.width = '50px';
        img.style.height = '50px';
        imgCell.appendChild(img);

        const nicknameCell = document.createElement('td');
        const nicknameSpan = document.createElement('span');
        nicknameSpan.textContent = follower.userNickname;
        nicknameCell.appendChild(nicknameSpan);

        const createdTimeCell = document.createElement('td');
        createdTimeCell.textContent = follower.createdTime;

        const followDaysCell = document.createElement('td');
        followDaysCell.textContent = `${followersDate[iterStat.index]} 일 동안 팔로우`;

        row.appendChild(imgCell);
        row.appendChild(nicknameCell);
        row.appendChild(createdTimeCell);
        row.appendChild(followDaysCell);

        tableBody.appendChild(row);
    });
}

*/