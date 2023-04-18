package org.zerock.wecart.domain.pricecompare;

import org.zerock.wecart.domain.board.Criteria;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class GoodsPageDTO {

	private GoodsCriteria cri;
	
	private int totalAmount;
	
	private int startPage;
	private int endPage;
	private int realEndPage;
	
	private int offset;
	
	
	public GoodsPageDTO(GoodsCriteria cri, int totalAmount) {
		this.cri = cri;
		
		this.totalAmount = totalAmount;
		
		int currPage = cri.getCurrPage();
		int amount = cri.getAmount();
		int pagesPerPage = cri.getPagesPerPage();
		
		this.endPage = (int) Math.ceil((currPage * 1.0) / pagesPerPage) * pagesPerPage;
		
		this.startPage = this.endPage - (pagesPerPage - 1);
		
		this.realEndPage = (int) Math.ceil((totalAmount * 1.0) / amount);
		
		if(this.realEndPage < this.endPage) {
			this.endPage = this.realEndPage;
		} //if
		
		this.offset = (currPage - 1) * amount;
	} //Constructor
	
} //end class










