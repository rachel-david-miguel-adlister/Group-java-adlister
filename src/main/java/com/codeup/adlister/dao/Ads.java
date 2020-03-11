package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // list of ads from a user id
    List<Ad>userAds(Long user_id);
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    // get the details of a certain ad
    List<Ad> details(int id);
    //delete an ad
    void deleteAd(int id);
}
