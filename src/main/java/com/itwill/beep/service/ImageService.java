package com.itwill.beep.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.itwill.beep.domain.ChannelEntity;
import com.itwill.beep.domain.ChannelRepository;
import com.itwill.beep.dto.ChannelImageRequestDto;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ImageService {
    private final ChannelRepository channelRepository;

    @Value("${file.upload-dir}")
    private String uploadPath;

    @Transactional
    public void channelProfileImgUpload(ChannelImageRequestDto dto) throws IOException {
        UUID uuid = UUID.randomUUID();
        String imageFileName = uuid + "_" + dto.getImgFile().getOriginalFilename();
        log.info("imageFileName={}", imageFileName);

        // 업로드할 디렉토리 경로 설정
        Path uploadDirectory = Paths.get(uploadPath);

        // 디렉토리가 존재하지 않으면 생성
        if (!Files.exists(uploadDirectory)) {
            Files.createDirectories(uploadDirectory);
        }

        Path imageFilePath = uploadDirectory.resolve(imageFileName);
        log.info("imageFilePath={}", imageFilePath);

        Files.write(imageFilePath, dto.getImgFile().getBytes());

        ChannelEntity channelEntity = channelRepository.findByChannelId(dto.getChannelId());
        channelEntity.updateChannelProfileImg("/uploads/" + imageFileName);
        channelRepository.save(channelEntity);
    }

}
