package com.itwill.beep.domain;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {

    List<CategoryEntity> findByTotalViewNotNullOrderByTotalViewDesc();

    CategoryEntity findByCategoryId(long categoryId);
}
