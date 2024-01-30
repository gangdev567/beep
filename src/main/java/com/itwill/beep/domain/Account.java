package com.itwill.beep.domain;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.annotations.NaturalId;

import jakarta.persistence.Basic;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE) @Builder
@Getter
@ToString
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
@Entity @Table(name = "users")
public class Account {
    
    @Id // PK
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 열시퀸스
    @Column(name = "user_no")
    private Long id;
    
    @EqualsAndHashCode.Include // username 필드 만으로 equals 비교를 하기 위해서.
    @NaturalId // unique
    @Basic(optional = false)
    @Column(name = "user_id", updatable = false) // set절에서 제외
    private String username;
    
    @Basic(optional = false)
    private String user_password;
    
    @Basic(optional = false)
    @Column(name = "username")
    private String userNickname; 
    
    @Basic(optional = false)
    private String email;
    
    @Builder.Default // 빌더패턴을 이용해서 객체를 생성할 때 nullPointExeption이 발생하는 것을 방지하기 위해 비어있는 Set<>을 생성하는 에너테이션
    @ToString.Exclude 
    @ElementCollection(fetch = FetchType.LAZY)
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "user_roles", joinColumns = @JoinColumn(name = "user_no"))
    private Set<UserRole> roles = new HashSet<>();
    
    public Account addRole(UserRole role) {
        roles.add(role);
        return this;
    }
    
    public Account clearRoles() {
        roles.clear();
        return this;
    }

}
