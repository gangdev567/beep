/**
 * follow.js
 * 
 */

const userIdToFollow = document.getElementById('following').value; // 팔로우/언팔로우할 사용자 ID로 교체

async function follow() {
    try {
        const response = await fetch(`/api/follow/add/${userIdToFollow}`, {
            method: 'POST',
        });

        if (response.ok) {
            console.log(response);
            alert(`${userIdToFollow}님을 팔로우 하였습니다!`);
        } else {
            console.error(response);
            alert("사용자를 팔로우하는 중 오류가 발생했습니다!");
        }
    } catch (error) {
        console.error(error);
        alert("사용자를 팔로우하는 중 오류가 발생했습니다!");
    }
}

async function unfollow() {
    try {
        const response = await fetch(`/api/follow/delete/${userIdToFollow}`, {
            method: 'DELETE',
        });

        if (response.ok) {
            console.log(response);
            alert(`${userIdToFollow}님을 언팔로우 하였습니다!`);
        } else {
            console.error(response);
            alert("사용자를 언팔로우하는 중 오류가 발생했습니다!");
        }
    } catch (error) {
        console.error(error);
        alert("사용자를 언팔로우하는 중 오류가 발생했습니다!");
    }
}