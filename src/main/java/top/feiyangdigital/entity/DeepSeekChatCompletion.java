package top.feiyangdigital.entity;

import com.unfbx.chatgpt.entity.chat.ChatCompletion;

import java.util.Map;

public class DeepSeekChatCompletion extends ChatCompletion {
    private Map<String, String> thinking;

    public Map<String, String> getThinking() {
        return thinking;
    }

    public void setThinking(Map<String, String> thinking) {
        this.thinking = thinking;
    }
}
