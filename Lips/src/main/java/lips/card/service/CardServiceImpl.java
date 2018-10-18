package lips.card.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.card.dao.CardDao;

@Service
public class CardServiceImpl implements CardService {
	@Autowired CardDao dao;

}
