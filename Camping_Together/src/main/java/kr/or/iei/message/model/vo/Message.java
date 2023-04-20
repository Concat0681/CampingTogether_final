package kr.or.iei.message.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Message {
    private int messageNo;
    private String receiver;
    private String sender;
    private String messageContent;
    private String messageTitle;
    private int readCheck;
    private String messageDate;
}

