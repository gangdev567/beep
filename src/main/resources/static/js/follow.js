document.addEventListener('DOMContentLoaded', async () => {

    await updateButtonVisibility();
});

async function updateButtonVisibility() {

    try {
        // 현재 사용자의 팔로우 상태를 확인하는 API 호출
        const followerIdElement = document.getElementById('followerId');
        const followerId = followerIdElement.value;
        const response = await fetch(`/api/follow/status/${followerId}`);

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
        } else {
            console.error(response);
            alert("팔로우 상태를 확인하는 중 오류가 발생했습니다!");
        }
    } catch (error) {
        console.error(error);
        alert("팔로우 상태를 확인하는 중 오류가 발생했습니다!");
    }
}

async function followOrUnfollow(isFollow) {
    if (!isLoggedIn()) {
        alert("로그인이 필요합니다!");
        // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        const returnUrl = encodeURIComponent(window.location.pathname);
        window.location.href = `/user/login?returnUrl=${returnUrl}`;
        return;
    }

    try {
        const followerIdElement = document.getElementById('followerId');
        const followerId = followerIdElement.value;

        const method = isFollow ? 'POST' : 'DELETE';
        const response = await fetch(`/api/follow/${isFollow ? 'add' : 'delete'}/${followerId}`, {
            method: method,
        });

        if (response.ok) {
            console.log(response);
            const action = isFollow ? '팔로우' : '언팔로우';
            alert(`${followerId}님을 ${action} 하였습니다!`);

            // 성공 시 버튼 클래스 조작
            const followBtn = document.getElementById('followBtn');
            const unfollowBtn = document.getElementById('unfollowBtn');

            if (isFollow) {
                followBtn.classList.add('d-none');
                unfollowBtn.classList.remove('d-none');
            } else {
                followBtn.classList.remove('d-none');
                unfollowBtn.classList.add('d-none');
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

