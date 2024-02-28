/**
 * SSE(Server-Sent-Event)를 처리하기 위한 스크립트
 */

 document.addEventListener('DOMContentLoaded', () => {
     
    const sse = new EventSource("http://192.168.20.26:8081/connect");

    sse.addEventListener('connect', (e) => {
        console.log(e);
        const { data: receivedConnectData } = e;
        console.log('connect event data: ',receivedConnectData);  // "connected!"
    });
    
     
    sse.addEventListener('broadcast_on', (e) => {
        // 알림 처리
        console.log(e);
        // 방송 시작 알림 처리
        const { data: channelTitle } = e;
        console.log('title: ', channelTitle);
        // ... 알림 표시 로직
        
    });
    
 });