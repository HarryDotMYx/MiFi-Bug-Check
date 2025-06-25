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
var idTimerPoll = 0;
$j(document).ready(function() {
//	init_itoggle('gw_arp_ping');
//	init_itoggle('x_DHCPClient', change_wan_dhcp_auto);
//	init_itoggle('wan_dnsenable_x', change_wan_dns_auto);
//	init_itoggle('vlan_filter', change_stb_port_and_vlan);
});
parent_control=[];
</script>
<script>

<% login_state_hook(); %>

function initial(){
	show_banner(1);
	show_menu(5,11,2);
	show_footer();

	if(!checkSERIALNO())
        return;
	
	load_pctrl();
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
	/*
	if(document.form.imei.value.length != 15){
		return false;
	}
	var i;
    for(i = 0; i < document.form.imei.value.length; i++) {
        if (document.form.imei.value.charAt(i) < '0' || document.form.imei.value.charAt(i) > '9') {
			return false;
		}
	}*/
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

function clean_data(e){
	clearTimeout(idTimerPoll);
	$j.ajax({
		type: "get",
		url: "/update.cgi",
        data: {
			output: "parent_control",
			arg0: e.id
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
	var code="<tr><th><#PCTRL_NAME#></th><th><#PCTRL_MAC#></th><th><#PCTRL_WEEK#></th><th><#PCTRL_STIME#></th><th><#PCTRL_ETIME#></th><th><#Clean#>:</th></tr>";
	for(i = 0; i < parent_control.length; i++){
		var pctrl = parent_control[i];
		code += "<tr>" + '<td style="width:20%;overflow-x:auto;">' + pctrl[0] + "</td>" + '<td style="width:20%;overflow-x:auto;">' + pctrl[1] + "</td>" + '<td style="width:20%;overflow-x:auto;">' + pctrl[2] + "</td>" + '<td style="width:10%;overflow-x:auto;">' + pctrl[3] + "</td>" + '<td style="width:10%;overflow-x:auto;">' + pctrl[4] + "</td>" + '<td style="width:10%;overflow-x:auto;"><input class="btn-primary"'+ ' id="' + pctrl[0] + '"' + ' onclick="clean_data(this);" type="button" value="<#Clean#>" /></td>' + "</tr>";
	}
	$j("#pctrl_list").html(code);
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

                                    <table id="pctrl_list" width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
									   
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