package com.itwill.beep;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import java.time.Duration;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import com.api.igdb.request.TwitchAuthenticator;
import com.api.igdb.utils.TwitchToken;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class TestTwitchToken {

    @Test
    void testGetTwitchToken() {
        // Create the Twitch authenticator instance
        TwitchAuthenticator tAuth = TwitchAuthenticator.INSTANCE;
        // request a new Twitch Authentication token
        TwitchToken token = tAuth.requestTwitchToken("cycgcdsm686coksyhuc8j1i2ee8fny",
                "u38dflbiyukx8nih3vsny3waz8wvl3");

        assertNotNull(token);
        assertTrue(token.getExpires_in() > Duration.ofDays(57).toSeconds());
        long tokenFutureDate = System.currentTimeMillis() + Duration.ofDays(57).toSeconds();
        assertTrue(tokenFutureDate > token.getExpiresUnix());
    }
}
