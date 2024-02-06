package com.itwill.beep.domain;

public enum Broadcast {
    ON("STAUTS_ON"), 
    OFF("STAUTS_OFF");
    
    private String status;
    
    Broadcast(String status) {
        this.status = status;
    }
    
    public String getStatus() {
        return this.status;
    }
}
