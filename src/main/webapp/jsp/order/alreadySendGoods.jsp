<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>查询列表</title>
<%@include file="/inc/inc.jsp" %>
<script type="text/javascript">
	var pager;
	(function () {
		seajs.use('app/jsp/order/alreadySendGoods', function (demopagePager) {
			pager = new demopagePager({element: document.body});
			pager.render();
		});
	})();
</script>
</head>
<body>
      		  <div class="row"><!--外围框架-->
            <div class="col-lg-12"><!--删格化-->
                <div class="row"><!--内侧框架-->
                    <div class="col-lg-12"><!--删格化-->
                        <div class="main-box clearfix"><!--白色背景-->
                        	<div class="main-box-body clearfix">	<!--padding20-->
                        		<div class="form-label">
	                     			<p class="word" ><a id="backPage" href="javascript:void(0)">返回上一级</a>&nbsp;&nbsp;&nbsp;当前位置：订单详细</p>
	                     		</div>
							<div class="form-label">
					           	<ul>
					                <li  class="col-md-6">
					                    <p class="word">订单来源：</p>
					                    <p>${orderDetail.chlId}</p>
					                </li>
					               	<li  class="col-md-6">
					                    <p class="word">订单类型：</p>
					                    <p>${orderDetail.orderType}</p>
					                </li> 
					            </ul>  
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">仓库ID：</p>
					                    <p>${orderDetail.routeId}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">仓库信息：</p>
					                    <p>${orderDetail.routeName}</p>
					                </li>  
					            </ul>
					  	</div>
	                <!--步骤结束-->
					  	 	<!--table表格-->
                                <div class="table-responsive clearfix">
                                 <input type="hidden" id="orderId" value="${orderDetail.orderId }">
                                    <table class="table table-hover table-border table-bordered">
                                        <thead>
                                            <tr>
                                            		<th>商品</th>
                                                <th>单价/数量</th>
                                                <th>售后</th>
                                                <th>下单时间</th>
                                                <th>订单状态</th>
                                                <th>实付金额</th>
                                                <th>优惠扣减金额</th>
                                                <th>积分</th>
                                            </tr>
                                        </thead>                                                                                                
                                    <tbody>
                                    	 <tr class="bj-f3">
							                <td class="tl" colspan="8">
							                	<div>
							                		<p>
							                			<span>父订单号:</span>
							                			<span>${orderDetail.parentOrderId}</span>
							                		</p>
							                		<p>
							                			<span>——&nbsp;</span>
							                			<span>${orderDetail.payStyleName}</span>
							                		</p>
							                	</div>
							                	<div>
							                		<p>
							                			<span>子（商家平台）订单号:</span>
							                			<span>${orderDetail.orderId }</span>
							                		</p>
							                		<p>
							                			<span>支付流水号:</span>
							                			<span>${orderDetail.balacneIfId }</span>
							                		</p>	
							                	</div>
							                </td>
						              </tr>
						               <c:forEach var="prod" items="${orderDetail.prodList}">
							          <tr>
							                 <td class="sp"  width="45%">
							                      <table width="100%" border="0">
							                         <tr>
							                             <td><img src="${prod.imageUrl}"></td>
							                             <td class="word"><a href="#">${prod.prodName}</a></td>	
							                         </tr>
							                      </table>
							                 </td>
							                <td>${prod.prodSalePrice}元/${prod.buySum}件</td>
							                <td>${prod.prodState}</td>
							                <td>${orderDetail.orderTime}</td>
							                <td>${orderDetail.stateName }</td>
							                <td>${prod.prodAdjustFee }</td>
							                <td>${prod.prodCouponFee }&nbsp;<br/>
											<c:choose>
										       <c:when test="${prod.cusServiceFlag eq 'Y'}">
										  		  <button class="biu-btn btn-blue btn-small  radius"  data-toggle="modal" onclick="pager._afterorderdetail('${orderDetail.orderId }','${prod.skuId}')">售后详情</button>
										       </c:when>
										       <c:otherwise>
												 <button class="biu-btn btn-blue btn-small  radius"  data-toggle="modal" data-target="#myModal${status.index}">售后</button>
										       </c:otherwise>
											</c:choose>
							                </td>
							                <td>${prod.jfFee }</td>
						              </tr> 
						              		              
				 <!-- 模态框（Modal） -->
				 <div class="modal fade" id="myModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							 <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								 <h4 class="modal-title" id="myModalLabel${status.index}">
									售后处理
								</h4>
							</div>  
							 <div class="modal-body text-center">
							 <br/><br/>
								<!--   <input type="button"  class="btn btn-primary"
						  		 onclick="pager._backOrder('');"  value="退货"> -->
						  		 <button class="biu-btn btn-blue btn-small  radius" data-dismiss="modal"
						  		 data-toggle="modal" data-target="#backModal${status.index}">退货</button> 
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="biu-btn btn-blue btn-small  radius" data-dismiss="modal"
								data-toggle="modal" data-dismiss="modal" data-target="#exchangeModal${status.index}">换货
								</button>&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="biu-btn btn-blue btn-small  radius" data-dismiss="modal" 
								data-toggle="modal" data-target="#refundModal${status.index}">退款</button>
								<br/><br/>
							</div> 
							<!-- <div>
							</div> -->
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div> 
				
				
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="backModal${status.index}" tabindex="-1" role="dialog" 
		aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
					</div>
					<div class="modal-body">
						<h4 class="modal-title text-c" id="backModalLabel${status.index}">
							${prod.prodName}
						</h4><br/>
						<p class="text-c"><input id="backNum${prod.prodDetalId}" class="int-text int-large" placeholder="请输入退货数量" type="text"/></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" data-dismiss="modal"
						onclick="pager._backOrder('${prod.prodDetalId}')">
							确认
						</button>
						<button type="button" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" data-dismiss="modal">取消
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="exchangeModal${status.index}" tabindex="-1" role="dialog" 
		aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="exchangeModalLabel1${status.index}">
							提示
						</h4>
					</div>
					<div class="modal-body">
						<h5 class="word">确认进行换货处理吗?</h5> 
					</div>
					<div class="modal-footer">
						<button type="button" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" data-dismiss="modal"
						onclick="pager._exchangeOrder('${prod.prodDetalId}')">
							确认
						</button>
						<button type="button" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" data-dismiss="modal">取消
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>

		<!-- 模态框（Modal） -->
		<div class="modal fade" id="refundModal${status.index}" tabindex="-1" role="dialog" 
		aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="refundModalLabel${status.index}">
							提示
						</h4>
					</div>
					<div class="modal-body">
						<h5 class="word">确认进行退款处理吗?</h5> 
					</div>
					<div class="modal-footer">
						<button type="button" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" data-dismiss="modal"
						onclick="pager._refundOrder('${prod.prodDetalId}')">
							确认
						</button>
						<button type="button" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" data-dismiss="modal">取消
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		
						              </c:forEach>
                                    </tbody>
                                    </table>
                               
                                </div>
                            <!--/table表格结束-->
                            	<header class="main-box-header clearfix">
                            <h5 class="pull-left">买家信息</h5>
                        		</header>
                            <div class="form-label">
					           	<ul>
					                <li  class="col-md-6">
					                    <p class="word">买家账号：</p>
					                    <p>${orderDetail.userId}</p>
					                </li>
					            </ul>  
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">收货人：</p>
					                    <p>${orderDetail.contactName}</p>
					                </li>
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">手机号：</p>
					                    <p>${orderDetail.contactTel }</p>
					                </li>
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">收货地址：</p>
					                    <p>${orderDetail.provinceCode}${orderDetail.cityCode }${orderDetail.countyCode}
					                    ${orderDetail.address },${orderDetail.contactName},${orderDetail.contactTel}</p>
					                </li>
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">买家留言：</p>
					                    <p>${orderDetail.remark }</p>
					                </li>
					            </ul>
					  	</div>
					  	<br/><br/><br/>
					  	<header class="main-box-header clearfix">
                            <h5 class="pull-left">发票信息</h5>
                        		</header>
					  	  <div class="form-label text">
					  	  		<ul>
					                <li  class="col-md-6">
					                    <p class="word">发票类型：</p>
					                    <p>${orderDetail.invoiceTypeName }</p>
					                </li>
					            </ul>  
					           	<ul>
					                <li  class="col-md-6">
					                    <p class="word">发票类目：</p>
					                    <p>${orderDetail.invoiceContent }</p>
					                </li>
					            </ul>  
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">发票抬头：</p>
					                    <p>${orderDetail.invoiceTitle }</p>
					                </li>
					            </ul>
					  	</div>
					  	
					  	<header class="main-box-header clearfix">
                            <h5 class="pull-left">物流信息</h5>
                        		</header>
                        		 <div class="form-label text">
					  	  		<ul>
					                <li  class="col-md-6">
					                    <p class="word">快递公司：</p>
					                    <p>${orderDetail.expressId }</p>
					                </li>
					            </ul>  
					           	<ul>
					                <li  class="col-md-6">
					                    <p class="word">快递单号：</p>
					                    <p>${orderDetail.expressOddNumber }</p>
					                </li>
					            </ul>  
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">发票抬头：</p>
					                    <p>${orderDetail.invoiceTitle }</p>
					                </li>
					            </ul>
					  	</div>
     <br/>
     <div class="table-responsive clearfix">
                <table class="table table-hover table-border table-bordered" >
                    <thead>
                        <tr>
                            <th>时间</th>
                            <th>地点和跟踪进度</th>
                            <th>操作人以及网点电话</th>
                        </tr>
                    </thead>
                <tbody>
                    <tr>
                        <td>biu</td>
                        <td>全国</td>
                        <td>总部</td>
                    </tr>
                </tbody>
                </table>
         </div>
           <!--/table表格结束-->      
           <br/><br/>                     
                </div>
              </div> 
            </div>
    </div>
</body>
</html>