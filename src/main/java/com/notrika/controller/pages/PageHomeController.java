package com.notrika.controller.pages;

import com.mservice.allinone.models.CaptureMoMoRequest;
import com.mservice.allinone.processor.allinone.CaptureMoMo;
import com.mservice.shared.sharedmodels.Environment;
import com.notrika.entity.BannerGallery;
import com.notrika.entity.Product;
import com.notrika.entity.Tag;
import com.notrika.helper.CookieHelper;
import com.notrika.service.*;
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
import java.util.Map;
import java.util.stream.Collectors;


@Slf4j
@Controller
//@RequestMapping("/")
public class PageHomeController {
	private final BannerGalleryService bannerGalleryService;
	private final CategoryService categoryService;
	private final ProductService productService;
	private final CookieHelper cookieHelper;
	private final RatingService ratingService;
	private final TagService tagService;
	@Autowired
	public PageHomeController(CategoryService categoryService, ProductService productService,
			BannerGalleryService bannerGalleryService, CookieHelper cookieHelper, RatingService ratingService, TagService tagService) {
		this.categoryService = categoryService;
		this.productService = productService;
		this.cookieHelper = cookieHelper;
		this.bannerGalleryService = bannerGalleryService;
		this.ratingService = ratingService;
		this.tagService = tagService;
	}

	@GetMapping(value = "/")
	public String customerHomePage(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication, Model model) {

		Map<String, List<Product>> productByCategory = new HashMap<>();
		List<Product> listProduct = productService.findAllIgnoreStatus();
		List<Tag> masterTags = tagService.findAll().stream().filter(o->o.getMasterTag()==true).collect(Collectors.toList());
		
		//review{
		Map<String, Map<Long, Integer>> mapReviewByCategory = new HashMap<String, Map<Long, Integer>>();
		Map<String, Map<Long, Double>> mapAvgStarByCategory = new HashMap<String, Map<Long, Double>>();
		categoryService.findAll().stream().filter(p->p.getParentId()==null).forEach(c -> {
			productByCategory.put(c.getName(), productByCategory(c.getId()));
			//review
			Map<Long, Integer> mapReviewByCategoryProduct = ratingService.findAllReviewByList(productByCategory(c.getId()));
			mapReviewByCategory.put(c.getName(), mapReviewByCategoryProduct);
			
			Map<Long, Double> mapAvgStarByCategoryProduct = ratingService.findAllAvgStarByList(productByCategory(c.getId()));
			mapAvgStarByCategory.put(c.getName(), mapAvgStarByCategoryProduct);
		});
		model.addAttribute("mapReviewByCategory", mapReviewByCategory);
		model.addAttribute("mapAvgStarByCategory", mapAvgStarByCategory);
		model.addAttribute("masterTags", masterTags);
		//}
		List<Product> topProducts = listProduct;
		topProducts.addAll(listProduct);
		model.addAttribute("productByCategory", productByCategory);
		model.addAttribute("topProducts", listProduct);
		model.addAttribute("viewlist", cookieHelper.getCookieByName(request, productService, "viewlist"));
		List<BannerGallery> bannerList = bannerGalleryService.findAll();
		model.addAttribute("listBanner", bannerList);

		//review {
		Map<Long, Integer> mapReviewByView = ratingService.findAllReviewByList(cookieHelper.getCookieByName(request, productService, "viewlist"));
		model.addAttribute("mapReviewByView", mapReviewByView);
		Map<Long, Double> mapAvgStarByView = ratingService.findAllAvgStarByList(cookieHelper.getCookieByName(request, productService, "viewlist"));
		model.addAttribute("mapAvgStarByView", mapAvgStarByView);
		
		List<Product> list = new ArrayList<Product>();
	    productService.findTop5().forEach(pid->list.add(productService.findById(pid)));
	    Map<Long, Integer> mapReviewByTop5 = ratingService.findAllReviewByList(list);
		model.addAttribute("mapReviewByTop5", mapReviewByTop5);
		Map<Long, Double> mapAvgStarByTop5 = ratingService.findAllAvgStarByList(list);
		model.addAttribute("mapAvgStarByTop5", mapAvgStarByTop5);
		//}
		return "template/user/page/index/index";
	}
	@GetMapping(value = "/test")
	public String test(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication, Model model) {
		return "ajax";
	}

	public List<Product> productByCategory(long catId) {
		return productService.findByCategories(catId);
	}

	@GetMapping("/banner/display/{id}")
	@ResponseBody
	public void showBannerImage(@PathVariable("id") Long id, HttpServletResponse response)
			throws ServletException, IOException {
		log.info("showBannerImage: ");
		BannerGallery bannerGallery = bannerGalleryService.findById(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
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