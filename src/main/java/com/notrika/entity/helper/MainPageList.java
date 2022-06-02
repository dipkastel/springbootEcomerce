package com.notrika.entity.helper;

import com.notrika.entity.BannerGallery;
import com.notrika.entity.Product;
import com.notrika.entity.Widget;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class MainPageList {

    public MainPageList(ListTypes listType) {
        this.listType = listType;
    }

    private List<Product> products;
    private List<Widget> widgets;
    private List<BannerGallery> banners;
    private String listName;
    private String linkMore;
    private ListTypes listType;

    public enum ListTypes{
        NORMAL_PRODUCTS, SPECIAL_PRODUCTS, HEADER_WIDGET,BANNER_LIST,SITE_FEATURES,SPECIAL_OFFERS
    }
}
