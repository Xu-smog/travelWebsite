package org.travel.service;

import java.util.ArrayList;

import org.travel.user.DongTai;

public interface DongTaiService {
	ArrayList<DongTai> queryByPage(int page);//页码
}
