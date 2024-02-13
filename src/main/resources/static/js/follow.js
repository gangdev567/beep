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
    const fromUserNo = document.getElementById('loginUserId').value;
    try {
        const response = await fetch(`/api/follow/followlist/${fromUserNo}`);
        if (response.ok) {
            const data = await response.json();
            console.log(data);

            // 데이터를 Thymeleaf 템플릿에 적용
            document.getElementById('countByFollow').innerText = data.countByFollow;
            const followListElement = document.getElementById('followList');
            followListElement.innerHTML = ''; // 리스트 초기화
            data.followList.forEach(follow => {
                const li = document.createElement('li');
                const a = document.createElement('a');
                a.href = `/channel/${follow.toUserNo.username}`; // 여기에 주소를 넣어줍니다.
                a.innerText = follow.toUserNo.userNickname;
                li.appendChild(a);
                followListElement.appendChild(li);
            });

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


