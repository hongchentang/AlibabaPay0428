<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/include/taglib.jsp"%>
<form id="siteForm"  action="${ctx}/cms/site/${StringUtils:isNotEmpty(cmsSite.id)?'editSite':'saveSite'}.do" method="post" >
<input name="cmsSite.id"  type="hidden" value="${cmsSite.id}"/>
<table cellspacing="0" cellpadding="0" border="0" class="alter-table-v" width="90%">
	<tbody>
		<tr>
			<td><label>名称</label></td>
			<td>
			<input id="cmsSite.name" name="cmsSite.name" class="easyui-textbox" 
									data-options="required:true" style="width: 400px" type="text" value="${cmsSite.name}"/>
			</td>
		</tr>
		<tr>
			<td><label>源文件目录名</label></td>
			<td>
			<input id="cmsSite.sourcePath" name="cmsSite.sourcePath" class="easyui-textbox" 
									data-options="required:true" style="width: 400px" type="text" value="${cmsSite.sourcePath}"/>
			</td>
		</tr>
		<tr>
			<td><label>域名</label></td>
			<td>
			<input id="cmsSite.cmsSiteDoMain" name="cmsSite.siteDoMain" class="easyui-textbox" 
			       style="width: 400px" type="text" value="${cmsSite.siteDoMain}"/>
			</td>
		</tr>
		<tr>
			<td><label>排序</label></td>
			<td>
			<input id="cmsSite.orderNum" name="cmsSite.orderNum" class="easyui-numberbox" data-options="min:0,precision:0" 
				style="width: 400px" type="text" value="${cmsSite.orderNum}"/>
			</td>
		</tr>
		<tr>
			<td><label>是否有效</label></td>
			<td>
			<div>
			<input id="cmsSite.isValid" name="cmsSite.isValid" class="easyui-validatebox" 
				data-options="required:true" type="radio"  value="01" ${(cmsSite.isValid eq '01' or empty cmsSite.isValid)?'checked="checked"':''}/>
									<label>否</label>
			&nbsp;&nbsp;
			<input id="cmsSite.isValid" name="cmsSite.isValid" class="easyui-validatebox" 
					data-options="required:true" type="radio" value="02" ${cmsSite.isValid eq '02'?'checked="checked"':''}/>
									<label>是</label>
			</div>
			</td>
		</tr>
		<tr>
			<td><label>外部链接</label></td>
			<td>
			<input id="cmsSite.url" name="cmsSite.url" class="easyui-textbox" 
				 style="width: 400px" type="text" value="${cmsSite.url}"/>
			</td>
		</tr>
		<tr>
			<td><label>LOGO</label></td>
			<td>
			<input id="cmsSite.logo" name="cmsSite.logo" class="easyui-textbox" 
				 style="width: 400px" type="text" value="${cmsSite.logo}"/>
			</td>
		</tr>
		<tr>
			<td><label>版权</label></td>
			<td>
			<input id="cmsSite.copyright" name="cmsSite.copyright" class="easyui-textbox" 
									 style="width: 400px" type="text" value="${cmsSite.copyright}"/>
			</td>
		</tr>
		<tr>
			<td><label>备案号</label></td>
			<td>
			<input id="cmsSite.recordCode" name="cmsSite.recordCode" class="easyui-textbox" 
						 style="width: 400px" type="text" value="${cmsSite.recordCode}"/>
			</td>
		</tr>
		<tr>
			<td><label>页面模版</label></td>
			<td>
			<input type="hidden" value="${cmsSite.indexTemplet}" name="cmsSite.indexTemplet" id="indexTemplet"/>
			<input id="cmsSite.indexTempletName" name="cmsSite.indexTempletName" class="easyui-textbox" 
				 readonly="readonly" style="width: 400px" type="text" value="${cmsSite.indexTempletName}"/>
			</td>
		</tr>
		<tr>
			<td><label>时间</label></td>
			<td>
			<input id="cmsSite.endTime" name="cmsSite.endTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  
			 style="width: 400px" type="text" value="${cmsSite.endTime}"/>
			</td>
		</tr>
		
	</tbody>
</table>
<div style="text-align: center; padding: 5px">
	<button type="button"  class="easyui-linkbutton" onclick="saveSite();">保存</button>
	<button type="button"  class="easyui-linkbutton" onclick="easyuiUtils.closeWindow('siteWindow')">取消</button>
</div>
</form>
<script type="text/javascript">
 tableVBg('.alter-table-v');
 function saveSite(){
	 jQuery("#siteWindow").find('#siteForm').form('submit', {   
		    success: function(data){    
				var json=jQuery.parseJSON(data);
				if(json){
					var message = json.message;
					var statusCode = json.statusCode;
					if(parseInt(statusCode)==300){
						jQuery.messager.alert("提示信息",message,function(){});
					}else if(parseInt(statusCode)==200){
						jQuery.messager.alert("提示信息",message,function(){});
						easyuiUtils.ajaxClearFormForPanel(getCurrentTabId());
						closeWindow('siteWindow');
					}
				}else{
					console.error("json is null");
				}
			}    
		}); 
 }
 
 function viwe(){
	 
	 
 }
</script>
