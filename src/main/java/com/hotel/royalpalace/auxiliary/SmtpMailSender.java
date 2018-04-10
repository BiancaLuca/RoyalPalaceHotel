package com.hotel.royalpalace.auxiliary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.net.InetAddress;
import java.net.UnknownHostException;

@Component
public class SmtpMailSender {

    private String email;

    private String title;

    private String body;

    @Autowired
    private JavaMailSender javaMailSender;

    public SmtpMailSender() {

    }

    public SmtpMailSender(String email, String title, String body) {
        this.email = email;
        this.title = title;
        this.body = body;
    }

    public static String GetHostMachineIp() throws UnknownHostException {
        InetAddress ip = InetAddress.getLocalHost();
        return ip.getHostAddress();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public void sendToSingle(String to, String subject, String body) throws MessagingException {
        String[] toArray = {to};
        sendToMultiple(toArray, subject, body);
    }

    public void sendToMultiple(String[] to, String subject, String body) throws MessagingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper;
        helper = new MimeMessageHelper(message, true); // true indicates
        // multipart message
        helper.setSubject(subject);
        helper.setTo(to);
        helper.setText(body, true); // true indicates html
        javaMailSender.send(message);
    }

    public void run() {
        try {
            sendToSingle(this.email, this.title, this.body);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
