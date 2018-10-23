package lips.card.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.card.dao.CardDao;
import lips.card.dto.CardDto;

@Service
public class CardServiceImpl implements CardService {
	@Autowired CardDao dao;

	@Override
	public List<CardDto> YLocationList(CardDto dto) {
		
		return dao.selJoinYLocation(dto);
	}

	@Override
	public String CardValue(CardDto dto) {
		
		return dao.selCardValueDto(dto);
	}

}
