/**
 * SSE(Server-Sent-Event)를 처리하기 위한 스크립트
 */

 document.addEventListener('DOMContentLoaded', () => {
     
    const sse = new EventSource("http://localhost:8081/connect");

    sse.addEventListener('connect', (e) => {
        console.log(e);
        const { data: receivedConnectData } = e;
        console.log('connect event data: ',receivedConnectData);  // "connected!"
    });
    
     
    sse.addEventListener('broadcast_on', (e) => {
        // 알림 처리
        console.log(e);
        // 방송 시작 알림 처리
        // ... 알림 표시 로직
        // 알림 생성 및 표시
        createNotification(e.data);
        
        // 알림창 생성 함수
        
        });
    
        function createNotification(data) {
            console.log(data);
            const notificationElement = document.createElement('div');
            notificationElement.classList.add('notification');
            
            // JSON 객체 처리

            notificationElement.textContent = JSON.stringify(data);
        
            const notificationContainer = document.getElementById('notification-container');
            notificationContainer.appendChild(notificationElement);
            
            // 알림창 보여주기
            notificationElement.classList.add('active');
            
            // 3초 후 알림창 숨기기
            setTimeout(() => {
            notificationElement.classList.remove('active');
            setTimeout(() => notificationContainer.removeChild(notificationElement), 500);
            }, 300000);
            }
    
 });