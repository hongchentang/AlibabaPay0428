/*************************************************
Copyright (C), 2012
Author:梁华璜 
Version: 
Date: 2013-9-17
Description: // 用于详细说明此程序文件完成的主要功能，与其他模块
// 或函数的接口，输出值、取值范围、含义及参数间的控
// 制、顺序、独立或依赖等关系
Function List: // 主要函数列表，每条记录应包括函数名及功能简要说明
1. ....
History: // 修改历史记录列表，每条修改记录应包括修改日期、修改
// 者及修改内容简述
1. Date:
Author:
Modification:
2. ...
*************************************************/
package com.hcis.ipanther.common.security.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hcis.ipanther.common.security.entity.Role;
import com.hcis.ipanther.core.service.IBaseService;
import com.hcis.ipanther.core.web.vo.SearchParam;

public interface IRoleService extends  IBaseService<Role> {

	public int save(Role role,HttpServletRequest request);
	public boolean checkRoleName(String roleName,String oldRoleName);
	public List<Role> allRolePrivilege();
	public Role view(Role role);
	public List<Role> selectByMap(Map<String,Object> map);
	
	public int batchDelete(List<Role> baseForms, String id);
	
	/**
	 * 根据角色编码取到角色
	 * @param roleCode
	 * @return
	 */
	Role getRoleByCode(String roleCode);

	/**
	 *
	 * @param searchParam
	 * @return
	 */
    Map<String, Role> select2Map(SearchParam searchParam);
}
