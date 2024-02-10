package com.itwill.beep.domain;

public enum StreamingStatus {
    RUNNING("STATUS_RUNNING"),
    STOPPED("STATUS_STOPPED");
    
    private String Streamingstatus;

    StreamingStatus(String Streamingstatus) {
        this.Streamingstatus = Streamingstatus;
    }
    
    public String getStreamingstatus() {
        return this.Streamingstatus;
    }
}
