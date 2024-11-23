package com.smartfeed.kevin.models;
/*
*
@author ameda
@project SmartFeed
*
*/

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Post {
    private int postId;
    private String postText;
    private String media;
    private String privacySetting;
    private String submitted;
    private int user_account_id;
}
