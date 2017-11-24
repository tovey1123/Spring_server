<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="renderer" content="webkit" />

<!--[if lt IE 9]>
<script type="text/javascript">
	window.location.href = "http://www.faisco.cn/kill-IE.jsp?url=http%3A%2F%2Fwww.faisco.cn%2Fportal.jsp";
</script>
<![endif]-->

<meta id="_TOKEN" value="1407b5ca7c35aa5b69eccd58defe34ff" type="hidden" />

<script type="text/javascript" src="//ps.faisys.com/js/comm/jquery/jquery-core.min.js?v=201707031158"></script>

<script type="text/javascript" src="//ps.faisys.com/js/comm/fai.min.js?v=201710241206"></script>
<script type="text/javascript" src="//ps.faisys.com/js/comm/jquery/jquery-ui-core.min.js?v=201710241206"></script>
<script type="text/javascript" src="//ps.faisys.com/js/portal.min.js?v=201710241206"></script>
<script type="text/javascript" src="//ps.faisys.com/js/comm/faiui.min.js?v=201710241206"></script>

<script type="text/javascript" src="//ps.faisys.com/js/checkLogin.min.js?v=201710241206"></script>

<link rel="stylesheet" type="text/css" href="//ps.faisys.com/css/comm/fai.min.css?v=201707031158" />
<link rel="stylesheet" type="text/css" href="//ps.faisys.com/css/master.min.css?v=201711161431" />
<link rel="stylesheet" type="text/css" href="//ps.faisys.com/css/shop3.min.css?v=201711141059" />
<link rel="stylesheet" type="text/css" href="//ps.faisys.com/css/default.min.css?v=201710241206" />
<link rel="stylesheet" type="text/css" href="//ps.faisys.com/css/respond_portal.min.css?v=201711131450" />

<link rel="stylesheet" type="text/css" href="//ps.faisys.com/css/header.min.css?v=201710301715" />
<title>凡科-商务平台</title>
<style type="text/css">
html { overflow:hidden; }
body { font-family: "微软雅黑";}
#nav { display:none;}
</style>
<script type="text/javascript" src="//ps.faisys.com/js/util.min.js?v=201707031158"></script>
<script language="javascript" type="text/javascript">

var oldCacct = 'uq14792825';
if(!true){
	if(!false){
		top.location.href = "http://www.faisco.cn/authMobile.jsp";
	}else{
		top.location.href = "http://www.webportal.cc/authMobile_o.jsp";
	}
}

if(false){ //仅有邮箱权限直接跳邮箱
	if(!false){
		top.location.href = "http://mail.faisco.cn";
	}else{
		top.location.href = "http://mail.webportal.cc";
	}
}

/*
 * 异步弹窗组件，避免多弹窗冲突。比较弹窗优先级，最后只出现一个弹窗
 * @author afei - 20170817
 */
var Popup = (function(){
	extendJQueryRemove();
	//弹窗优先级，数字越大越优先
	var Level = {
		MOBILE_VERIFY_MAILACCT: 120,	//邮箱注册用户 强制手机验证弹窗（对应 portal.jsp > mailVerify_mailAcct）
		COMPLETE_CORP_INFO: 110,	//企业资料完善弹窗（对应completeInfo.jsp.inc）
		DOMAIN_AUTH_2: 100,		//域名实名引导弹窗2（已停止解析）（对应default.jsp.inc > buildDomainAuth2）
		DOMAIN_AUTH_1: 90,		//域名实名引导弹窗1（即将停止解析）（对应default.jsp.inc > buildDomainAuth1）
		DOMAIN_BEIAN_RETURN: 80,	//域名打回弹窗提示（对应default.jsp.inc > popupBeianReturn）
		BEIAN_REGISTRAR: 70,		//域名——境外注册商弹窗提示（对应siteRecord.jsp > buildDomainBeianWindow）
		BEIAN_TYPE: 60,			//外部域名的备案类型提示（对应siteRecord.jsp > buildDomainBeianWindow）
		DOMAIN_BEIAN: 50,		//更换备案线路（对应default.jsp.inc > buildDomainBeianWindow）
		MODIFY_PWD: 40,			//修改密码（对应default.jsp.inc > popupPwd）
		MPS_RECORD_ALERT: 30, //公安部备案弹窗，优先级最低
		AD_CORPGROUPBUY: 20		//网站付费引导企业团购弹窗（对应default.jsp.inc > popCorpGroupBuyAd）
	}
	var taskQueue = [],
		isTimeout = false;
	var $currentPopup = null,
		currentLevel = 0;
	$(function(){
		$('#mainFrame').load(function(){
			setTimeout(function(){
				isTimeout = true;
				//若已出现其他弹层，这里做避让
				if(top.$('.popupBg').length > 0 && taskQueue.length == 0){
					taskQueue = [];
					return;
				}
				taskQueue.sort(function(a, b){
					return b.level - a.level;
				});
				var task = null;
				while (task = taskQueue.shift()) {
					if(typeof task.func != 'function'){
						continue;
					}
					try{
						$currentPopup = $(task.func());
					}catch(e){
						console.log('popup error 1');
						$currentPopup && $currentPopup.remove();
						$currentPopup = null;
					}
					if($currentPopup && $currentPopup.length > 0){
						currentLevel = task.level;
						$currentPopup.onRemove(Fai.removeBg);
						break;
					}
				};
				taskQueue = [];
			}, 100);
		});
	});
	
	return {
		Level: Level,
		/*
		 * @param func 弹窗对应的调用方法，注意每个func在弹窗成功后要返回自身弹窗的$dom对象。
		 * @param level 弹窗优先级，统一定义在上面的Level中
		 */
		show: function(func, level){
			if(typeof func != 'function' || isNaN(level)){
				return;
			}
			//将弹窗加入队列，等待定时后弹窗
			if(!isTimeout){
				var popupItem = {func: func, level: level};
				taskQueue.push(popupItem);
			//若定时已过，根据优先级决定是否替换弹窗
			}else{
				//若弹窗已消失，重置当前变量
				if($currentPopup && ($currentPopup.length == 0 || !$currentPopup.is(':visible') || $currentPopup.css('opacity') == '0')){
					$currentPopup = null;
					currentLevel = 0;
				}
				if(level > currentLevel){
					var $popup;
					try{
						$popup = $(func());
					}catch(e){
						console.log('popup error 2');
						$popup && $popup.remove();
						$popup = null;
					}
					if($popup && $popup.length > 0){
						if($currentPopup){
							$currentPopup.remove();
							Fai.bg();
						}
						$currentPopup = $popup;
						currentLevel = level;
						$currentPopup.onRemove(Fai.removeBg);
					}
				}
			}
		}
	}
	
	//这里是对jQuery的remove方法进行扩展，jq对象调用remove()时，如果有绑定onRemove回调，则触发执行onRemove
	function extendJQueryRemove(){
		jQuery.fn.onRemove = function(func){
			if(typeof func == 'function'){
				for(var i = 0, len = this.length; i < len; i++){
					this[i].onRemove = func;
				}
			}
		}
		var oldRemove = jQuery.fn.remove;
		jQuery.fn.remove = function(){
			for(var i = 0, len = oldRemove.call(this).length; i < len; i++){
				if(typeof this[i].onRemove == 'function'){
					this[i].onRemove.call(this);
				}
			}
		}
	}
})();

$(function(){
	
		if($.cookie("serviceTipsCookie") == "true"){
			$(".serviceSideBarTipsNum").css("display","block");
		}

		if($.cookie("orderTipsCookie") == "true"){
			$(".orderSideBarTipsNum").css("display","block");
		}

		if($.cookie("couponTipsCookie") == "true"){
			$(".couponSideBarTipsNum").css("display","block");
		}

		$('#fkAcctInput').live('keyup',function(){
			$('.freeDomain').find("span").text($('.fkAcct').find('input').val() == "" ? "uq14792825" : $('.fkAcct').find('input').val());
		});

		$('#fkAcctInput').live('change',function(){
			cacctValidate();
		});

		$('.domainWindowClose').live('click', domainWindowClose);

		$('#searchDomainInput').live('keyup',function(){
			if($('#searchDomain').val() == ""){
				$('#searchBtn').css("background","url(//ps.faisys.com/image/portalDoaminWindowIcon.png) #e6e6e6 -142px no-repeat");
			}else{
				$('#searchBtn').css("background","url(//ps.faisys.com/image/portalDoaminWindowIcon.png) #2cbf61 -142px no-repeat");	
			}
		})

	

	mpsAlert.showAlert();

	if(false){	
		$.cookie( 'fromSiteManage', true, { expires: 1, path: '/' });
	}
});
function toSetPwd(){
	Fai.removeIng2();
	Fai.removeBg();
	
	Portal.logDog(100068,9);
	
	$.cookie( 'faiIng', '0', { expires: 1, path: '/' });
	
		window.location.href= "http://www.faisco.cn/portal.jsp#appId=setPwd";
	
	window.location.reload();
}

function tipsClose(){
	Fai.removeIng2();
	Fai.removeBg();
	$.cookie( 'faiIng', '0', { expires: 1, path: '/' });
}

function grandUp(){
	Fai.removeIng2();
	Fai.removeBg();
	Portal.logDog(101004,29);//点击hd弹窗-原价升级
	top.location.href="http://www.faisco.cn/portal.jsp?ram="+Math.random()+"#appId=shopCart";
}

function goCoupon(){
	Fai.removeIng2();
	Fai.removeBg();
	Portal.logDog(101004,30);//点击hd弹窗-点击购买现金券
	top.location.href="http://www.faisco.cn/portal.jsp?ram="+Math.random()+"#appId=shopCart";
	var href="http://www.faisco.cn/portal.jsp#appId=shop&tab=3";
	window.open(href);
}

function tipsClose3(){
	Fai.removeIng2();
	Fai.removeBg();
	Portal.logDog(101004,31);//点击hd弹窗-点击关闭
	top.location.href="http://www.faisco.cn/portal.jsp?ram="+Math.random()+"#appId=shopCart";
}

function flyerGrandUp(){
	Fai.removeIng2();
	Fai.removeBg();
	Portal.logDog(101004,43);//点击微传单弹窗-暂不需要
	top.location.href="http://www.faisco.cn/portal.jsp?ram="+Math.random()+"#appId=shopCart";
}

function flyerGoCoupon(){
	Fai.removeIng2();
	Fai.removeBg();
	Portal.logDog(101004,44);//点击微传单弹窗-点击购买现金券
	top.location.href="http://www.faisco.cn/portal.jsp?ram="+Math.random()+"#appId=shopCart";
	var href="http://www.faisco.cn/portal.jsp#appId=shop&tab=6";
	window.open(href);
}

function flyerTipsClose(){
	Fai.removeIng2();
	Fai.removeBg();
	Portal.logDog(101004,45);//点击微传单弹窗-点击关闭
	top.location.href="http://www.faisco.cn/portal.jsp?ram="+Math.random()+"#appId=shopCart";
}



	function updateAcct(){
		if($('.domainWindow #acctUpdateBtn').attr('_disabled') == 'true'){
			return false;
		}
		cacctValidate(function(){
			var params = new Array();
			var cacctVal = $('#fkAcctInput').val();
			params.push( 'cacct=' + Fai.encodeUrl(cacctVal) );
			$.ajax({
				type: 'post',
				url: '../ajax/corp_h.jsp?cmd=set',
				data: params.join(''),
				error: function(){
					$('#save').attr('disabled', false);
					Fai.ing('服务繁忙，请稍后再试。', false);
				},
				success: function(result){
					Portal.logDog(100068, 81);
					Fai.successHandle(result, '', '', document.location.href, 0, 1);
				}
			})
		});
	}
	
	function cacctValidate(callBack) {	//callBack:帐号验证通过后要执行的回调函数
		var cacct = $('#fkAcctInput');
		this.showErr = function(msg){
			$('.domainWindow #acctCheckMsg').text(msg);
		}
		this.firstCheck = function(){
			if (oldCacct == cacct.val()) {
				showErr("新旧帐号一致，请输入新的凡科帐号");
				return false;
			}
			if (cacct.val() == "") {
				showErr("请输入凡科帐号");
				return false;
			}
		
			var reg = /[\u4e00-\u9fa5]/g;
			if (reg.test(cacct.val())) {
				showErr("不可输入中文字符，请输入4-20个字母、数字组合");
				return false;
			} else {
				reg = /^[a-zA-Z0-9]+$/g;
				if (!reg.test(cacct.val())) {
					showErr("使用非法字符，请输入4-20个字母、数字组合");
					return false;
				} else {
					reg = /^[0-9]/;
					if (reg.test(cacct.val())) {
						showErr("首字不能为数字，请输入4-20个字母、数字组合");
						return false;
					} else {
						if (cacct.val().length < 4) {
							showErr("字数不足4位，请输入4-20个字母、数字组合");
							return false;
						}
						if (cacct.val().length > 20) {
							showErr("字数超过20位，请输入4-20个字母、数字组合");
							return false;
						}
					}
				}
			}
		}
		
		$('.domainWindow #acctUpdateBtn').removeAttr('_disabled');
		showErr('');
		if(this.firstCheck() == false){
			$('.domainWindow #acctUpdateBtn').attr('_disabled', 'true');
			return false;
		}else{
			$.ajax({
				type: "post",
				url: '/ajax/reg_h.jsp',
				data: "cmd=checkCacct&cacct=" + Fai.encodeUrl(cacct.val()),
				error: function(){},
				success: function(result) {
					var result = jQuery.parseJSON(result);
					if (result.success) {
						if (result.existed) {
							showErr(' 抱歉, ' + cacct.val() + '已被注册，请输入其他字符');
							$('.domainWindow #acctUpdateBtn').attr('_disabled', 'true');
						} else {
							if(callBack){callBack();}
						}
					}
				}
			});
		}
	}
	
	function resetAcct(){	//点查询域名时恢复显示原来的免费网址（帐号），清除错误提示。
		$('#fkAcctInput').val(oldCacct);
		$('.freeDomain').find("span").text(oldCacct);
		$('#acctCheckMsg').text('');
		setTimeout(function(){	//有时是ajax校验帐号是否可用，有延时
			$('#fkAcctInput').val(oldCacct);
			$('.freeDomain').find("span").text(oldCacct);
			$('#acctCheckMsg').text('');
		}, 800);
	}
	
	//检查域名
	function windowDomainCheck(){
		Portal.logDog(100068, 82);
		var domainText = $('.windowDomainText').val();
		if ( domainText.indexOf(".") != -1 ){
			domainText = domainText.slice(0, domainText.indexOf("."));
			$('.windowDomainText').val(domainText);
		}
		var msg = checkDomain(domainText);
		if (msg != '') {
			$('#domainSearchResultImg').removeClass().addClass("domainSearchResultImgNo");
			$('.domainSearchResultText').css('color','#ff4c15');
			$('.domainSearchResultText').html(msg);
			return;
		}
		var domainList = new Array();
		domainText = domainText + $('.domainSearchEnd').val();
		domainList.push(domainText);
	
		$('.windowDomainText').attr("disabled", true);
		$('.domainSearchEnd').attr("disabled", true);
		$('.domainSearchBtn').attr("disabled", true);
		
		$('#domainSearchResultImg').removeClass().addClass("icoWait");
		$('.domainSearchResultText').html('正在查询，请稍后......');
		
		$.ajax({
			type: 'post',
			url: '../ajax/faiDomain_h.jsp?cmd=checkRegistered&domainList=' + Fai.encodeUrl($.toJSON(domainList)),
			error: function(){ 
				$('.windowDomainText').removeAttr("disabled");
				$('.domainSearchEnd').removeAttr("disabled");
				$('.domainSearchBtn').removeAttr("disabled");
				Fai.ing("服务繁忙，请稍候重试", false);
			},
			success: function(result){
				$('.windowDomainText').removeAttr("disabled");
				$('.domainSearchEnd').removeAttr("disabled");
				$('.domainSearchBtn').removeAttr("disabled");
				result = jQuery.parseJSON(result);
				if (result.success) {
					$(result.regList).each(function() {
						if (this.msg) {
							$('#domainSearchResultImg').removeClass().addClass("domainSearchResultImgNo");
							$('.domainSearchResultText').css('color','#ff4c15');
							$('.domainSearchResultText').html('系统错误');
						} else {
							if (this.reg) {
								if ( !Fai.top.topBarHasCheckDomain ){
									$('.windowDomainText').focus();
								}
								$('#domainSearchResultImg').removeClass().addClass("domainSearchResultImgNo");
								$('.domainSearchResultText').css('color','#ff4c15');
								$('.domainSearchResultText').html('此域名已被注册，请重新查询');
							} else {
								if ( !Fai.top.topBarHasCheckDomain ){
									$('.domainSearchMsg').show();
								}
								$('#domainSearchResultImg').removeClass().addClass("domainSearchResultImgYes");
								$('.domainSearchResultText').css('color','#939393');
								
									$('.domainSearchResultText').html("此域名可注册，<a onclick='Portal.logDog(100068, 83);domainWindowClose()' href='http://www.faisco.cn/portal.jsp#appId=shop' target='_blank' style='color:#ff8915;'>买网站送顶级域名</a>");
								
							}
						}
					});
				}else{
					$('#domainSearchResultImg').removeClass().addClass("domainSearchResultImgYes");
					$('.domainSearchResultText').html(msg);
				}
			}
		});
		function checkDomain(domain){
			if (!domain) {
				return '请先输入域名';
			}
			if (!Fai.isDomain(domain)) {
				if (domain.indexOf("-") == 0 || domain.lastIndexOf("-") == domain.length - 1) {
					return '域名的开头及结尾均不能含有-';
				} else if (domain.indexOf("--") >= 0) {
					return '域名不能含有连续的-';
				} else if (domain.indexOf(".") >= 0) {
					return '域名不能含有.';
				}
				return '域名由英文a-z、数字0-9和-组成';
			}
			return '';
		}
	};
	
	function domainWindowClose(){
		$('#domainWindow').remove();
		Fai.removeBodyBg('domainWindow');
	}


var mpsAlert = {
	requestUrl:"/ajax/MPSRecord_h.jsp",
	cmd:{
		isShowMPSBeianAlert:"isShowMPSBeianAlert"
	},
	isCompleteShowAlert:true,//通过jsp获取,【企业信息完善】弹窗优先于公安备案弹窗
	isCompleteShowAlertCookie:null,

	showAlert:function() {

		var canMPShow = (($.cookie("hasShowMPSAlert") != "true"));
		if(canMPShow) { return; }//公安部弹窗，优先度最低......

		var datas = {};
		datas.cmd = mpsAlert.cmd.isShowMPSBeianAlert;
		$.ajax({
			url:mpsAlert.requestUrl,
			data:datas,
			success:function(result) {
				result = jQuery.parseJSON(result);
				if(result.success) {
					switch (result.showAlertType) {
						case 1:top.Popup.show(mpsAlert.alertType.shanghaiAlert, top.Popup.Level.MPS_RECORD_ALERT);break;
						case 2:top.Popup.show(mpsAlert.alertType.noramlAlert, top.Popup.Level.MPS_RECORD_ALERT);break;
					}
				}
			}
		});

	},
	alertType:{
		shanghaiAlert:function() {
			Fai.removeIng();
			Fai.bg();

            Fai.ing2("<div class='warningWindow MPSAlert'>"
                    + "<span class='warning-icon' style='height:32px'></span><span class='title' style='width:213px;text-align:left;'>公安部规定，你有域名需进行公安备案<br/>否则于<font color='#e64340'>3月25日起无法访问网站</font></span>" 
                    + "<div><a class='MPSCenterButton MPSRecordAlert' id='MPSRecord'>前往公安备案</a></div>"
               + "</div>", false, false, 372, 206);

            top.$('.MPSRecordAlert').on("click", function(){
            	Fai.removeIng2();
            	Fai.removeBg();
            	changeBzUI();
            	snavItemClick(this);
            	$(this).unbind();
            });

            top.$(".msg2").css("margin", "43px auto");
            top.$(".close").css("margin", "16px").removeClass("close").addClass("close-icon");

			return top.$(".MPSAlert").closest("#ing2");
		},
		noramlAlert:function() {
			Fai.bg();
            Fai.ing2("<div class='warningWindow MPSAlert'>"
                    + "<span class='title' style='width:328px;'><span class='warning-icon'></span>公安部规定，你有域名需进行公安备案否则<font color='#e64340'>网站会被关闭</font></span>" 
                    + "<div>"
                        + "<a class='MPSLeftButton2 MPSRecordAlert' id='MPSRecord'>前往公安备案</a>"
                        + "<a class='MPSLeftButton2' onclick='Fai.removeIng2();Fai.removeBg();' >知&nbsp;道&nbsp;了</a>"
                    + "</div>"
               + "</div>", false, false, 398, 204);
            top.$('.MPSRecordAlert').on("click", function(){
            	Fai.removeIng2();
            	Fai.removeBg();
            	changeBzUI();
            	snavItemClick(this);
            	$(this).unbind();
            });

            top.$(".msg2").css("margin", "42px auto");
            top.$(".close").css("margin", "16px").removeClass("close").addClass("close-icon");
			top.$(".tips2").css("border-radius", "2px")
                   .css("border", "none")
                   .css("box-shadow", "none")
                   .css("-moz-box-shadow", "none")
                   .css("webkit-box-shadow", "none");

			return top.$(".MPSAlert").closest("#ing2");
		},
	}
};

function delDomain(domain){
	//删除域名
	$.ajax({
		type: "post",
		url: 'ajax/faiDomain_h.jsp?cmd=delDomain&domain='+domain,
		error: function(){ Fai.ing("服务繁忙，请稍候重试", false);},
		success: function(result){
			Fai.successHandle(result, '删除成功', '删除失败', '', 0, 1);
			setTimeout(function(){
				window.location.reload();
			}, 500);
		}
	});
}

function toSiteRecord(domain){
	$.ajax({
		url:"/ajax/faiDomain_h.jsp?cmd=setRecordType&domain="+domain+"&recordType=2&beianStatus=9",
		dataType:"json",
		error:function(data) { Fai.ing("系统繁忙，请稍后再试", false); },
		success:function(data) {
			if(data.success) {
				Fai.removeIng2();
				Fai.removeBg();
				Portal.openApp2({openAppId:"siteRecord",iframeParams:"ram="+Math.random()+"&domain="+domain});
				top.changeBzUI();
			} else {
				Fai.removeIng2();
				Fai.removeBg();
				Fai.ing("系统繁忙，请稍后再试", false);
			}
		}
	})
}

function showErr(obj, str){
    if (obj.attr("id") == "regging") {
        if (str != "") {
            $("#reggingLine").show();
        } else {
            $("#reggingLine").hide();
        }
    }
    if (str != "") {
        obj.parent().parent().find(".item4").show();
        obj.parent().parent().find(".item4").text(str);
    } else {
        obj.parent().parent().find(".item4").hide();
        obj.parent().parent().find(".item4").text(str);
    }
    obj.parent().parent().find(".item3").hide();
    obj.parent().parent().find(".item5").hide();
}
</script>
</head>
<body>
<!--<body class="indexBody">-->
	





<style>

.sep {float: left;width: 1px;height: 10px;min-height: 10px;background: #c5c5c5; margin-top:23px;}
.align_Line{display: inline-block;vertical-align: top; height: 25px; line-height: 22px; margin-top: 2px;}
</style>

	<div id="header">
	<div style="float:left; height:58px;">
		<a  title='点击设置企业logo' onclick='toCorp();' href='javaScript:void(0);' style="float:left;height:58px;"><img id="corp-logo" src="//ps.faisys.com/image/logo11.jpg?v=201602241046" class="logo" border="0" style="width:180px;height:58px;"/></a>
	</div>
	
	<div class="headerRight">
	
		<div class="topTag" style="width:90px;"><span style=" margin-left:1px;"><div class="sep sep1"></div><a href="javascript:Portal.logout();" >退出</a></span><span class="outImg"></span></div>					
	
				<div class="topTag serviceSupport "><span style="margin-left:1px;"><div class="sep sep2"></div><a href="javaScript:void(0)" target="blank">在线咨询</a></span><span class="bottomImg"></span></div>
			
		<div class="topTag companySummary "><span style=" margin-left:1px;"><div class="sep sep3"></div><div class="redPoint"></div><a href="javaScript:void(0)" target="blank">企业概括</a></span><span class="bottomImg"></span></div>
		
		<div style="float:right; margin-right:10px;"><font color="#666">,下午好！</font></div>
		<div class="userNameWidth">
		boss

		</div>
	</div>	
	
	<script type="text/javascript">
	$(function(){
		var isShowModify = 'true';
		if($.cookie('isShowModify') != isShowModify){
			$.cookie('hasShowModify', 'false', {path:'/', expires:365});
			$.cookie('isShowModify', isShowModify, {path:'/', expires:365});
		}
		if(isShowModify == 'true' && $.cookie('hasShowModify') != 'true'){
			$('.companySummary .redPoint').css('display', 'inline-block');
		}
		
		$(".agentPortal").data("Show", true);
		$(".serviceSupport").mouseover(function(){
			$('.serviceSupport').css('margin-right','-1px');
			$('.serviceSupport').css('width','111px');
			$(this).attr("_mouseIn",1);
			$(this).addClass('.headerRight companySummaryHover');
			$('.serviceSupport .bottomImg').css('transform','rotate(180deg)');
			var div = $("#faiscoService");
			div.css('left', $(".serviceSupport").offset().left - div.outerWidth() + $('.serviceSupport').outerWidth());
			div.css('top', $(".serviceSupport").offset().top + 55);
			div.show();
			$('.sep1').css('visibility','hidden');
			$('.sep2').css('visibility','hidden');
			if(($(".agentPortal").data("Show") == true)){
				Portal.logDog(100068,66);//在线咨询-代理入口曝光
			}
			$(".agentPortal").data("Show", false);
		}).mouseleave(function(){
			$('.serviceSupport').css('margin-right','0px');
			$('.serviceSupport').css('width','110px');
			$(this).attr("_mouseIn",0);
			$(this).removeClass('.headerRight companySummaryHover');
			$('.serviceSupport .bottomImg').css('transform','rotate(0deg)');
			setTimeout(function(){
				var mouseIn = parseInt($('.serviceSupport').attr('_mouseIn'));
				if(mouseIn == 0){				
					$('#faiscoService').hide();
				}
			}, 100);
			$('.sep1').css('visibility','visible');
			$('.sep2').css('visibility','visible');
			$(".agentPortal").data("Show", true);
		});

		$("#faiscoService").mouseover(function(){
			$('.serviceSupport').css('margin-right','-1px');
			$('.serviceSupport').css('width','111px');
			$('.serviceSupport').attr('_mouseIn', 1);
			$(this).show();
			$('.serviceSupport').addClass('.headerRight companySummaryHover');
			$('.serviceSupport .bottomImg').css('transform','rotate(180deg)');
			$('.sep1').css('visibility','hidden');
			$('.sep2').css('visibility','hidden');
		}).mouseleave(function(){
			$('.serviceSupport').css('margin-right','0px');
			$('.serviceSupport').css('width','110px');
			$('.serviceSupport').attr('_mouseIn', 0);
			$('.serviceSupport').removeClass('.headerRight companySummaryHover');
			$('.serviceSupport .bottomImg').css('transform','rotate(0deg)');
			setTimeout(function(){
				var mouseIn = parseInt($('.serviceSupport').attr('_mouseIn'));
				if(mouseIn == 0){					
					$('#faiscoService').hide();
					$(".agentPortal").data("Show", true);
				}
			}, 100);
			$('.sep1').css('visibility','visible');
			$('.sep2').css('visibility','visible');
		});

		checkFromMjz();
		
	/*$('.clearService').mouseover(function(){
		$(this).addClass('clearServiceHover');
		
	}).mouseleave(function(){
		$(this).removeClass('clearServiceHover');
		
		});*/
	});
	
	function toChangeCacct(){
		$.cookie('toChangeCacct', 'true');
		toCorp();
	}
	
	function checkFromMjz(){
		if( $.cookie("_c1") ){
			if( $.cookie("_c1") == $.cookie("loginCacct") ){
				var domainStr = window.location.host;
				domainStr = domainStr.startsWith("www.") ? domainStr.substring(4) : domainStr;
				document.cookie ="_c1=;domain="+ domainStr;
				Portal.logDog(200222, 14);
			}
		}
	}

	</script>
</div>
<div class="companySummaryWindow">
	
		<div class="fix" style="width:111px;height:5px; background:#fff; margin-left:0px; margin-top:-1px;"></div>
	
	<div class="row"> 
		<div class="corpTitle">
		凡科帐号：		
		</div>
		<div class="corpContent corpAccount" style="text-align:left; width:160px; overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
			uq14792825
			&nbsp;&nbsp;<a href='javaScript:void(0);' onclick='toChangeCacct()' target='_top' style='color:#3497db;text-decoration: none'>[修改]</a>

		</div>
	</div>
	<div class="row">
		<div class="corpTitle">企业名称：</div>
		
		<div class="corpContent corpName" style="text-align:left; width:160px; overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">-</div>
	</div>
	
	<div class="row">
		<div class="corpTitle">员工总数：</div>
		<div class="corpContent"><span>1</span>个
		&nbsp;&nbsp;<a href='javaScript:void(0);' onclick='toStaff()' target='_top' style='color:#3497db;text-decoration: none'>[管理员工]</a>

		</div>
	</div>
	
</div>


	<div id="faiscoService" class="service" style=" display:none; border: 1px solid #dfdfdf; border-top:1px solid #fff; background-color:#fff; padding-top:0px;padding-bottom: 5px;">
		
				<div class="topTag"><span style="margin-left:1px;"><div class="sep sep2"></div>
					<a class="icon align_Line" href="http://www.faisco.cn/qq.jsp?s=5" target="_blank" onclick="Portal.logDog(100068, 25);Portal.logDog(4000007, 4);"><img src="//ps.faisys.com/image/qq1.gif" width="20px" height="20px" alt="在线客服QQ"></a>
					<a class="item align_Line" href="http://www.faisco.cn/qq.jsp?s=5" target="blank" onclick="Portal.logDog(100068, 25);Portal.logDog(4000007, 4);">人工客服</a>
				</span></div>
				
				
	</div>

<script type="text/javascript">
	$(document).on('mouseover','.companySummary , .companySummaryWindow',function(){
		$('.companySummary').css('margin-right','-1px');
		$('.companySummary').css('width','111px');
		$('.companySummary .bottomImg').css('transform','rotate(180deg)');
		$('.companySummaryWindow').css('display','block');
		$('.companySummary').addClass('.headerRight companySummaryHover');
		$('.companySummary .redPoint').hide();
		$.cookie('hasShowModify', 'true', {path:'/', expires:365});
		
			$('.sep2').css('visibility','hidden');
		
		$('.sep3').css('visibility','hidden');
	})

	$(document).on('mouseout','.companySummary , .companySummaryWindow',function(){
			$('.companySummary').css('margin-right','0px');
			$('.companySummary').css('width','110px');
			$('.companySummary .bottomImg').css('transform','rotate(0deg)');
			$('.companySummaryWindow').css('display','none');
			$('.companySummary').removeClass('.headerRight companySummaryHover');
			
				$('.sep2').css('visibility','visible');
			
			$('.sep3').css('visibility','visible');
	})
	
</script>

	
	
	<div class="indexContainer">
		<!-- left containter -->
		
			

<script type="text/javascript" src="//ps.faisys.com/js/util.min.js?v=201707031158"></script>
<script type="text/javascript" language="javascript">
var cnt = 0;
function snavItemClick(e)
{
	var id = $(e).attr("id");
	if(id == "order"){
	/*	$(".orderSideBarTipsNum").css("display","none");
		$.cookie("orderTipsCookie","false");
		$.cookie("serviceTipsCookie","false");*/
	}else if(id == "coupon"){
		$(".couponSideBarTipsNum").css("display","none");
		$.cookie("couponTipsCookie","false");
		$.cookie("serviceTipsCookie","false");
		$("#coupon").attr("_select",1);
	}else if(id == "dnspodTransfer"){
		$.cookie("hasShowDomainTipsPoint", true);
		$(".domainTipsPoint").remove();
	}else if(id == "shopCart"){
		$(".orderSideBarTipsNum").css("display","none");
		//$.cookie("orderTipsCookie","false");
		$.cookie("serviceTipsCookie","false");
	}
	
	if(id != "shopCart"){
		var orderCount = parseInt(top.$(".orderSideBarTipsNum").text());
		if(orderCount == 0){
			$(".orderSideBarTipsNum").css("display","none");
		}else{
			$(".orderSideBarTipsNum").css("display","block");
		}
		
	}
	if(id == "dnspodTransfer"){
		top.$(".domainAutonym").hide();
	}else{
		top.$(".domainAutonym").show();
	}

	if(id == "corpGroupBuy"){
		$.cookie("showCorpGroupBuyTagCookie","false",{path:'/', expires:365});
		$(".newShopTips").css("display","none");
	}
	
	if(id != "coupon"){
		$("#coupon").attr("_select",0);
	}
	changeUI(e);
	var options = {
		openAppId : id
	}
	Portal.openApp2(options);
	//head管理员工
	if(id == 'corpStaff'){
		$('.firstTag').css('background','#3497db');
		$('.firstTag a').css('color','#fff');
		$('.businessPlatform .rightArrow1' ).css('background','url(//ps.faisys.com/image/bz.png?v=201508201752) -230px -130px ');
		$('.rightArrow').removeClass('rotate90');
		$('.companyManage .rightArrow').addClass('rotate90');
		$('.companyManageList').slideDown().siblings('ul').slideUp();
		$('.companyManageList #corpStaff').parent().css('background','#fff');
		$('.companyManageList #corpStaff').css('color','#3497db');

	}
	
	
}

function changeUI(e){
	$('.childMenu').css('background','#3497db');
	$(e).parent().css('background','#ededf0');
	$('.leftContainer a').css('color','#fff');
	$(e).css('color','#3497db');
	var className = $(e).parent().parent().attr("class");
	$('.rightArrow').removeClass('rotate90');
	$('#'+ className +' .rightArrow').addClass('rotate90');
	$('.'+ className).slideDown().siblings('ul').slideUp();

}

//商务平台按钮点击
function businessClick(){
	if(!true){
		$('.completeInfoBg').show();
		$('.completeInfo').show();
	}
	$('.businessPlatform').css('background','#ededf0');
	$('.businessPlatform a' ).css('color','#3497db');
	if(Fai.isIE()){
		$('.businessPlatform .rightArrow1' ).css('background','url(//ps.faisys.com/image/bz8.png?v=201510101724) -230px -100px ');
	}else{
		$('.businessPlatform .rightArrow1' ).css('background','url(//ps.faisys.com/image/bz.png?v=201508201752) -230px -100px ');
	}
	$('.leftTag .rightArrow').removeClass('rotate90');
	$('.leftContainer ul').slideUp();

	cnt++;
	if(cnt == 1){
		Portal.logDog(4000046, 1);
	}else{
		cnt = 0;
	}
}

function changeBzUI(){
	$('.businessPlatform').css('background','#3497db');
	$('.businessPlatform a' ).css('color','#fff');
	if(Fai.isIE()){
		$('.businessPlatform .rightArrow1' ).css('background','url(//ps.faisys.com/image/bz8.png?v=201510101724) -230px -130px ');
	}else{
		$('.businessPlatform .rightArrow1' ).css('background','url(//ps.faisys.com/image/bz.png?v=201508201752) -230px -130px ');
	}
}

function toStaff(){
	changeUI("#corpStaff");
	var initAppOptions = {
		openAppId : "corpStaff"
	}	
	Portal.initApp2(initAppOptions);
	changeBzUI();
}

function toService(){
	$(".serviceSideBarTipsNum").css("display","none");
	$.cookie("serviceTipsCookie","false");

	changeUI("#shop");
	var initAppOptions = {
		openAppId : "shop"
	}	
	Portal.initApp2(initAppOptions);
	changeBzUI();
}

function toCount(){
	changeUI("#account");
	var initAppOptions = {
		openAppId : "account"
	}	
	Portal.initApp2(initAppOptions);
	changeBzUI();
}

function toCorp(){
	changeUI("#setCorpInfo");
	var initAppOptions = {
		openAppId : "setCorpInfo"
	}	
	Portal.initApp2(initAppOptions);
	changeBzUI();
}
function toDomain(){
	changeUI("#dnspodTransfer");
	var initAppOptions = {
		openAppId : "dnspodTransfer"
	}	
	Portal.initApp2(initAppOptions);
	changeBzUI();
}

function toSelf(){
	changeUI("#setInfo");
	var initAppOptions = {
		openAppId : "setInfo"
	}	
	Portal.initApp2(initAppOptions);
	changeBzUI();
}

function toShop(){
	changeUI("#shop");
	var initAppOptions = {
		openAppId : "shop"
	}	
	Portal.initApp2(initAppOptions);
	changeBzUI();
}

function isDomShow(id){
	var id = "#"+id;
	
	var show = false;
	if($(id)[0]!=undefined){
		if($(id).css("display")!="none"){
			show = true;
		}
	}
	
	return show;
}

//判断指定的现金券是否过期  
function isSpecificCouponExpire(){
	//优先级判断：站腾网 SEO>网站定制>云客网 SEO；
	var ztType = 95;
	var webSiteCustomType = 149;
	var ykType = 142;
	var couponType = [ztType,webSiteCustomType,ykType];
	
	var ztSeo = {type:ztType,expireTime:undefined,price:undefined,id:undefined};//站腾网SEO现金券
	var webSiteCustom = {type:webSiteCustomType,expireTime:undefined,price:undefined,id:undefined};//网站定制现金券
	var ykSeo = {type:ykType,expireTime:undefined,price:undefined,id:undefined};//云客网SEO现金券
	var productArr = [ztSeo,webSiteCustom,ykSeo];
	
	var productMap = {95:0,149:1,142:2};
	var hasSpecificCoupon = false;
	$.ajax({
		type: "post",
		async: false,
		data:{cmd:"getCouponInfo",types: $.toJSON(couponType)},
		url: "/ajax/corpGroupBuy_h.jsp",
		error: function(){
			Fai.ing("服务繁忙，请稍候重试",false);
		},
		success: function(result){
			var result = $.parseJSON(result);
			if(result.success){
			var coupons = $.parseJSON(result.data);
				$.each(coupons, function(index,coupon) {
					if(coupon.status==0){
						var couponType = coupon.type;
						var index = productMap[couponType];
						if(index!=undefined){
							productArr[index].expireTime = new Date(coupon.expireTime);
							productArr[index].price = coupon.price;
							productArr[index].id = coupon.id;
							hasSpecificCoupon = true;
						}
					}
				});
			}
		}
	});
	
	var hasCouponExpired = false;
	if(hasSpecificCoupon){
		//最近七天的区间
		var today = new Date();
		var expireArr = new Array();
		$.each(productArr, function(index,element) {
			var expireTime = element.expireTime;
			if(expireTime!=null){
				var aWeekAgo = new Date(expireTime);
				aWeekAgo.setDate(expireTime.getDate()-7);
				if(aWeekAgo<=today&&today<=expireTime){
					hasCouponExpired = true;
				}
			}
		});
	}
	
	return hasCouponExpired;
}

//检测是否领取了新人礼包赠送的券
function hasPickGiftBag(){
	//优先级判断：站腾网 SEO>网站定制>云客网 SEO；
	var ztType = 95;
	var zhishiCoupon = 126;
	var couponType = [ztType,zhishiCoupon];
	var hasPick = false;
	$.ajax({
		type: "post",
		async: false,
		data:{cmd:"getCouponInfo",types: $.toJSON(couponType)},
		url: "/ajax/corpGroupBuy_h.jsp",
		error: function(){
			Fai.ing("服务繁忙，请稍候重试",false);
		},
		success: function(result){
			var result = $.parseJSON(result);
			if(result.success){
				var coupons = $.parseJSON(result.data);
				$.each(coupons, function(index,coupon) {
					if(coupon.type!=undefined){
						hasPick = true;
					}
				});
			}
		}
	});
	
	return hasPick;
}


$(function(){
	
	//新注册用户显示礼包标签
	var isNewUser = true;
	var hasPick = hasPickGiftBag();
	if(isNewUser&&!hasPick){
		
		var giftBagImgShow = true;
		
		$(".corpGroupBuyImg").hide();
		
		var giftBagClicked = $.cookie("giftBagClicked");
		if(giftBagClicked){
			giftBagImgShow = false;
		}
		
		if(giftBagImgShow){
			$("#giftBagImg").show();
			Portal.logDog(4000073,53);
		}
	}
	
	//每月月初 7 天，显示 tab-sale 标签
	if(!isDomShow("giftBagImg")){//如果新人的礼包标签符合显示条件，则该标签不显示
		var today = new Date().getDate();
		if(today<=7){
			
			var corpGroupBuyImg = true;
			
			$(".corpGroupBuyImg").hide();
		
			var cashCouponClicked = $.cookie("cashCouponClicked");
			if(cashCouponClicked){
				corpGroupBuyImg = false;
			}
			
			if(corpGroupBuyImg){
				$("#cashCouponImg").show();
				Portal.logDog(4000073,55);
			}
		}
	}
	
	//当指定现金券过期的时候，显示小红点
	if(!isDomShow("giftBagImg")&&!isDomShow("cashCouponImg")){
		var hasCouponExpire = isSpecificCouponExpire();
		if(hasCouponExpire){
			$(".corpGroupBuyImg").hide();
			$("#couponExpireImg").show();
		
			var couponExpireClicked = $.cookie("couponExpireClicked");
			if(couponExpireClicked){
				$("#couponExpireImg").hide();
			}
		}		
	}
	
	$("#corpGroupBuy").bind("click",function(){
		var giftBagImg = {id:"giftBagImg",cacheKey:"giftBagClicked",cacheValue:new Date().toGMTString(),srcId:54};
		var cashCouponImg = {id:"cashCouponImg",cacheKey:"cashCouponClicked",cacheValue:true,srcId:56};
		var couponExpireImg = {id:"couponExpireImg",cacheKey:"couponExpireClicked",cacheValue:true};
		
		var imgArr = [giftBagImg,cashCouponImg,couponExpireImg];
		$.each(imgArr, function(index,element) {
			if(isDomShow(element.id)){
				$.cookie(element.cacheKey,element.cacheValue, { expires: 3650, path: '/' });
				if(element.srcId!=undefined){
					Portal.logDog(4000073,element.srcId);
				}
			}
			var id = "#"+element.id;
			$(id).hide();
			
		});
	});
	
	var initAppOptions = {
		openAppId : ""
	}
	Portal.initApp2(initAppOptions);

	if($(".fkServiceList").css("display") == "block"){
		$(".serviceSideBarTipsNum").css("display","none");
		$.cookie("serviceTipsCookie","false");
	
	}

	if(0 > $.cookie("allCanUseCouponListSizeCookie")){
		if($("#coupon").attr("_select") != 1){
			$(".couponSideBarTipsNum").css("display","block");
			$.cookie("couponTipsCookie","true");
		}
		$.cookie("allCanUseCouponListSizeCookie",0);
	}
	
	//商务平台-菜单栏点击行为统计
	$(".firstTag").bind('click',function(){
		var idName = $(this).attr('id');
		cnt++;
		if(cnt == 1){
			if(idName == 'businessPlatform_id'){
				Portal.logDog(4000073, 1);	//点击商务平台
			}else if(idName == 'fkServiceList'){
				Portal.logDog(4000073, 2);	//点击凡科服务
			}else if(idName == 'myCountList'){
				Portal.logDog(4000073, 8);	//点击企业信息
			}else if(idName == 'domainInfoList'){
				Portal.logDog(4000073, 11);	//点击企业账户
			}else if(idName == 'personInfoList'){
				Portal.logDog(4000073, 14);	//点击个人信息
			}
		}else{
			cnt = 0;
		}
	});
	
	$("#leftContainer .childMenu>a").bind('click',function(){
		var id = $(this).attr('id');
		cnt++;
		if(cnt == 1){
			if(id == 'shop'){
				Portal.logDog(4000073, 18);	//点击凡科服务-凡科商城
			}else if(id == 'corpGroupBuy'){
				Portal.logDog(4000073, 3);	//点击凡科服务-企业团购
			}else if(id == 'shopCart'){
				Portal.logDog(4000073, 4);	//点击凡科服务-待支付订单
			}else if(id == 'order'){
				Portal.logDog(4000073, 5);	//点击凡科服务-已完成订单
			}else if(id == 'coupon'){
				Portal.logDog(4000073, 6);	//点击凡科服务-我的现金券
			}else if(id == 'account'){
				Portal.logDog(4000073, 7);	//点击凡科服务-已购产品
			}else if(id == 'setCorpInfo'){
				Portal.logDog(4000073, 9);	//点击企业信息-修改企业资料
			}else if(id == 'upEmail'){
				
			}else if(id == 'corpStaff'){
				Portal.logDog(4000073, 10);	//点击企业信息-管理员工
			}else if(id == 'dnspodTransfer'){
				Portal.logDog(4000052, 2);
				Portal.logDog(4000073, 12);	//点击企业账户-域名管理
			}else if(id == 'smsAccount'){
				Portal.logDog(4000073, 13);	//点击企业账户-短信账户
			}else if(id == 'setInfo'){
				Portal.logDog(4000073, 15);	//点击个人信息-修改个人资料
			}else if(id == 'quickLogin'){
				Portal.logDog(4000073, 16);	//点击个人信息-便捷登录
			}else if(id == 'setPwd'){
				Portal.logDog(4000073, 17);	//点击个人信息-修改密码
			}
		}else{
			cnt = 0;
		}
	});
	
	
});

// mapping app - button - url
Portal.mappingApp = [
	{"app":"businessPlatform", "btn":"businessPlatform", "url": "/default.jsp"},						//商务平台
	
	//凡科服务								
	{"app":"shop", "btn":"shop", "url": "/service/shop3.jsp"},								// 凡科商城
	{"app":"corpGroupBuy", "btn":"corpGroupBuy", "url": "/service/corpGroupBuy/index.jsp"},						// 企业团购
	{"app":"shopCart", "btn":"shopCart", "url": "/service/shopCart.jsp"},							// 凡科购物车
	{"app":"shopConfirm", "btn":"shopCart", "url": "/service/shopConfirm.jsp"},						// 确认订单
	{"app":"shopFinish", "btn":"shopCart", "url": "/service/shopConfirm3.jsp"},						// 订单完成
	{"app":"orderPaying", "btn":"shopCart", "url": "/service/shopOrderDetailPaying.jsp"},			// 待支付订单详情
	{"app":"coupon", "btn":"coupon", "url": "/service/shopCouponList.jsp"},							// 凡科现金券
	{"app":"order", "btn":"order", "url": "/service/shopOrderList.jsp"},							// 凡科订单

	//我的账户
	{"app":"account",         "btn":"account",        "url": "/service/account.jsp"},							// 账户管理
	{"app":"dnspodTransfer",  "btn":"dnspodTransfer", "url": "/service/dnspodTransfer.jsp"},					// 域名管理
	{"app":"siteRecord",      "btn":"dnspodTransfer", "url": "/service/siteRecord.jsp"},						// 域名备案
	{"app":"MPSRecord",       "btn":"dnspodTransfer", "url": "/service/MPSRecordList.jsp"},	                   //公安部备案
	{"app":"shopOrderDetail", "btn":"order",          "url": "/service/shopOrderDetail.jsp"},					// 详细	
	{"app":"smsAccount", 	  "btn":"smsAccount", "url": "/service/smsAccount.jsp"},					//短信账户

	// 企业管理
	{"app":"setCorpInfo", "btn":"setCorpInfo", "url": "/corp/default.jsp"},							// 修改企业资料
	{"app":"upEmail", "btn":"upEmail", "url": "/corp/upemail.jsp"},								// 修改注册邮箱
	{"app":"corpStaff", "btn":"corpStaff", "url": "/corp/staff.jsp"},							// 管理员工

	// 个人平台
	{"app":"setInfo", "btn":"setInfo", "url": "/self/default.jsp"},								// 修改个人资料
	{"app":"setPwd", "btn":"setPwd", "url": "/self/pwd.jsp"},								// 修改密码
	
	{"app":"quickLogin", "btn":"quickLogin", "url": "/self/quickLogin.jsp"},								// 便捷登录
	
	{}
];
</script>
<div id="leftContainer" class="leftContainer">
	<div class="firstTag businessPlatform" id="businessPlatform_id" style="border-top: 0px;"><a class="leftTag" id="businessPlatform" href="/portal.jsp" onclick="businessClick();">商务平台<span class="rightArrow1"></span></a></div>
	
	<div class= 'firstTag fkService' id="fkServiceList">
		<a class="leftTag" id="fkService" onclick="toService();Portal.logDog(101004, 6);" href="javaScript:void(0);" >凡科服务
			<span class='rightArrow'></span>
						
		</a>	
	</div>
	<ul class="fkServiceList" style="display:none;height:auto;">
		<li class="childMenu"><a id="shop" href="javaScript:void(0)" onclick="snavItemClick(this);">凡科商城</a></li>		
		<li class="childMenu">
			<a id="corpGroupBuy" href="javaScript:void(0)" onclick="snavItemClick(this);">企业团购
				
				<img id="giftBagImg" class="corpGroupBuyImg" src="//ps.faisys.com/image/portal/giftBagTab.png?v=201711141014"  />
				<img id="cashCouponImg" class="corpGroupBuyImg" src="//ps.faisys.com/image/portal/cashCouponTab.png?v=201711142023"  />
				<div id="couponExpireImg" class="corpGroupBuyImg" ></div>
			</a>
		</li>
		<li class="childMenu">
			<a id="shopCart" href="javaScript:void(0)" onclick="snavItemClick(this);">待支付订单
				
					<div class="orderSideBarTipsNum" style="display:none;">
						0
					</div>
			</a>	
		</li>
		<li class="childMenu">
			<a id="order" href="javaScript:void(0)" onclick="snavItemClick(this);">已完成订单

			</a>
		</li>

		
		<li class="childMenu">
			<a id="coupon" href="javaScript:void(0)" onclick="snavItemClick(this);" >
		     我的现金劵
				
			</a>
		</li>
		<li class="childMenu" style="border-bottom: 1px solid #3392d6;"><a id="account" href="javaScript:void(0)" onclick="snavItemClick(this);" >已购产品</a></li>
	</ul>
	
	<div class="firstTag myCount" id="myCountList"><a class="leftTag" id="myCount" onclick="toCorp()" href="javaScript:void(0);">企业信息<span class="rightArrow"></span></a></div>
	<ul class="myCountList" style="display:none;height:auto;">
			<li class="childMenu" ><a id="setCorpInfo" href="javaScript:void(0)" onclick="snavItemClick(this);">修改企业资料</a></li>
			
			<li class="childMenu" style="border-bottom: 1px solid #3392d6;"><a id="corpStaff" href="javaScript:void(0)" onclick="snavItemClick(this);">管理员工</a></li>
	</ul>
	
	<div class="firstTag domainInfo" id="domainInfoList">
		<a class="leftTag" id="domainInfo" onclick="toDomain();" href="javaScript:void(0);" >企业账户
			
			<span class="rightArrow"></span>
		</a>
	</div>
	<ul class="domainInfoList" style="display:none;height:auto;">
		<li class="childMenu">
			<a id="dnspodTransfer" href="javaScript:void(0)" onclick="snavItemClick(this);">域名管理
				
			</a>
		</li>
		
		<li class="childMenu" style="border-bottom: 1px solid #3392d6;"><a id="smsAccount" href="javaScript:void(0)" onclick="snavItemClick(this);">短信账户</a></li>
		
	</ul>
	
	
	<div class="firstTag personInfo" id="personInfoList"><a class="leftTag" id="personInfo" onclick="toSelf();" href="javaScript:void(0);">个人信息<span class="rightArrow"></span></a></div>
	<ul class="personInfoList" style="display:none;height:auto;">
		<li class="childMenu"><a id="setInfo" href="javaScript:void(0)" onclick="snavItemClick(this);">修改个人资料</a></li>
		
		<li class="childMenu"><a id="quickLogin" href="javaScript:void(0)" onclick="snavItemClick(this);">便捷登录</a></li>
		
		<li class="childMenu" style="border-bottom: 1px solid #3392d6;"><a id="setPwd" href="javaScript:void(0)" onclick="snavItemClick(this);">修改密码</a></li>
	</ul>
</div>
		
		
		

		<!-- left containter end -->
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" style="width:100%;height:100%;">
                    <iframe id="mainFrame" name="mainFrame" frameBorder="0" scrolling="auto" src="/default.jsp">浏览器不支持嵌入式框架</iframe>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>