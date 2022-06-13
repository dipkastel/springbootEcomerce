package com.notrika.entity.helper;

import com.notrika.entity.tables.BannerGallery;
import com.notrika.entity.tables.Product;
import com.notrika.entity.tables.Widget;
import lombok.Getter;
import lombok.Setter;

import java.util.Arrays;
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
        NORMAL_PRODUCTS, SPECIAL_PRODUCTS, SUPER_CAT,BANNER_LIST,BANNERS_WIDGET,SITE_FEATURES,SPECIAL_OFFERS,MULTIPLE_BANNER_RIGHT,MULTIPLE_BANNER_LEFT,MULTIPLE_BANNER_SAME,THRIPLE_BANNER_SAME;
        public static ListTypes getWidgetType(String type){
           return Arrays.stream(ListTypes.values()).filter(p->p.name().equals(type)).findFirst().get();
        }
    }
}
