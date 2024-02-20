package com.itwill.beep.domain;

public enum UserRoleType {
    USER("ROLE_USER"),
    STREAMER("ROLE_STREAMER"),
    ADMIN("ROLE_ADMIN"),
<<<<<<< HEAD
	SOCIAL("ROLE_SOCIAL");





=======
    SOCIAL("ROLE_SOCIAL");
>>>>>>> 5961feb6aae72ee2c896a725aaaf81fccb9276a7
    
    private String authority;
    
    UserRoleType(String authority) {
        this.authority = authority;
    }
    
    public String getAuthority() {
        return this.authority;
    }

}
