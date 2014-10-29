<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbJobCatalogList" title="工作小类" actionUrl="tbJobCatalogController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="小类名称" field="jobCatalogName" query="true"></t:dgCol>
   <t:dgCol title="显示顺序" field="displayIndex" query="true"></t:dgCol>
   <t:dgCol title="大类外键" field="tbJobClassEntity_Id" replace="${jobClassNameReplace}" query="true"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbJobCatalogController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbJobCatalogController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbJobCatalogController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbJobCatalogController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>