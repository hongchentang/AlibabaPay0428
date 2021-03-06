<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@include file="/jsp/common/include/taglib.jsp"%>

<table class="alter-table-v" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td>专利标题</td>
		<td colspan="3">${usePatent.patentName}</td>
	</tr>
	<tr>
		<td>专利申请号</td>
		<td>${usePatent.patentPublicNumber }</td>
		<td>使用类型</td>
		<td>
			${dict:getEntryName("IPBOX_APPLICATIN_TYPE", usePatent.useType)}
		</td>
	</tr>
	<tr>
		<td>入股企业</td>
		<td>${usePatent.spShareName }</td>
		<td>入股类型</td>
		<td>${usePatent.spShareType }</td>
	</tr>
	<tr>
		<td>入股比例</td>
		<td>${usePatent.spShareScale }</td>
		<td>入股金额</td>
		<td>${usePatent.spShareMoney }</td>
	</tr>
	<tr>
		<td>入股日期</td>
		<td>
			<fmt:formatDate value="${usePatent.spShareDate }" type="date" pattern="yyyy-MM-dd"/>
		</td>
		<td>入股金额</td>
		<td>${usePatent.spLinkMan }</td>
	</tr>
	<tr>
		<td>入股条件</td>
		<td colspan="3">
			${usePatent.spShareCondition }
		</td>
	</tr>
	<tr>
		<td>联系人电话</td>
		<td>${usePatent.contractNumber }</td>
		<td>所属公司</td>
		<td>${usePatent.orgDepId }</td>
	</tr>
	<tr>
		<td>上传合同附件</td>
		<td colspan="3">
			<c:if  test="${not empty usePatent.attachName}">
				<c:set value="${ipanthercore:getJSONMap(usePatent.attachName)}" var="map" />
				<div id="fileSpanAttachment">
					<span id="attachmentName">${map.attachmentName}</span>
				</div>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>备注</td>
		<td colspan="3">${usePatent.remark }</td>
	</tr>
</table>

<script type="text/javascript">
tableVBg('.alter-table-v');
$(document).ready(function (){
});
function getPatentByNo(){
	var applyNo = $("#patentPublicNumber").val();
	$.ajax({
		url:'${ctx}/intellectual/patent/getPatentByApplyNo.do?ApplyNo='+applyNo,//地址
		dataType:'json',//数据类型
		type:'POST',//类型
		//请求成功
		success:function(data,status){
			var josn=eval(data);
			if(josn.id !=null && josn.id!="" ){			
				//使用id选择器：可以设置值
	            //$("#patentName").textbox('setValue', josn.patentName);
	            //使用id选择器和setText：可以设置值
	            $("#patentId").textbox('setText', "");
	         	$("#patentId").textbox('setText', josn.id);
	            $("#patentName").textbox('setText', "");
	         	$("#patentName").textbox('setText', josn.patentName);
			}else{
				
				$("#patentName").textbox('setText', "");
				alert("未查询到该申请号！");
				
			}
		}
	})
}
function submitProjectForm(){
	$.messager.confirm('确认','确认保存吗？',function(result){    
		if (result){  
			$('#usePatentSp_saveFrom').form('submit',{
				onSubmit: function(){
					if($("#year").val()==''){
						$.messager.progress('close');	
						$.messager.alert('提示','请填写项目实施年度！');
						return false;
					}
					var isValid = $(this).form('validate');
					if (!isValid){
						$.messager.progress('close');	
						$.messager.alert('提示','请填写必填项！');
					}
					return isValid;	
				},
				success: function(data){
					var json=jQuery.parseJSON(data);
					if(!jQuery.isEmptyObject(json)){
						var message = json.message;
						var statusCode = json.statusCode;
						if(parseInt(statusCode)==300){
							$.messager.alert('提示',message);
						}else if(parseInt(statusCode)==200){
							closeWindow('addWindow');
							$('#viewUsePatentListAp').panel('refresh');
							$.messager.alert('提示',message);
						}
					}else{
						$.messager.alert('提示','json is null');
					}
				}
			});
		}
	});
}
</script>
