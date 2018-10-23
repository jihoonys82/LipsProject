package lips.card.service;

import java.util.List;

import lips.card.dto.CardDto;

public interface CardService {
	public List<CardDto> YLocationList(CardDto dto);
	
	public String CardValue(CardDto dto);
	
	public List<CardDto> AllCardList();

}
