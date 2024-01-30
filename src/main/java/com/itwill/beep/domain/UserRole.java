package com.itwill.beep.domain;

public enum UserRole {
    USER("ROLE_USER"),
    STREAMER("ROLE_STREAMER"),
    ADMIN("ROLE_ADMIN");
    
    private String authority;
    
    UserRole(String authority) {
        this.authority = authority;
    }
    
    public String getAuthority() {
        return this.authority;
    }

}
