<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>审核详情</title>
<%@include file="/inc/inc.jsp" %>
<input type="hidden" value="${order.downstreamorderid}" id="downOrdId">
<input type="hidden" value="${order.accountid}" id="accountId">
<input type="hidden" value="${order.operid}" id="operId">
<input type="hidden" value="${order.userid}" id="userId">
<input type="hidden" value="${order.token}" id="token">
<input type="hidden" name="sourceFlag" id="sourceFlag" value="${requestScope.sourceFlag}"/>
</head>
<body>
  <div class="content-wrapper-iframe"><!--右侧灰色背景-->
  		  <div class="row"><!--外围框架-->
            <div class="col-lg-12"><!--删格化-->
                <div class="row"><!--内侧框架-->
                    <div class="col-lg-12"><!--删格化-->
                        <div class="main-box clearfix"><!--白色背景-->
                        	<div class="main-box-body clearfix">	<!--padding20-->
							<div class="form-label">
					           	<ul>
					                <li  class="col-md-6">
					                    <p class="word">订单来源：</p>
					                    <p class="wide-field" style="word-break:break-all;">${order.chlidname}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">订单类型：</p>
					                    <p class="wide-field" style="word-break:break-all;">${order.ordertypename}</p>
					                </li>  
					            </ul>  
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">仓库ID：</p>
					                    <p class="wide-field" style="word-break:break-all;">${order.routeid}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">仓库信息：</p>
					                    <p class="wide-field" style="word-break:break-all;">${order.routename}</p>
					                </li>  
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">父订单号：</p>
					                    <p id="parentId" class="wide-field" style="word-break:break-all;">${order.parentorderid}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">子订单号：</p>
					                    <p  class="wide-field" style="word-break:break-all;">${order.origorderid}</p>
					                </li>  
					            </ul>
					            <ul>
					            	<li  class="col-md-6">
					                    <p class="word">支付流水号：</p>
					                    <p id="balanceId" class="wide-field" style="word-break:break-all;">${order.externalid}</p>
					                </li>  
					            </ul>
					  	</div>
					  	 	<!--table表格-->
                                <div class="table-responsive">
                                    <table class="table table-hover table-border table-bordered">
                                        <thead>
                                            <tr>
                                            	<th>商品</th>
                                                <th>单价/数量</th>
                                                <th>下单时间</th>
                                                <th>订单状态</th>
                                                <th>优惠券</th>
                                                <th>消费积分</th>
                                                <th>赠送积分</th>
                                            </tr>
                                        </thead>                                                                                                
                                    <tbody>
						                <c:forEach items="${order.prodList}" var="sp">
								          <tr>
								                 <td class="sp"  width="45%">
								                      <table width="100%" border="0">
								                         <tr>
								                             <td><img src="${sp.imageUrl}"></td>
								                             <td class="word"><a href="#">${sp.prodName}</a></td>	
								                         </tr>
								                      </table>
								                 </td>
								                <td>${sp.prodSalePrice}/${sp.buySum}件</td>
								                <td><fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								                <td>${order.statename}</td>
								                <td>${sp.prodCouponFee}</td>
							                	<td id="saleJF">${sp.jfFee}</td>
							                	<td id="giveJF">${sp.giveJF}</td>
							              </tr> 
						              </c:forEach>
                                    </tbody>
                                   </table>
                               
                                </div>
                            <!--/table表格结束-->
                            <div class="text-r right">
                            	<ul class="mt-20">
                            		<li>
                            			 <p class="word">总优惠金额：<span class="red">${order.ordDiscountFee}</span></p>
                            		</li>
                            		<li>
                            			 <p class="word">运费：<span class="red">${order.ordFreight}</span></p>
                            		</li>
                            		<li>
                            			 <p class="word">订单应付金额：<span class="red">${order.ordAdjustFee}</span></p>
                            		</li>
                            	</ul>
                            </div>
                            <div class="form-label">
                            	<ul>
                            		<li class="col-md-6">
                            			<p class="word">售后订单号：</p>
                            			<p id="orderId" class="wide-field" style="word-break:break-all;">${order.orderid}</p>
                            		</li>
                            		<li class="col-md-6">
	                            		<p class="word">原始订单号：</p>
	                            		<p class="wide-field" style="word-break:break-all;">${order.origorderid}</p>
                            		</li>
                            	</ul>
                            	<ul>
                            		<li class="col-md-6">
	                            		<p class="word">售后操作人：</p>
	                            		<p class="wide-field" style="word-break:break-all;">${order.afterSalesOperator}</p>
                            		</li>
                            	</ul>
                            </div>
                            <div class="nav-tplist-title bd-bottom pb-10  pt-15"></div>
                            <div class="nav-tplist-title bd-bottom pb-10  pt-15">
                            	<ul>
                            		<li>客户信息</li>
                            	</ul>
                            </div>
                            <div class="form-label">
                            	<ul>
                            		<li class="col-md-6">
                            			<p class="word" >账号信息：</p>
                            			<p class="wide-field" style="word-break:break-all;">${order.username}</p>
                            		</li>
                            		<li class="col-md-6">
                            			<p class="word">手机号：</p>
                            			<p class="wide-field" style="word-break:break-all;">${order.contacttel}</p>
                            		</li>
                            	</ul>
                            	<ul>
                            		<li class="col-md-6">
                            			<p class="word">支付方式：</p>
                            			<p class="wide-field" style="word-break:break-all;">${order.paystylename}</p>
                            		</li>
                            		<li class="col-md-6">
                            			<p class="word">收货地址：</p>
                            			<p class="wide-field" style="word-break:break-all;">${order.provincecode}${order.citycode }${order.countycode}
					                    ${order.address }&nbsp;${order.contactname}</p>
                            		</li>
                            	</ul>
                            </div>
                            
                            <c:choose>
                            	<c:when test="${order.state==22}">
                            		<div class="nav-tplist-title bd-bottom pb-10  pt-15">
		                            	<ul>
		                            		<li>售后详细</li>
		                            	</ul>
		                            </div>
		                            <div class="form-label">
		                            	<ul>
		                            		<li class="col-md-6">
		                            			<p class="word">业务类型：</p>
		                            			<p class="wide-field" style="word-break:break-all;">${order.busicodename}</p>
		                            		</li>
		                            		<li class="col-md-6">
		                            			<p class="word">退款金额：</p>
		                            			<p class="wide-field" style="word-break:break-all;">${order.ordAdjustFee}</p>
		                            		</li>
		                            		
		                            	</ul>
				                         <ul>
		                            		<li class="col-md-6">
		                            			<p class="word">退款理由：</p>
		                            			<p class="wide-field" style="word-break:break-all;">${order.remark}</p>
		                            		</li>
		                            		<li class="col-md-6">
		                            			<p class="word">图片：</p>
		                            			<c:forEach items="${order.prodList}" var="sp">
										          <p class="wide-field" style="word-break:break-all;"><img src="${sp.afterSaleImageUrl}"></p>
								                </c:forEach>
		                            		</li>
		                            	</ul>
		                            </div>
                            	</c:when>
                            	<c:when test="${order.state==312}">
                            		<div class="nav-tplist-title bd-bottom pb-10  pt-15">
		                            	<ul>
		                            		<li>退款详细</li>
		                            	</ul>
		                            </div>
		                            <div class="form-label">
		                            		<ul>
		                            		<li class="col-md-6">
		                            			<p class="word">退款类型：</p>
		                            			<p class="wide-field" style="word-break:break-all;">${order.busicodename}</p>
		                            		</li>
		                            		<li class="col-md-6">
		                            			<p class="word">退款金额：</p>
		                            			<p id="currentMoney" class="wide-field" style="word-break:break-all;">${order.updateFee}</p>
		                            		</li>
		                            	</ul>
		                            		<ul>
			                            		<li class="col-md-6">
			                            			<p class="word">退款理由：</p>
			                            			<p class="wide-field" style="word-break:break-all;">${order.remark}</p>
			                            		</li>
			                            		<li class="col-md-6">
			                            			<p class="word">图片：</p>
			                            			<c:forEach items="${order.prodList}" var="sp">
											          <p class="wide-field" style="word-break:break-all;"><img src="${sp.afterSaleImageUrl}"></p>
									                </c:forEach>
			                            		</li>
			                            	</ul>
		                            	</div>
		                            <div class="nav-tplist-title bd-bottom pb-10  pt-15">
		                            	<ul>
		                            		<li>退款物流</li>
		                            	</ul>
		                            </div>
		                            <div class="form-label">
		                            	<ul>
		                            		<li class="col-md-6">
		                            			<p class="word">快递公司：</p>
		                            			<p class="wide-field" style="word-break:break-all;">${order.expressName}</p>
		                            		</li>
		                            		<li class="col-md-6">
		                            			<p class="word">快递单号：</p>
		                            			<p class="wide-field" style="word-break:break-all;">${order.expressoddnumber}</p>
		                            		</li>
		                            	</ul>
		                            </div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="nav-tplist-title bd-bottom pb-10  pt-15">
		                            	<ul>
		                            		<li>退款详细</li>
		                            	</ul>
		                            </div>
		                            <div class="form-label">
		                            		<ul>
		                            		<li class="col-md-6">
		                            			<p class="word">退款类型：</p>
		                            			<p class="wide-field" style="word-break:break-all;">${order.busicodename}</p>
		                            		</li>
		                            		<li class="col-md-6">
		                            			<p class="word">退款金额：</p>
		                            			<p id="currentMoney" class="wide-field" style="word-break:break-all;">${order.ordAdjustFee}</p>
		                            		</li>
		                            	</ul>
		                            		<ul>
			                            		<li class="col-md-6">
			                            			<p class="word">退款理由：</p>
			                            			<p class="wide-field" style="word-break:break-all;">${order.remark}</p>
			                            		</li>
			                            		<li class="col-md-6">
			                            			<p class="word">图片：</p>
			                            			<c:forEach items="${order.prodList}" var="sp">
											          <p class="wide-field" style="word-break:break-all;"><img src="${sp.afterSaleImageUrl}"></p>
									                </c:forEach>
			                            		</li>
			                            	</ul>
		                            	</div>
		                            <div class="nav-tplist-title bd-bottom pb-10  pt-15">
		                            	<ul>
		                            		<li>退款物流</li>
		                            	</ul>
		                            </div>
		                            <div class="form-label">
		                            	<ul>
		                            		<li class="col-md-6">
		                            			<p class="word">快递公司：</p>
		                            			<p class="wide-field" style="word-break:break-all;">${order.expressName}</p>
		                            		</li>
		                            		<li class="col-md-6">
		                            			<p class="word">快递单号：</p>
		                            			<p class="wide-field" style="word-break:break-all;">${order.expressoddnumber}</p>
		                            		</li>
		                            	</ul>
		                            </div>
						         <!--/table表格结束-->              
		                         </c:otherwise>
                            </c:choose>
                            
                       
                            <c:choose>
                            	<c:when test="${order.state != 212 && order.state != 22 && order.state != 23 && order.state!=213 && order.state!=312 && requestScope.sourceFlag!=00}">
                            		 <div class="row">
		                           		<p class="center mt-20">
		                           			<input type="button" class="biu-btn  btn-primary btn-blue btn-small  ml-5" id="edit" value="同意退款">
		                           			<input type="button" id="add-k" class="biu-btn  btn-primary btn-blue btn-small  ml-5" value="拒绝退款">
		                           			<input type="button" id="backPage" class="biu-btn  btn-primary btn-blue btn-small  ml-5" value="返回">
		                            	</p>
	                            	</div> 
                            	</c:when>
                            	<c:when test="${order.state == 95 && requestScope.sourceFlag!=00}">
                            		<div class="row">
		                           		<p class="center mt-20">
		                           			<input type="button" class="biu-btn  btn-primary btn-blue btn-small  ml-5" id="edit" value="重新退款">
		                           			<input type="button" id="backPage" class="biu-btn  btn-primary btn-blue btn-small  ml-5" value="返回">
		                            	</p>
	                            	</div>
                            	</c:when>
                            	<c:when test="${order.state == 23 && requestScope.sourceFlag!=00}">
                            		<div class="row">
		                           		<p class="center mt-20">
		                           			<input type="button" id="operation" class="biu-btn  btn-primary btn-blue btn-small  ml-5" id="edit" value="收到退货">
		                           			<input type="button" id="backPage" class="biu-btn  btn-primary btn-blue btn-small  ml-5" value="返回">
		                            	</p>
	                            	</div>
                            	</c:when>
                            	 <c:otherwise>
                            	 	<div class="row">
		                           		<p class="center mt-20">
		                           			<input type="button" id="backPage" class="biu-btn  btn-primary btn-blue btn-small  ml-5" value="返回">
		                            	</p>
	                            	</div>
                            	 </c:otherwise>
                            </c:choose>
                            <!-- 收到退货 start-->
								<div class="eject-big">
									<div class="prompt-samll" id="prompt">
									<div class="eject-medium-title">
											<p>提示</p>
											<p class="img"><i class="fa fa-times"></i></p>
									</div>
									<!--确认删除-->
									<div class="prompt-samll-confirm">
										<ul>
										<li class="word">确定要收到退货吗？</li>
										<li>
											<input type="button"  id="backGoods" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" value="确认">
											<input id="prompt-close" type="button"  class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" id="closebtn" value="取消"></li>		
										</ul>
									</div>
									</div>	
								<div class="mask" id="eject-mask"></div>
								</div>
                            <!-- 收到退货 end-->
                            
                            <!-- 拒绝退款理由 start-->
                           <form id="refuseDataForm" method="post" >
                            <div class="eject-big">
                            	 <div class="eject-medium" id="add-samll">
                            	 	<div class="eject-medium-title">
										<p class="img"><i class="fa fa-times"></i></p>
									</div>
									<div class="form-label mt-20">
						           		<ul>
							                <li>
							                	<p class="word"><span>*</span>拒绝理由:</p>
							                    <p><textarea id="refuseMoneyInfo" name="refuseMoneyInfo" rows="4" cols="25" class="int-text"></textarea></p>
							                </li>
							                
						            	</ul>
								    </div>	
										<!--按钮-->
										<div class="row mt-15"><!--删格化-->
								               <p class="center pr-30 mt-30">
								                   <input type="button" id="refuseBackMoney" class="biu-btn  btn-primary  btn-auto  ml-5" value="确  认">
								                   <input id="add-close" type="button" class="biu-btn  btn-primary  btn-auto  ml-5 edit-close" value="取  消">
								               </p>
								        </div>
								</div>
								<div class="mask" id="eject-mask"></div>
							</div>	
							</form>
                            <!--  拒绝退款理由end-->
                            <!--编辑名称弹出框-->
                             <form id="dataForm" method="post" >
							<div class="eject-big">
									<div class="eject-medium" id="edit-medium">
										<div class="eject-medium-title">
											<p class="img"><i class="fa fa-times"></i></p>
										</div>
										<div class="form-label mt-20">
							           		<ul>
								                <li>
								                    <p class="word"><span>*</span>退款金额:</p>
								                    <p ><input type="text" class="int-text int-medium" placeholder="不能多于用户申请金额" name="updateMoneyData" id="updateMoneyData"></p>
								                    </li>
								                    <li><label id="tipsMsg" style="display: none;"><span class="ash" id="tips"></span></label></li>
								                <li>
								                	<p class="word"><span>*</span>退款理由:</p>
								                    <p>
										 				<textarea id="updateMoneyInfo" name="updateMoneyInfo" rows="4" cols="25" class="int-text"></textarea>
										 			</p>
								                </li>
							            	</ul>
							      	    </div>
											<!--按钮-->
										<div class="row mt-15" ><!--删格化-->
											 <p class="center pr-30 mt-30">
												<input type="button" class="biu-btn  btn-primary  btn-auto  ml-5" id="updateMoney" value="确  认">
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input id="edit-close" type="button" class="biu-btn  btn-primary  btn-auto  ml-5" value="取  消">
											 </p>
										 </div>
									</div>	
									<div class="mask" id="eject-mask"></div>	
							</div>
							</form>
							<!--编辑名称弹出框 结束-->	
                       </div>	
                   </div>
                </div>
              </div> 
          </div>
         </div>
    </div>
    <script type="text/javascript">
			var pager;
			(function () {
				seajs.use('app/jsp/order/backGoodSecond', function (backSecondPager) {
					pager = new backSecondPager({element: document.body});
					pager.render();
				});
			})();
 </script>   
</body>
</html>