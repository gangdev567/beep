package com.itwill.beep.domain;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {

    List<Category> findByTotalViewNotNullOrderByTotalViewDesc();

    // @Query("SELECT v FROM Video v WHERE v.category = :category")
    // List<Video> findVideosByCategory(@Param("category") Category category);

}
