package xjnu.edu.weixin.mall.controller.weixin;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.web.system.service.SystemService;
import xjnu.edu.weixin.mall.entity.mall.TbMallProductEntity;
import xjnu.edu.weixin.mall.json.mall.TbMallProductEntityJson;
import xjnu.edu.weixin.mall.service.mall.ProductServiceI;
import xjnu.edu.weixin.mall.utils.AjaxProductJson;

/**   
 * @Title: Controller
 * @Description:微信前端   商品显示
 * @date 2014-08-05 12:48:40
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/productController")
public class ProductController extends BaseController {
	@Autowired
	private SystemService systemService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	@Autowired
	private ProductServiceI productService;
	
	/**
	 * 根据选择的小类返回所有商品  (微信前端)
	 * @return 
	 * @return 
	 */

	/*@RequestMapping(params = "search")
	@ResponseBody
	public void search(HttpServletRequest request,HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		String catalogId = (String) request.getSession().getAttribute("catalogId");
		System.out.println("--------catalogId--------------------"+catalogId);
		DetachedCriteria dc = DetachedCriteria.forClass(TbMallProductEntity.class); 
		dc.add(Restrictions.eq("catalogId", catalogId));
		List<TbMallProductEntity> catalogList =  systemService.findByDetached(dc);
		j.setObj(catalogList);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(j.getJsonStr());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	
	
	@RequestMapping(params = "getdata")
	@ResponseBody
	public AjaxProductJson getdata(HttpServletRequest request,HttpServletResponse response) {
		AjaxProductJson j = new AjaxProductJson();
		String catalogId=request.getParameter("catalogId");
		String shopId=request.getParameter("shopId");
		String pageNo=request.getParameter("pageNo");
		int pageN=Integer.parseInt(pageNo);
		/*List<TbMallProductEntity> tbMallProductEntityList=systemService.findHql("from TbMallProductEntity where shopId=? and catalogId=?", new Object[]{shopId,catalogId});*/
		List<TbMallProductEntityJson>  productJson=new ArrayList<TbMallProductEntityJson>();
		int pageTotal = productService.getProductPageCount(shopId, catalogId);
		List<TbMallProductEntity> tbMallProductEntityList=productService.getProduct(shopId, catalogId, pageN);
		if(tbMallProductEntityList==null){
			tbMallProductEntityList = new ArrayList<TbMallProductEntity>();
		}
		for(TbMallProductEntity pe : tbMallProductEntityList){
			TbMallProductEntityJson tpe =new TbMallProductEntityJson(pe);
			productJson.add(tpe);
		}
		j.setTotalPage(pageTotal);
		j.setObj(productJson);
		return j;
	}
	
	
	
	@RequestMapping(params = "display")
	public String display(HttpServletRequest request) {
		String openuserid =request.getParameter("open_user_id");
		String shopId=request.getParameter("shopId");
//		System.out.println("----------id-------------"+openuserid);
		request.setAttribute("open_user_id", openuserid);
		request.setAttribute("shopId", shopId);	
		
		return "xjnu/edu/weixin/mall_user/product_list";
	}

}