package com.notrika.entity;

import javax.xml.crypto.Data;
import java.util.List;

public class PaginationResult <T>{
   public List<T> data;
   public Long count;
}
