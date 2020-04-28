package com.hcis.ipr.intellectual.cost.dao;

import java.util.List;
import java.util.Map;

import com.hcis.ipr.intellectual.cost.dto.PatentCostMonitorDto;
import org.springframework.stereotype.Repository;

import com.hcis.ipanther.core.persistence.dao.MyBatisDao;
import com.hcis.ipanther.core.web.vo.SearchParam;
import com.hcis.ipr.intellectual.cost.dto.PatentCostDetailDto;
import com.hcis.ipr.intellectual.cost.dto.PatentCostListDto;
import com.hcis.ipr.intellectual.cost.entity.PatentCost;

@Repository("patentCostDao")
public class PatentCostDao extends MyBatisDao {

	/**
	 * 费用列表
	 * 
	 * @param searchParam
	 * @return
	 */
	public List<PatentCostListDto> selectList(SearchParam searchParam) {
		return this.getSqlSession().selectList(namespace + ".selectList", searchParam);
	}

	public PatentCostDetailDto getPatentDetail(String id) {
		return this.getSqlSession().selectOne(namespace + ".selectDetail", id);
	}

	public List<PatentCost> selectListNeedMonitor(Map query) {
		return this.getSqlSession().selectList(namespace + ".selectListNeedMonitor", query);
	}

	public List<PatentCost> getPatentId(String patentId) {
		return this.getSqlSession().selectList(namespace + ".getPatentId", patentId);
	}

    public PatentCostMonitorDto get4Email(String id) {
    	return this.getSqlSession().selectOne(namespace + ".get4Email", id);
	}
	public List<PatentCost> selectListByPatentId(SearchParam searchParam) {
		return this.getSqlSession().selectList(namespace + ".selectByPantentId", searchParam);
	}
	public int  deletByPatentId(PatentCost patentCost){
		return  this.getSqlSession().update(namespace+".updateByPatentId", patentCost);

	}

}
