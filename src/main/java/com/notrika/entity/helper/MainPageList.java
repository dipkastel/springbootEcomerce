package com.notrika.entity.helper;

import com.notrika.entity.Product;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter
@Getter
public class MainPageList {
    private List<Product> products;
    private String listName;
    private String linkMore;
    private String listType;
}
