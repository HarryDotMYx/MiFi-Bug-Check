<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - <#menu5_2_3#></title>
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
<script type="text/javascript" src="/client_function.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script>
var $j = jQuery.noConflict();
var update_timer;

$j(document).ready(function() {
	init_itoggle('vpn_enable_x');
	init_itoggle('vpn_pptp_mppe_x');
	init_itoggle('openvpn_tls_auth_x');
	//init_itoggle('openvpn_compress_x');
	//init_itoggle('openvpn_tls_client_x');
});

</script>
<script>

function initial(){
	show_banner(1);
	show_menu(5,8,1);
	show_footer();

	if (!checkSERIALNO())
	    return;
	
	load_body();
	vpn_type_change();
	vpn_status_set('<% nvram_get_x("2", "vpn_status"); %>');
	update_timer = setTimeout("update_vpn_status();", 2000);
}



function applyRule(){
	if(validForm()){
		showLoading();
		
		document.form.action_mode.value = " Restart ";
		document.form.current_page.value = "Advanced_VPN_Content.asp";
		document.form.next_page.value = "";
		document.form.action_script.value = "vpn_setting";
		
		//document.form.submit();
		if(document.form.vpn_type.value == "2"){
			var files = $j("#openvpn")[0].files[0];
			var url = "/openvpn.cgi";
		}else if(document.form.vpn_type.value == "3"){
			var files = $j("#wireguard")[0].files[0];
			var url = "/wireguard.cgi";
		}else{
			document.form.submit();
			return true;
		}
		if(files){
			var fd = new FormData();
			fd.append("file",files);
			$j.ajax({
				type: 'POST',
				url: url,
				data: fd,
				cache: false,
				processData: false,
				contentType: false,
				success: function(res){
					document.form.submit();
				}
			});
		}else{
			document.form.submit();
		}
	}
}

function validForm(){
	return true;
}

function changeBgColor(obj, num){
	$("row" + num).style.background=(obj.checked)?'#D9EDF7':'whiteSmoke';
}

function vpn_type_change()
{
	if (document.form.vpn_type.value == "0"){
		showhide_div("vpn_pptp_mppe",1);
		showhide_div("vpn_pptp_server",1);
		showhide_div("vpn_pptp_username",1);
		showhide_div("vpn_pptp_password",1);
		showhide_div("vpn_l2tp_server",0);
		showhide_div("vpn_l2tp_username",0);
		showhide_div("vpn_l2tp_password",0);
		showhide_div("openvpn_username",0);
		showhide_div("openvpn_password",0);
		showhide_div("openvpn_config_file",0);
		showhide_div("wireguard_config_file",0);
		showhide_div("zerotier_network_id",0);
		showhide_div("zerotier_address",0);
		/*
		showhide_div("openvpn_server",0);
		showhide_div("openvpn_proto",0);
		showhide_div("openvpn_port",0);
		showhide_div("openvpn_devtype",0);
		showhide_div("openvpn_authtype",0);
		showhide_div("openvpn_username",0);
		showhide_div("openvpn_password",0);
		showhide_div("openvpn_auth_alg",0);
		showhide_div("openvpn_cipher_alg",0);
		showhide_div("openvpn_tls_auth",0);
		showhide_div("openvpn_compress",0);
	
		showhide_div("wireguard_itf_pubkey",0);
		showhide_div("wireguard_itf_address",0);
		showhide_div("wireguard_itf_netmask",0);
		showhide_div("wireguard_itf_port",0);
		showhide_div("wireguard_itf_mtu",0);
		showhide_div("wireguard_peer_endpoint",0);
		showhide_div("wireguard_peer_port",0);
		showhide_div("wireguard_peer_pubkey",0);
		showhide_div("wireguard_peer_presharedkey",0);
		*/
	}else if (document.form.vpn_type.value == "1"){
		showhide_div("vpn_pptp_mppe",0);
		showhide_div("vpn_pptp_server",0);
		showhide_div("vpn_pptp_username",0);
		showhide_div("vpn_pptp_password",0);
		showhide_div("vpn_l2tp_server",1);
		showhide_div("vpn_l2tp_username",1);
		showhide_div("vpn_l2tp_password",1);
		showhide_div("openvpn_username",0);
		showhide_div("openvpn_password",0);
		showhide_div("openvpn_config_file",0);
		showhide_div("wireguard_config_file",0);
		showhide_div("zerotier_network_id",0);
		showhide_div("zerotier_address",0);
		/*
		showhide_div("openvpn_server",0);
		showhide_div("openvpn_proto",0);
		showhide_div("openvpn_port",0);
		showhide_div("openvpn_devtype",0);
		showhide_div("openvpn_authtype",0);
		
		showhide_div("openvpn_username",0);
		showhide_div("openvpn_password",0);
		showhide_div("openvpn_auth_alg",0);
		showhide_div("openvpn_cipher_alg",0);
		showhide_div("openvpn_tls_auth",0);
		showhide_div("openvpn_compress",0);
		
		showhide_div("wireguard_itf_pubkey",0);
		
		showhide_div("wireguard_itf_address",0);
		showhide_div("wireguard_itf_netmask",0);
		showhide_div("wireguard_itf_port",0);
		showhide_div("wireguard_itf_mtu",0);
		showhide_div("wireguard_peer_endpoint",0);
		showhide_div("wireguard_peer_port",0);
		showhide_div("wireguard_peer_pubkey",0);
		showhide_div("wireguard_peer_presharedkey",0);
		*/
	}else if(document.form.vpn_type.value == "2"){
		
		showhide_div("vpn_pptp_mppe",0);
		showhide_div("vpn_pptp_server",0);
		showhide_div("vpn_pptp_username",0);
		showhide_div("vpn_pptp_password",0);
		showhide_div("vpn_l2tp_server",0);
		showhide_div("vpn_l2tp_username",0);
		showhide_div("vpn_l2tp_password",0);
		showhide_div("openvpn_username",1);
		showhide_div("openvpn_password",1);
		showhide_div("openvpn_config_file",1);
		showhide_div("wireguard_config_file",0);
		showhide_div("zerotier_network_id",0);
		showhide_div("zerotier_address",0);
		/*
		showhide_div("openvpn_server",1);
		showhide_div("openvpn_proto",1);
		showhide_div("openvpn_port",1);
		showhide_div("openvpn_devtype",1);
		showhide_div("openvpn_authtype",1);
		if(document.form.openvpn_authtype.value == "0"){
			showhide_div("openvpn_username",0);
			showhide_div("openvpn_password",0);
		}else{
			showhide_div("openvpn_username",1);
			showhide_div("openvpn_password",1);
		}
		showhide_div("openvpn_auth_alg",1);
		showhide_div("openvpn_cipher_alg",1);
		showhide_div("openvpn_tls_auth",1);
		showhide_div("openvpn_compress",1);
		showhide_div("wireguard_itf_pubkey",0);
		showhide_div("wireguard_itf_address",0);
		showhide_div("wireguard_itf_netmask",0);
		showhide_div("wireguard_itf_port",0);
		showhide_div("wireguard_itf_mtu",0);
		showhide_div("wireguard_peer_endpoint",0);
		showhide_div("wireguard_peer_port",0);
		showhide_div("wireguard_peer_pubkey",0);
		showhide_div("wireguard_peer_presharedkey",0);
		*/
	}else if(document.form.vpn_type.value == "3"){
		/*
		showhide_div("wireguard_itf_pubkey",1);
		showhide_div("wireguard_itf_address",1);
		showhide_div("wireguard_itf_netmask",1);
		showhide_div("wireguard_itf_port",1);
		showhide_div("wireguard_itf_mtu",1);
		showhide_div("wireguard_peer_endpoint",1);
		showhide_div("wireguard_peer_port",1);
		showhide_div("wireguard_peer_pubkey",1);
		showhide_div("wireguard_peer_presharedkey",1);
		*/
		showhide_div("vpn_pptp_mppe",0);
		showhide_div("vpn_pptp_server",0);
		showhide_div("vpn_pptp_username",0);
		showhide_div("vpn_pptp_password",0);
		showhide_div("vpn_l2tp_server",0);
		showhide_div("vpn_l2tp_username",0);
		showhide_div("vpn_l2tp_password",0);
		showhide_div("openvpn_username",0);
		showhide_div("openvpn_password",0);
		showhide_div("openvpn_config_file",0);
		showhide_div("wireguard_config_file",1);
		showhide_div("zerotier_network_id",0);
		showhide_div("zerotier_address",0);
		/*
		showhide_div("openvpn_server",0);
		showhide_div("openvpn_proto",0);
		showhide_div("openvpn_port",0);
		showhide_div("openvpn_devtype",0);
		showhide_div("openvpn_authtype",0);
		showhide_div("openvpn_username",0);
		showhide_div("openvpn_password",0);
		showhide_div("openvpn_auth_alg",0);
		showhide_div("openvpn_cipher_alg",0);
		showhide_div("openvpn_tls_auth",0);
		showhide_div("openvpn_compress",0);
		*/
	}else if(document.form.vpn_type.value == "4"){
		showhide_div("vpn_pptp_mppe",0);
		showhide_div("vpn_pptp_server",0);
		showhide_div("vpn_pptp_username",0);
		showhide_div("vpn_pptp_password",0);
		showhide_div("vpn_l2tp_server",0);
		showhide_div("vpn_l2tp_username",0);
		showhide_div("vpn_l2tp_password",0);
		showhide_div("openvpn_username",0);
		showhide_div("openvpn_password",0);
		showhide_div("openvpn_config_file",0);
		showhide_div("wireguard_config_file",0);
		showhide_div("zerotier_network_id",1);
		showhide_div("zerotier_address",1);
	}else {
		document.form.vpn_type.value = "0";
		
		showhide_div("vpn_pptp_mppe",1);
		showhide_div("vpn_pptp_server",1);
		showhide_div("vpn_pptp_username",1);
		showhide_div("vpn_pptp_password",1);
		showhide_div("vpn_l2tp_server",0);
		showhide_div("vpn_l2tp_username",0);
		showhide_div("vpn_l2tp_password",0);
		/*
		showhide_div("openvpn_server",0);
		showhide_div("openvpn_proto",0);
		showhide_div("openvpn_port",0);
		showhide_div("openvpn_devtype",0);
		showhide_div("openvpn_authtype",0);
		showhide_div("openvpn_username",0);
		showhide_div("openvpn_password",0);
		showhide_div("openvpn_auth_alg",0);
		showhide_div("openvpn_cipher_alg",0);
		showhide_div("openvpn_tls_auth",0);
		showhide_div("openvpn_compress",0);
		showhide_div("wireguard_itf_pubkey",0);
		showhide_div("wireguard_itf_address",0);
		showhide_div("wireguard_itf_netmask",0);
		showhide_div("wireguard_itf_port",0);
		showhide_div("wireguard_itf_mtu",0);
		showhide_div("wireguard_peer_endpoint",0);
		showhide_div("wireguard_peer_port",0);
		showhide_div("wireguard_peer_pubkey",0);
		showhide_div("wireguard_peer_presharedkey",0);
		*/
		showhide_div("openvpn_username",0);
		showhide_div("openvpn_password",0);
		showhide_div("openvpn_config_file",0);
		showhide_div("wireguard_config_file",0);
		showhide_div("zerotier_network_id",0);
		showhide_div("zerotier_address",0);
	}
}
function vpn_status_set(status)
{
	if(status == "0"){
		$("vpn_status").innerHTML= "<#VPN_CLIENT_CONNECTTING#>";
	}else if(status == "1"){
		$("vpn_status").innerHTML= "<#VPN_CLIENT_CONNECTED#>";
	}else if(status == "2"){
		$("vpn_status").innerHTML= "<#VPN_CLIENT_DISCONNECT#>";
	}else{
		$("vpn_status").innerHTML= "<#VPN_CLIENT_DISCONNECT#>";
	}
}

function update_vpn_status(){
	clearTimeout(update_timer);
	$j.ajax({
		url: '/vpn_client_status.asp',
		dataType: 'script',
		cache: true,
		error: function(xhr){
			;
		},
		success: function(response){
			vpn_status_set(response);
			update_timer = setTimeout("update_vpn_status();", 2000);
		}
	});
}

</script>
<style>
.table-list td {
    padding: 6px 8px;
}
.table-list input,
.table-list select {
    margin-top: 0px;
    margin-bottom: 0px;
}
</style>
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
	<!--
    <form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">

    <input type="hidden" name="current_page" value="Advanced_VPN_Content.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="vpn_setting">
	-->
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
                            <h2 class="box_head round_top"><#menu5_7#> - <#menu5_7_9#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#VPN_HELP#></div>
                                    
                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
										<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
									<input type="hidden" name="current_page" value="Advanced_VPN_Content.asp">
									<input type="hidden" name="next_page" value="">
									<input type="hidden" name="next_host" value="">
									<input type="hidden" name="sid_list" value="">
									<input type="hidden" name="group_id" value="">
									<input type="hidden" name="action_mode" value="">
									<input type="hidden" name="action_script" value="vpn_setting">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#VPN_HELP#></th>
                                        </tr>
										<tr>
										<th width="50%"><#VPN_STATUS#></th>
                                            <td>
											<i id="vpn_status"><i>
											</td>
										</tr>
										<tr>
                                            <th width="50%"><#VPN_ENABLE#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="vpn_enable_x_on_of">
                                                        <input type="checkbox" id="vpn_enable_x_fake" <% nvram_match_x("","vpn_enable", "1", "value=1 checked"); %><% nvram_match_x("","vpn_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="vpn_enable_x" id="vpn_enable_x_1" value="1" <% nvram_match_x("","vpn_enable", "1", "checked"); %> /><#checkbox_Yes#>
                                                    <input type="radio" name="vpn_enable_x" id="vpn_enable_x_0" value="0" <% nvram_match_x("","vpn_enable", "0", "checked"); %> /><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
										
										<tr>
											<th width="50%"><#VPN_TYPE#></th>						  
											<td>
												<select onChange="vpn_type_change()" name="vpn_type" value="<% nvram_get_x("", "vpn_type"); %>">
												<option value="0" <% nvram_match_x("","vpn_type", "0","selected"); %>>pptp</option>
												<option value="1" <% nvram_match_x("","vpn_type", "1","selected"); %>>l2tp</option>
												<option value="2" <% nvram_match_x("","vpn_type", "2","selected"); %>>openvpn</option>
												<option value="3" <% nvram_match_x("","vpn_type", "3","selected"); %>>wireguard</option>
												<option value="4" <% nvram_match_x("","vpn_type", "4","selected"); %>>ZeroTier</option>
												</select>
											</td>
										</tr>
										
										<tr id="vpn_pptp_mppe">
                                            <th width="50%"><#PPTP_MPPE#></th>						  
											<td>
                                                <div class="main_itoggle">
                                                    <div id="vpn_pptp_mppe_x_on_of">
                                                        <input type="checkbox" id="vpn_pptp_mppe_x_fake" <% nvram_match_x("","mppe", "1", "value=1 checked"); %><% nvram_match_x("","mppe", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="vpn_pptp_mppe_x" id="vpn_pptp_mppe_x_1" value="1" <% nvram_match_x("","mppe", "1", "checked"); %> /><#checkbox_Yes#>
                                                    <input type="radio" name="vpn_pptp_mppe_x" id="vpn_pptp_mppe_x_0" value="0" <% nvram_match_x("","mppe", "0", "checked"); %> /><#checkbox_No#>
                                                </div>
                                            </td>
										</tr>
										
										<tr id="vpn_pptp_server">
                                            <th width="50%"><#PPTP_SERVER#></th>						  
											<td><input type="text" name="pptp_server" class="input" value="<% nvram_get_x("", "pptp_server"); %>"> </td>
										</tr>
										
										<tr id="vpn_pptp_username">
                                            <th width="50%"><#PPTP_USERNAME#></th>						  
											<td><input type="text" name="pptp_username" class="input" value="<% nvram_get_x("", "pptp_username"); %>"> </td>
										</tr>
										
										<tr id="vpn_pptp_password">
                                            <th width="50%"><#PPTP_PASSWORD#></th>						  
											<td><input type="text" name="pptp_password" class="input" value="<% nvram_get_x("", "pptp_password"); %>"> </td>
										</tr>
										
										<tr id="vpn_l2tp_server">
                                            <th width="50%"><#L2TP_SERVER#></th>						  
											<td><input type="text" name="l2tp_server" class="input" value="<% nvram_get_x("", "l2tp_server"); %>"> </td>
										</tr>
										
										<tr id="vpn_l2tp_username">
                                            <th width="50%"><#L2TP_USERNAME#></th>						  
											<td><input type="text" name="l2tp_username" class="input" value="<% nvram_get_x("", "l2tp_username"); %>"> </td>
										</tr>
										
										<tr id="vpn_l2tp_password">
                                            <th width="50%"><#L2TP_PASSWORD#></th>						  
											<td><input type="text" name="l2tp_password" class="input" value="<% nvram_get_x("", "l2tp_password"); %>"> </td>
										</tr>
										
										<!--
										<tr id="openvpn_server">
                                            <th width="50%"><#OPENVPN_SERVER#></th>						  
											<td><input type="text" name="openvpn_server" class="input" value="<% nvram_get_x("", "openvpn_server"); %>"> </td>
										</tr>
										
										<tr id="openvpn_proto">
											<th width="50%"><#OPENVPN_PROTO#></th>
											<td>
											<select name="openvpn_proto" value="<% nvram_get_x("", "openvpn_proto"); %>">
												<option value="tcp" <% nvram_match_x("","openvpn_proto", "tcp","selected"); %>>tcp</option>
												<option value="udp" <% nvram_match_x("","openvpn_proto", "udp","selected"); %>>udp</option>
											</select>
                                            </td>						  
										</tr>
										
										<tr id="openvpn_port">
                                            <th width="50%"><#OPENVPN_PORT#></th>						  
											<td><input type="text" name="openvpn_port" class="input" value="<% nvram_get_x("", "openvpn_port"); %>"> </td>
										</tr>
										
										<tr id="openvpn_devtype">
                                            <th width="50%"><#OPENVPN_DEVTYPE#></th>
											<td>
											<select name="openvpn_devtype" value="<% nvram_get_x("", "openvpn_devtype"); %>">
												<option value="tun" <% nvram_match_x("","openvpn_devtype", "tun","selected"); %>>tun</option>
												<option value="tap" <% nvram_match_x("","openvpn_devtype", "tap","selected"); %>>tap</option>
											</select>
                                            </td>
										</tr>
										
										<tr id="openvpn_authtype">
                                            <th width="50%"><#OPENVPN_AUTHTYPE#></th>
											<td>
											<select name="openvpn_authtype" onChange="vpn_type_change()" value="<% nvram_get_x("", "openvpn_authtype"); %>">
												<option value="0" <% nvram_match_x("","openvpn_authtype", "0","selected"); %>>certificate</option>
												<option value="1" <% nvram_match_x("","openvpn_authtype", "1","selected"); %>>username/password</option>
											</select>
                                            </td>
										</tr>
										-->
										<tr id="openvpn_username">
                                            <th width="50%"><#OPENVPN_USERNAME#></th>
											<td><input type="text" name="openvpn_username" class="input" value="<% nvram_get_x("", "openvpn_username"); %>"> </td>
										</tr>
										
										<tr id="openvpn_password">
                                            <th width="50%"><#OPENVPN_PASSWORD#></th>
											<td><input type="text" name="openvpn_password" class="input" value="<% nvram_get_x("", "openvpn_password"); %>"> </td>
										</tr>
										
										<!--
										<tr id="openvpn_auth_alg">
                                            <th width="50%"><#OPENVPN_AUTH_ALG#></th>
											<td>
											<select name="openvpn_auth_alg" value="<% nvram_get_x("", "openvpn_auth_alg"); %>">
												<option value="NONE" <% nvram_match_x("","openvpn_auth_alg", "NONE","selected"); %>>NONE</option>
												<option value="MD5" <% nvram_match_x("","openvpn_auth_alg", "MD5","selected"); %>>MD5</option>
												<option value="RSA-MD5" <% nvram_match_x("","openvpn_auth_alg", "RSA-MD5","selected"); %>>RSA-MD5</option>
												<option value="SHA1" <% nvram_match_x("","openvpn_auth_alg", "SHA1","selected"); %>>SHA1</option>
												<option value="RSA-SHA1" <% nvram_match_x("","openvpn_auth_alg", "RSA-SHA1","selected"); %>>RSA-SHA1</option>
												<option value="MDC2" <% nvram_match_x("","openvpn_auth_alg", "MDC2","selected"); %>>MDC2</option>
												<option value="RSA-MDC2" <% nvram_match_x("","openvpn_auth_alg", "RSA-MDC2","selected"); %>>RSA-MDC2</option>
												<option value="MD5-SHA1" <% nvram_match_x("","openvpn_auth_alg", "MD5-SHA1","selected"); %>>MD5-SHA1</option>
												<option value="RSA-SHA1-2" <% nvram_match_x("","openvpn_auth_alg", "RSA-SHA1-2","selected"); %>>RSA-SHA1-2</option>
												<option value="RIPEMD160" <% nvram_match_x("","openvpn_auth_alg", "RIPEMD160","selected"); %>>RIPEMD160</option>
												<option value="RSA-RIPEMD160" <% nvram_match_x("","openvpn_auth_alg", "RSA-RIPEMD160","selected"); %>>RSA-RIPEMD160</option>										
												<option value="MD4" <% nvram_match_x("","openvpn_auth_alg", "MD4","selected"); %>>MD4</option>
												<option value="RSA-MD4" <% nvram_match_x("","openvpn_auth_alg", "RSA-MD4","selected"); %>>RSA-MD4</option>
												<option value="SHA256" <% nvram_match_x("","openvpn_auth_alg", "SHA256","selected"); %>>SHA256</option>											
												<option value="SHA384" <% nvram_match_x("","openvpn_auth_alg", "SHA384","selected"); %>>SHA384</option>
												<option value="SHA512" <% nvram_match_x("","openvpn_auth_alg", "SHA512","selected"); %>>SHA512</option>
												<option value="SHA224" <% nvram_match_x("","openvpn_auth_alg", "SHA224","selected"); %>>SHA224</option>
												<option value="RSA-SHA256" <% nvram_match_x("","openvpn_auth_alg", "RSA-SHA256","selected"); %>>RSA-SHA256</option>											
												<option value="RSA-SHA384" <% nvram_match_x("","openvpn_auth_alg", "RSA-SHA384","selected"); %>>RSA-SHA384</option>
												<option value="RSA-SHA512" <% nvram_match_x("","openvpn_auth_alg", "RSA-SHA512","selected"); %>>RSA-SHA512</option>
												<option value="RSA-SHA224" <% nvram_match_x("","openvpn_auth_alg", "RSA-SHA224","selected"); %>>RSA-SHA224</option>
												<option value="whirlpool" <% nvram_match_x("","openvpn_auth_alg", "whirlpool","selected"); %>>whirlpool</option>											
												<option value="BLAKE2b512" <% nvram_match_x("","openvpn_auth_alg", "BLAKE2b512","selected"); %>>BLAKE2b512</option>
												<option value="BLAKE2b256" <% nvram_match_x("","openvpn_auth_alg", "BLAKE2b256","selected"); %>>BLAKE2b256</option>
												<option value="SHA512-224" <% nvram_match_x("","openvpn_auth_alg", "SHA512-224","selected"); %>>SHA512-224</option>
												<option value="SHA512-256" <% nvram_match_x("","openvpn_auth_alg", "SHA512-256","selected"); %>>SHA512-256</option>
												<option value="SHA3-224" <% nvram_match_x("","openvpn_auth_alg", "SHA3-224","selected"); %>>SHA3-224</option>
												<option value="SHA3-256" <% nvram_match_x("","openvpn_auth_alg", "SHA3-256","selected"); %>>SHA3-256</option>
												<option value="SHA3-384" <% nvram_match_x("","openvpn_auth_alg", "SHA3-384","selected"); %>>SHA3-384</option>
												<option value="SHA3-512" <% nvram_match_x("","openvpn_auth_alg", "SHA3-512","selected"); %>>SHA3-512</option>
												<option value="SHAKE128" <% nvram_match_x("","openvpn_auth_alg", "SHAKE128","selected"); %>>SHAKE128</option>
												<option value="SHAKE256" <% nvram_match_x("","openvpn_auth_alg", "SHAKE256","selected"); %>>SHAKE256</option>										
												<option value="id-rsassa-pkcs1-v1_5-with-sha3-224" <% nvram_match_x("","openvpn_auth_alg", "id-rsassa-pkcs1-v1_5-with-sha3-224","selected"); %>>id-rsassa-pkcs1-v1_5-with-sha3-224</option>
												<option value="id-rsassa-pkcs1-v1_5-with-sha3-256" <% nvram_match_x("","openvpn_auth_alg", "id-rsassa-pkcs1-v1_5-with-sha3-256","selected"); %>>id-rsassa-pkcs1-v1_5-with-sha3-256</option>
												<option value="id-rsassa-pkcs1-v1_5-with-sha3-384" <% nvram_match_x("","openvpn_auth_alg", "id-rsassa-pkcs1-v1_5-with-sha3-384","selected"); %>>id-rsassa-pkcs1-v1_5-with-sha3-384</option>
												<option value="id-rsassa-pkcs1-v1_5-with-sha3-512" <% nvram_match_x("","openvpn_auth_alg", "id-rsassa-pkcs1-v1_5-with-sha3-512","selected"); %>>id-rsassa-pkcs1-v1_5-with-sha3-512</option>	
												<option value="SM3" <% nvram_match_x("","openvpn_auth_alg", "SM3","selected"); %>>SM3</option>
												<option value="RSA-SM3" <% nvram_match_x("","openvpn_auth_alg", "RSA-SM3","selected"); %>>RSA-SM3</option>
												<option value="RSA-SHA512/224" <% nvram_match_x("","openvpn_auth_alg", "RSA-SHA512/224","selected"); %>>RSA-SHA512/224</option>
												<option value="RSA-SHA512/256" <% nvram_match_x("","openvpn_auth_alg", "RSA-SHA512/256","selected"); %>>RSA-SHA512/256</option>
											</select>
                                            </td>
										</tr>
										
										<tr id="openvpn_cipher_alg">
                                            <th width="50%"><#OPENVPN_CIPHER_ALG#></th>
											<td>
											<select name="openvpn_cipher_alg" id="openvpn_cipher_alg" value="<% nvram_get_x("", "openvpn_cipher_alg"); %>">
												<option value="NONE" <% nvram_match_x("","openvpn_cipher_alg", "NONE","selected"); %>>NONE</option>
												<option value="AES-128-CBC" <% nvram_match_x("","openvpn_cipher_alg", "AES-128-CBC","selected"); %>>AES-128-CBC</option>
												<option value="AES-128-CFB" <% nvram_match_x("","openvpn_cipher_alg", "AES-128-CFB","selected"); %>>AES-128-CFB</option>
												<option value="AES-128-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "AES-128-CFB1","selected"); %>>AES-128-CFB1</option>
												<option value="AES-128-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "AES-128-CFB8","selected"); %>>AES-128-CFB8</option>
												<option value="AES-128-GCM" <% nvram_match_x("","openvpn_cipher_alg", "AES-128-GCM","selected"); %>>AES-128-GCM</option>
												<option value="AES-128-OFB" <% nvram_match_x("","openvpn_cipher_alg", "AES-128-OFB","selected"); %>>AES-128-OFB</option>
												<option value="AES-192-CBC" <% nvram_match_x("","openvpn_cipher_alg", "AES-192-CBC","selected"); %>>AES-192-CBC</option>
												<option value="AES-192-CFB" <% nvram_match_x("","openvpn_cipher_alg", "AES-192-CFB","selected"); %>>AES-192-CFB</option>
												<option value="AES-192-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "AES-192-CFB1","selected"); %>>AES-192-CFB1</option>
												<option value="AES-192-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "AES-192-CFB8","selected"); %>>AES-192-CFB8</option>
												<option value="AES-192-GCM" <% nvram_match_x("","openvpn_cipher_alg", "AES-192-GCM","selected"); %>>AES-192-GCM</option>
												<option value="AES-192-OFB" <% nvram_match_x("","openvpn_cipher_alg", "AES-192-OFB","selected"); %>>AES-192-OFB</option>
												<option value="AES-256-CBC" <% nvram_match_x("","openvpn_cipher_alg", "AES-256-CBC","selected"); %>>AES-256-CBC</option>
												<option value="AES-256-CFB" <% nvram_match_x("","openvpn_cipher_alg", "AES-256-CFB","selected"); %>>AES-256-CFB</option>
												<option value="AES-256-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "AES-256-CFB1","selected"); %>>AES-256-CFB1</option>
												<option value="AES-256-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "AES-256-CFB8","selected"); %>>AES-256-CFB8</option>
												<option value="AES-256-GCM" <% nvram_match_x("","openvpn_cipher_alg", "AES-256-GCM","selected"); %>>AES-256-GCM</option>
												<option value="AES-256-OFB" <% nvram_match_x("","openvpn_cipher_alg", "AES-256-OFB","selected"); %>>AES-256-OFB</option>
												<option value="ARIA-128-CBC" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-128-CBC","selected"); %>>ARIA-128-CBC</option>
												<option value="ARIA-128-CFB" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-128-CFB","selected"); %>>ARIA-128-CFB</option>
												<option value="ARIA-128-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-128-CFB1","selected"); %>>ARIA-128-CFB1</option>
												<option value="ARIA-128-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-128-CFB8","selected"); %>>ARIA-128-CFB8</option>
												<option value="ARIA-128-OFB" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-128-OFB","selected"); %>>ARIA-128-OFB</option>
												<option value="ARIA-192-CBC" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-192-CBC","selected"); %>>ARIA-192-CBC</option>
												<option value="ARIA-192-CFB" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-192-CFB","selected"); %>>ARIA-192-CFB</option>
												<option value="ARIA-192-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-192-CFB1","selected"); %>>ARIA-192-CFB1</option>
												<option value="ARIA-192-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-192-CFB8","selected"); %>>ARIA-192-CFB8</option>
												<option value="ARIA-192-OFB" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-192-OFB","selected"); %>>ARIA-192-OFB</option>
												<option value="ARIA-256-CBC" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-256-CBC","selected"); %>>ARIA-256-CBC</option>
												<option value="ARIA-256-CFB" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-256-CFB","selected"); %>>ARIA-256-CFB</option>
												<option value="ARIA-256-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-256-CFB1","selected"); %>>ARIA-256-CFB1</option>
												<option value="ARIA-256-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-256-CFB8","selected"); %>>ARIA-256-CFB8</option>
												<option value="ARIA-256-OFB" <% nvram_match_x("","openvpn_cipher_alg", "ARIA-256-OFB","selected"); %>>ARIA-256-OFB</option>
												<option value="CAMELLIA-128-CBC" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-128-CBC","selected"); %>>CAMELLIA-128-CBC</option>
												<option value="CAMELLIA-128-CFB" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-128-CFB","selected"); %>>CAMELLIA-128-CFB</option>
												<option value="CAMELLIA-128-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-128-CFB1","selected"); %>>CAMELLIA-128-CFB1</option>
												<option value="CAMELLIA-128-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-128-CFB8","selected"); %>>CAMELLIA-128-CFB8</option>
												<option value="CAMELLIA-128-OFB" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-128-OFB","selected"); %>>CAMELLIA-128-OFB</option>
												<option value="CAMELLIA-192-CBC" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-192-CBC","selected"); %>>CAMELLIA-192-CBC</option>
												<option value="CAMELLIA-192-CFB" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-192-CFB","selected"); %>>CAMELLIA-192-CFB</option>
												<option value="CAMELLIA-192-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-192-CFB1","selected"); %>>CAMELLIA-192-CFB1</option>
												<option value="CAMELLIA-192-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-192-CFB8","selected"); %>>CAMELLIA-192-CFB8</option>
												<option value="CAMELLIA-192-OFB" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-192-OFB","selected"); %>>CAMELLIA-192-OFB</option>
												<option value="CAMELLIA-256-CBC" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-256-CBC","selected"); %>>CAMELLIA-256-CBC</option>
												<option value="CAMELLIA-256-CFB" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-256-CFB","selected"); %>>CAMELLIA-256-CFB</option>
												<option value="CAMELLIA-256-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-256-CFB1","selected"); %>>CAMELLIA-256-CFB1</option>
												<option value="CAMELLIA-256-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-256-CFB8","selected"); %>>CAMELLIA-256-CFB8</option>
												<option value="CAMELLIA-256-OFB" <% nvram_match_x("","openvpn_cipher_alg", "CAMELLIA-256-OFB","selected"); %>>CAMELLIA-256-OFB</option>
												<option value="CHACHA20-POLY1305" <% nvram_match_x("","openvpn_cipher_alg", "CHACHA20-POLY1305","selected"); %>>CHACHA20-POLY1305</option>
												<option value="SEED-CBC" <% nvram_match_x("","openvpn_cipher_alg", "SEED-CBC","selected"); %>>SEED-CBC</option>
												<option value="SEED-CFB" <% nvram_match_x("","openvpn_cipher_alg", "SEED-CFB","selected"); %>>SEED-CFB</option>
												<option value="SEED-OFB" <% nvram_match_x("","openvpn_cipher_alg", "SEED-OFB","selected"); %>>SEED-OFB</option>
												<option value="SM4-CBC" <% nvram_match_x("","openvpn_cipher_alg", "SM4-CBC","selected"); %>>SM4-CBC</option>
												<option value="SM4-CFB" <% nvram_match_x("","openvpn_cipher_alg", "SM4-CFB","selected"); %>>SM4-CFB</option>
												<option value="BF-CBC" <% nvram_match_x("","openvpn_cipher_alg", "BF-CBC","selected"); %>>BF-CBC</option>
												<option value="BF-CFB" <% nvram_match_x("","openvpn_cipher_alg", "BF-CFB","selected"); %>>BF-CFB</option>
												<option value="BF-OFB" <% nvram_match_x("","openvpn_cipher_alg", "BF-OFB","selected"); %>>BF-OFB</option>
												<option value="CAST5-CBC" <% nvram_match_x("","openvpn_cipher_alg", "CAST5-CBC","selected"); %>>CAST5-CBC</option>
												<option value="CAST5-CFB" <% nvram_match_x("","openvpn_cipher_alg", "CAST5-CFB","selected"); %>>CAST5-CFB</option>
												<option value="CAST5-OFB" <% nvram_match_x("","openvpn_cipher_alg", "CAST5-OFB","selected"); %>>CAST5-OFB</option>
												<option value="DES-CBC" <% nvram_match_x("","openvpn_cipher_alg", "DES-CBC","selected"); %>>DES-CBC</option>
												<option value="DES-CFB" <% nvram_match_x("","openvpn_cipher_alg", "DES-CFB","selected"); %>>DES-CFB</option>
												<option value="DES-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "DES-CFB1","selected"); %>>DES-CFB1</option>
												<option value="DES-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "DES-CFB8","selected"); %>>DES-CFB8</option>
												<option value="DES-EDE-CBC" <% nvram_match_x("","openvpn_cipher_alg", "DES-EDE-CBC","selected"); %>>DES-EDE-CBC</option>
												<option value="DES-EDE-CFB" <% nvram_match_x("","openvpn_cipher_alg", "DES-EDE-CFB","selected"); %>>DES-EDE-CFB</option>
												<option value="DES-EDE-OFB" <% nvram_match_x("","openvpn_cipher_alg", "DES-EDE-OFB","selected"); %>>DES-EDE-OFB</option>
												<option value="DES-EDE3-CBC" <% nvram_match_x("","openvpn_cipher_alg", "DES-EDE3-CBC","selected"); %>>DES-EDE3-CBC</option>
												<option value="DES-EDE3-CFB" <% nvram_match_x("","openvpn_cipher_alg", "DES-EDE3-CFB","selected"); %>>DES-EDE3-CFB</option>
												<option value="DES-EDE3-CFB1" <% nvram_match_x("","openvpn_cipher_alg", "DES-EDE3-CFB1","selected"); %>>DES-EDE3-CFB1</option>
												<option value="DES-EDE3-CFB8" <% nvram_match_x("","openvpn_cipher_alg", "DES-EDE3-CFB8","selected"); %>>DES-EDE3-CFB8</option>
												<option value="DES-EDE3-OFB" <% nvram_match_x("","openvpn_cipher_alg", "DES-EDE3-OFB","selected"); %>>DES-EDE3-OFB</option>
												<option value="DES-OFB" <% nvram_match_x("","openvpn_cipher_alg", "DES-OFB","selected"); %>>DES-OFB</option>
												<option value="DESX-CBC" <% nvram_match_x("","openvpn_cipher_alg", "DESX-CBC","selected"); %>>DESX-CBC</option>
												<option value="IDEA-CBC" <% nvram_match_x("","openvpn_cipher_alg", "IDEA-CBC","selected"); %>>IDEA-CBC</option>
												<option value="IDEA-CFB" <% nvram_match_x("","openvpn_cipher_alg", "IDEA-CFB","selected"); %>>IDEA-CFB</option>
												<option value="IDEA-OFB" <% nvram_match_x("","openvpn_cipher_alg", "IDEA-OFB","selected"); %>>IDEA-OFB</option>
												<option value="RC2-40-CBC" <% nvram_match_x("","openvpn_cipher_alg", "RC2-40-CBC","selected"); %>>RC2-40-CBC</option>
												<option value="RC2-64-CBC" <% nvram_match_x("","openvpn_cipher_alg", "RC2-64-CBC","selected"); %>>RC2-64-CBC</option>
												<option value="RC2-CBC" <% nvram_match_x("","openvpn_cipher_alg", "RC2-CBC","selected"); %>>RC2-CBC</option>
												<option value="RC2-CFB" <% nvram_match_x("","openvpn_cipher_alg", "RC2-CFB","selected"); %>>RC2-CFB</option>
												<option value="RC2-OFB" <% nvram_match_x("","openvpn_cipher_alg", "RC2-OFB","selected"); %>>RC2-OFB</option>
											</select>
                                            </td>
										</tr>
										
										<tr id="openvpn_tls_auth">
                                            <th width="50%"><#OPENVPN_TLS_AUTH#></th>						  
											<td>
                                                <div class="main_itoggle">
                                                    <div id="openvpn_tls_auth_x_on_of">
                                                        <input type="checkbox" id="openvpn_tls_auth_x_fake" <% nvram_match_x("","openvpn_tls_auth", "1", "value=1 checked"); %><% nvram_match_x("","openvpn_tls_auth", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="openvpn_tls_auth_x" id="openvpn_tls_auth_x_1" value="1" <% nvram_match_x("","openvpn_tls_auth", "1", "checked"); %> /><#checkbox_Yes#>
                                                    <input type="radio" name="openvpn_tls_auth_x" id="openvpn_tls_auth_x_0" value="0" <% nvram_match_x("","openvpn_tls_auth", "0", "checked"); %> /><#checkbox_No#>
                                                </div>
                                            </td>
										</tr>
										
										<tr id="openvpn_compress">
                                            <th width="50%"><#OPENVPN_COMPRESS#></th>
											<td>
											<select name="openvpn_compress_alg" id="openvpn_compress_alg" value="<% nvram_get_x("", "openvpn_compress_alg"); %>">
											<option value="NONE" <% nvram_match_x("","openvpn_compress_alg", "NONE","selected"); %>>none</option>
											<option value="lzo" <% nvram_match_x("","openvpn_compress_alg", "lzo","selected"); %>>lzo</option>
											<option value="lz4" <% nvram_match_x("","openvpn_compress_alg", "lz4","selected"); %>>lz4</option>
											<option value="lz4-v2" <% nvram_match_x("","openvpn_compress_alg", "lz4-v2","selected"); %>>lz4-v2</option>
											<option value="stub" <% nvram_match_x("","openvpn_compress_alg", "stub","selected"); %>>stub</option>
											<option value="stub-v2" <% nvram_match_x("","openvpn_compress_alg", "stub-v2","selected"); %>>stub-v2</option>
											<option value="migrate" <% nvram_match_x("","openvpn_compress_alg", "migrate","selected"); %>>migrate</option>
											</select>
											</td>
										</tr>
										
										-->
										
										<!--
										<tr id="wireguard_itf_pubkey">
                                            <th width="50%"><#WIREGUARD_LOCAL_PUBLIC_KEY#></th>
											<td>
												<textarea name="wg_itf_pubkey" class="input" readonly="readonly"><% nvram_get_x("", "wg_cli_public_key"); %></textarea>
												<input name="button" type="button" class="btn btn-primary" onclick="generate_new_key();" value="<#WIREGUARD_GENERATE_KEY#>"/>
											</td>
										</tr>
										
										<tr id="wireguard_itf_address">
                                            <th width="50%"><#WIREGUARD_LOCAL_ADDRESS#></th>
											<td><input type="text" name="wg_itf_address" class="input" value="<% nvram_get_x("", "wg_itf_address"); %>"> </td>
										</tr>
										
										<tr id="wireguard_itf_netmask">
                                            <th width="50%"><#WIREGUARD_LOCAL_NETMASK#></th>
											<td><input type="text" name="wg_itf_netmask" class="input" value="<% nvram_get_x("", "wg_itf_netmask"); %>"> </td>
										</tr>
										
										<tr id="wireguard_itf_port">
                                            <th width="50%"><#WIREGUARD_LOCAL_PORT#></th>
											<td><input type="text" name="wg_itf_port" class="input" value="<% nvram_get_x("", "wg_itf_port"); %>"> </td>
										</tr>
										
										<tr id="wireguard_itf_mtu">
                                            <th width="50%"><#WIREGUARD_LOCAL_MTU#></th>
											<td><input type="text" name="wg_itf_mtu" class="input" value="<% nvram_get_x("", "wg_itf_mtu"); %>"> </td>
										</tr>
										
										<tr id="wireguard_peer_endpoint">
                                            <th width="50%"><#WIREGUARD_PEER_ENDPOINT#></th>
											<td><input type="text" name="wg_peer_endpoint" class="input" value="<% nvram_get_x("", "wg_peer_endpoint"); %>"> </td>
										</tr>
										
										<tr id="wireguard_peer_port">
                                            <th width="50%"><#WIREGUARD_PEER_PORT#></th>
											<td><input type="text" name="wg_peer_port" class="input" value="<% nvram_get_x("", "wg_peer_port"); %>"> </td>
										</tr>
										
										<tr id="wireguard_peer_pubkey">
                                            <th width="50%"><#WIREGUARD_PEER_PUBLIC_KEY#></th>
											<td><input type="text" name="wg_peer_public_key" class="input" value="<% nvram_get_x("", "wg_peer_public_key"); %>"> </td>
										</tr>
										
										<tr id="wireguard_peer_presharedkey">
                                            <th width="50%"><#WIREGUARD_PEER_PRESHARED_KEY#></th>
											<td><input type="text" name="wg_peer_preshare_key" class="input" value="<% nvram_get_x("", "wg_peer_preshare_key"); %>"> </td>
										</tr>
										-->
										<tr id="zerotier_address">
                                            <th width="50%"><#ZEROTIER_ADDRESS#></th>
											<td><input type="text" name="zt_network_id" class="input" readonly="readonly" value="<% nvram_get_x("", "zerotier_addr"); %>"> </td>
										</tr>
										
										<tr id="zerotier_network_id">
                                            <th width="50%"><#ZEROTIER_NETWORK_ID#></th>
											<td><input type="text" name="zt_network_id" class="input" value="<% nvram_get_x("", "zt_network_id"); %>"> </td>
										</tr>
										</form>
										
										<tr id="openvpn_config_file">
											<form method="post" name="openvpnForm" id="openvpnForm" action="openvpn.cgi" target="hidden_frame" enctype="multipart/form-data">
                                            <th width="50%"><#OPENVPN_CONFIG_FILE#></th>
                                            <td>
												<input type="file" name="openvpn" id= "openvpn" size="36" class="input"/><br/>
                                            </td>
											</form>
                                        </tr>
										
										<tr id="wireguard_config_file">
											<form method="post" name="wireguardForm" id="wireguardForm" action="wireguard.cgi" target="hidden_frame" enctype="multipart/form-data">
                                            <th width="50%"><#WIREGUARD_CONFIG_FILE#></th>
                                            <td>
												<input type="file" name="wireguard" id= "wireguard" size="36" class="input"/><br/>
                                            </td>
											</form>
                                        </tr>
										</table>
									
                                    <table class="table">
                                        <tr>
                                            <td style="border: 0 none;"><center><input name="button" type="button" class="btn btn-primary" style="width: 219px" onclick="applyRule();" value="<#CTL_apply#>"/></center></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="footer"></div>
</div>
</body>
</html>
