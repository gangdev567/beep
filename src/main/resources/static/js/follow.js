/**
 * follow.js
 * 
 * 
 */

document.addEventListener('DOMContentLoaded', async () => {
    // 팔로우 목록 불러오기
    fetchFollowList();

    // 팔로워 목록 불러오기
    fetchFollowerList();

    // 팔로우/언팔로우 버튼 불러오기
    await updateButtonVisibility();

});

async function updateButtonVisibility() {

    try {
        // 현재 사용자의 팔로우 상태를 확인하는 API 호출
        const loginUserId = document.getElementById('loginUserId').value;
        const channelUserId = document.getElementById('channelUserId').value;
        const response = await fetch(`/api/follow/status/${channelUserId}`);

        if (response.ok) {
            const data = await response.json();
            const isFollowing = data.isFollowing;

            // 팔로우 상태에 따라 버튼 초기 설정
            const followBtn = document.getElementById('followBtn');
            const unfollowBtn = document.getElementById('unfollowBtn');

            if (isFollowing) {
                // 이미 팔로우 중인 경우
                followBtn.classList.add('d-none');
                unfollowBtn.classList.remove('d-none');
            } else {
                // 아직 팔로우하지 않은 경우
                followBtn.classList.remove('d-none');
                unfollowBtn.classList.add('d-none');
            }

            // channel id와 loginUserId 비교하여 팔로우 버튼 비활성화
            if (loginUserId === channelUserId) {
                followBtn.disabled = true;
            } else {
                followBtn.disabled = false;
            }

        } else {
            console.error(response);
            console.log("팔로우 상태를 확인하는 중 오류가 발생했습니다!");
        }
    } catch (error) {
        console.error(error);
        console.log("팔로우 상태를 확인하는 중 오류가 발생했습니다!");
    }
}

async function followOrUnfollow(isFollow) {
    if (!isLoggedIn()) {
        alert("로그인이 필요합니다!");

        return;
    }

    try {
        const channelUserIdElement = document.getElementById('channelUserId');
        const channelUserId = channelUserIdElement.value;
        const channelUserNickname = document.getElementById('channelUserNickname').value;

        const method = isFollow ? 'POST' : 'DELETE';
        const response = await fetch(`/api/follow/${isFollow ? 'add' : 'delete'}/${channelUserId}`, {
            method: method,
        });

        if (response.ok) {
            console.log(response);
            const action = isFollow ? '팔로우' : '언팔로우';
            alert(`${channelUserNickname}님을 ${action} 하였습니다!`);

            // 성공 시 버튼 클래스 조작
            const followBtn = document.getElementById('followBtn');
            const unfollowBtn = document.getElementById('unfollowBtn');

            if (isFollow) {
                followBtn.classList.add('d-none');
                unfollowBtn.classList.remove('d-none');
                fetchFollowList();
                fetchFollowerList();
            } else {
                followBtn.classList.remove('d-none');
                unfollowBtn.classList.add('d-none');
                fetchFollowList();
                fetchFollowerList();
            }
        } else {
            console.error(response);
            const action = isFollow ? '팔로우' : '언팔로우';
            alert(`사용자를 ${action} 하는 중 오류가 발생했습니다!`);
        }
    } catch (error) {
        console.error(error);
        alert("오류가 발생했습니다!");
    }
}

async function follow() {
    await followOrUnfollow(true);
}

async function unfollow() {
    await followOrUnfollow(false);
}

function isLoggedIn() {

    return authentication !== 'anonymousUser';
}

async function fetchFollowList() {
    const follower = document.getElementById('loginUserId').value;
    try {
        const response = await fetch(`/api/follow/followlist/${follower}`);
        if (response.ok) {
            const data = await response.json();
            console.log(data);

            // data.countByFollow를 countByFollow 요소에 표시
            document.getElementById('countByFollow').innerText = data.countByFollow;

            // followListElement와 itemsPerPage, currentPage를 초기화
            const followListElement = document.getElementById('followList');
            followListElement.innerHTML = ''; // 리스트 초기화
            const itemsPerPage = 3; // 페이지 당 항목 수
            let currentPage = 1; // 현재 페이지
            let closeButton; // 닫기 버튼

            // 첫 번째 페이지 렌더링
            renderFollowList(currentPage);

            // 페이지를 렌더링하는 함수
            function renderFollowList(page) {
                // 페이지에 표시할 항목의 시작 인덱스와 끝 인덱스 계산
                const startIndex = (page - 1) * itemsPerPage;
                const endIndex = Math.min(page * itemsPerPage, data.followList.length);

                // 이전에 추가한 더보기 버튼이 있다면 제거
                const loadMoreButton = document.getElementById('loadMoreButton');
                if (loadMoreButton) {
                    loadMoreButton.remove();
                }

                // 페이지에 해당하는 항목을 followListElement에 추가
                data.followList.slice(startIndex, endIndex).forEach(follow => {
                    const li = createFollowListItem(follow);
                    followListElement.appendChild(li);
                });

                // 만약 현재 페이지가 마지막 페이지가 아니라면 더보기 버튼 추가
                if (endIndex < data.followList.length) {
                    addLoadMoreButton();
                }

                // 현재 페이지가 1보다 크면 닫기 버튼 추가
                if (page > 1) {
                    addCloseButton();
                }
            }

            // 더보기 버튼을 추가하는 함수
            function addLoadMoreButton() {
                const loadMoreButton = document.createElement('button');
                loadMoreButton.id = 'loadMoreButton'; // 버튼에 ID 추가
                loadMoreButton.innerText = '더 보기';
                loadMoreButton.classList.add('btn', 'btn-primary', 'mt-3');
                loadMoreButton.addEventListener('click', () => {
                    currentPage++; // 다음 페이지로 이동
                    renderFollowList(currentPage); // 페이지 렌더링
                });

                followListElement.appendChild(loadMoreButton); // 더보기 버튼을 followListElement에 추가
            }

            // 닫기 버튼을 추가하는 함수
            function addCloseButton() {
                closeButton = document.createElement('button');
                closeButton.id = 'closeButton'; // 버튼에 ID 추가
                closeButton.innerText = '닫기';
                closeButton.classList.add('btn', 'btn-secondary', 'mt-3');
                closeButton.addEventListener('click', () => {
                    // 추가된 요소들과 닫기 버튼 제거
                    removeAllElements();
                    currentPage = 1; // 첫 번째 페이지로 돌아감
                    renderFollowList(currentPage); // 페이지 렌더링
                });

                followListElement.appendChild(closeButton); // 닫기 버튼을 followListElement에 추가
            }

            // 팔로우 항목을 만들어 반환하는 함수
            function createFollowListItem(follow) {
                const li = document.createElement('li');
                li.classList.add('list-group-item'); // 부트스트랩 리스트 그룹 아이템 클래스 추가

                // 이미지와 링크를 함께 생성하여 추가
                const a = document.createElement('a');
                a.classList.add('text-decoration-none', 'text-black'); // 링크에 밑줄 제거 클래스 추가
                a.href = `/channel/${follow.followingUserAccount.userNickname}`; // 주소 추가

                const img = document.createElement('img');
                img.src = '/images/default.png'; // 이미지 경로 설정(추후에 follow.followingUserAccount.userImageUrl로 바꿔야합니다.)
                img.alt = '프로필 이미지'; // 이미지 대체 텍스트 설정
                img.style.width = '50px'; // 이미지 너비 설정
                img.style.height = '50px'; // 이미지 높이 설정

                a.appendChild(img);
                a.appendChild(document.createTextNode(follow.followingUserAccount.userNickname)); // 텍스트 노드 추가

                li.appendChild(a);

                return li;
            }

            // 추가된 요소들과 닫기 버튼 제거하는 함수
            function removeAllElements() {
                // 추가된 요소들 제거
                const additionalItems = followListElement.querySelectorAll('.list-group-item');
                additionalItems.forEach(item => {
                    item.remove();
                });
                // 닫기 버튼 제거
                closeButton.remove();
            }


        } else {
            console.error('팔로우 목록을 불러오는 중 에러 발생:', response.status);
        }
    } catch (error) {
        console.error('팔로우 목록을 불러오는 중 에러 발생:', error);
    }
}

async function fetchFollowerList() {
    const toUserNo = document.getElementById('channelUserId').value;
    try {
        const response = await fetch(`/api/follow/followerlist/${toUserNo}`);
        if (response.ok) {
            const data = await response.json();
            console.log(data);

            // 데이터를 Thymeleaf 템플릿에 적용
            document.getElementById('countByFollower').innerText = data.countByFollower + ' 명';
            // TODO: Follower Count만 나타내고 followUser들의 데이터들을 불러오는 것을 고려해보기(일단은 X)         
        } else {
            console.error('팔로워 목록을 불러오는 중 에러 발생:', response.status);
        }
    } catch (error) {
        console.error('팔로워 목록을 불러오는 중 에러 발생:', error);
    }
}


