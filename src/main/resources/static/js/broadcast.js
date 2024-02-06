/**
 *  방송을 시작할 때 방송 정보를 입력할 모달창을 띄우는 스크립트
 *  broadcast.js
 */
document.addEventListener('DOMContentLoaded', function() {
   
    const button = document.querySelector('#broadcastOn');
    console.log(button);
    button.addEventListener('click', function() {
        const modal = document.getElementById('myModal');
        console.log(modal);;
        modal.style.display = 'block'; 
   });
    
});