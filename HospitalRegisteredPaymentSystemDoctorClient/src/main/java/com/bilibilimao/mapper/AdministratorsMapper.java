package com.bilibilimao.mapper;

import java.util.List;
import com.bilibilimao.po.Administrators;

public interface AdministratorsMapper {
	public List<Administrators> findAdministrators(Administrators administrators);
	public void updateAdministrators(Administrators administrators) throws Exception;
}