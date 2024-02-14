package com.itwill.beep.web;

import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.itwill.beep.domain.CategoryEntity;
import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.service.CategoryService;
import com.itwill.beep.service.ChannelService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/categories")
public class CategoryController {
    private final CategoryService categoryService;
    private final ChannelService channelService;

    @GetMapping
    public String showCategories(Model model) {
        log.info("showCategories()");

        List<CategoryEntity> mostViewers = categoryService.findByTotalViewers();

        model.addAttribute("mostViewers", mostViewers);

        return "categories";
    }

    @GetMapping("/{categoryId}")
    public String categoriesChannelList(@PathVariable("categoryId") Long categoryId, Model model) {
        log.info("categoriesChannelList");

        CategoryEntity categoryEntityDetails = categoryService.findByCategoryIdIs(categoryId);
        List<ChannelEntity> categoryChannelList =
                channelService.findByCategoryCategoryId(categoryId);

        model.addAttribute("categoryDetails", categoryEntityDetails);
        model.addAttribute("categoryChannelList", categoryChannelList);

        return "categories-channellist";
    }


    @ResponseBody
    @GetMapping("/api/search")
    public ResponseEntity<List<CategoryEntity>> searchGamesApi(
            @RequestParam(value = "keyword") String keyword) {
        log.info("searchGamesApi(keyword={})", keyword);

        List<CategoryEntity> foundGames = categoryService.searchGames(keyword);

        // ResponseEntity를 사용하여 HTTP 응답을 반환
        return ResponseEntity.ok(foundGames);

    }

}
