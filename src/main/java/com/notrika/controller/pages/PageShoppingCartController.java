package com.notrika.controller.pages;

import com.notrika.entity.Cart;
import com.notrika.entity.tables.CartItem;
import com.notrika.entity.tables.Product;
import com.notrika.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@RestController
@RequestMapping(path = "/cart", produces = "application/json")
@CrossOrigin(origins = "*")
@Slf4j
public class PageShoppingCartController {

    private final ProductService productService;
    private final Cart cart;

    @Autowired
    public PageShoppingCartController(ProductService productService,Cart cart) {
        this.productService = productService;
        this.cart = cart;
    }

    @GetMapping("/getAll")
    public List<CartItem> getAllCartItem(){
        log.info("getAll Cart Items ->>"+cart.getCartItems().size());
        return cart.getCartItems() ;
    }

    @GetMapping("/get")
    public CartItem getCartItemByProductId(
            @RequestParam(name = "productId", required = true) Long productId
            ){
        log.info("Get CartItem wit ProductId: "+productId);
        Product product = productService.findById(productId);
        CartItem item = new CartItem();
        item.setProduct(product);
        item.setTotalPrice(product.getPrice());
        item.setSellingQuantity(1);
        return item;
    }

    @PostMapping("/update")
    public List<CartItem> updateCartItem(
            HttpServletResponse response, HttpServletRequest request,
            @RequestBody List<CartItem> cartItems
    ){
        log.info("update cart items with items number: "+cartItems.size());
        if (cartItems!=null){
            cart.clearCartItem();
            cartItems.forEach(item->cart.addCartItem(item));
        }else{
            cart.clearCartItem();
        }
        return cart.getCartItems();
    }



}
