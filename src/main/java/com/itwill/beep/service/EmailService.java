package com.itwill.beep.service;

import com.itwill.beep.domain.UserAccountEntity;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.mail.javamail.JavaMailSender;

@Slf4j
@Service
@RequiredArgsConstructor
public class EmailService {

    private final JavaMailSender javaMailSender;
    private final VerificationTokenService tokenService;

    public void sendVerificationToken(UserAccountEntity user) {
        String token = tokenService.createVerificationToken(user);

        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, "utf-8");

            String link = "http://localhost:8081/settings/security/registrationConfirm?token=" + token;
            String content = "<p>Dear User,</p>" +
                "<p>To confirm your email, please click the link below:</p>" +
                "<a href=\"" + link + "\">Confirm Email</a>" +
                "<p>Ignore this email if you do remember requesting it.</p>";

            try {
                helper.setTo(user.getUserEmail());
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            helper.setSubject("Confirm your email");
            helper.setText(content, true);
            int test = JavaMailSenderImpl.DEFAULT_PORT;
            javaMailSender.send(message);

            log.info("Verification email sent to {}", user.getUserEmail());
        } catch (MessagingException e) {
            log.error("Failed to send email", e);
        }
    }
}