package com.basic.mast;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MastService {
	
	@Autowired
	private MastDAO mastDAO;
	
	public List<MastBuyListDTO> mastBuyList(int state_num){
		return mastDAO.mastBuyList(state_num);
	}
}
