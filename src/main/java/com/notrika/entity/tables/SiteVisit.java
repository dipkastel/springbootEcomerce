package com.notrika.entity.tables;

import com.notrika.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "SiteVisit")
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class SiteVisit extends BaseEntity {
    private String userAgent;
    private String userIp;
    private String userUniq;
    private String url;
}
