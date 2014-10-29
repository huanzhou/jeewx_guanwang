package xjnu.edu.weixin.mall.entity.mall;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 商铺配送时间
 * @date 2014-08-05 12:55:24
 * @version V1.0   
 *
 */
@Entity
@Table(name = "tb_mall_work_time", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class TbMallWorkTimeEntity implements java.io.Serializable {
	/**主键*/
	private java.lang.String id;
	/**标题*/
	private java.lang.String title;
	/**开始时间*/
	private java.lang.String startTime;
	/**截止时间*/
	private java.lang.String endTime;
	/**订单截止时间*/
	private java.lang.String lastSubmitTime;
	/**商铺外键*/
	private java.lang.String shopId;
	/**每周休息时间*/
	private java.lang.String notWorkDay;
	/**每月休息日期*/
	private java.lang.String notWorkDate;
	/**每周休息时间提示*/
	private java.lang.String notWorkDateExplain;
	/**每月休息时间提示*/
	private java.lang.String notWorkDayExplain;
	
	private String todayOrTomorow  ;
	
	@Transient
	public String getTodayOrTomorow() {
		return todayOrTomorow;
	}
	@Transient
	public void setTodayOrTomorow(String todayOrTomorow) {
		this.todayOrTomorow = todayOrTomorow;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=50)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  标题
	 */
	@Column(name ="TITLE",nullable=true,length=250)
	public java.lang.String getTitle(){
		return this.title;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  标题
	 */
	public void setTitle(java.lang.String title){
		this.title = title;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  开始时间
	 */
	@Column(name ="START_TIME",nullable=true,length=50)
	public java.lang.String getStartTime(){
		return this.startTime;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  开始时间
	 */
	public void setStartTime(java.lang.String startTime){
		this.startTime = startTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  截止时间
	 */
	@Column(name ="END_TIME",nullable=true,length=50)
	public java.lang.String getEndTime(){
		return this.endTime;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  截止时间
	 */
	public void setEndTime(java.lang.String endTime){
		this.endTime = endTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  订单截止时间
	 */
	@Column(name ="LAST_SUBMIT_TIME",nullable=true,length=50)
	public java.lang.String getLastSubmitTime(){
		return this.lastSubmitTime;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  订单截止时间
	 */
	public void setLastSubmitTime(java.lang.String lastSubmitTime){
		this.lastSubmitTime = lastSubmitTime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商铺外键
	 */
	@Column(name ="SHOP_ID",nullable=true,length=50)
	public java.lang.String getShopId(){
		return this.shopId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商铺外键
	 */
	public void setShopId(java.lang.String shopId){
		this.shopId = shopId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  每周休息时间
	 */
	@Column(name ="NOT_WORK_DAY",nullable=true,length=50)
	public java.lang.String getNotWorkDay(){
		return this.notWorkDay;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  每周休息时间
	 */
	public void setNotWorkDay(java.lang.String notWorkDay){
		this.notWorkDay = notWorkDay;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  每月休息日期
	 */
	@Column(name ="NOT_WORK_DATE",nullable=true,length=250)
	public java.lang.String getNotWorkDate(){
		return this.notWorkDate;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  每月休息日期
	 */
	public void setNotWorkDate(java.lang.String notWorkDate){
		this.notWorkDate = notWorkDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  每周休息时间提示
	 */
	@Column(name ="NOT_WORK_DATE_EXPLAIN",nullable=true,length=350)
	public java.lang.String getNotWorkDateExplain(){
		return this.notWorkDateExplain;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  每周休息时间提示
	 */
	public void setNotWorkDateExplain(java.lang.String notWorkDateExplain){
		this.notWorkDateExplain = notWorkDateExplain;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  每月休息时间提示
	 */
	@Column(name ="NOT_WORK_DAY_EXPLAIN",nullable=true,length=350)
	public java.lang.String getNotWorkDayExplain(){
		return this.notWorkDayExplain;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  每月休息时间提示
	 */
	public void setNotWorkDayExplain(java.lang.String notWorkDayExplain){
		this.notWorkDayExplain = notWorkDayExplain;
	}
}
