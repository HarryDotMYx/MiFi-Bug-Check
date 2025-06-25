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

</script>
<script>

<% login_state_hook(); %>

function initial(){
	show_banner(1);
	show_menu(5,6,3);
	show_footer();

	if(!checkSERIALNO())
        return;
	update_nnode_info();
}

function applyRule(){
	if(validForm()){
		showLoading();
		document.form.next_page.value = "";
		document.form.action_mode.value = " ApplyCellLock ";
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

function update_nnode_info() {
	$j.ajax({
		url: '/nnode.asp',
		dataType: 'script',
		error: function(xhr) {
			;
		},
		success: function(response) {
			var nnode = JSON.parse(response);
			var table1 = $j('#nnode_show_table');
			var code;
			var i;
			if(nnode.length > 0){
				code = '<tr><th style="width:30%;text-align:center;">pci</th><th style="width:30%;text-align:center;">earfcn</th><th style="width:30%;text-align:center;">rsrp</th></tr>';
				for(i = 0; i < nnode.length; i += 3){
					code += '<tr><td style="width:30%;text-align:center;">' + nnode[i] + '</td><td style="width:30%;text-align:center;">' + nnode[i+1] + '</td><td style="width:30%;text-align:center;">' + nnode[i+2] + '</td></tr>';
				}
			}else{
				code = "";
			}
			table1.html(code);
			setTimeout("update_nnode_info();", 2000);
		}
	});
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
    <input type="hidden" name="current_page" value="Advanced_CellLock_Content.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="LANHostConfig;General;Storage;">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="sys_settings_celllock">
    
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
                            <h2 class="box_head round_top"><#menu5_4#> - <#menu5_4_7#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#CELL_LOCK#></div>

                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th width="50%"><#PCI#></th>
                                            <td align="left">
                                            <input type="text" name="pci" id="pci" maxlength="15" class="input" size="15" value="<% nvram_get_x("","pci_lock"); %>">
                                            </td>
                                        </tr>
										
										<tr>
                                            <th width="50%"><#FREQ#></th>
                                            <td align="left">
                                            <input type="text" name="freq" id="freq" maxlength="15" class="input" size="15" value="<% nvram_get_x("","freq_lock"); %>">
                                            </td>
                                        </tr>
                                        
									</table>
                                    <table class="table">
                                        <tr>
                                            <td style="border: 0 none;"><center><input name="button" type="button" class="btn btn-primary" style="width: 219px" onclick="applyRule();" value="<#CTL_apply#>"/></center></td>
                                        </tr>
                                    </table>
									<table class="table" width="80%" align="center" cellpadding="4" cellspacing="0" id="nnode_show_table">
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
