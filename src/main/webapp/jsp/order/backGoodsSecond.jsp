<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>查询列表</title>
<%@include file="/inc/inc.jsp" %>
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
					                    <p>${order.chlId}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">订单类型：</p>
					                    <p>${order.orderType}</p>
					                </li>  
					            </ul>  
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">仓库ID：</p>
					                    <p>${order.routeId}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">仓库信息：</p>
					                    <p>XXXXX</p>
					                </li>  
					            </ul>
					  	</div>
					  	 	<!--table表格-->
                                <div class="table-responsive clearfix">
                                    <table class="table table-hover table-border table-bordered">
                                        <thead>
                                            <tr>
                                            	<th>商品</th>
                                                <th>单价/数量</th>
                                                <th>下单时间</th>
                                                <th>售后</th>
                                                <th>订单状态</th>
                                                <th>退款类型</th>
                                                <th>退款金额</th>
                                            </tr>
                                        </thead>                                                                                                
                                    <tbody>
                                    	 <tr class="bj-f3">
							                <td class="tl" colspan="7">
							                	<div>
							                		<p>
							                			<span>父订单号:</span>
							                			<span>xxxx</span>
							                		</p>
							                		<p>
							                			<span>支付流水号:</span>
							                			<span>xxx</span>
							                		</p>
							                	</div>
							                	<div>
							                		<p>
							                			<span>子（商家平台）订单号:</span>
							                			<span>xxxx</span>
							                		</p>
							                		<p>
							                			<span>支付流水号:</span>
							                			<span>xxxx</span>
							                		</p>	
							                		<p>
							                			<span>支付时间:</span>
							                			<span>xxxxxx</span>
							                		</p>
							                	</div>
							                </td>
						              </tr>
						                <c:forEach items="${order.productList}" var="sp">
								          <tr>
								                 <td class="sp"  width="45%">
								                      <table width="100%" border="0">
								                         <tr>
								                             <td><img src="../images/tp-01.png"></td>
								                             <td class="word"><a href="#">${sp.prodName}</a></td>	
								                         </tr>
								                      </table>
								                 </td>
								                <td>${sp.salePrice}/件</td>
								                <td>${order.orderTime}</td>
								                <td>xxxxx</td>
								                <td class="color-red">${order.stateName}</td>
								                <td>退款类型30.00</td>
								                <td>退款金额</td>
							              </tr> 
						              </c:forEach>
                                    </tbody>
                                   </table>
                               
                                </div>
                            <!--/table表格结束-->
                            <div class="form-label">
                            	<ul>
                            		<li class="col-md-2">
                            			<p class="word">退款编号：</p>
                            			<p >xxx</p>
                            		</li>
                            		<li class="col-md-2">
	                            		<p class="word">订单号：</p>
	                            		<p >xxxx</p>
                            		</li>
                            	</ul>
                            	<ul>
                            		<li class="col-md-2">
	                            		<p class="word">
	                            			<h2>客户信息</h2>
	                            		</p>
                            		</li>
                            	</ul>
                            	<ul>
                            		<li class="col-md-5">
                            			<p class="word">账号信息：</p>
                            			<p>${order.userId}</p>
                            		</li>
                            		<li class="col-md-5">
                            			<p class="word">手机号：</p>
                            			<p>${order.contactTel}</p>
                            		</li>
                            	</ul>
                            	<ul>
                            		<li class="col-md-5">
                            			<p class="word">支付方式：</p>
                            			<p>${order.payStyleName}</p>
                            		</li>
                            		<li class="col-md-5">
                            			<p class="word">支付账号：</p>
                            			<p>xxxxxx</p>
                            		</li>
                            	</ul>
                            	<ul>
                            		<li class="col-md-5">
                            			<p class="word">收货信息:</p>
                            			<p>${order.address}</p>
                            		</li>
                            	</ul>
                            	<ul>
                            		<li class="col-md-2">
	                            		<p class="word">
	                            			<h2>退款详细</h2>
	                            		</p>
                            		</li>
                            	</ul>
                            	<ul>
                            		<li class="col-md-5">
                            			<p class="word">子订单号：</p>
                            			<p>xxxxxxxxx</p>
                            		</li>
                            		<li class="col-md-5">
                            			<p class="word">退款类型：</p>
                            			<p>xxxxxxxxxxx</p>
                            		</li>
                            		<li class="col-md-5">
                            			<p class="word">退款金额：</p>
                            			<p>xxxxxxxx</p>
                            		</li>
                            		<li class="col-md-5">
                            			<p class="word">退款理由：</p>
                            			<p>5345545</p>
                            		</li>
                            		<li class="col-md-5">
                            			<p class="word">图片：</p>
                            			<p>dsd</p>
                            		</li>
                            	</ul>
                            	<ul>
                            		<li class="col-md-2"><p class="word"><h2>退款物流</h2></p></li>
                            	</ul>
                            	<ul>
                            		<li class="col-md-3">
                            			<p class="word">快递公司：</p>
                            			<p>${order.expressId }</p>
                            		</li>
                            		<li class="col-md-3">
                            			<p class="word">快递单号：</p>
                            			<p>xxxxx</p>
                            		</li>
                            		<li class="col-md-3">
                            			<p class="word">图片：</p>
                            			<p>dsd</p>
                            		</li>
                            	</ul>
                            </div>
                            <div>
                            <ul>
                            	<li class="col-md-5">
                            		<p>
                             			<input type="button" class="biu-btn btn-primary btn-blue btn-small " value="同意退款 ">
                             			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             			<input type="button" class="biu-btn btn-primary btn-blue btn-small " value="退款金额修改">
                             			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             			<input type="button" class="biu-btn btn-primary btn-blue btn-small " value="拒绝退款">
                             		</p>
                            	</li>
                            </ul>
                            </div>
                       </div>	
                   </div>
                </div>
              </div> 
          </div>
         </div>
    </div>
</body>
</html>