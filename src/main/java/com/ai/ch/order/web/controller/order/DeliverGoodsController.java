package com.ai.ch.order.web.controller.order;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.ch.order.web.model.sso.client.GeneralSSOClientUser;
import com.ai.opt.base.vo.BaseResponse;
import com.ai.opt.sdk.dubbo.util.DubboConsumerFactory;
import com.ai.opt.sdk.web.model.ResponseData;
import com.ai.opt.sso.client.filter.SSOClientConstants;
import com.ai.platform.common.api.sysuser.interfaces.ISysUserQuerySV;
import com.ai.platform.common.api.sysuser.param.SysUserQueryRequest;
import com.ai.platform.common.api.sysuser.param.SysUserQueryResponse;
import com.ai.slp.order.api.delivergoods.interfaces.IDeliverGoodsSV;
import com.ai.slp.order.api.delivergoods.param.DeliverGoodsRequest;


@Controller
public class DeliverGoodsController {
	
	private static final Logger LOG = LoggerFactory.getLogger(DeliverGoodsController.class);
	
	//订单发货
	@RequestMapping("/deliver")
	@ResponseBody
	public ResponseData<String> deliver(HttpServletRequest request,String orderId,
			String expressId,String expressOddNumber) {
		GeneralSSOClientUser user = (GeneralSSOClientUser) request.getSession().getAttribute(SSOClientConstants.USER_SESSION_KEY);
		ResponseData<String> data=null;
		DeliverGoodsRequest req=new DeliverGoodsRequest();
		try {
			//获取售后操作人
			ISysUserQuerySV iSysUserQuerySV = DubboConsumerFactory.getService(ISysUserQuerySV.class);
			SysUserQueryRequest  userReq = new SysUserQueryRequest ();
			userReq.setTenantId(user.getTenantId());
			userReq.setId(user.getUserId());
			SysUserQueryResponse  response = iSysUserQuerySV.queryUserInfo(userReq);
			if(response!=null){
				String no = response.getNo();
				req.setOperId(no);
			}
			req.setExpressId(expressId);
			req.setExpressOddNumber(expressOddNumber);
			req.setOrderId(Long.parseLong(orderId));
			req.setTenantId(user.getTenantId());
			IDeliverGoodsSV deliverGoodsSV = DubboConsumerFactory.getService(IDeliverGoodsSV.class);
			BaseResponse baseResponse = deliverGoodsSV.deliverGoods(req);
			if(baseResponse!=null&&baseResponse.getResponseHeader().isSuccess()) {
				data=new ResponseData<String>(ResponseData.AJAX_STATUS_SUCCESS, "发货成功", null);
			}else {
				data=new ResponseData<String>(ResponseData.AJAX_STATUS_FAILURE, baseResponse.getResponseHeader().getResultMessage(), null);
			}
		} catch (Exception e) {
			LOG.info(e.getMessage());
			data=new ResponseData<String>(ResponseData.AJAX_STATUS_FAILURE, "发货失败,出现未知异常", null);
		}
		return data;
	}

}
