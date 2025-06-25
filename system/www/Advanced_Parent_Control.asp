<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - <#menu5_4#></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">

<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">

<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/itoggle.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script>
var $j = jQuery.noConflict();

$j(document).ready(function() {
//	init_itoggle('gw_arp_ping');
//	init_itoggle('x_DHCPClient', change_wan_dhcp_auto);
//	init_itoggle('wan_dnsenable_x', change_wan_dns_auto);
//	init_itoggle('vlan_filter', change_stb_port_and_vlan);
});
parent_control=[];
var clients_info = [<% get_static_client(); %>];
</script>
<script>

<% login_state_hook(); %>

function initial(){
	show_banner(1);
	show_menu(5,11,1);
	show_footer();

	if(!checkSERIALNO())
        return;
}

function applyRule(){
	if(validForm()){
		showLoading();
		document.form.next_page.value = "";
		document.form.action_mode.value = " ParentControl ";
		document.form.submit();
	}
}

function validForm(){
	var stime = document.form.pctrl_stime.value;
	var etime = document.form.pctrl_etime.value;
	var hour;
	var min;
	if(!validate_stand_hwaddr(document.form.pctrl_mac)){
		return false;
	}
	
	if(stime.charAt(2) != ':' || etime.charAt(2) != ':'){
		alert("<#Alert_Time#>");
		return false;
	}
	hour = parseInt(stime.substr(0,stime.indexOf(":")));
	min = parseInt(stime.substr(stime.indexOf(":")+1));
	if(hour < 0 || hour >23 || min < 0 || min > 59){
		alert("<#Alert_Time#>");
		return false;
	}
	stime = hour*60 + min;
	
	hour = parseInt(etime.substr(0,etime.indexOf(":")));
	min = parseInt(etime.substr(etime.indexOf(":")+1));
	if(hour < 0 || hour >23 || min < 0 || min > 59){
		alert("<#Alert_Time#>");
		return false;
	}
	etime = hour*60 + min;
	
	if(stime == etime){
		alert("<#Alert_Time1#>");
		return false;
	}
	
	if(document.form.pctrl_sun.value == 0 && document.form.pctrl_mon.value == 0 && document.form.pctrl_tue.value == 0
		&& document.form.pctrl_wed.value == 0 && document.form.pctrl_thu.value == 0 && document.form.pctrl_fri.value == 0 && document.form.pctrl_sat.value == 0){
		alert("<#Alert_Week#>");
		return false;
	}
	return true;
}

function invoke_timer(s){
	idTimerPoll = setTimeout('load_pctrl()', s*1000);
}

function load_pctrl(){
	clearTimeout(idTimerPoll);
	$j.ajax({
		type: "get",
		url: "/update.cgi",
        data: {
			output: "parent_control"
        },
		dataType: "script",
		cache: true,
		error: function(xhr){
			if(xhr.readyState == 4){
				eval_pctrl(xhr.responseText);
			}else{
				invoke_timer(5);
			}
		},
		success: function(response){
			eval_pctrl(response);
		}
	});
}
function eval_pctrl(response){
	
	try {
		eval(response);
	}
	catch (ex) {
		parent_control.length = 0;
	}
}

function setClientMAC(num){
	document.form.pctrl_mac.value = clients_info[num][1];
	hideClients_Block();
}

function showclientList(){
	var code = "";
	var show_name = "";
	for(var i = 0; i < clients_info.length ; i++){
		if(clients_info[i][2] && clients_info[i][2].length > 20)
			show_name = clients_info[i][2].substring(0, 18) + "..";
		else
			show_name = clients_info[i][2];
		
		if(clients_info[i][1]){
			code += '<a href="javascript:void(0)"><div onclick="setClientMAC('+i+');"><strong>'+clients_info[i][1]+'</strong>';
			/*code += ' ['+clients_info[i][2]+']';
			if(show_name && show_name.length > 0)
				code += ' ('+show_name+')';*/
			code += ' </div></a>';
		}
	}
	if (code == "")
		code = '<div style="text-align: center;" onclick="hideClients_Block();"><#Nodata#></div>';
	code +='<!--[if lte IE 6.5]><iframe class="hackiframe2"></iframe><![endif]-->';	
	$("ClientList_Block").innerHTML = code;
}

var isMenuopen = 0;
function hideClients_Block(){
	$j("#chevron").children('i').removeClass('icon-chevron-up').addClass('icon-chevron-down');
	$('ClientList_Block').style.display='none';
	isMenuopen = 0;
}

function pullLANIPList(obj){
	if(isMenuopen == 0){
		$j(obj).children('i').removeClass('icon-chevron-down').addClass('icon-chevron-up');
		$("ClientList_Block").style.display = 'block';
		document.form.pctrl_mac.focus();
		showclientList();
		isMenuopen = 1;
	}
	else
		hideClients_Block();
}

</script>

</head>

<body onload="initial();" onunLoad="return unload_body();">

<div class="wrapper">
    <div class="container-fluid" style="padding-right: 0px">
        <div class="row-fluid">
            <div class="span3">
                <center>
                    <div id="logo"></div>
                    <div id="company_name"><#Company_Name#></div>
                    <div id="product_name"><#Product_Name#></div>
                    <div id="model_name"><#Model_Name#></div>
                    <div id="model_name1"><#Model_Name1#></div>
                </center>
            </div>
            <div class="span9" >
                <div id="TopBanner"></div>
            </div>
        </div>
    </div>

    <div id="Loading" class="popup_bg"></div>

    <iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>

    <form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
    <input type="hidden" name="current_page" value="Advanced_Parent_Control.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="LANHostConfig;General;Storage;">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="parent_control">
    
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">
                <!--Sidebar content-->
                <!--=====Beginning of Main Menu=====-->
                <div class="well sidebar-nav side_nav" style="padding: 0px;">
                    <ul id="mainMenu" class="clearfix"></ul>
                    <ul class="clearfix">
                        <li>
                            <div id="subMenu" class="accordion"></div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="span9">
                <!--Body content-->
                <div class="row-fluid">
                    <div class="span12">
                        <div class="box well grad_colour_dark_blue">
                            <h2 class="box_head round_top"><#menu9#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#PARENT_CONTROL#></div>

                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th width="50%"><#PCTRL_NAME#></th>
                                            <td align="left">
                                            <input type="text" name="pctrl_name" id="pctrl_name" maxlength="20" class="input" size="20" value="">
                                            </td>
                                        </tr>
										
										<tr>
                                            <th width="50%"><#PCTRL_MAC#></th>
                                            <td align="left">
											<!--<input type="text" name="pctrl_mac" id="pctrl_mac" maxlength="17" class="input" size="17" value="">-->
											<div id="ClientList_Block" class="alert alert-info ddown-list" style="width: 215px;"></div>
                                            <div class="input-append">
                                                <input type="text" maxlength="17" class="span12" size="17" name="pctrl_mac" id="pctrl_mac" value="" style="float:left; width: 185px">
												<button class="btn btn-chevron" id="chevron" type="button" onclick="pullLANIPList(this);" title="Select the MAC of LAN clients."><i class="icon icon-chevron-down"></i></button>
                                            </div>
                                            </td>
                                        </tr>
										
										<tr>
                                            <th width="50%"><#PCTRL_WEEK#></th>
                                            <td align="left">
                                             <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="pctrl_sun" id="pctrl_sun" value="0"><#PCTRL_SUN#></label>
											 <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="pctrl_mon" id="pctrl_mon" value="0"><#PCTRL_MON#></label>
											 <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="pctrl_tue" id="pctrl_tue" value="0"><#PCTRL_TUE#></label>
											 <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="pctrl_wed" id="pctrl_wed" value="0"><#PCTRL_WED#></label>
											 </br>
											 <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="pctrl_thu" id="pctrl_thu" value="0"><#PCTRL_THU#></label>
											 <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="pctrl_fri" id="pctrl_fri" value="0"><#PCTRL_FRI#></label>
											 <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="pctrl_sat" id="pctrl_sat" value="0"><#PCTRL_SAT#></label>
                                            </td>
                                        </tr>
										
										<tr>
                                            <th width="50%"><#PCTRL_STIME#></th>
                                            <td align="left">
                                            <input type="text" name="pctrl_stime" id="pctrl_stime" maxlength="5" class="input" size="5" value="">
                                            </td>
                                        </tr>
										
										<tr>
                                            <th width="50%"><#PCTRL_ETIME#></th>
                                            <td align="left">
                                            <input type="text" name="pctrl_etime" id="pctrl_etime" maxlength="5" class="input" size="5" value="">
                                            </td>
                                        </tr>
                                        
									</table>
                                    <table class="table">
                                        <tr>
                                            <td style="border: 0 none;"><center><input name="button" type="button" class="btn btn-primary" style="width: 219px" onclick="applyRule();" value="<#CTL_apply#>"/></center></td>
                                        </tr>
                                    </table>
									<table class="table" width="100%" align="center" cellpadding="4" cellspacing="0" id="nnode_show_table">
									</table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </form>
    <div id="footer"></div>
</div>
</body>
</html>