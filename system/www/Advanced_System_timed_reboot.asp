<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - <#menu5_6_2#></title>
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
	init_itoggle('timed_reboot_enable');
	init_itoggle('timed_reboot_repeat');
});

</script>
<script>

function initial(){
	show_banner(1);
	show_menu(5,7,6);
	show_footer();
	
	load_body();
}


function applyRule(){
		showLoading();
		document.form.current_page.value = "Advanced_System_timed_reboot.asp";
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
    <input type="hidden" name="current_page" value="Advanced_System_timed_reboot.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="action_script" value="Timed_Reboot">

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
                            <h2 class="box_head round_top"><#menu5_6#> - <#menu5_6_17#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#TIMED_REBOOT_DESC#></div>

                                    <table width="100%" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#TIMED_REBOOT#></th>
                                        </tr>
										<tr>
                                            <th width="50%"><#TIMED_REBOOT_ENABLE#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="timed_reboot_enable_on_of">
                                                        <input type="checkbox" id="timed_reboot_enable_fake" <% nvram_match_x("", "timed_reboot_enable", "1", "value=1 checked"); %><% nvram_match_x("", "timed_reboot_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" value="1" name="timed_reboot_enable" id="timed_reboot_enable_1" <% nvram_match_x("","timed_reboot_enable", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" value="0" name="timed_reboot_enable" id="timed_reboot_enable_0" <% nvram_match_x("","timed_reboot_enable", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
										
										<tr>
                                            <th width="50%"><#TIMED_REBOOT_REPEAT#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="timed_reboot_repeat_on_of">
                                                        <input type="checkbox" id="timed_reboot_repeat_fake" <% nvram_match_x("", "timed_reboot_repeat", "1", "value=1 checked"); %><% nvram_match_x("", "timed_reboot_repeat", "0", "value=0"); %>>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" value="1" name="timed_reboot_repeat" id="timed_reboot_repeat_1" <% nvram_match_x("","timed_reboot_repeat", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" value="0" name="timed_reboot_repeat" id="timed_reboot_repeat_0" <% nvram_match_x("","timed_reboot_repeat", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
										
                                        <tr>
                                            <th  width="50%"><#TIMED_REBOOT_HOUR#></th>
                                            <td>
												<select name="timed_reboot_hour">
                                                 <option value="0" <% nvram_match_x("","timed_reboot_hour", "0","selected"); %>>00</option>
												 <option value="1" <% nvram_match_x("","timed_reboot_hour", "1","selected"); %>>01</option>
												 <option value="2" <% nvram_match_x("","timed_reboot_hour", "2","selected"); %>>02</option>
												 <option value="3" <% nvram_match_x("","timed_reboot_hour", "3","selected"); %>>03</option>
												 <option value="4" <% nvram_match_x("","timed_reboot_hour", "4","selected"); %>>04</option>
												 <option value="5" <% nvram_match_x("","timed_reboot_hour", "5","selected"); %>>05</option>
												 <option value="6" <% nvram_match_x("","timed_reboot_hour", "6","selected"); %>>06</option>
												 <option value="7" <% nvram_match_x("","timed_reboot_hour", "7","selected"); %>>07</option>
												 <option value="8" <% nvram_match_x("","timed_reboot_hour", "8","selected"); %>>08</option>
												 <option value="9" <% nvram_match_x("","timed_reboot_hour", "9","selected"); %>>09</option>
												 <option value="10" <% nvram_match_x("","timed_reboot_hour", "10","selected"); %>>10</option>
												 <option value="11" <% nvram_match_x("","timed_reboot_hour", "11","selected"); %>>11</option>
												 <option value="12" <% nvram_match_x("","timed_reboot_hour", "12","selected"); %>>12</option>
												 <option value="13" <% nvram_match_x("","timed_reboot_hour", "13","selected"); %>>13</option>
												 <option value="14" <% nvram_match_x("","timed_reboot_hour", "14","selected"); %>>14</option>
												 <option value="15" <% nvram_match_x("","timed_reboot_hour", "15","selected"); %>>15</option>
												 <option value="16" <% nvram_match_x("","timed_reboot_hour", "16","selected"); %>>16</option>
												 <option value="17" <% nvram_match_x("","timed_reboot_hour", "17","selected"); %>>17</option>
												 <option value="18" <% nvram_match_x("","timed_reboot_hour", "18","selected"); %>>18</option>
												 <option value="19" <% nvram_match_x("","timed_reboot_hour", "19","selected"); %>>19</option>
												 <option value="20" <% nvram_match_x("","timed_reboot_hour", "20","selected"); %>>20</option>
												 <option value="21" <% nvram_match_x("","timed_reboot_hour", "21","selected"); %>>21</option>
												 <option value="22" <% nvram_match_x("","timed_reboot_hour", "22","selected"); %>>22</option>
												 <option value="23" <% nvram_match_x("","timed_reboot_hour", "23","selected"); %>>23</option>
												</select>
                                            </td>
                                        </tr>
										
										<tr>
                                            <th  width="50%"><#TIMED_REBOOT_MIN#></th>
                                            <td>
												<select name="timed_reboot_min">
                                                 <option value="0" <% nvram_match_x("","timed_reboot_min", "0","selected"); %>>00</option>
												 <option value="1" <% nvram_match_x("","timed_reboot_min", "1","selected"); %>>01</option>
												 <option value="2" <% nvram_match_x("","timed_reboot_min", "2","selected"); %>>02</option>
												 <option value="3" <% nvram_match_x("","timed_reboot_min", "3","selected"); %>>03</option>
												 <option value="4" <% nvram_match_x("","timed_reboot_min", "4","selected"); %>>04</option>
												 <option value="5" <% nvram_match_x("","timed_reboot_min", "5","selected"); %>>05</option>
												 <option value="6" <% nvram_match_x("","timed_reboot_min", "6","selected"); %>>06</option>
												 <option value="7" <% nvram_match_x("","timed_reboot_min", "7","selected"); %>>07</option>
												 <option value="8" <% nvram_match_x("","timed_reboot_min", "8","selected"); %>>08</option>
												 <option value="9" <% nvram_match_x("","timed_reboot_min", "9","selected"); %>>09</option>
												 <option value="10" <% nvram_match_x("","timed_reboot_min", "10","selected"); %>>10</option>
												 <option value="11" <% nvram_match_x("","timed_reboot_min", "11","selected"); %>>11</option>
												 <option value="12" <% nvram_match_x("","timed_reboot_min", "12","selected"); %>>12</option>
												 <option value="13" <% nvram_match_x("","timed_reboot_min", "13","selected"); %>>13</option>
												 <option value="14" <% nvram_match_x("","timed_reboot_min", "14","selected"); %>>14</option>
												 <option value="15" <% nvram_match_x("","timed_reboot_min", "15","selected"); %>>15</option>
												 <option value="16" <% nvram_match_x("","timed_reboot_min", "16","selected"); %>>16</option>
												 <option value="17" <% nvram_match_x("","timed_reboot_min", "17","selected"); %>>17</option>
												 <option value="18" <% nvram_match_x("","timed_reboot_min", "18","selected"); %>>18</option>
												 <option value="19" <% nvram_match_x("","timed_reboot_min", "19","selected"); %>>19</option>
												 <option value="20" <% nvram_match_x("","timed_reboot_min", "20","selected"); %>>20</option>
												 <option value="21" <% nvram_match_x("","timed_reboot_min", "21","selected"); %>>21</option>
												 <option value="22" <% nvram_match_x("","timed_reboot_min", "22","selected"); %>>22</option>
												 <option value="23" <% nvram_match_x("","timed_reboot_min", "23","selected"); %>>23</option>
												 <option value="24" <% nvram_match_x("","timed_reboot_min", "24","selected"); %>>24</option>
												 <option value="25" <% nvram_match_x("","timed_reboot_min", "25","selected"); %>>25</option>
												 <option value="26" <% nvram_match_x("","timed_reboot_min", "26","selected"); %>>26</option>
												 <option value="27" <% nvram_match_x("","timed_reboot_min", "27","selected"); %>>27</option>
												 <option value="28" <% nvram_match_x("","timed_reboot_min", "28","selected"); %>>28</option>
												 <option value="29" <% nvram_match_x("","timed_reboot_min", "29","selected"); %>>29</option>
												 <option value="30" <% nvram_match_x("","timed_reboot_min", "30","selected"); %>>30</option>
												 <option value="31" <% nvram_match_x("","timed_reboot_min", "31","selected"); %>>31</option>
												 <option value="32" <% nvram_match_x("","timed_reboot_min", "32","selected"); %>>32</option>
												 <option value="33" <% nvram_match_x("","timed_reboot_min", "33","selected"); %>>33</option>
												 <option value="34" <% nvram_match_x("","timed_reboot_min", "34","selected"); %>>34</option>
												 <option value="35" <% nvram_match_x("","timed_reboot_min", "35","selected"); %>>35</option>
												 <option value="36" <% nvram_match_x("","timed_reboot_min", "36","selected"); %>>36</option>
												 <option value="37" <% nvram_match_x("","timed_reboot_min", "37","selected"); %>>37</option>
												 <option value="38" <% nvram_match_x("","timed_reboot_min", "38","selected"); %>>38</option>
												 <option value="39" <% nvram_match_x("","timed_reboot_min", "39","selected"); %>>39</option>
												 <option value="40" <% nvram_match_x("","timed_reboot_min", "40","selected"); %>>40</option>
												 <option value="41" <% nvram_match_x("","timed_reboot_min", "41","selected"); %>>41</option>
												 <option value="42" <% nvram_match_x("","timed_reboot_min", "42","selected"); %>>42</option>
												 <option value="43" <% nvram_match_x("","timed_reboot_min", "43","selected"); %>>43</option>
												 <option value="44" <% nvram_match_x("","timed_reboot_min", "44","selected"); %>>44</option>
												 <option value="45" <% nvram_match_x("","timed_reboot_min", "45","selected"); %>>45</option>
												 <option value="46" <% nvram_match_x("","timed_reboot_min", "46","selected"); %>>46</option>
												 <option value="47" <% nvram_match_x("","timed_reboot_min", "47","selected"); %>>47</option>
												 <option value="48" <% nvram_match_x("","timed_reboot_min", "48","selected"); %>>48</option>
												 <option value="49" <% nvram_match_x("","timed_reboot_min", "49","selected"); %>>49</option>
												 <option value="50" <% nvram_match_x("","timed_reboot_min", "50","selected"); %>>50</option>
												 <option value="51" <% nvram_match_x("","timed_reboot_min", "51","selected"); %>>51</option>
												 <option value="52" <% nvram_match_x("","timed_reboot_min", "52","selected"); %>>52</option>
												 <option value="53" <% nvram_match_x("","timed_reboot_min", "53","selected"); %>>53</option>
												 <option value="54" <% nvram_match_x("","timed_reboot_min", "54","selected"); %>>54</option>
												 <option value="55" <% nvram_match_x("","timed_reboot_min", "55","selected"); %>>55</option>
												 <option value="56" <% nvram_match_x("","timed_reboot_min", "56","selected"); %>>56</option>
												 <option value="57" <% nvram_match_x("","timed_reboot_min", "57","selected"); %>>57</option>
												 <option value="58" <% nvram_match_x("","timed_reboot_min", "58","selected"); %>>58</option>
												 <option value="59" <% nvram_match_x("","timed_reboot_min", "59","selected"); %>>59</option>
												</select>
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
