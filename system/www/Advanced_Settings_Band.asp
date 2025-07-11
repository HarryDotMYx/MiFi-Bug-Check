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
<script type="text/javascript">
</script>
<script>
var $j = jQuery.noConflict();

$j(document).ready(function() {
	init_itoggle('help_enable');
});

</script>
<script>
<% get_band_info(); %>
<% login_state_hook(); %>

function initial(){
	show_banner(1);
	show_menu(5,6,2); 
	show_footer();

	if(!checkSERIALNO())
        return;

	load_body();
	var nvrf_hwid = '<% nvram_get_x("","rf_hwid"); %>';
	var str4G;
	var str5G;
	if(nvrf_hwid==500)
	{
		str4G = "1:3:5:8:28:34:38:39:40:41";
		str5G = "1:28:41:78";
	}
	else if (nvrf_hwid==501 || nvrf_hwid==502)
	{
		str4G = "1:3:5:7:8:20:28:34:38:39:40:41";
		str5G = "1:5:8:28:41:78";
	}
	else if(nvrf_hwid==520)
	{
		str4G = "1:3:5:7:8:20:28:34:38:39:40:41:42:43";
		str5G = "1:3:5:7:8:20:28:38:40:41:77:78";
	}
	var arr4G = str4G.split(":");
	var arr5G = str5G.split(":");
	var strTemp;
	for(var i = 0; i<arr4G.length;i++)
	{
		strTemp = "band"+arr4G[i]+"_enable_x_on_of";
		document.getElementById(strTemp).style.display = "block";
	}
	for(var i = 0; i<arr5G.length;i++)
	{
		strTemp = "bandN"+arr5G[i]+"_enable_x_on_of";
		document.getElementById(strTemp).style.display = "block";
	}
}
function applyRule4G(){
	showLoading();
		
	document.form.action_mode.value = " Apply4G ";
	document.form.current_page.value = "Advanced_Settings_Band.asp";
	document.form.next_page.value = "";
	document.form.submit();
	
}
function applyRule5G(){
	showLoading();
		
	document.form.action_mode.value = " Apply5G ";
	document.form.current_page.value = "Advanced_Settings_Band.asp";
	document.form.next_page.value = "";
	document.form.submit();
	
}


</script>
<style>
    .table th, .table td{vertical-align: middle;}
    .table input, .table select {margin-bottom: 0px;}
    .table_4g_band th, .table_4g_band td,.table_5g_band th, .table_5g_band td {
    padding: 8px;
    line-height: 18px;
    text-align: left;
    vertical-align: top;
    border-top: none;
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
    <input type="hidden" name="current_page" value="Advanced_Settings_Band.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="sys_settings_mode" value="">
	<input type="hidden" name="sid_list" value="LANHostConfig;General;Storage;">
	<input type="hidden" name="action_script" value="sys_settings_band">

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
                            <h2 class="box_head round_top"><#menu5_4#> - <#menu5_6_14#></h2>
                            <div class="round_bottom">
                                
                                    <div id="tabMenu" class="submenuBlock"></div>     
                                     <table class="table">  
                                            <th colspan="4" style="background-color: #E3E3E3;"><#Bands_4G#></th>
                                     </table>
                                     <div style="width:684px;margin-left:15px" class="nowrap"> 
                                                    
                                                       
                                                <div id="band1_enable_x_on_of" class="main_itoggle"  style="width:136px;display:none">                                                                                                
                                                     <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band1_enable_x" id="band1_enable_x_fake" <% nvram_match_x("", "band1_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band1_enable_x", "0", "value=0"); %>><#Bands_1#></label>
                                                    </div>
                                                <div id="band3_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">
                                                     <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band3_enable_x" id="band3_enable_x_fake" <% nvram_match_x("", "band3_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band3_enable_x", "0", "value=0"); %>><#Bands_3#></label>                                                     
                                                </div>                                     
                                                <div id="band5_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band5_enable_x" id="band5_enable_x_fake" <% nvram_match_x("", "band5_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band5_enable_x", "0", "value=0"); %>><#Bands_5#></label>
                                                </div>                                     
											
                                                <div id="band7_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">                                             
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band7_enable_x" id="band7_enable_x_fake" <% nvram_match_x("", "band7_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band7_enable_x", "0", "value=0"); %>><#Bands_7#></label>
                                                    </div>
                                          
                                               <div id="band8_enable_x_on_of"  class="main_itoggle" style="width:136px;display:none">       
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band8_enable_x" id="band8_enable_x_fake" <% nvram_match_x("", "band8_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band8_enable_x", "0", "value=0"); %>><#Bands_8#></label>
                                                    </div>
											
                                                <div  id="band20_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">       
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band20_enable_x" id="band20_enable_x_fake" <% nvram_match_x("", "band20_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band20_enable_x", "0", "value=0"); %>><#Bands_20#></label>
                                                </div>                                     
											
                                                <div id="band28_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">       
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band28_enable_x" id="band28_enable_x_fake" <% nvram_match_x("", "band28_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band28_enable_x", "0", "value=0"); %>><#Bands_28#></label>
                                                    </div>
											
                                                <div id="band34_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">       
                                                    <div  style="">
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band34_enable_x" id="band34_enable_x_fake" <% nvram_match_x("", "band34_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band34_enable_x", "0", "value=0"); %>><#Bands_34#></label>
                                                       
                                                    </div>
                                                </div>                                     
											
                                                <div id="band38_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">                                                        
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band38_enable_x" id="band38_enable_x_fake" <% nvram_match_x("", "band38_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band38_enable_x", "0", "value=0"); %>><#Bands_38#></label>
                                                    </div>
                                                <div id="band39_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">        
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band39_enable_x" id="band39_enable_x_fake" <% nvram_match_x("", "band39_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band39_enable_x", "0", "value=0"); %>><#Bands_39#></label>
                                                </div>                                     
                                                <div id="band40_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">       
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band40_enable_x" id="band40_enable_x_fake" <% nvram_match_x("", "band40_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band40_enable_x", "0", "value=0"); %>><#Bands_40#></label>
                                                </div>                                                                         
                                                <div id="band41_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">       
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band41_enable_x" id="band41_enable_x_fake" <% nvram_match_x("", "band41_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band41_enable_x", "0", "value=0"); %>><#Bands_41#></label>
                                                       
                                                    </div>
                                                <div id="band42_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">       
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band42_enable_x" id="band42_enable_x_fake" <% nvram_match_x("", "band42_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band42_enable_x", "0", "value=0"); %>><#Bands_42#></label>
                                                </div>                                     
                                                <div id="band43_enable_x_on_of"  class="main_itoggle" style="width:136px;display:none">       
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band43_enable_x" id="band43_enable_x_fake" <% nvram_match_x("", "band43_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band43_enable_x", "0", "value=0"); %>><#Bands_43#></label>
                                                       
                                                    </div>
                                            									
                                                </div>                                     
                   
                                   </div>


                                    <table class="table">
                                        <tr>
                                            <td style="border: 0 none;"><center><input name="button" type="button" class="btn btn-primary" style="width: 219px;margin-top:17px" onclick="applyRule4G();" value="<#CTL_apply#>"/></center></td>
                                        </tr>
                                    </table>
                                      <table width="100%" cellpadding="4" cellspacing="0" class="table table_5g_band">
                                        <tr>
                                            <th colspan="5" style="background-color: #E3E3E3;"><#Bands_5G#></th>
                                        </tr>
                                         </table>
                                        <div style="width:684px;margin-left:15px"  class="nowrap">                
                                                <div id="bandN1_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">                                                                                                   
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n1_enable_x" id="band_n1_enable_x_fake" <% nvram_match_x("", "band_n1_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n1_enable_x", "0", "value=0"); %>><#Bands_N1#></label>
                                                    </div>
                                                <div  id="bandN3_enable_x_on_of"  class="main_itoggle" style="width:136px;display:none">                                                                                            
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n3_enable_x" id="band_n3_enable_x_fake" <% nvram_match_x("", "band_n3_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n3_enable_x", "0", "value=0"); %>><#Bands_N3#></label>
                                                </div>                                     
                                                <div  id="bandN5_enable_x_on_of"  class="main_itoggle" style="width:136px;display:none">                                                                                            
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n5_enable_x" id="band_n5_enable_x_fake" <% nvram_match_x("", "band_n5_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n5_enable_x", "0", "value=0"); %>><#Bands_N5#></label>
                                                    </div>
                                                <div  id="bandN7_enable_x_on_of"  class="main_itoggle" style="width:136px;display:none">                                                                                            
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n7_enable_x" id="band_n7_enable_x_fake" <% nvram_match_x("", "band_n7_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n7_enable_x", "0", "value=0"); %>><#Bands_N7#></label>
                                                </div>                                     
                                                <div  id="bandN8_enable_x_on_of"  class="main_itoggle" style="width:136px;display:none">                                                                                               
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n8_enable_x" id="band_n8_enable_x_fake" <% nvram_match_x("", "band_n8_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n8_enable_x", "0", "value=0"); %>><#Bands_N8#></label>
                                                    </div>
                                                  <div  id="bandN20_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">                                              
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n20_enable_x" id="band_n20_enable_x_fake" <% nvram_match_x("", "band_n20_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n20_enable_x", "0", "value=0"); %>><#Bands_N20#></label>
                                                </div>                                     
                                                <div  id="bandN28_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">                                              
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n28_enable_x" id="band_n28_enable_x_fake" <% nvram_match_x("", "band_n28_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n28_enable_x", "0", "value=0"); %>><#Bands_N28#></label>
                                                    </div>
                                                 <div  id="bandN38_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">                                              
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n38_enable_x" id="band_n38_enable_x_fake" <% nvram_match_x("", "band_n38_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n38_enable_x", "0", "value=0"); %>><#Bands_N38#></label>
                                                </div>                                     
                                                 <div  id="bandN40_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">                                              
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n40_enable_x" id="band_n40_enable_x_fake" <% nvram_match_x("", "band_n40_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n40_enable_x", "0", "value=0"); %>><#Bands_N40#></label>
                                                </div>                                                                            
                                                <div  id="bandN41_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">                                              
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n41_enable_x" id="band_n41_enable_x_fake" <% nvram_match_x("", "band_n41_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n41_enable_x", "0", "value=0"); %>><#Bands_N41#></label>
                                                    </div>
                                                 <div  id="bandN77_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">                                              
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n77_enable_x" id="band_n77_enable_x_fake" <% nvram_match_x("", "band_n77_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n77_enable_x", "0", "value=0"); %>><#Bands_N77#></label>
                                                </div>                                     
                                                <div  id="bandN78_enable_x_on_of" class="main_itoggle" style="width:136px;display:none">                                              
                                                         <label class="checkbox inline"><input type="checkbox" onclick="this.value=(this.value==0)?1:0" name="band_n78_enable_x" id="band_n78_enable_x_fake" <% nvram_match_x("", "band_n78_enable_x", "1", "value=1 checked"); %><% nvram_match_x("", "band_n78_enable_x", "0", "value=0"); %>><#Bands_N78#></label>
                                                </div>                                     
                   
                                       
                                    </div>


                                    <table class="table">
                                        <tr>
                                            <td style="border: 0 none;"><center><input name="button" type="button" class="btn btn-primary" style="width: 219px;margin-top:17px" onclick="applyRule5G();" value="<#CTL_apply#>"/></center></td>
                                        </tr>
                                    </table>
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
