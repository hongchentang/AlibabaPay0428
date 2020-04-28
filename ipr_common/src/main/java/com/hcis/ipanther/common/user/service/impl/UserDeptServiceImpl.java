package com.hcis.ipanther.common.user.service.impl;

import java.util.*;

import com.hcis.ipanther.common.dept.dao.DepartmentDao;
import com.hcis.ipanther.common.dept.entity.Department;
import com.hcis.ipanther.common.user.entity.User;
import com.hcis.ipanther.core.utils.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcis.ipanther.common.login.vo.LoginUser;
import com.hcis.ipanther.common.user.dao.UserDeptDao;
import com.hcis.ipanther.common.user.entity.UserDept;
import com.hcis.ipanther.common.user.service.IUserDeptService;
import com.hcis.ipanther.core.persistence.dao.MyBatisDao;
import com.hcis.ipanther.core.service.impl.mybatis.BaseServiceImpl;
import org.springframework.util.CollectionUtils;

@Service
public class UserDeptServiceImpl extends BaseServiceImpl<UserDept> implements IUserDeptService{

	@Autowired
	private UserDeptDao userDeptDao;
	
	/**
	 * 按用户ID标记删除关联
	 * @param userDept
	 * @return
	 */
	public int deleteByUserIdLogic(UserDept userDept){
		return userDeptDao.deleteByUserIdLogic(userDept);
	}

	/**
	 * 按用户ID物理删除关联
	 * @param userDept
	 * @return
	 */
	public int deleteByUserIdPhysic(UserDept userDept){
		return userDeptDao.deleteByUserIdPhysic(userDept);
	}
	
	
	
	@Override
	public MyBatisDao getBaseDao() {
		return userDeptDao;
	}

	@Override
	public int updateByUserDeptId(UserDept userDept,LoginUser loginUser) {
		userDept.setUpdatedby(loginUser.getId());
		userDept.setUpdateTime(new Date());
		return userDeptDao.updateByUserDeptId(userDept);
	}

    @Override
    public Map<String, List<UserDept>> getUsersDept(List<String> userIds) {
		Map<String, List<UserDept>> map = new HashMap<>();
		if(!CollectionUtils.isEmpty(userIds)){
			List<UserDept> deptList = userDeptDao.getUsersDept(userIds);
			for(UserDept ud : deptList){
				String userId = ud.getUserId();
				List<UserDept> list = map.get(userId);
				if(list == null){
					list = new ArrayList<>();
				}
				list.add(ud);
				map.put(userId, list);
			}
		}
        return map;
    }

    @Override
    public String getUserDeptNameStr(List<UserDept> list) {
		if (list != null) {
			String deptNameStr = "";
			for (UserDept ud : list) {
				if (StringUtils.isBlank(deptNameStr)) {
					deptNameStr += ud.getDeptName();
				} else {
					deptNameStr += "," + ud.getDeptName();
				}
			}
			return deptNameStr;
		}
		return null;
    }

}
