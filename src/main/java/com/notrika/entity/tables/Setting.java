package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "settings")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Setting extends BaseEntity {


    public Setting(String Key, String value,String section){
        this.skey = Key;
        this.svalue = value;
        this.section = section;
    }



    private String skey;
    private String svalue;
    public String section;
    private boolean active = true;



    @PrePersist
    void setActive() {
        this.active = true;
    }


}
