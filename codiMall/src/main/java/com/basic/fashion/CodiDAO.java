package com.basic.fashion;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.basic.product.KindDTO;
import com.basic.product.ProductSelectDTO;
import com.basic.util.PageMaker;

@Repository
public class CodiDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "CodiMapper.";
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	DefaultTransactionDefinition def = null;
	TransactionStatus status = null;
	
	//코디 리스트
	public List<CodiDTO> codiList(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace + "codiList", pageMaker);
	}
	
	//페이지 카운트
	public int codiCount(){
		return sqlSession.selectOne(namespace + "codiCount");
	}
	
	//등록
	public int codiCreate(CodiDTO codiDTO) throws Exception{
		return sqlSession.insert(namespace + "codiCreate", codiDTO);
	}
	
	//삭제
	public void codiDelete() throws Exception{
		
	}
	
	//코디 등록 할 상품 리스트
	public List<CodiDTO> codiProductList(PageMaker pageMaker, int kind_num){
		Map<String, Object> map = new HashMap<>();
		map.put("kind_num", kind_num);
		map.put("pageMaker", pageMaker);
		List<CodiDTO> ar = sqlSession.selectList(namespace+"SelCodiProductList", map);
		return ar;
	}
	public List<KindDTO> codiKindList(int productSelect_num){
		Map<String, Integer> map = new HashMap<>();
		map.put("productSelect_num", productSelect_num);
		List<KindDTO> ar = sqlSession.selectList(namespace+"SelkindList", map);
		return ar;
	}
	public List<ProductSelectDTO> codiSelectList(){
		return sqlSession.selectList(namespace+"SelProductSelectList");
	}
	//상품 리스트 카운트
	public int codiProductListCount(int kind_num){
		Map<String, Object> map = new HashMap<>();
		map.put("kind_num", kind_num);
		
		return sqlSession.selectOne(namespace+"codiProductListCount", kind_num);
	}
	

}
