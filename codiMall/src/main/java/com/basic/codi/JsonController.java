package com.basic.codi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.basic.basket.BasketService;
import com.basic.board.BoardService;
import com.basic.product.ProductDTO;
import com.basic.product.ProductEachDTO;
import com.basic.product.ProductEachListDTO;
import com.basic.product.ProductService;

@Controller
@RequestMapping(value="/json")
@ResponseBody
public class JsonController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BasketService basketService;
	
	@Autowired
	private BoardService boardService;
	

	
	@RequestMapping(value="/productSize", produces = "application/json; charset=utf-8")
	public List<String> productSizeList(@RequestParam int product_num){
		return productService.productSizeList(product_num);
	}
	
	@RequestMapping(value="/productEach", produces = "application/json; charset=utf-8")
	public Map<String, Object> productEachList(@RequestParam int product_num,@RequestParam String productSize_size){
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("eachList", productService.productEachList(product_num, productSize_size));
		return retVal;
	}

	@RequestMapping(value="/sale_item", method=RequestMethod.POST)
	public Map<String, Object> sale_item(@RequestParam HashMap<String, Object> param){
		System.out.println(param);
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("KEY", "VALUE");
		
		return hashmap;
	}
	@RequestMapping(value="/productEachGet")
	public int productEachGet(int product_num,String productSize_size,String productEach_color){
		System.out.println("json--"+product_num);
		System.out.println("json--"+productSize_size);
		System.out.println("json--"+productEach_color);
		
		ProductEachDTO productEachDTO = new ProductEachDTO();
		productEachDTO.setProduct_num(product_num);
		productEachDTO.setProductSize_size(productSize_size);
		productEachDTO.setProductEach_color(productEach_color);
		return productService.productEachGet(productEachDTO);
	}
	
	@RequestMapping(value="/basketProductEach",produces = "application/json; charset=utf-8")
	public Map<String, Object> basketProductEach(@RequestParam int product_num){
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("eachList", basketService.basketProductEachList(product_num));
		return retVal;
	}
	
	@RequestMapping(value="/allProductSize",produces = "application/json; charset=utf-8")
	public Map<String, Object> allProductSize(){
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("sizeList", productService.allProductSize());
		return retVal;
	}
	
	@RequestMapping(value="/allProductColor",produces = "application/json; charset=utf-8")
	public Map<String, Object> allProductColor(){
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("colorList", productService.allProductColor());
		return retVal;
	}
	
	@RequestMapping(value="/allKindNum",produces = "application/json; charset=utf-8")
	public Map<String, Object> allKindNum(){
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("kindNumList", productService.allKindNum());
		return retVal;
	}
	
	
	
}
