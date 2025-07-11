<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - <#menu5_6_13#></title>
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
	init_itoggle('enable_auto_sleep');
});

</script>
<script>

function initial(){
	show_banner(1);
	show_menu(5,7,5);
	show_footer();
	load_body();
}



function applyRuleSleep(){
	showLoading();
	document.form.action_mode.value = " ApplyAutoSleep ";
	document.form.current_page.value = "Advanced_System_AutoSleep.asp";
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
    <input type="hidden" name="current_page" value="Advanced_System_AutoSleep.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="AUTOSLEEP;">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="">
    <input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get_x("", "preferred_lang"); %>">

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
                            <h2 class="box_head round_top"><#menu5_6#> - <#menu5_6_13#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#AUTO_SLEEP_DESC#></div>
									<table width="100%" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#AUTO_SLEEP#></th>
                                        </tr>
										<tr>
                                            <th width="50%" style="border-top: 0 none;"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this, 0, 22);"><#ENABLE_AUTO_SLEEP#></a></th>
                                            <td style="border-top: 0 none;">
                                                <div class="main_itoggle">
                                                    <div id="enable_auto_sleep_on_of">
                                                        <input type="checkbox" id="enable_auto_sleep_fake" <% nvram_match_x("","enable_auto_sleep", "1", "value=1 checked"); %><% nvram_match_x("","enable_auto_sleep", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="enable_auto_sleep" id="enable_auto_sleep_1" value="1" <% nvram_match_x("","enable_auto_sleep", "1", "checked"); %> /><#checkbox_Yes#>
                                                    <input type="radio" name="enable_auto_sleep" id="enable_auto_sleep_0" value="0" <% nvram_match_x("","enable_auto_sleep", "0", "checked"); %> /><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="50%"><#AUTO_SLEEP_TIME#></th>
                                            <td>
                                                <select " name="auto_sleep_time" id="auto_sleep_time">
                                                    <option value="600" <% nvram_match_x("","auto_sleep_time", "600","selected"); %>><#AUTO_SLEEP_TIME1#></option>
                                                    <option value="1800" <% nvram_match_x("","auto_sleep_time", "1800","selected"); %>><#AUTO_SLEEP_TIME2#></option>
                                                    <option value="3600" <% nvram_match_x("","auto_sleep_time", "3600","selected"); %>><#AUTO_SLEEP_TIME3#></option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="table">
                                        <tr>
                                            <td style="border: 0 none;">
                                                <center><input class="btn btn-primary" style="width: 219px" onclick="applyRuleSleep();" type="button" value="<#CTL_apply#>" /></center>
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
