package com.notrika.controller.pages;

import com.mservice.allinone.models.CaptureMoMoRequest;
import com.mservice.allinone.processor.allinone.CaptureMoMo;
import com.mservice.shared.sharedmodels.Environment;
import com.notrika.entity.BannerGallery;
import com.notrika.entity.Product;
import com.notrika.entity.Widget;
import com.notrika.entity.helper.MainPageList;
import com.notrika.helper.enums.WidgetType;
import com.notrika.service.BannerGalleryService;
import com.notrika.service.ProductService;
import com.notrika.service.WidgetService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@Slf4j
@Controller
//@RequestMapping("/")
public class PageHomeController {
    private final BannerGalleryService bannerGalleryService;
    private final ProductService productService;
    private final WidgetService widgetService;

    @Autowired
    public PageHomeController(BannerGalleryService bannerGalleryService, ProductService productService, WidgetService widgetService) {
        this.productService = productService;
        this.bannerGalleryService = bannerGalleryService;
        this.widgetService = widgetService;

    }

    @GetMapping(value = "/")
    public String customerHomePage(HttpServletRequest request, HttpServletResponse response,
                                   Authentication authentication, Model model) {

        List<MainPageList> mainPageLayout = new ArrayList<>();

        //banners Widget
        MainPageList bannersWidget = new MainPageList(MainPageList.ListTypes.BANNERS_WIDGET);
        List<Widget> bannersWidgetList = widgetService.findByType(WidgetType.BANNERS_WIDGET);
        bannersWidget.setWidgets(bannersWidgetList);
        if(bannersWidgetList.size()>0)
            mainPageLayout.add(bannersWidget);

        //super tag
        MainPageList superCat = new MainPageList(MainPageList.ListTypes.SUPER_CAT);
        List<Widget> listSuperWidget = widgetService.findByType(WidgetType.SUPER_CAT);
        superCat.setWidgets(listSuperWidget);
        mainPageLayout.add(superCat);


        //banners
        MainPageList banners = new MainPageList(MainPageList.ListTypes.BANNER_LIST);
        List<BannerGallery> bannerList = bannerGalleryService.findAll();
        banners.setBanners(bannerList);
        mainPageLayout.add(banners);

        //THRIPLE_BANNER_SAME Widget
        MainPageList thripleMain = new MainPageList(MainPageList.ListTypes.THRIPLE_BANNER_SAME);
        List<Widget> thripleItemsList = widgetService.findByType(WidgetType.THRIPLE_BANNER_SAME);
        thripleMain.setWidgets(thripleItemsList);
        if(thripleItemsList.size()>0)
            mainPageLayout.add(thripleMain);


        //listProducts
        MainPageList listProductsNormal = new MainPageList(MainPageList.ListTypes.NORMAL_PRODUCTS);
        List<Product> products = productService.findByFilter("", 10);
        listProductsNormal.setProducts(products);
        listProductsNormal.setLinkMore("/more");
        listProductsNormal.setListName("محصولات پر فروش");
        mainPageLayout.add(listProductsNormal);


        //MULTIPLE_BANNER_RIGHT
        MainPageList multipleRight = new MainPageList(MainPageList.ListTypes.MULTIPLE_BANNER_RIGHT);
        List<Widget> multipleRightList = widgetService.findByType(WidgetType.MULTIPLE_BANNER_RIGHT);
        multipleRight.setWidgets(multipleRightList);
        if(multipleRightList.size()>0)
            mainPageLayout.add(multipleRight);

        //listProducts
        MainPageList listProductsSpecial = new MainPageList(MainPageList.ListTypes.SPECIAL_PRODUCTS);
        List<Product> products2 = productService.findByFilter("", 10);
        listProductsSpecial.setProducts(products2);
        listProductsSpecial.setLinkMore("/more");
        listProductsSpecial.setListName("محصولات کم فروش");
        mainPageLayout.add(listProductsSpecial);



        //MULTIPLE_BANNER_SAME
        MainPageList multipleSame = new MainPageList(MainPageList.ListTypes.MULTIPLE_BANNER_SAME);
        List<Widget> multipleSameList = widgetService.findByType(WidgetType.MULTIPLE_BANNER_SAME);
        multipleSame.setWidgets(multipleSameList);
        if(multipleSameList.size()>0)
            mainPageLayout.add(multipleSame);

        //listProducts
        mainPageLayout.add(listProductsNormal);


        //MULTIPLE_BANNER_LEFT
        MainPageList multipleLeft = new MainPageList(MainPageList.ListTypes.MULTIPLE_BANNER_LEFT);
        List<Widget> multipleLeftList = widgetService.findByType(WidgetType.MULTIPLE_BANNER_LEFT);
        multipleLeft.setWidgets(multipleLeftList);
        if(multipleLeftList.size()>0)
            mainPageLayout.add(multipleLeft);

        //listProducts
        MainPageList listProductsOffer = new MainPageList(MainPageList.ListTypes.SPECIAL_OFFERS);
        List<Product> products3 = productService.findByFilter("", 10);
        listProductsOffer.setProducts(products3);
        listProductsOffer.setLinkMore("/more");
        listProductsOffer.setListName("محصولات کمتر فروش");
        mainPageLayout.add(listProductsOffer);

        //listProducts
        mainPageLayout.add(listProductsNormal);


        //site-features
        MainPageList siteFeatures = new MainPageList(MainPageList.ListTypes.SITE_FEATURES);
        mainPageLayout.add(siteFeatures);

        model.addAttribute("MainList", mainPageLayout);


//
//		Map<String, List<Product>> productByCategory = new HashMap<>();
//		List<Product> listProduct = productService.findAllIgnoreStatus();
//		List<Tag> masterTags = tagService.findAll().stream().filter(o->o.getMasterTag()==true).collect(Collectors.toList());
//
//		//review{
//		Map<String, Map<Long, Integer>> mapReviewByCategory = new HashMap<String, Map<Long, Integer>>();
//		Map<String, Map<Long, Double>> mapAvgStarByCategory = new HashMap<String, Map<Long, Double>>();
//		categoryService.findAll().stream().filter(p->p.getParentId()==null).forEach(c -> {
//			productByCategory.put(c.getName(), productByCategory(c.getId()));
//			//review
//			Map<Long, Integer> mapReviewByCategoryProduct = ratingService.findAllReviewByList(productByCategory(c.getId()));
//			mapReviewByCategory.put(c.getName(), mapReviewByCategoryProduct);
//
//			Map<Long, Double> mapAvgStarByCategoryProduct = ratingService.findAllAvgStarByList(productByCategory(c.getId()));
//			mapAvgStarByCategory.put(c.getName(), mapAvgStarByCategoryProduct);
//		});
//		model.addAttribute("mapReviewByCategory", mapReviewByCategory);
//		model.addAttribute("mapAvgStarByCategory", mapAvgStarByCategory);
//		model.addAttribute("masterTags", masterTags);
//		//}
//		List<Product> topProducts = listProduct;
//		topProducts.addAll(listProduct);
//		model.addAttribute("productByCategory", productByCategory);
//		model.addAttribute("topProducts", listProduct);
//		model.addAttribute("viewlist", cookieHelper.getCookieByName(request, productService, "viewlist"));
//
//		//review {
//		Map<Long, Integer> mapReviewByView = ratingService.findAllReviewByList(cookieHelper.getCookieByName(request, productService, "viewlist"));
//		model.addAttribute("mapReviewByView", mapReviewByView);
//		Map<Long, Double> mapAvgStarByView = ratingService.findAllAvgStarByList(cookieHelper.getCookieByName(request, productService, "viewlist"));
//		model.addAttribute("mapAvgStarByView", mapAvgStarByView);
//
//		List<Product> list = new ArrayList<Product>();
//	    productService.findTop5().forEach(pid->list.add(productService.findById(pid)));
//	    Map<Long, Integer> mapReviewByTop5 = ratingService.findAllReviewByList(list);
//		model.addAttribute("mapReviewByTop5", mapReviewByTop5);
//		Map<Long, Double> mapAvgStarByTop5 = ratingService.findAllAvgStarByList(list);
//		model.addAttribute("mapAvgStarByTop5", mapAvgStarByTop5);
//		//}
        return "template/user/page/index/index";
    }

    private MainPageList getWidgets(int i, HashMap<WidgetType, List<Widget>> widgetsMap, List<WidgetType> widgetTypes) {
        MainPageList pageItem;
        if (widgetsMap.size() > i) {
            WidgetType key = widgetsMap.keySet().toArray(new WidgetType[0])[i];
            pageItem = new MainPageList(MainPageList.ListTypes.getWidgetType(key.toString()));
            List<Widget> widgetList = widgetsMap.get(key);
            pageItem.setWidgets(widgetList);
            return pageItem;
        } else {
            return null;
        }
    }

    @GetMapping(value = "/test")
    public String test(HttpServletRequest request, HttpServletResponse response,
                       Authentication authentication, Model model) {
        return "ajax";
    }

//    public List<Product> productByCategory(long catId) {
//        return productService.findByCategories(catId);
//    }

    @GetMapping("/banner/display/{id}")
    @ResponseBody
    public void showBannerImage(@PathVariable("id") Long id, HttpServletResponse response)
            throws ServletException, IOException {
        log.info("showBannerImage: ");
        BannerGallery bannerGallery = bannerGalleryService.findById(id);
        String types = "image/jpeg, image/jpg, image/png, image/gif";
        response.setContentType(types);
        if (bannerGallery != null) {
            response.getOutputStream().write(bannerGallery.getImage());
        }
        response.getOutputStream().close();
    }

    @GetMapping("momo")
    public String getMoMoOrder(Model model) {
        String requestId = String.valueOf(System.currentTimeMillis());
        String orderId = String.valueOf(System.currentTimeMillis());
        long amount = 50000;

        String orderInfo = "Pay With MoMo";
        String returnURL = "https://google.com.vn";
        String notifyURL = "https://google.com.vn";
        String extraData = "";
        String bankCode = "SML";
        Environment environment = Environment.selectEnv("dev", Environment.ProcessType.PAY_GATE);
        CaptureMoMo captureMoMo = new CaptureMoMo(environment);
        CaptureMoMoRequest captureMoMoRequest = captureMoMo.createPaymentCreationRequest(orderId, requestId,
                Long.toString(amount), orderInfo, returnURL, notifyURL, extraData);
//		try {
//			CaptureMoMoResponse captureMoMoResponse = CaptureMoMo.process(environment, orderId, requestId, Long.toString(amount), orderInfo, returnURL, notifyURL, "");
//		}catch (Exception e){
//			model.addAttribute("response",e.getMessage());
//		}

        model.addAttribute("payment", captureMoMoRequest);

        return "template/user/page/momo";

    }
}
