package com.asm.Entity;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfo {

    String from;
    String to;
    String[] cc;
    String[] bcc;
    String subject;
    public List<File> getFiles() {
		return files;
	}

	public void setFiles(List<File> files) {
		this.files = files;
	}

	String body;
    String[] attachments;
	List<File> files=new ArrayList<>();

	public MailInfo() {
	}
    public MailInfo(String to, String subject, String body) {
        this.from = "FPT Polytechnic <poly@fpt.edu.vn>";
        this.to = to;
        this.subject = subject;
        this.body = body;
    }

	public String getFrom() {
		return from;
	}

	public String getTo() {
		return to;
	}

	public String[] getCc() {
		return cc;
	}

	public String[] getBcc() {
		return bcc;
	}

	public String getSubject() {
		return subject;
	}

	public String getBody() {
		return body;
	}

	public String[] getAttachments() {
		return attachments;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public void setCc(String[] cc) {
		this.cc = cc;
	}

	public void setBcc(String[] bcc) {
		this.bcc = bcc;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public void setAttachments(String[] attachments) {
		this.attachments = attachments;
	}
    
    
}
