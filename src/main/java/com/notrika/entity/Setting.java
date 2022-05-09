package com.notrika.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "settings")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Setting {


    public Setting(String Key, String value,String section){
        this.skey = Key;
        this.svalue = value;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Long id;

    private String skey;
    private String svalue;
    public String section;
    private boolean active = true;



    @PrePersist
    void setActive() {
        this.active = true;
    }


}
