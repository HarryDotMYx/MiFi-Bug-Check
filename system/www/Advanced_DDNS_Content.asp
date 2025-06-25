<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - <#menu5_18_20#></title>
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
	init_itoggle('ddns_enable');
});

</script>
<script>

function initial(){
	show_banner(1);
	show_menu(5,10,1);
	show_footer();
	
	load_body();
}


function applyRule(){
		showLoading();
		document.form.current_page.value = "Advanced_DDNS_Content.asp";
		document.form.next_page.value = "";
		document.form.submit();
}
</script>
<style>
    .table th, .table td{vertical-align: middle;}
    .table input, .table select {margin-bottom: 0px;}
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
    <input type="hidden" name="current_page" value="Advanced_DDNS_Content.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="set_ddns">

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
                            <h2 class="box_head round_top"><#menu5_18_20#> - <#menu5_18_20#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#DDNS_DESC#></div>

                                    <table width="100%" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#DDNS#></th>
                                        </tr>
										<tr>
                                            <th width="50%"><#DDNS_ENABLE#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="ddns_enable_on_of">
                                                        <input type="checkbox" id="ddns_enable_fake" <% nvram_match_x("", "ddns_enable", "1", "value=1 checked"); %><% nvram_match_x("", "ddns_enable", "0", "value=0"); %> />
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" value="1" name="ddns_enable" id="ddns_enable_1" <% nvram_match_x("", "ddns_enable", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" value="0" name="ddns_enable" id="ddns_enable_0" <% nvram_match_x("", "ddns_enable", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
										
                                        <tr>
                                            <th  width="50%"><#DDNS_SERVER#></th>
                                            <td>
                                                <input type="text" name="ddns_server" class="input" maxlength="39" value="<% nvram_get_x("", "ddns_server"); %>"/>
                                            </td>
                                        </tr>
										<tr>
                                            <th  width="50%"><#DDNS_LOGIN#></th>
                                            <td>
                                                <input type="text" name="ddns_login" class="input" maxlength="39" value="<% nvram_get_x("", "ddns_login"); %>"/>
                                            </td>
                                        </tr>
										
										<tr>
                                            <th  width="50%"><#DDNS_PASSWORD#></th>
                                            <td>
                                                <input type="text" name="ddns_password" class="input" maxlength="39" value="<% nvram_get_x("", "ddns_password"); %>"/>
                                            </td>
                                        </tr>
										<tr>
                                            <th  width="50%"><#DDNS_HOSTNAME#></th>
                                            <td>
                                                <input type="text" name="ddns_hostname" class="input" maxlength="39" value="<% nvram_get_x("", "ddns_hostname"); %>"/>
                                            </td>
                                        </tr>
										
                                    </table>
                                    <table class="table">
                                        <tr>
                                            <td style="border: 0 none;">
                                                <center><input class="btn btn-primary" style="width: 219px" onclick="applyRule();" type="button" value="<#CTL_apply#>" /></center>
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
