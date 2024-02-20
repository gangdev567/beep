package com.itwill.beep.service;

import com.itwill.beep.domain.StreamingRecord;
import com.itwill.beep.domain.StreamingRecordRepository;
import java.time.LocalDateTime;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class StreamingService {

    private final StreamingRecordRepository streamingRecordRepository;

    public void recordStartTime(String streamKey) {
        StreamingRecord streamingRecord = new StreamingRecord();
        streamingRecord.updateStreamingKey(streamKey);
        streamingRecord.updateStreamingStartTime(LocalDateTime.now());
        streamingRecordRepository.save(streamingRecord);
    }

    public List<StreamingRecord> getAllStreamRecords() {
        List<StreamingRecord> records = streamingRecordRepository.findAll();

        return records;
    }
}