package com.notrika.service;

import com.notrika.entity.tables.CartItem;
import com.notrika.entity.tables.CustomerOrder;
import com.notrika.entity.tables.Payment;
import com.notrika.entity.tables.Product;
import com.notrika.repository.DAO;
import com.notrika.repository.PaymentRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@Service
@Transactional
@Slf4j
public class PaymentService implements DAO<Payment> {
	private final PaymentRepository repo;
	private final ProductService productService;

	@Autowired
	public PaymentService(PaymentRepository repo, ProductService productService) {
		this.repo = repo;
		this.productService = productService;
	}

	@Override
	public List<Payment> findAll() {
		return repo.findAll();
	}

	@Override
	public Payment findById(Long id) {
		return repo.findById(id).get();
	}

	@Override
	public void save(Payment vo) {
		repo.save(vo);
	}



	@Override
	public void delete(Long id) {
		repo.deleteById(id);
	}

	public Payment findPaymentByCustomerOrderId(Long customerOrderId) {
		return repo.findTop1ByCustomerOrderIdOrderByPaymentDateDesc(customerOrderId);
	}

	public Long countByCustomerOrderId(Long customerOrderId) {
		return repo.countByCustomerOrderId(customerOrderId);
	}

	public Double statistiqueSalesByMonthYear(int month, int year) {
		Double result = 0.0d;
		if(repo.totalPriceInPaymentByMonthYear(month, year) != null) {
			result = repo.totalPriceInPaymentByMonthYear(month, year);
		}
		return result;
	}

	public HashMap<Integer, Double> statistiqueSalesByYear(int year) {
		HashMap<Integer, Double> result = new HashMap<Integer, Double>();
		for (int i = 1; i <= 12; i++) {
			result.put(i, statistiqueSalesByMonthYear(i, year));
		}
		return result;
	}
	
	public List<Double> getListPricePayment(HashMap<Integer, Double> salesByYear){
		List<Double> list = new ArrayList<Double>();
		for (Integer m : salesByYear.keySet()) {
			list.add(salesByYear.get(m));
		}
		return list;
	}
	public double totalSales(HashMap<Integer, Double> salesByYear) {
		double totalSales = 0.0;
		for (Integer m : salesByYear.keySet()) {
			totalSales += salesByYear.get(m);
		}
		return totalSales;
	}
	
	public List<Payment> findAllPaymentByCustomerId(Long customerId){
		return repo.findAllByCustomerIdOrderByPaymentDateDesc(customerId);
	}

	public Payment saveVO(Payment vo) {
		CustomerOrder order =  vo.getCustomerOrder();
		if (checkOrder(order)){
			order.getCartItems().forEach(cartItem -> {
				Product product = productService.findById(cartItem.getProduct().getId());
				if (isStockEqual(cartItem)){
					log.info("decrease stock = 0 and set enable to false (out-stock)");
					product.setStockQuantity(product.getStockQuantity()-cartItem.getSellingQuantity());
//					product.setEnabled(false);
				}else{
					log.info("decrease stock");
					product.setStockQuantity(product.getStockQuantity()-cartItem.getSellingQuantity());
				}
				productService.save(product);
			});
			log.info("save Payment");
			return repo.save(vo);
		}
		return null;
	}


	private boolean checkOrder(CustomerOrder order){
		boolean check = true;
		for (CartItem cartItem: order.getCartItems()) {
			if (!checkStock(cartItem)){
				check = false;
				break;
			}
		}
		return check;
	}

	private boolean isStockEqual(CartItem item){
		Product product = productService.findById(item.getProduct().getId());
		return item.getSellingQuantity() == product.getStockQuantity();
	}

	private boolean checkStock(CartItem item){
		Product product = productService.findById(item.getProduct().getId());
		return item.getSellingQuantity() <= product.getStockQuantity();
	}

	public void deleteAll() {
		repo.deleteAll();
	}
}
//commit
