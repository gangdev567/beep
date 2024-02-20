/**
 * follow.js
 * 
 */

document.addEventListener('DOMContentLoaded', async () => {
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

/**
 * fetchFollowList()
 * fragments 로만 구현할지 안할지 정해야함. 일단은 뺐습니다.
 */

async function fetchFollowList() {
    try {
        const response = await fetch('/api/follow/followlist');
        if (response.ok) {
            const data = await response.json();
            console.log(data);

            // followListElement와 itemsPerPage, currentPage를 초기화
            const followListElement = document.getElementById('followList');
            followListElement.innerHTML = '<h5 class="my-2 text-secondary fw-bold">팔로우 목록</h5>';
            const itemsPerPage = 3; // 페이지 당 항목 수
            let currentPage = 1; // 현재 페이지
            let closeButton; // 닫기 버튼

            // 첫 번째 페이지 렌더링
            renderFollowList(currentPage);

            // 페이지를 렌더링하는 함수
            function renderFollowList(page) {
                // 페이지에 표시할 항목의 시작 인덱스와 끝 인덱스 계산
                const startIndex = (page - 1) * itemsPerPage;
                const endIndex = Math.min(page * itemsPerPage, data.channelList.length);

                // streamingState가 'ON'인 것들을 먼저 정렬
                data.channelList.sort((a, b) => {
                    // 'ON'인 것이 먼저 오도록 정렬
                    if (a.streamingState.includes('ON') && !b.streamingState.includes('ON')) {
                        return -1;
                    }
                    if (!a.streamingState.includes('ON') && b.streamingState.includes('ON')) {
                        return 1;
                    }
                    return 0;
                });

                // 이전에 추가한 더보기 버튼이 있다면 제거
                const loadMoreButton = document.getElementById('loadMoreButton');
                if (loadMoreButton) {
                    loadMoreButton.remove();
                }

                data.channelList.slice(startIndex, endIndex).forEach(channel => {
                    const li = createChannelListItem(channel);
                    followListElement.appendChild(li);
                });

                // 만약 현재 페이지가 마지막 페이지가 아니라면 더보기 버튼 추가
                if (endIndex < data.channelList.length) {
                    addLoadMoreButton();
                }

                // 현재 페이지가 1보다 크면 닫기 버튼 추가
                if (endIndex >= data.channelList.length && data.channelList.length > 0) {
                    addCloseButton();
                }
            }

            // 더보기 버튼을 추가하는 함수
            function addLoadMoreButton() {
                const loadMoreButton = document.createElement('button');
                loadMoreButton.id = 'loadMoreButton'; // 버튼에 ID 추가
                loadMoreButton.innerText = '더보기';
                loadMoreButton.classList.add('btn', 'btn-outline-secondary', 'mt-2', 'btn-sm');

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
                closeButton.classList.add('btn', 'btn-outline-secondary', 'mt-2', 'btn-sm');

                closeButton.addEventListener('click', () => {
                    // 추가된 요소들과 닫기 버튼 제거
                    removeAllElements();
                    currentPage = 1; // 첫 번째 페이지로 돌아감
                    renderFollowList(currentPage); // 페이지 렌더링
                });

                if (currentPage > 1) {
                        followListElement.appendChild(closeButton); // 닫기 버튼을 followListElement에 추가
                    }
            }

            function createChannelListItem(channel) {
                const divTag = document.createElement('div');
                divTag.classList.add('list-group-item', 'd-flex', 'align-items-center');
                divTag.style.border = "none";

                divTag.addEventListener('mouseenter', () => {
                    divTag.style.backgroundColor = '#808080'; // 회색 빛 추가
                });

                divTag.addEventListener('mouseleave', () => {
                    divTag.style.backgroundColor = ''; // 마우스를 떼면 원래의 색으로 복원
                });

                const a = document.createElement('a'); // <a> 태그 생성
                a.classList.add('text-decoration-none', 'text-secondary');
                a.href = `/channel/${channel.channelUserAccountEntityChannelName}`;
                divTag.appendChild(a);

                const div = document.createElement('div');
                div.classList.add('d-flex', 'align-items-center', 'flex-grow-1'); // 텍스트를 오른쪽으로 정렬하기 위해 flex 속성 추가
                a.appendChild(div); // <div>를 <a> 태그 내에 추가

                const img = document.createElement('img');
                img.src = '/images/default.png';
                img.alt = '프로필 이미지';
                img.style.width = '50px';
                img.style.height = '50px';
                img.classList.add('me-3');
                div.appendChild(img); // 이미지를 <div> 태그 내에 추가

                const channelInfo = document.createElement('div'); // 채널 정보를 감싸는 <div> 생성
                channelInfo.classList.add('flex-grow-1'); // 채널 정보가 남은 공간을 차지하도록 설정
                div.appendChild(channelInfo); // 채널 정보를 <div> 태그 내에 추가

                const channelName = document.createElement('span');
                channelName.classList.add('fw-bold');
                channelName.innerText = channel.channelUserAccountEntityChannelName;
                channelInfo.appendChild(channelName); // 채널 이름을 <div> 태그 내에 추가

                let text = '';

                if (channel.streamingState.includes('ON')) {
                    text += `<br><span class="badge bg-danger">LIVE</span> 👁️ ${channel.channelViewerCount}<br>${channel.categoryEntityOfChannelCategoryName}`;
                } else {
                    text += '<br>오프라인';
                }

                const small = document.createElement('small');
                small.classList.add('text-truncate', 'text-secondary');
                small.innerHTML = text;
                channelInfo.appendChild(small); // 텍스트 정보를 <div> 태그 내에 추가

                return divTag;
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
