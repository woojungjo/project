package org.zerock.wecart.domain.pricecompare;

import org.zerock.wecart.domain.board.Criteria;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class GoodsPageDTO {

	private Criteria cri;
	
	private int totalAmount;
	
	private int startPage;
	private int endPage;
	private int realEndPge;
	
	private int offset;
	
//	private boolean 
	
} //end class
