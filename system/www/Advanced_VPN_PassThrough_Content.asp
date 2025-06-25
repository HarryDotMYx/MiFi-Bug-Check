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


$j(document).ready(function() {
	init_itoggle('pptp_passthrough_x');
	init_itoggle('l2tp_passthrough_x');
	init_itoggle('ipsec_passthrough_x');
});

</script>
<script>

function initial(){
	show_banner(1);
	show_menu(5,8,2);
	show_footer();

	if (!checkSERIALNO())
	    return;
	
	load_body();
}

function applyRule(){
	if(validForm()){
		showLoading();
		
		document.form.action_mode.value = " Restart ";
		document.form.current_page.value = "Advanced_VPN_PassThrough_Content.asp";
		document.form.next_page.value = "";
		
		document.form.submit();
	}
}

function validForm(){
	return true;
}

function changeBgColor(obj, num){
	$("row" + num).style.background=(obj.checked)?'#D9EDF7':'whiteSmoke';
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

    <form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">

    <input type="hidden" name="current_page" value="Advanced_VPN_PassThrough_Content.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="vpn_passthrough">

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
                            <h2 class="box_head round_top"><#menu5_7#> - <#menu5_7_10#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#VPN_PASS_THROUGH#></div>
                                    
                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#VPN_PASS_THROUGH#></th>
                                        </tr>
										
										<tr>
                                            <th width="50%"><#PPTP#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="pptp_passthrough_x_on_of">
                                                        <input type="checkbox" id="pptp_passthrough_x_fake" <% nvram_match_x("","pptp_passthrough", "1", "value=1 checked"); %><% nvram_match_x("","pptp_passthrough", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="pptp_passthrough_x" id="pptp_passthrough_x_1" value="1" <% nvram_match_x("","pptp_passthrough", "1", "checked"); %> /><#checkbox_Yes#>
                                                    <input type="radio" name="pptp_passthrough_x" id="pptp_passthrough_x_0" value="0" <% nvram_match_x("","pptp_passthrough", "0", "checked"); %> /><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
										
										<tr>
                                            <th width="50%"><#L2TP#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="l2tp_passthrough_x_on_of">
                                                        <input type="checkbox" id="l2tp_passthrough_x_fake" <% nvram_match_x("","l2tp_passthrough", "1", "value=1 checked"); %><% nvram_match_x("","l2tp_passthrough", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="l2tp_passthrough_x" id="l2tp_passthrough_x_1" value="1" <% nvram_match_x("","l2tp_passthrough", "1", "checked"); %> /><#checkbox_Yes#>
                                                    <input type="radio" name="l2tp_passthrough_x" id="l2tp_passthrough_x_0" value="0" <% nvram_match_x("","l2tp_passthrough", "0", "checked"); %> /><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
										
										
										<tr>
                                            <th width="50%"><#IPSEC#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="ipsec_passthrough_x_on_of">
                                                        <input type="checkbox" id="ipsec_passthrough_x_fake" <% nvram_match_x("","ipsec_passthrough", "1", "value=1 checked"); %><% nvram_match_x("","ipsec_passthrough", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="ipsec_passthrough_x" id="ipsec_passthrough_x_1" value="1" <% nvram_match_x("","ipsec_passthrough", "1", "checked"); %> /><#checkbox_Yes#>
                                                    <input type="radio" name="ipsec_passthrough_x" id="ipsec_passthrough_x_0" value="0" <% nvram_match_x("","ipsec_passthrough", "0", "checked"); %> /><#checkbox_No#>
                                                </div>
                                            </td>
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

    </form>

    <div id="footer"></div>
</div>
</body>
</html>
