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
public class User {

    private int account_id;
    private String first_name;
    private String last_name;
    private String email;
    private String bio;
}
