package com.itwill.beep.domain;

public enum StreamingState {
    STREAMING("STREAMING"),
    STOPPED("STOPPED");
    
    private String streamingState;

    StreamingState(String streamingState) {
        this.streamingState = streamingState;
    }
    
    public String getStreamingstate() {
        return this.streamingState;
    }
}
