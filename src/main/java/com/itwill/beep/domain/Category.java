package com.itwill.beep.domain;

import jakarta.persistence.Basic;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@ToString
@EqualsAndHashCode
@Entity
@Table(name = "category")
public class Category {
    @Id
    private Long categoryId;

    @Basic(optional = false)
    private String categoryName;

    private String imageUrl;

    // @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    // private List<Video> videos;
}
