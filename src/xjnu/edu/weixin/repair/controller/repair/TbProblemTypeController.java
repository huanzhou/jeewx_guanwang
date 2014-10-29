package xjnu.edu.weixin.repair.controller.repair;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import xjnu.edu.weixin.repair.entity.repair.TbProblemTypeEntity;
import xjnu.edu.weixin.repair.service.repair.TbProblemTypeServiceI;

/**   
 * @Title: Controller
 * @Description: 故障类型表
 * @author zhangdaihao
 * @date 2014-09-16 16:57:33
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/tbProblemTypeController")
public class TbProblemTypeController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbProblemTypeController.class);

	@Autowired
	private TbProblemTypeServiceI tbProblemTypeService;
	@Autowired
	private SystemService systemService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 故障类型表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbProblemType")
	public ModelAndView tbProblemType(HttpServletRequest request) {
		return new ModelAndView("xjnu/edu/weixin/repair/repair/tbProblemTypeList");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(TbProblemTypeEntity tbProblemType,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbProblemTypeEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbProblemType, request.getParameterMap());
		this.tbProblemTypeService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除故障类型表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbProblemTypeEntity tbProblemType, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbProblemType = systemService.getEntity(TbProblemTypeEntity.class, tbProblemType.getId());
		message = "故障类型表删除成功";
		tbProblemTypeService.delete(tbProblemType);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加故障类型表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbProblemTypeEntity tbProblemType, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbProblemType.getId())) {
			message = "故障类型表更新成功";
			TbProblemTypeEntity t = tbProblemTypeService.get(TbProblemTypeEntity.class, tbProblemType.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbProblemType, t);
				tbProblemTypeService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "故障类型表更新失败";
			}
		} else {
			message = "故障类型表添加成功";
			tbProblemTypeService.save(tbProblemType);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 故障类型表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbProblemTypeEntity tbProblemType, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbProblemType.getId())) {
			tbProblemType = tbProblemTypeService.getEntity(TbProblemTypeEntity.class, tbProblemType.getId());
			req.setAttribute("tbProblemTypePage", tbProblemType);
		}
		return new ModelAndView("xjnu/edu/weixin/repair/repair/tbProblemType");
	}
}
