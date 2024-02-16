package com.itwill.beep.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import java.util.Calendar;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode
@Builder
@AllArgsConstructor
@Entity
@Table(name = "verification_tokens")
public class VerificationToken {

    private static final int EXPIRATION = 60 * 24; // 토큰 유효 시간 24시간

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="verifi_token_id")
    private Long verifiTokenId;

    @Column(name="verifi_token_value")
    private String verifiTokenValue;

    @OneToOne(targetEntity = UserAccountEntity.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "verifi_token_user_Account")
    private UserAccountEntity verifiTokenUserAccount;

    @Column(name="verifi_token_expiry_date")
    private Date verifiTokenExpiryDate;

    public VerificationToken() {
        super();
    }

    public VerificationToken(String token, UserAccountEntity user) {
        super();
        this.verifiTokenValue = token;
        this.verifiTokenUserAccount = user;
        this.verifiTokenExpiryDate = calculateExpiryDate(EXPIRATION);
    }

    private Date calculateExpiryDate(int expiryTimeInMinutes) {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(new Date().getTime());
        cal.add(Calendar.MINUTE, expiryTimeInMinutes);
        return new Date(cal.getTime().getTime());
    }

    // 표준 게터/세터/생성자 ...
}