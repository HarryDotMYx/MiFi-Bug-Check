<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - 5G <#menu5_1_2#></title>
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
<script type="text/javascript" src="/wireless2.js"></script>
<script type="text/javascript" src="/help_wl.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/md5.js"></script>
<script>
var $j = jQuery.noConflict();

$j(document).ready(function() {
	init_itoggle('wl_guest_enable');
	init_itoggle('wl_closed_1');
});

</script>
<script>

<% firmware_caps_hook(); %>

function initial(){
	show_banner(1);
	show_menu(5,2,2);
	show_footer();
        if(!checkSERIALNO())
        return;
	if (!support_5g_11ac()){
		var o1 = document.form.wl_gmode_1;
		o1.remove(0);
		o1.remove(0);
		o1.options[0].text = "a/n Mixed (*)";
		insert_vht_bw(0);
//		o1 = document.form.wl_mcs_mode_1;
//		o1.remove(1);
//		o1.remove(1);
//		o1.remove(1);
	}
	if (support_5g_11ac()){
		var o1 = document.form.wl_gmode_1;
		o1.remove(3);
		o1.remove(3);
		o1.remove(3);
		insert_vht_bw(1);//qiqi
	}



	if (!support_5g_160mhz()){
		document.form.wl_HT_BW_1.remove(3);
	}

//	document.form.wl_radio_date_x_Sun.checked = getDateCheck(document.form.wl_radio_date_x.value, 0);
//	document.form.wl_radio_date_x_Mon.checked = getDateCheck(document.form.wl_radio_date_x.value, 1);
//	document.form.wl_radio_date_x_Tue.checked = getDateCheck(document.form.wl_radio_date_x.value, 2);
//	document.form.wl_radio_date_x_Wed.checked = getDateCheck(document.form.wl_radio_date_x.value, 3);
//	document.form.wl_radio_date_x_Thu.checked = getDateCheck(document.form.wl_radio_date_x.value, 4);
//	document.form.wl_radio_date_x_Fri.checked = getDateCheck(document.form.wl_radio_date_x.value, 5);
//	document.form.wl_radio_date_x_Sat.checked = getDateCheck(document.form.wl_radio_date_x.value, 6);
//	document.form.wl_radio_time_x_starthour.value = getTimeRange(document.form.wl_radio_time_x.value, 0);
//	document.form.wl_radio_time_x_startmin.value = getTimeRange(document.form.wl_radio_time_x.value, 1);
//	document.form.wl_radio_time_x_endhour.value = getTimeRange(document.form.wl_radio_time_x.value, 2);
//	document.form.wl_radio_time_x_endmin.value = getTimeRange(document.form.wl_radio_time_x.value, 3);
//	document.form.wl_radio_time2_x_starthour.value = getTimeRange(document.form.wl_radio_time2_x.value, 0);
//	document.form.wl_radio_time2_x_startmin.value = getTimeRange(document.form.wl_radio_time2_x.value, 1);
//	document.form.wl_radio_time2_x_endhour.value = getTimeRange(document.form.wl_radio_time2_x.value, 2);
//	document.form.wl_radio_time2_x_endmin.value = getTimeRange(document.form.wl_radio_time2_x.value, 3);

	document.form.wl_ssid_1.value = decodeURIComponent(document.form.wl_ssid2_1.value);
	document.form.wl_wpa_psk_1.value = decodeURIComponent(document.form.wl_wpa_psk_org_1.value);
	document.form.wl_key1_1.value = decodeURIComponent(document.form.wl_key1_org_1.value);
//	document.form.wl_key2.value = decodeURIComponent(document.form.wl_key2_org.value);
//	document.form.wl_key3.value = decodeURIComponent(document.form.wl_key3_org.value);
//	document.form.wl_key4.value = decodeURIComponent(document.form.wl_key4_org.value);
//	document.form.wl_phrase_x.value = decodeURIComponent(document.form.wl_phrase_x_org.value);

	if(document.form.wl_wpa_psk_1.value.length < 1)
		document.form.wl_wpa_psk_1.value = "Please type Password";

	insertChannelOption();
	wl_auth_mode_change(1);

	document.form.wl_channel_1.value = document.form.wl_channel_orig_1.value;

	load_body();

	automode_hint();
	enableExtChRows(document.form.wl_gmode_1);
	insertExtChannelOption();
}

function applyRule(){
	var auth_mode = document.form.wl_auth_mode_1.value;

	if(document.form.wl_wpa_psk_1.value == "Please type Password")
		document.form.wl_wpa_psk_1.value = "";

	if(validForm()){
//		document.form.wl_radio_date_x.value = setDateCheck(
//		    document.form.wl_radio_date_x_Sun,
//		    document.form.wl_radio_date_x_Mon,
//		    document.form.wl_radio_date_x_Tue,
//		    document.form.wl_radio_date_x_Wed,
//		    document.form.wl_radio_date_x_Thu,
//		    document.form.wl_radio_date_x_Fri,
//		    document.form.wl_radio_date_x_Sat);
//		document.form.wl_radio_time_x.value = setTimeRange(
//		    document.form.wl_radio_time_x_starthour,
//		    document.form.wl_radio_time_x_startmin,
//		    document.form.wl_radio_time_x_endhour,
//		    document.form.wl_radio_time_x_endmin);
//		document.form.wl_radio_time2_x.value = setTimeRange(
//		    document.form.wl_radio_time2_x_starthour,
//		    document.form.wl_radio_time2_x_startmin,
//		    document.form.wl_radio_time2_x_endhour,
//		    document.form.wl_radio_time2_x_endmin);
		
		showLoading();
		
		document.form.action_mode.value = " Apply ";
		document.form.current_page.value = "Advanced_Wireless_Content2.asp";
		document.form.next_page.value = "";
		
		if(auth_mode == "wpa" || auth_mode == "wpa2" || auth_mode == "radius")
			document.form.next_page.value = "Advanced_WSecurity_Content.asp";
		
		inputCtrl(document.form.wl_crypto_1, 1);
		inputCtrl(document.form.wl_wpa_psk_1, 1);
		inputCtrl(document.form.wl_wep_x_1, 1);
//		inputCtrl(document.form.wl_key, 1);
		inputCtrl(document.form.wl_key1_1, 1);
//		inputCtrl(document.form.wl_key2, 1);
//		inputCtrl(document.form.wl_key3, 1);
//		inputCtrl(document.form.wl_key4, 1);
//		inputCtrl(document.form.wl_phrase_x, 1);
//		inputCtrl(document.form.wl_wpa_gtk_rekey, 1);
		
		document.form.submit();
	}
}

function validForm(){
	var auth_mode = document.form.wl_auth_mode_1.value;

    if(document.form.wl_guest_enable[0].checked){
//        if(!validate_timerange(document.form.wl_radio_time_x_starthour, 0)
//                || !validate_timerange(document.form.wl_radio_time_x_startmin, 1)
//                || !validate_timerange(document.form.wl_radio_time_x_endhour, 2)
//                || !validate_timerange(document.form.wl_radio_time_x_endmin, 3)
//                )
//            return false;

//        var starttime = eval(document.form.wl_radio_time_x_starthour.value + document.form.wl_radio_time_x_startmin.value);
//        var endtime = eval(document.form.wl_radio_time_x_endhour.value + document.form.wl_radio_time_x_endmin.value);

//        if(starttime == endtime){
//            alert("<#FirewallConfig_URLActiveTime_itemhint2#>");
//                document.form.wl_radio_time_x_starthour.focus();
//                document.form.wl_radio_time_x_starthour.select;
//            return false;
//        }

//        if(!validate_timerange(document.form.wl_radio_time2_x_starthour, 0)
//                || !validate_timerange(document.form.wl_radio_time2_x_startmin, 1)
//                || !validate_timerange(document.form.wl_radio_time2_x_endhour, 2)
//                || !validate_timerange(document.form.wl_radio_time2_x_endmin, 3)
//                )
//            return false;

//        var starttime2 = eval(document.form.wl_radio_time2_x_starthour.value + document.form.wl_radio_time2_x_startmin.value);
//        var endtime2 = eval(document.form.wl_radio_time2_x_endhour.value + document.form.wl_radio_time2_x_endmin.value);

//        if(starttime2 == endtime2){
//            alert("<#FirewallConfig_URLActiveTime_itemhint2#>");
//                document.form.wl_radio_time2_x_starthour.focus();
//                document.form.wl_radio_time2_x_starthour.select;
//            return false;
//        }

//        if((document.form.wl_radio_date_x_Sun.checked ==false)
//                && (document.form.wl_radio_date_x_Mon.checked ==false)
//                && (document.form.wl_radio_date_x_Tue.checked ==false)
//                && (document.form.wl_radio_date_x_Wed.checked ==false)
//                && (document.form.wl_radio_date_x_Thu.checked ==false)
//                && (document.form.wl_radio_date_x_Fri.checked ==false)
//                && (document.form.wl_radio_date_x_Sat.checked ==false)){
//            alert("<#WLANConfig11b_x_RadioEnableDate_itemname#> - <#JS_fieldblank#>");
//            document.form.wl_radio_x[0].checked=false;
//            document.form.wl_radio_x[1].checked=true;
//            return false;
//        }
    }

	if(!validate_string_ssid(document.form.wl_ssid_1))
		return false;

	if(document.form.wl_ssid_1.value == "")
		document.form.wl_ssid_1.value = "ASUS_5G";
//
//	if(document.form.wl_wep_x.value != "0")
//		if(!validate_wlphrase('WLANConfig11a', 'wl_phrase_x', document.form.wl_phrase_x))
//			return false;

	if(auth_mode == "psk"){
		if(!validate_psk(document.form.wl_wpa_psk_1))
			return false;
		
//		if(!validate_range(document.form.wl_wpa_gtk_rekey, 0, 2592000))
//			return false;
	}
//	else if(auth_mode == "wpa" || auth_mode == "wpa2"){
//		if(!validate_range(document.form.wl_wpa_gtk_rekey, 0, 2592000))
//			return false;
//	}
//	else{
//		var cur_wep_key = eval('document.form.wl_key'+document.form.wl_key.value);
//		if(auth_mode != "radius" && !validate_wlkey(cur_wep_key))
//			return false;
//	}

	return true;
}

function done_validating(action){
	refreshpage();
}

function change_key_des(){
	var objs = getElementsByName_iefix("span", "key_des");
	var wep_type = document.form.wl_wep_x_1.value;
	var str = "";
	
	if(wep_type == "1")
		str = "(<#WLANConfig11b_WEPKey_itemtype1#>)";
	else if(wep_type == "2")
		str = "(<#WLANConfig11b_WEPKey_itemtype2#>)";
	
	for(var i = 0; i < objs.length; ++i)
		showtext(objs[i], str);
}

function validate_wlphrase(s, v, obj){
	if(!validate_string(obj)){
		is_wlphrase(s, v, obj);
		return(false);
	}
	
	return true;
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

    <iframe name="hidden_frame" id="hidden_frame" width="0" height="0" frameborder="0"></iframe>
    <form method="post" name="form" action="/start_apply.htm" target="hidden_frame">

    <input type="hidden" name="current_page" value="Advanced_Wireless_Content2.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="WLANConfig11a;">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="restart_wifis">

    <input type="hidden" name="wl_radio_date_x_1" value="<% nvram_get_x("","wl_radio_date_x_1"); %>">
    <input type="hidden" name="wl_radio_time_x_1" value="<% nvram_get_x("","wl_radio_time_x_1"); %>">
    <input type="hidden" name="wl_radio_time2_x_1" value="<% nvram_get_x("","wl_radio_time2_x_1"); %>">
    <input type="hidden" name="wl_ssid2_1" value="<% nvram_char_to_ascii("",  "wl_ssid_1"); %>">
    <input type="hidden" name="wl_wpa_mode_1" value="<% nvram_get_x("","wl_wpa_mode_1"); %>">
    <input type="hidden" name="wl_wpa_psk_org_1" value="<% nvram_char_to_ascii("", "wl_wpa_psk_1"); %>">
    <input type="hidden" name="wl_key1_org_1" value="<% nvram_char_to_ascii("", "wl_key1_1"); %>">
    <input type="hidden" name="wl_key2_org_1" value="<% nvram_char_to_ascii("", "wl_key2_1"); %>">
    <input type="hidden" name="wl_key3_org_1" value="<% nvram_char_to_ascii("", "wl_key3_1"); %>">
    <input type="hidden" name="wl_key4_org_1" value="<% nvram_char_to_ascii("", "wl_key4_1"); %>">
    <input type="hidden" name="wl_phrase_x_org_1" value="<% nvram_char_to_ascii("", "wl_phrase_x_1"); %>">
    <input type="hidden" name="wl_mode_x_1" value="<% nvram_get_x("","wl_mode_x_1"); %>">
    <input type="hidden" name="wl_nmode_1" value="<% nvram_get_x("","wl_nmode_1"); %>">
    <input type="hidden" name="wl_key_type_1" value='<% nvram_get_x("","wl_key_type_1"); %>'>
    <input type="hidden" name="wl_channel_orig_1" value='<% nvram_get_x("","wl_channel_1"); %>'>

    <input type="hidden" name="wl_country_code_1" value="<% nvram_get_x("","wl_country_code_1"); %>">

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
                            <h2 class="box_head round_top"><#menu5_1#> - <#menu5_1_2#> (5GHz)</h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>

                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th width="50%" style="border-top: 0 none;"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 22);"><#Guest_ap_enable#></a></th>
                                            <td style="border-top: 0 none;">
                                                <div class="main_itoggle">
                                                    <div id="wl_guest_enable_on_of">
                                                        <input type="checkbox" id="wl_guest_enable_fake" <% nvram_match_x("","wl_guest_enable", "1", "value=1 checked"); %><% nvram_match_x("","wl_guest_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="wl_guest_enable" id="wl_guest_enable_1" value="1" <% nvram_match_x("","wl_guest_enable", "1", "checked"); %> /><#checkbox_Yes#>
                                                    <input type="radio" name="wl_guest_enable" id="wl_guest_enable_0" value="0" <% nvram_match_x("","wl_guest_enable", "0", "checked"); %> /><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
										<tr>
										<th width="50%"><#StartTime#></th>
										<td>
										<select name="wl_guest_ap_smonth" style="width:50px;">
											<option value="1" <% nvram_match_x("","wl_wl_guest_ap_smonth", "1","selected"); %>>1</option>
											<option value="2" <% nvram_match_x("","wl_guest_ap_smonth", "2","selected"); %>>2</option>
											<option value="3" <% nvram_match_x("","wl_guest_ap_smonth", "3","selected"); %>>3</option>
											<option value="4" <% nvram_match_x("","wl_guest_ap_smonth", "4","selected"); %>>4</option>
											<option value="5" <% nvram_match_x("","wl_guest_ap_smonth", "5","selected"); %>>5</option>
											<option value="6" <% nvram_match_x("","wl_guest_ap_smonth", "6","selected"); %>>6</option>
											<option value="7" <% nvram_match_x("","wl_guest_ap_smonth", "7","selected"); %>>7</option>
											<option value="8" <% nvram_match_x("","wl_guest_ap_smonth", "8","selected"); %>>8</option>
											<option value="9" <% nvram_match_x("","wl_guest_ap_smonth", "9","selected"); %>>9</option>
											<option value="10" <% nvram_match_x("","wl_guest_ap_smonth", "10","selected"); %>>10</option>
											<option value="11" <% nvram_match_x("","wl_guest_ap_smonth", "11","selected"); %>>11</option>
											<option value="12" <% nvram_match_x("","wl_guest_ap_smonth", "12","selected"); %>>12</option>
										</select>
										<select name="wl_guest_ap_sdays" style="width:50px;">
											<option value="1" <% nvram_match_x("","wl_guest_ap_sdays", "1","selected"); %>>1</option>
											<option value="2" <% nvram_match_x("","wl_guest_ap_sdays", "2","selected"); %>>2</option>
											<option value="3" <% nvram_match_x("","wl_guest_ap_sdays", "3","selected"); %>>3</option>
											<option value="4" <% nvram_match_x("","wl_guest_ap_sdays", "4","selected"); %>>4</option>
											<option value="5" <% nvram_match_x("","wl_guest_ap_sdays", "5","selected"); %>>5</option>
											<option value="6" <% nvram_match_x("","wl_guest_ap_sdays", "6","selected"); %>>6</option>
											<option value="7" <% nvram_match_x("","wl_guest_ap_sdays", "7","selected"); %>>7</option>
											<option value="8" <% nvram_match_x("","wl_guest_ap_sdays", "8","selected"); %>>8</option>
											<option value="9" <% nvram_match_x("","wl_guest_ap_sdays", "9","selected"); %>>9</option>
											<option value="10" <% nvram_match_x("","wl_guest_ap_sdays", "10","selected"); %>>10</option>
											<option value="11" <% nvram_match_x("","wl_guest_ap_sdays", "11","selected"); %>>11</option>
											<option value="12" <% nvram_match_x("","wl_guest_ap_sdays", "12","selected"); %>>12</option>
											<option value="13" <% nvram_match_x("","wl_guest_ap_sdays", "13","selected"); %>>13</option>
											<option value="14" <% nvram_match_x("","wl_guest_ap_sdays", "14","selected"); %>>14</option>
											<option value="15" <% nvram_match_x("","wl_guest_ap_sdays", "15","selected"); %>>15</option>
											<option value="16" <% nvram_match_x("","wl_guest_ap_sdays", "16","selected"); %>>16</option>
											<option value="17" <% nvram_match_x("","wl_guest_ap_sdays", "17","selected"); %>>17</option>
											<option value="18" <% nvram_match_x("","wl_guest_ap_sdays", "18","selected"); %>>18</option>
											<option value="19" <% nvram_match_x("","wl_guest_ap_sdays", "19","selected"); %>>19</option>
											<option value="20" <% nvram_match_x("","wl_guest_ap_sdays", "20","selected"); %>>20</option>
											<option value="21" <% nvram_match_x("","wl_guest_ap_sdays", "21","selected"); %>>21</option>
											<option value="22" <% nvram_match_x("","wl_guest_ap_sdays", "22","selected"); %>>22</option>
											<option value="23" <% nvram_match_x("","wl_guest_ap_sdays", "23","selected"); %>>23</option>
											<option value="24" <% nvram_match_x("","wl_guest_ap_sdays", "24","selected"); %>>24</option>
											<option value="25" <% nvram_match_x("","wl_guest_ap_sdays", "25","selected"); %>>25</option>
											<option value="26" <% nvram_match_x("","wl_guest_ap_sdays", "26","selected"); %>>26</option>
											<option value="27" <% nvram_match_x("","wl_guest_ap_sdays", "27","selected"); %>>27</option>
											<option value="28" <% nvram_match_x("","wl_guest_ap_sdays", "28","selected"); %>>28</option>
											<option value="29" <% nvram_match_x("","wl_guest_ap_sdays", "29","selected"); %>>29</option>
											<option value="30" <% nvram_match_x("","wl_guest_ap_sdays", "30","selected"); %>>30</option>
											<option value="31" <% nvram_match_x("","wl_guest_ap_sdays", "31","selected"); %>>31</option>
										</select>
										<select name="wl_guest_ap_shour" style="width:50px;">
											<option value="0" <% nvram_match_x("","wl_guest_ap_shour", "0","selected"); %>>00</option>
											<option value="1" <% nvram_match_x("","wl_guest_ap_shour", "1","selected"); %>>01</option>
											<option value="2" <% nvram_match_x("","wl_guest_ap_shour", "2","selected"); %>>02</option>
											<option value="3" <% nvram_match_x("","wl_guest_ap_shour", "3","selected"); %>>03</option>
											<option value="4" <% nvram_match_x("","wl_guest_ap_shour", "4","selected"); %>>04</option>
											<option value="5" <% nvram_match_x("","wl_guest_ap_shour", "5","selected"); %>>05</option>
											<option value="6" <% nvram_match_x("","wl_guest_ap_shour", "6","selected"); %>>06</option>
											<option value="7" <% nvram_match_x("","wl_guest_ap_shour", "7","selected"); %>>07</option>
											<option value="8" <% nvram_match_x("","wl_guest_ap_shour", "8","selected"); %>>08</option>
											<option value="9" <% nvram_match_x("","wl_guest_ap_shour", "9","selected"); %>>09</option>
											<option value="10" <% nvram_match_x("","wl_guest_ap_shour", "10","selected"); %>>10</option>
											<option value="11" <% nvram_match_x("","wl_guest_ap_shour", "11","selected"); %>>11</option>
											<option value="12" <% nvram_match_x("","wl_guest_ap_shour", "12","selected"); %>>12</option>
											<option value="13" <% nvram_match_x("","wl_guest_ap_shour", "13","selected"); %>>13</option>
											<option value="14" <% nvram_match_x("","wl_guest_ap_shour", "14","selected"); %>>14</option>
											<option value="15" <% nvram_match_x("","wl_guest_ap_shour", "15","selected"); %>>15</option>
											<option value="16" <% nvram_match_x("","wl_guest_ap_shour", "16","selected"); %>>16</option>
											<option value="17" <% nvram_match_x("","wl_guest_ap_shour", "17","selected"); %>>17</option>
											<option value="18" <% nvram_match_x("","wl_guest_ap_shour", "18","selected"); %>>18</option>
											<option value="19" <% nvram_match_x("","wl_guest_ap_shour", "19","selected"); %>>19</option>
											<option value="20" <% nvram_match_x("","wl_guest_ap_shour", "20","selected"); %>>20</option>
											<option value="21" <% nvram_match_x("","wl_guest_ap_shour", "21","selected"); %>>21</option>
											<option value="22" <% nvram_match_x("","wl_guest_ap_shour", "22","selected"); %>>22</option>
											<option value="23" <% nvram_match_x("","wl_guest_ap_shour", "23","selected"); %>>23</option>
										</select>
										<select name="wl_guest_ap_smin" style="width:50px;">
											<option value="0" <% nvram_match_x("","wl_guest_ap_smin", "0","selected"); %>>00</option>
											<option value="1" <% nvram_match_x("","wl_guest_ap_smin", "1","selected"); %>>01</option>
											<option value="2" <% nvram_match_x("","wl_guest_ap_smin", "2","selected"); %>>02</option>
											<option value="3" <% nvram_match_x("","wl_guest_ap_smin", "3","selected"); %>>03</option>
											<option value="4" <% nvram_match_x("","wl_guest_ap_smin", "4","selected"); %>>04</option>
											<option value="5" <% nvram_match_x("","wl_guest_ap_smin", "5","selected"); %>>05</option>
											<option value="6" <% nvram_match_x("","wl_guest_ap_smin", "6","selected"); %>>06</option>
											<option value="7" <% nvram_match_x("","wl_guest_ap_smin", "7","selected"); %>>07</option>
											<option value="8" <% nvram_match_x("","wl_guest_ap_smin", "8","selected"); %>>08</option>
											<option value="9" <% nvram_match_x("","wl_guest_ap_smin", "9","selected"); %>>09</option>
											<option value="10" <% nvram_match_x("","wl_guest_ap_smin", "10","selected"); %>>10</option>
											<option value="11" <% nvram_match_x("","wl_guest_ap_smin", "11","selected"); %>>11</option>
											<option value="12" <% nvram_match_x("","wl_guest_ap_smin", "12","selected"); %>>12</option>
											<option value="13" <% nvram_match_x("","wl_guest_ap_smin", "13","selected"); %>>13</option>
											<option value="14" <% nvram_match_x("","wl_guest_ap_smin", "14","selected"); %>>14</option>
											<option value="15" <% nvram_match_x("","wl_guest_ap_smin", "15","selected"); %>>15</option>
											<option value="16" <% nvram_match_x("","wl_guest_ap_smin", "16","selected"); %>>16</option>
											<option value="17" <% nvram_match_x("","wl_guest_ap_smin", "17","selected"); %>>17</option>
											<option value="18" <% nvram_match_x("","wl_guest_ap_smin", "18","selected"); %>>18</option>
											<option value="19" <% nvram_match_x("","wl_guest_ap_smin", "19","selected"); %>>19</option>
											<option value="20" <% nvram_match_x("","wl_guest_ap_smin", "20","selected"); %>>20</option>
											<option value="21" <% nvram_match_x("","wl_guest_ap_smin", "21","selected"); %>>21</option>
											<option value="22" <% nvram_match_x("","wl_guest_ap_smin", "22","selected"); %>>22</option>
											<option value="23" <% nvram_match_x("","wl_guest_ap_smin", "23","selected"); %>>23</option>
											<option value="24" <% nvram_match_x("","wl_guest_ap_smin", "24","selected"); %>>24</option>
											<option value="25" <% nvram_match_x("","wl_guest_ap_smin", "25","selected"); %>>25</option>
											<option value="26" <% nvram_match_x("","wl_guest_ap_smin", "26","selected"); %>>26</option>
											<option value="27" <% nvram_match_x("","wl_guest_ap_smin", "27","selected"); %>>27</option>
											<option value="28" <% nvram_match_x("","wl_guest_ap_smin", "28","selected"); %>>28</option>
											<option value="29" <% nvram_match_x("","wl_guest_ap_smin", "29","selected"); %>>29</option>
											<option value="30" <% nvram_match_x("","wl_guest_ap_smin", "30","selected"); %>>30</option>
											<option value="31" <% nvram_match_x("","wl_guest_ap_smin", "31","selected"); %>>31</option>
											<option value="32" <% nvram_match_x("","wl_guest_ap_smin", "32","selected"); %>>32</option>
											<option value="33" <% nvram_match_x("","wl_guest_ap_smin", "33","selected"); %>>33</option>
											<option value="34" <% nvram_match_x("","wl_guest_ap_smin", "34","selected"); %>>34</option>
											<option value="35" <% nvram_match_x("","wl_guest_ap_smin", "35","selected"); %>>35</option>
											<option value="36" <% nvram_match_x("","wl_guest_ap_smin", "36","selected"); %>>36</option>
											<option value="37" <% nvram_match_x("","wl_guest_ap_smin", "37","selected"); %>>37</option>
											<option value="38" <% nvram_match_x("","wl_guest_ap_smin", "38","selected"); %>>38</option>
											<option value="39" <% nvram_match_x("","wl_guest_ap_smin", "39","selected"); %>>39</option>
											<option value="40" <% nvram_match_x("","wl_guest_ap_smin", "40","selected"); %>>40</option>
											<option value="41" <% nvram_match_x("","wl_guest_ap_smin", "41","selected"); %>>41</option>
											<option value="42" <% nvram_match_x("","wl_guest_ap_smin", "42","selected"); %>>42</option>
											<option value="43" <% nvram_match_x("","wl_guest_ap_smin", "43","selected"); %>>43</option>
											<option value="44" <% nvram_match_x("","wl_guest_ap_smin", "44","selected"); %>>44</option>
											<option value="45" <% nvram_match_x("","wl_guest_ap_smin", "45","selected"); %>>45</option>
											<option value="46" <% nvram_match_x("","wl_guest_ap_smin", "46","selected"); %>>46</option>
											<option value="47" <% nvram_match_x("","wl_guest_ap_smin", "47","selected"); %>>47</option>
											<option value="48" <% nvram_match_x("","wl_guest_ap_smin", "48","selected"); %>>48</option>
											<option value="49" <% nvram_match_x("","wl_guest_ap_smin", "49","selected"); %>>49</option>
											<option value="50" <% nvram_match_x("","wl_guest_ap_smin", "50","selected"); %>>50</option>
											<option value="51" <% nvram_match_x("","wl_guest_ap_smin", "51","selected"); %>>51</option>
											<option value="52" <% nvram_match_x("","wl_guest_ap_smin", "52","selected"); %>>52</option>
											<option value="53" <% nvram_match_x("","wl_guest_ap_smin", "53","selected"); %>>53</option>
											<option value="54" <% nvram_match_x("","wl_guest_ap_smin", "54","selected"); %>>54</option>
											<option value="55" <% nvram_match_x("","wl_guest_ap_smin", "55","selected"); %>>55</option>
											<option value="56" <% nvram_match_x("","wl_guest_ap_smin", "56","selected"); %>>56</option>
											<option value="57" <% nvram_match_x("","wl_guest_ap_smin", "56","selected"); %>>57</option>
											<option value="58" <% nvram_match_x("","wl_guest_ap_smin", "58","selected"); %>>58</option>
											<option value="59" <% nvram_match_x("","wl_guest_ap_smin", "59","selected"); %>>59</option>
										</select>
										</td>
										</tr>
										
										<tr>
										<th width="50%"><#EndTime#></th>
										<td>
										<select name="wl_guest_ap_emonth" style="width:50px;">
											<option value="1" <% nvram_match_x("","wl_guest_ap_emonth", "1","selected"); %>>1</option>
											<option value="2" <% nvram_match_x("","wl_guest_ap_emonth", "2","selected"); %>>2</option>
											<option value="3" <% nvram_match_x("","wl_guest_ap_emonth", "3","selected"); %>>3</option>
											<option value="4" <% nvram_match_x("","wl_guest_ap_emonth", "4","selected"); %>>4</option>
											<option value="5" <% nvram_match_x("","wl_guest_ap_emonth", "5","selected"); %>>5</option>
											<option value="6" <% nvram_match_x("","wl_guest_ap_emonth", "6","selected"); %>>6</option>
											<option value="7" <% nvram_match_x("","wl_guest_ap_emonth", "7","selected"); %>>7</option>
											<option value="8" <% nvram_match_x("","wl_guest_ap_emonth", "8","selected"); %>>8</option>
											<option value="9" <% nvram_match_x("","wl_guest_ap_emonth", "9","selected"); %>>9</option>
											<option value="10" <% nvram_match_x("","wl_guest_ap_emonth", "10","selected"); %>>10</option>
											<option value="11" <% nvram_match_x("","wl_guest_ap_emonth", "11","selected"); %>>11</option>
											<option value="12" <% nvram_match_x("","wl_guest_ap_emonth", "12","selected"); %>>12</option>
										</select>
										<select name="wl_guest_ap_edays" style="width:50px;">
											<option value="1" <% nvram_match_x("","wl_guest_ap_edays", "1","selected"); %>>1</option>
											<option value="2" <% nvram_match_x("","wl_guest_ap_edays", "2","selected"); %>>2</option>
											<option value="3" <% nvram_match_x("","wl_guest_ap_edays", "3","selected"); %>>3</option>
											<option value="4" <% nvram_match_x("","wl_guest_ap_edays", "4","selected"); %>>4</option>
											<option value="5" <% nvram_match_x("","wl_guest_ap_edays", "5","selected"); %>>5</option>
											<option value="6" <% nvram_match_x("","wl_guest_ap_edays", "6","selected"); %>>6</option>
											<option value="7" <% nvram_match_x("","wl_guest_ap_edays", "7","selected"); %>>7</option>
											<option value="8" <% nvram_match_x("","wl_guest_ap_edays", "8","selected"); %>>8</option>
											<option value="9" <% nvram_match_x("","wl_guest_ap_edays", "9","selected"); %>>9</option>
											<option value="10" <% nvram_match_x("","wl_guest_ap_edays", "10","selected"); %>>10</option>
											<option value="11" <% nvram_match_x("","wl_guest_ap_edays", "11","selected"); %>>11</option>
											<option value="12" <% nvram_match_x("","wl_guest_ap_edays", "12","selected"); %>>12</option>
											<option value="13" <% nvram_match_x("","wl_guest_ap_edays", "13","selected"); %>>13</option>
											<option value="14" <% nvram_match_x("","wl_guest_ap_edays", "14","selected"); %>>14</option>
											<option value="15" <% nvram_match_x("","wl_guest_ap_edays", "15","selected"); %>>15</option>
											<option value="16" <% nvram_match_x("","wl_guest_ap_edays", "16","selected"); %>>16</option>
											<option value="17" <% nvram_match_x("","wl_guest_ap_edays", "17","selected"); %>>17</option>
											<option value="18" <% nvram_match_x("","wl_guest_ap_edays", "18","selected"); %>>18</option>
											<option value="19" <% nvram_match_x("","wl_guest_ap_edays", "19","selected"); %>>19</option>
											<option value="20" <% nvram_match_x("","wl_guest_ap_edays", "20","selected"); %>>20</option>
											<option value="21" <% nvram_match_x("","wl_guest_ap_edays", "21","selected"); %>>21</option>
											<option value="22" <% nvram_match_x("","wl_guest_ap_edays", "22","selected"); %>>22</option>
											<option value="23" <% nvram_match_x("","wl_guest_ap_edays", "23","selected"); %>>23</option>
											<option value="24" <% nvram_match_x("","wl_guest_ap_edays", "24","selected"); %>>24</option>
											<option value="25" <% nvram_match_x("","wl_guest_ap_edays", "25","selected"); %>>25</option>
											<option value="26" <% nvram_match_x("","wl_guest_ap_edays", "26","selected"); %>>26</option>
											<option value="27" <% nvram_match_x("","wl_guest_ap_edays", "27","selected"); %>>27</option>
											<option value="28" <% nvram_match_x("","wl_guest_ap_edays", "28","selected"); %>>28</option>
											<option value="29" <% nvram_match_x("","wl_guest_ap_edays", "29","selected"); %>>29</option>
											<option value="30" <% nvram_match_x("","wl_guest_ap_edays", "30","selected"); %>>30</option>
											<option value="31" <% nvram_match_x("","wl_guest_ap_edays", "31","selected"); %>>31</option>
										</select>
										<select name="wl_guest_ap_ehour" style="width:50px;">
											<option value="0" <% nvram_match_x("","wl_guest_ap_ehour", "0","selected"); %>>00</option>
											<option value="1" <% nvram_match_x("","wl_guest_ap_ehour", "1","selected"); %>>01</option>
											<option value="2" <% nvram_match_x("","wl_guest_ap_ehour", "2","selected"); %>>02</option>
											<option value="3" <% nvram_match_x("","wl_guest_ap_ehour", "3","selected"); %>>03</option>
											<option value="4" <% nvram_match_x("","wl_guest_ap_ehour", "4","selected"); %>>04</option>
											<option value="5" <% nvram_match_x("","wl_guest_ap_ehour", "5","selected"); %>>05</option>
											<option value="6" <% nvram_match_x("","wl_guest_ap_ehour", "6","selected"); %>>06</option>
											<option value="7" <% nvram_match_x("","wl_guest_ap_ehour", "7","selected"); %>>07</option>
											<option value="8" <% nvram_match_x("","wl_guest_ap_ehour", "8","selected"); %>>08</option>
											<option value="9" <% nvram_match_x("","wl_guest_ap_ehour", "9","selected"); %>>09</option>
											<option value="10" <% nvram_match_x("","wl_guest_ap_ehour", "10","selected"); %>>10</option>
											<option value="11" <% nvram_match_x("","wl_guest_ap_ehour", "11","selected"); %>>11</option>
											<option value="12" <% nvram_match_x("","wl_guest_ap_ehour", "12","selected"); %>>12</option>
											<option value="13" <% nvram_match_x("","wl_guest_ap_ehour", "13","selected"); %>>13</option>
											<option value="14" <% nvram_match_x("","wl_guest_ap_ehour", "14","selected"); %>>14</option>
											<option value="15" <% nvram_match_x("","wl_guest_ap_ehour", "15","selected"); %>>15</option>
											<option value="16" <% nvram_match_x("","wl_guest_ap_ehour", "16","selected"); %>>16</option>
											<option value="17" <% nvram_match_x("","wl_guest_ap_ehour", "17","selected"); %>>17</option>
											<option value="18" <% nvram_match_x("","wl_guest_ap_ehour", "18","selected"); %>>18</option>
											<option value="19" <% nvram_match_x("","wl_guest_ap_ehour", "19","selected"); %>>19</option>
											<option value="20" <% nvram_match_x("","wl_guest_ap_ehour", "20","selected"); %>>20</option>
											<option value="21" <% nvram_match_x("","wl_guest_ap_ehour", "21","selected"); %>>21</option>
											<option value="22" <% nvram_match_x("","wl_guest_ap_ehour", "22","selected"); %>>22</option>
											<option value="23" <% nvram_match_x("","wl_guest_ap_ehour", "23","selected"); %>>23</option>
										</select>
										<select name="wl_guest_ap_emin" style="width:50px;">
											<option value="0" <% nvram_match_x("","wl_guest_ap_emin", "0","selected"); %>>00</option>
											<option value="1" <% nvram_match_x("","wl_guest_ap_emin", "1","selected"); %>>01</option>
											<option value="2" <% nvram_match_x("","wl_guest_ap_emin", "2","selected"); %>>02</option>
											<option value="3" <% nvram_match_x("","wl_guest_ap_emin", "3","selected"); %>>03</option>
											<option value="4" <% nvram_match_x("","wl_guest_ap_emin", "4","selected"); %>>04</option>
											<option value="5" <% nvram_match_x("","wl_guest_ap_emin", "5","selected"); %>>05</option>
											<option value="6" <% nvram_match_x("","wl_guest_ap_emin", "6","selected"); %>>06</option>
											<option value="7" <% nvram_match_x("","wl_guest_ap_emin", "7","selected"); %>>07</option>
											<option value="8" <% nvram_match_x("","wl_guest_ap_emin", "8","selected"); %>>08</option>
											<option value="9" <% nvram_match_x("","wl_guest_ap_emin", "9","selected"); %>>09</option>
											<option value="10" <% nvram_match_x("","wl_guest_ap_emin", "10","selected"); %>>10</option>
											<option value="11" <% nvram_match_x("","wl_guest_ap_emin", "11","selected"); %>>11</option>
											<option value="12" <% nvram_match_x("","wl_guest_ap_emin", "12","selected"); %>>12</option>
											<option value="13" <% nvram_match_x("","wl_guest_ap_emin", "13","selected"); %>>13</option>
											<option value="14" <% nvram_match_x("","wl_guest_ap_emin", "14","selected"); %>>14</option>
											<option value="15" <% nvram_match_x("","wl_guest_ap_emin", "15","selected"); %>>15</option>
											<option value="16" <% nvram_match_x("","wl_guest_ap_emin", "16","selected"); %>>16</option>
											<option value="17" <% nvram_match_x("","wl_guest_ap_emin", "17","selected"); %>>17</option>
											<option value="18" <% nvram_match_x("","wl_guest_ap_emin", "18","selected"); %>>18</option>
											<option value="19" <% nvram_match_x("","wl_guest_ap_emin", "19","selected"); %>>19</option>
											<option value="20" <% nvram_match_x("","wl_guest_ap_emin", "20","selected"); %>>20</option>
											<option value="21" <% nvram_match_x("","wl_guest_ap_emin", "21","selected"); %>>21</option>
											<option value="22" <% nvram_match_x("","wl_guest_ap_emin", "22","selected"); %>>22</option>
											<option value="23" <% nvram_match_x("","wl_guest_ap_emin", "23","selected"); %>>23</option>
											<option value="24" <% nvram_match_x("","wl_guest_ap_emin", "24","selected"); %>>24</option>
											<option value="25" <% nvram_match_x("","wl_guest_ap_emin", "25","selected"); %>>25</option>
											<option value="26" <% nvram_match_x("","wl_guest_ap_emin", "26","selected"); %>>26</option>
											<option value="27" <% nvram_match_x("","wl_guest_ap_emin", "27","selected"); %>>27</option>
											<option value="28" <% nvram_match_x("","wl_guest_ap_emin", "28","selected"); %>>28</option>
											<option value="29" <% nvram_match_x("","wl_guest_ap_emin", "29","selected"); %>>29</option>
											<option value="30" <% nvram_match_x("","wl_guest_ap_emin", "30","selected"); %>>30</option>
											<option value="31" <% nvram_match_x("","wl_guest_ap_emin", "31","selected"); %>>31</option>
											<option value="32" <% nvram_match_x("","wl_guest_ap_emin", "32","selected"); %>>32</option>
											<option value="33" <% nvram_match_x("","wl_guest_ap_emin", "33","selected"); %>>33</option>
											<option value="34" <% nvram_match_x("","wl_guest_ap_emin", "34","selected"); %>>34</option>
											<option value="35" <% nvram_match_x("","wl_guest_ap_emin", "35","selected"); %>>35</option>
											<option value="36" <% nvram_match_x("","wl_guest_ap_emin", "36","selected"); %>>36</option>
											<option value="37" <% nvram_match_x("","wl_guest_ap_emin", "37","selected"); %>>37</option>
											<option value="38" <% nvram_match_x("","wl_guest_ap_emin", "38","selected"); %>>38</option>
											<option value="39" <% nvram_match_x("","wl_guest_ap_emin", "39","selected"); %>>39</option>
											<option value="40" <% nvram_match_x("","wl_guest_ap_emin", "40","selected"); %>>40</option>
											<option value="41" <% nvram_match_x("","wl_guest_ap_emin", "41","selected"); %>>41</option>
											<option value="42" <% nvram_match_x("","wl_guest_ap_emin", "42","selected"); %>>42</option>
											<option value="43" <% nvram_match_x("","wl_guest_ap_emin", "43","selected"); %>>43</option>
											<option value="44" <% nvram_match_x("","wl_guest_ap_emin", "44","selected"); %>>44</option>
											<option value="45" <% nvram_match_x("","wl_guest_ap_emin", "45","selected"); %>>45</option>
											<option value="46" <% nvram_match_x("","wl_guest_ap_emin", "46","selected"); %>>46</option>
											<option value="47" <% nvram_match_x("","wl_guest_ap_emin", "47","selected"); %>>47</option>
											<option value="48" <% nvram_match_x("","wl_guest_ap_emin", "48","selected"); %>>48</option>
											<option value="49" <% nvram_match_x("","wl_guest_ap_emin", "49","selected"); %>>49</option>
											<option value="50" <% nvram_match_x("","wl_guest_ap_emin", "50","selected"); %>>50</option>
											<option value="51" <% nvram_match_x("","wl_guest_ap_emin", "51","selected"); %>>51</option>
											<option value="52" <% nvram_match_x("","wl_guest_ap_emin", "52","selected"); %>>52</option>
											<option value="53" <% nvram_match_x("","wl_guest_ap_emin", "53","selected"); %>>53</option>
											<option value="54" <% nvram_match_x("","wl_guest_ap_emin", "54","selected"); %>>54</option>
											<option value="55" <% nvram_match_x("","wl_guest_ap_emin", "55","selected"); %>>55</option>
											<option value="56" <% nvram_match_x("","wl_guest_ap_emin", "56","selected"); %>>56</option>
											<option value="57" <% nvram_match_x("","wl_guest_ap_emin", "56","selected"); %>>57</option>
											<option value="58" <% nvram_match_x("","wl_guest_ap_emin", "58","selected"); %>>58</option>
											<option value="59" <% nvram_match_x("","wl_guest_ap_emin", "59","selected"); %>>59</option>
										</select>
										</td>
										</tr>
<!--                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 23);"><#WLANConfig11b_x_RadioEnableDate_itemname#></a></th>
                                            <td>
                                                <div class="controls">
                                                    <label class="checkbox inline"><input type="checkbox" class="input" name="wl_radio_date_x_Mon" onChange="return changeDate();" /><#DAY_Mon#></label>
                                                    <label class="checkbox inline"><input type="checkbox" class="input" name="wl_radio_date_x_Tue" onChange="return changeDate();" /><#DAY_Tue#></label>
                                                    <label class="checkbox inline"><input type="checkbox" class="input" name="wl_radio_date_x_Wed" onChange="return changeDate();" /><#DAY_Wed#></label>
                                                    <label class="checkbox inline"><input type="checkbox" class="input" name="wl_radio_date_x_Thu" onChange="return changeDate();" /><#DAY_Thu#></label>
                                                    <label class="checkbox inline"><input type="checkbox" class="input" name="wl_radio_date_x_Fri" onChange="return changeDate();" /><#DAY_Fri#></label>
                                                </div>
                                            </td>
                                        </tr>-->
<!--                                        <tr>
                                            <th style="border-top: 0 none;"><a class="help_tooltip"  href="javascript:void(0);" onmouseover="openTooltip(this, 0, 24);"><#WLANConfig11b_x_RadioEnableTime_itemname#></a></th>
                                            <td style="border-top: 0 none;">
                                                <input type="text" maxlength="2" style="width: 20px;" size="2" name="wl_radio_time_x_starthour" onKeyPress="return is_number(this,event);" />:
                                                <input type="text" maxlength="2" style="width: 20px;" size="2" name="wl_radio_time_x_startmin" onKeyPress="return is_number(this,event);" />&nbsp;-&nbsp;
                                                <input type="text" maxlength="2" style="width: 20px;" size="2" name="wl_radio_time_x_endhour" onKeyPress="return is_number(this,event);" />:
                                                <input type="text" maxlength="2" style="width: 20px;" size="2" name="wl_radio_time_x_endmin" onKeyPress="return is_number(this,event);" />
                                            </td>
                                        </tr>-->
<!--                                        <tr>
                                            <th><#WLANConfig11b_x_RadioEnableDate_itemname2#></th>
                                            <td>
                                                <div class="controls">
                                                    <label class="checkbox inline"><input type="checkbox" class="input" name="wl_radio_date_x_Sat" onChange="return changeDate();" /><#DAY_Sat#></label>
                                                    <label class="checkbox inline"><input type="checkbox" class="input" name="wl_radio_date_x_Sun" onChange="return changeDate();" /><#DAY_Sun#></label>
                                                </div>
                                            </td>
                                        </tr>-->
<!--                                        <tr>
                                            <th style="border-top: 0 none;"><#WLANConfig11b_x_RadioEnableTime_itemname2#></th>
                                            <td style="border-top: 0 none;">
                                                <input type="text" maxlength="2" style="width: 20px;" size="2" name="wl_radio_time2_x_starthour" onKeyPress="return is_number(this,event);" />:
                                                <input type="text" maxlength="2" style="width: 20px;" size="2" name="wl_radio_time2_x_startmin" onKeyPress="return is_number(this,event);" />&nbsp;-&nbsp;
                                                <input type="text" maxlength="2" style="width: 20px;" size="2" name="wl_radio_time2_x_endhour" onKeyPress="return is_number(this,event);" />:
                                                <input type="text" maxlength="2" style="width: 20px;" size="2" name="wl_radio_time2_x_endmin" onKeyPress="return is_number(this,event);" />
                                            </td>
                                        </tr>-->
                                        <tr>
                                            <th width="50%"><a class="help_tooltip" href="javascript: void(0)" onmouseover="openTooltip(this, 0, 1);"><#WLANConfig11b_SSID_itemname#></a></th>
                                            <td><input type="text" maxlength="32" class="input" size="32" name="wl_ssid_1" value="" onkeypress="return is_string(this,event);"></td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 2);"><#WLANConfig11b_x_BlockBCSSID_itemname#></a></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="wl_closed_1_on_of">
                                                        <input type="checkbox" id="wl_closed_1_fake" <% nvram_match_x("", "wl_closed_1", "1", "value=1 checked"); %><% nvram_match_x("", "wl_closed_1", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" value="1" id="wl_closed_1_1" name="wl_closed_1" <% nvram_match_x("", "wl_closed_1", "1", "checked"); %> /><#checkbox_Yes#>
                                                    <input type="radio" value="0" id="wl_closed_1_0" name="wl_closed_1" <% nvram_match_x("", "wl_closed_1", "0", "checked"); %> /><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 4);"><#WLANConfig11b_x_Mode11g_itemname#></a></th>
                                            <td>
                                                <select name="wl_gmode_1" class="input" onChange="return change_common_wl(this, 'WLANConfig11a', 'wl_gmode_1')">
                                                    <option value="5" <% nvram_match_x("","wl_gmode_1", "5","selected"); %>>a/n/ac/ax Mixed (*)</option>
                                                    <option value="4" <% nvram_match_x("","wl_gmode_1", "4","selected"); %>>a/n/ac Mixed (*)</option>
                                                   <!-- <option value="3" <% nvram_match_x("","wl_gmode", "3","selected"); %>>n/ac Mixed</option>-->
                                                    <option value="2" <% nvram_match_x("","wl_gmode_1", "2","selected"); %>>a/n Mixed</option>
                                                    <option value="1" <% nvram_match_x("","wl_gmode_1", "1","selected"); %>>n Only</option>
                                                    <option value="0" <% nvram_match_x("","wl_gmode_1", "0","selected"); %>>a Only</option>                                          
                                                </select>
                                                <span id="wl_gmode_hint_1" style="display:none;color:#F75"><#WLANConfig11n_automode_limition_hint#></span>
                                            </td>
                                        </tr>
                                        <tr id="row_HT_BW">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 14);"><#WLANConfig11b_ChannelBW_itemname#></a></th>
                                            <td>
                                                <select name="wl_HT_BW_1" class="input" onChange="return change_common_wl(this, 'WLANConfig11a', 'wl_HT_BW_1')">
                                                    <option value="0" <% nvram_match_x("","wl_HT_BW_1", "0","selected"); %>>20 MHz</option>
                                                    <option value="1" <% nvram_match_x("","wl_HT_BW_1", "1","selected"); %>>20/40 MHz</option>
                                                    <option value="2" <% nvram_match_x("","wl_HT_BW_1", "2","selected"); %>>20/40/80 MHz</option>
                                                    <option value="3" <% nvram_match_x("","wl_HT_BW_1", "3","selected"); %>>20/40/80/160 MHz</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 3);"><#WLANConfig11b_Channel_itemname#></a></th>
                                            <td>
                                                <select name="wl_channel_1" class="input" onChange="return change_common_wl(this, 'WLANConfig11a', 'wl_channel_1')">
                                                </select>
                                            </td>
                                        </tr>
<!--                                        <tr id="row_HT_EXTCHA">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 15);"><#WLANConfig11b_EChannel_itemname#></a></th>
                                            <td>
                                                <select name="wl_HT_EXTCHA" class="input">
                                                    <option value="1" selected>Auto</option>
                                                </select>
                                            </td>
                                        </tr>-->
<!--                                        <tr>
                                            <th><#WIFIGuestMCS#></th>
                                            <td>
                                                <select name="wl_mcs_mode" class="input">
                                                    <option value="0" <% nvram_match_x("", "wl_mcs_mode", "0", "selected"); %>><#checkbox_No#> (*)</option>
                                                    <option value="7" <% nvram_match_x("", "wl_mcs_mode", "7", "selected"); %>>VHT (1S) 88 Mbps</option>
                                                    <option value="8" <% nvram_match_x("", "wl_mcs_mode", "8", "selected"); %>>VHT (1S) 58 Mbps</option>
                                                    <option value="9" <% nvram_match_x("", "wl_mcs_mode", "9", "selected"); %>>VHT (1S) 29 Mbps</option>
                                                    <option value="1" <% nvram_match_x("", "wl_mcs_mode", "1", "selected"); %>>HTMIX (1S) 45 Mbps</option>
                                                    <option value="2" <% nvram_match_x("", "wl_mcs_mode", "2", "selected"); %>>HTMIX (1S) 30 Mbps</option>
                                                    <option value="3" <% nvram_match_x("", "wl_mcs_mode", "3", "selected"); %>>HTMIX (1S) 15 Mbps</option>
                                                    <option value="4" <% nvram_match_x("", "wl_mcs_mode", "4", "selected"); %>>OFDM 12 Mbps</option>
                                                    <option value="5" <% nvram_match_x("", "wl_mcs_mode", "5", "selected"); %>>OFDM 9 Mbps</option>
                                                    <option value="6" <% nvram_match_x("", "wl_mcs_mode", "6", "selected"); %>>OFDM 6 Mbps</option>
                                                </select>
                                            </td>
                                        </tr>-->
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 5);"><#WLANConfig11b_AuthenticationMethod_itemname#></a></th>
                                            <td>
                                                <select name="wl_auth_mode_1" class="input" onChange="return change_common_wl(this, 'WLANConfig11a', 'wl_auth_mode_1');">
                                                    <option value="open" <% nvram_match_x("", "wl_auth_mode_1", "open", "selected"); %>>Open System</option>
                                                    <option value="shared" <% nvram_match_x("", "wl_auth_mode_1", "shared", "selected"); %>>Shared Key</option>
                                                    <option value="psk" <% nvram_double_match_x("", "wl_auth_mode_1", "psk", "", "wl_wpa_mode_1", "1", "selected"); %>>WPA-Personal</option>
                                                    <option value="psk" <% nvram_double_match_x("", "wl_auth_mode_1", "psk", "", "wl_wpa_mode_1", "2", "selected"); %>>WPA2-Personal</option>
                                                    <option value="psk" <% nvram_double_match_x("", "wl_auth_mode_1", "psk", "", "wl_wpa_mode_1", "0", "selected"); %>>WPA-Auto-Personal</option>
                           <!--                         <option value="wpa" <% nvram_double_match_x("", "wl_auth_mode", "wpa", "", "wl_wpa_mode", "3", "selected"); %>>WPA-Enterprise (Radius)</option>
                                                    <option value="wpa2" <% nvram_match_x("", "wl_auth_mode", "wpa2", "selected"); %>>WPA2-Enterprise (Radius)</option>
                                                    <option value="wpa" <% nvram_double_match_x("", "wl_auth_mode", "wpa", "", "wl_wpa_mode", "4", "selected"); %>>WPA-Auto-Enterprise (Radius)</option>
                                                    <option value="radius" <% nvram_match_x("", "wl_auth_mode", "radius", "selected"); %>>Radius with 802.1x</option>-->
                                                </select>
                                            </td>
                                        </tr>
                                        <tr id="row_wpa1">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 6);"><#WLANConfig11b_WPAType_itemname#></a></th>
                                            <td>
                                                <select name="wl_crypto_1" class="input" onChange="return change_common_wl(this, 'WLANConfig11a', 'wl_crypto_1')">
                                                    <option value="aes" <% nvram_match_x("", "wl_crypto_1", "aes", "selected"); %>>AES</option>
                                                    <option value="tkip+aes" <% nvram_match_x("", "wl_crypto_1", "tkip+aes", "selected"); %>>TKIP+AES</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr id="row_wpa2">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 7);"><#WLANConfig11b_x_PSKKey_itemname#></a></th>
                                            <td>
                                                <div class="input-append">
                                                    <input type="password" name="wl_wpa_psk_1" id="wl_wpa_psk_1" maxlength="64" size="32" value="" style="width: 175px;">
                                                    <button style="margin-left: -5px;" class="btn" type="button" onclick="passwordShowHide('wl_wpa_psk_1')"><i class="icon-eye-close"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="row_wep1">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 9);"><#WLANConfig11b_WEPType_itemname#></a></th>
                                            <td>
                                                <select name="wl_wep_x_1" class="input" onChange="return change_common_wl(this, 'WLANConfig11a', 'wl_wep_x_1');">
                                                    <option value="0" <% nvram_match_x("", "wl_wep_x_1", "0", "selected"); %>>None</option>
                                                    <option value="1" <% nvram_match_x("", "wl_wep_x_1", "1", "selected"); %>>WEP-64bits</option>
                                                    <option value="2" <% nvram_match_x("", "wl_wep_x_1", "2", "selected"); %>>WEP-128bits</option>
                                                </select>
                                                <br>
                                                <span name="key_des" style="color:#888"></span>
                                            </td>
                                        </tr>
<!--                                        <tr id="row_wep2">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 10);"><#WLANConfig11b_WEPDefaultKey_itemname#></a></th>
                                            <td>
                                                <select name="wl_key" class="input" onChange="return change_common_wl(this, 'WLANConfig11a', 'wl_key');">
                                                    <option value="1" <% nvram_match_x("","wl_key", "1","selected"); %>>1</option>
                                                    <option value="2" <% nvram_match_x("","wl_key", "2","selected"); %>>2</option>
                                                    <option value="3" <% nvram_match_x("","wl_key", "3","selected"); %>>3</option>
                                                    <option value="4" <% nvram_match_x("","wl_key", "4","selected"); %>>4</option>
                                                </select>
                                            </td>
                                        </tr>-->
                                        <tr id="row_wep3">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 18);"><#WLANConfig11b_WEPKey_itemname#></a></th>
                                            <td><input type="text" name="wl_key1_1" id="wl_key1_1" maxlength="32" class="input" size="34" value="" onKeyUp="return change_wlkey(this, 'WLANConfig11a');"></td>
                                        </tr>
<!--                                        <tr id="row_wep4">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 18);"><#WLANConfig11b_WEPKey2_itemname#></a></th>
                                            <td><input type="text" name="wl_key2" id="wl_key2" maxlength="32" class="input" size="34" value="" onKeyUp="return change_wlkey(this, 'WLANConfig11a');"></td>
                                        </tr>
                                        <tr id="row_wep5">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 18);"><#WLANConfig11b_WEPKey3_itemname#></a></th>
                                            <td><input type="text" name="wl_key3" id="wl_key3" maxlength="32" class="input" size="34" value="" onKeyUp="return change_wlkey(this, 'WLANConfig11a');"/></td>
                                        </tr>
                                        <tr id="row_wep6">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 18);"><#WLANConfig11b_WEPKey4_itemname#></a></th>
                                            <td><input type="text" name="wl_key4" id="wl_key4" maxlength="32" class="input" size="34" value="" onKeyUp="return change_wlkey(this, 'WLANConfig11a');"/></td>
                                        </tr>
                                        <tr id="row_wep7">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 8);"><#WLANConfig11b_x_Phrase_itemname#></a></th>
                                            <td>
                                                <input type="text" name="wl_phrase_x" maxlength="64" class="input" size="32" value="" onKeyUp="return is_wlphrase('WLANConfig11a', 'wl_phrase_x', this);" />
                                            </td>
                                        </tr>-->
   <!--                                     <tr id="row_wpa3">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 11);"><#WLANConfig11b_x_Rekey_itemname#></a></th>
                                            <td>
                                                <input type="text" maxlength="7" size="7" name="wl_wpa_gtk_rekey" class="input" value="<% nvram_get_x("", "wl_wpa_gtk_rekey"); %>" onKeyPress="return is_number(this,event);" />
                                                &nbsp;<span style="color:#888;">[0..2592000]</span>
                                            </td>
                                        </tr>-->
<!--                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 17);"><#WLANConfig11b_TxPower_itemname#></a></th>
                                            <td>
                                                <input type="text" maxlength="3" size="3" name="wl_TxPower" class="input" value="<% nvram_get_x("", "wl_TxPower"); %>" onKeyPress="return is_number(this,event);" onblur="return validate_range(this, 0, 100);" />
                                                &nbsp;<span style="color:#888;">[0..100]</span>
                                            </td>
                                        </tr>-->
<!--                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 25);"><#WLANConfig11b_KickStaRssiLow_itemname#></a></th>
                                            <td>
                                                <input type="text" maxlength="4" size="4" name="wl_KickStaRssiLow" class="input" value="<% nvram_get_x("", "wl_KickStaRssiLow"); %>" />
                                                &nbsp;<span style="color:#888;">[-100..0]</span>
                                            </td>
                                        </tr>-->
<!--                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 26);"><#WLANConfig11b_AssocReqRssiThres_itemname#></a></th>
                                            <td>
                                                <input type="text" maxlength="4" size="4" name="wl_AssocReqRssiThres" class="input" value="<% nvram_get_x("", "wl_AssocReqRssiThres"); %>" />
                                                &nbsp;<span style="color:#888;">[-100..0]</span>
                                            </td>
                                        </tr>-->
<!--
                                        <tr>
                                            <th><#WIFIRegionCode#></th>
                                            <td>
                                                <select name="wl_country_code" class="input" onChange="return change_common_wl(this, 'WLANConfig11a', 'wl_country_code')">
                                                    <option value="US" <% nvram_match_x("", "wl_country_code", "US","selected"); %>>USA (channels 36,40,44,48,149,153,157,161,165)</option>
                                                    <option value="AU" <% nvram_match_x("", "wl_country_code", "AU","selected"); %>>Australia (channels 36,40,44,48,149,153,157,161,165)</option>
                                                    <option value="NO" <% nvram_match_x("", "wl_country_code", "NO","selected"); %>>Norway (channels 36,40,44,48,149,153,157,161,165)</option>
                                                    <option value="FR" <% nvram_match_x("", "wl_country_code", "FR","selected"); %>>France (channels 36,40,44,48)</option>
                                                    <option value="GB" <% nvram_match_x("", "wl_country_code", "GB","selected"); %>>Europe (channels 36,40,44,48)</option>
                                                    <option value="TW" <% nvram_match_x("", "wl_country_code", "TW","selected"); %>>Taiwan (channels 149,153,157,161)</option>
                                                    <option value="CN" <% nvram_match_x("", "wl_country_code", "CN","selected"); %>>China (channels 36,40,44,48,149,153,157,161,165)</option>
                                                    <option value="KR" <% nvram_match_x("", "wl_country_code", "KR","selected"); %>>Korea (channels 149,153,157,161)</option>
                                                    <option value="JP" <% nvram_match_x("", "wl_country_code", "JP","selected"); %>>Japan (channels 36,40,44,48)</option>
                                                    <option value="DB" <% nvram_match_x("", "wl_country_code", "DB","selected"); %>>Debug (all channels)</option>
                                                </select>
                                            </td>
                                        </tr>
-->
                                    </table>

                                    <table class="table">
                                        <tr>
                                            <td style="border-top: 0 none;">
                                                <center><input type="button" id="applyButton" class="btn btn-primary" style="width: 219px" value="<#CTL_apply#>" onclick="applyRule();"></center>
                                            </td>
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
    </form>

    <div id="footer"></div>
</div>
</body>
</html>
