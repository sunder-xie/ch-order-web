define('app/jsp/order/backGoodSecond', function (require, exports, module) {
    'use strict';
    var $=require('jquery'),
    Widget = require('arale-widget/1.2.0/widget'),
    Dialog = require("optDialog/src/dialog"),
    Paging = require('paging/0.0.1/paging-debug'),
    AjaxController = require('opt-ajax/1.0.0/index');
    require("jsviews/jsrender.min");
    require("jsviews/jsviews.min");
    require("bootstrap-paginator/bootstrap-paginator.min");
    require("app/util/jsviews-ext");
    
    require("jquery-validation/1.15.1/jquery.validate");
	require("app/util/aiopt-validate-ext");
    
    require("opt-paging/aiopt.pagination");
    require("twbs-pagination/jquery.twbsPagination.min");
    require('bootstrap/js/modal');
    var SendMessageUtil = require("app/util/sendMessage");
    
    //实例化AJAX控制处理对象
    var ajaxController = new AjaxController();
    //定义页面组件类
    var backSecondPager = Widget.extend({
    	
    	Implements:SendMessageUtil,
    	//属性，使用时由类的构造函数传入
    	attrs: {
    	},
    	Statics: {
    	},
    	//事件代理
    	events: {
    		//查询
            "click #refuseBackMoney":"_refuseBackMoney",
            "click #updateMoney":"_updateMoney",
            "click #backPage":"_back"
        },
    	//重写父类
    	setup: function () {
    		backSecondPager.superclass.setup.call(this);
    		var formValidator=this._initValidate();
			$(":input").bind("focusout",function(){
				formValidator.element(this);
			});
    	},
    	_back:function(){
    		var orderid = $("#orderId").text();
    		window.location.href=_base+"/backDetail?orderId="
            + orderid;
    	},
    	_initValidate:function(){
    		var currentMoney = $("#currentMoney").text();
    		var formValidator=$("#dataForm").validate({
    			rules: {
    				updateMoneyData: {
    					required: true,
    					moneyNumber: true,
    					max:currentMoney,
    					min:1
    					},
	                 updateMoneyInfo:{
	                	 
	                	 required: true
	                 }
    			},
    			messages: {
    				updateMoneyData: {
    					required:"请输入退款金额!",
    					max:"退款金额不能大于{0}!",
    					min:"退款金额不能为小于{0}！"
    				},
    				updateMoneyInfo:{
    					required:"请输入修改理由!"
    				}
    			}
    		});
    		
    		return formValidator;
    	},
    	_refuseInitValidate:function(){
    		var formValidator=$("#refuseDataForm").validate({
    			rules: {
    				refuseMoneyInfo:{
	                	 required: true,
	                	 maxlength:200
	                 }
    			},
    			messages: {
    				refuseMoneyInfo:{
    					required:"请输入拒绝理由!",
    				    maxlength:"最大长度不能超过{0}"
    				}
    			}
    		});
    		
    		return formValidator;
    	},
    	_refuseBackMoney:function(){
    		var _this= this;
    		var formValidator=_this._refuseInitValidate();
 			formValidator.form();
 			if(!$("#refuseDataForm").valid()){
 				return false;
 			}
    		var isRefuse = true;
    	    var url=_base+"/firstBack";
    	    var refuseInfo = $("#refuseMoneyInfo").val();
    	},
    	_updateMoney:function(){
    		var _this= this;
    		var formValidator=_this._initValidate();
 			formValidator.form();
 			if(!$("#dataForm").valid()){
 				return false;
 			}
 			//获取数据
 			var parentId = $("#parentId").text();
 			var orderId = $("#orderId").text();
 			var banlanceIfId = $("#balanceId").text();
 			var money = $("#updateMoneyData").val();
	   		//退款
 		    ajaxController.ajax({
    	    	type: "post",
				dataType: "json",
				processing: false,
				message: "查询中，请等待...",
				url: url,
				data:{"orderId":orderId,"money":money,"banlanceIfId":banlanceIfId,"parentOrderId":parentId},
    	        success: function (data) {
    	        	if(data.statusCode == "1"){
    	        		//用于判断跳转到哪个审核页面
    	        		var flag="1";
    	        		window.location.href=_base+"/backDetail?orderId="+orderid+"&flag="+flag;
    	        	}else{
    	        		var d = Dialog({
							title: '消息',
							content:"退货审核失败:"+data.statusInfo,
							icon:'prompt',
							okValue: '确 定',
							ok:function(){
								this.close();
							}
						});
						d.show();
    	        	}
    	        },
                
    	    });
    	}
    		
    });
    
    module.exports = backSecondPager
});


