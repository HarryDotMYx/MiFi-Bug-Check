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

});

</script>
<script>

function initial(){
	show_banner(1);
	show_menu(5,8,3);
	show_footer();

	if (!checkSERIALNO())
	    return;
	
	load_body();
}

function applyRule(){
	if(validForm()){
		showLoading();
		
		document.form.action_mode.value = " Restart ";
		document.form.current_page.value = "Advanced_VPN_Cert_Content.asp";
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

    <input type="hidden" name="current_page" value="Advanced_VPN_Cert_Content.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="Certificate">

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
                            <h2 class="box_head round_top"><#menu5_7#> - <#menu5_7_11#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    
                                    
                                    <table class="table">
                                <tr>
                                    <td style="padding-bottom: 0px; border-top: 0 none;">
                                        <span class="caption-bold">ca.crt (Root CA Certificate):</span>
                                        <textarea rows="4" wrap="off" spellcheck="false" maxlength="8000" class="span12" name="ca_crt" style="font-family:'Courier New'; font-size:12px;"><% nvram_get_x("", "ca_crt0"); %><% nvram_get_x("", "ca_crt1"); %></textarea>
                                    </td>
                                </tr>
                                <tr id="row_client_crt">
                                    <td style="padding-bottom: 0px; border-top: 0 none;">
                                        <span class="caption-bold">client.crt (Client Certificate):</span>
                                        <textarea rows="4" wrap="off" spellcheck="false" maxlength="8000" class="span12" name="client_crt" style="font-family:'Courier New'; font-size:12px;"><% nvram_get_x("", "client_crt0"); %><% nvram_get_x("", "client_crt1"); %></textarea>
                                    </td>
                                </tr>
                                <tr id="row_client_key">
                                    <td style="padding-bottom: 0px; border-top: 0 none;">
                                        <span class="caption-bold">client.key (Client Private Key) - secret:</span>
                                        <textarea rows="4" wrap="off" spellcheck="false" maxlength="8000" class="span12" name="client_key" style="font-family:'Courier New'; font-size:12px;"><% nvram_get_x("", "client_key0"); %><% nvram_get_x("", "client_key1"); %></textarea>
                                    </td>
                                </tr>
                                <tr id="row_ta_key">
                                    <td style="padding-bottom: 0px; border-top: 0 none;">
                                        <span class="caption-bold">ta.key (TLS Auth Key) - secret:</span>
                                        <textarea rows="4" wrap="off" spellcheck="false" maxlength="8000" class="span12" name="ta_key" style="font-family:'Courier New'; font-size:12px;"><% nvram_get_x("", "ta_key0"); %><% nvram_get_x("", "ta_key1"); %></textarea>
                                    </td>
                                </tr>
                            </table>
                            <table class="table">
                                <tr>
                                    <td style="border: 0 none;"><center><input name="button2" type="button" class="btn btn-primary" style="width: 219px" onclick="applyRule();" value="Apply"/></center></td>
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
