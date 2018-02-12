<?php if(!defined('IN_PHPVMS') && IN_PHPVMS !== true) { die(); } ?>
<section class="content-header">
    <h1>Flight Briefing - <?php echo $schedule->code.$schedule->flightnum; ?></h1>
</section>
<section class="content">
    <div class="row">
		<script src="http://skyvector.com/linkchart.js"></script>
        <table class="table">
            <!-- Flight ID -->
            <tr style="background-color: #333; color: #FFF;">
                <td colspan="2">Flight</td>
            </tr>
            <tr>
                <td colspan="2">
                <?php echo $schedule->code.$schedule->flightnum; ?>
                </td>
            </tr>
            
            <tr  style="background-color: #333; color: #FFF;">
                <td>Departure</td>
                <td>Arrival</td>
            </tr>
            
            <tr>
                <td width="50%" ><?php echo "{$schedule->depname} ($schedule->depicao)"; ?><br />
                    <!-- <a href="https://pilotweb.nas.faa.gov/geo/icaoRadius.html?icao_id=<?php echo $schedule->depicao?>&radius=2"
                        target="_blank">Click to view NOTAMS</a> -->
                </td>
                <td width="50%" ><?php echo "{$schedule->arrname} ($schedule->arricao)"; ?><br />
                    <!-- <a href="https://pilotweb.nas.faa.gov/geo/icaoRadius.html?icao_id=<?php echo $schedule->arricao?>&radius=2"
                        target="_blank">Click to view NOTAMS</a> -->
                </td>
            </tr>
            
            <!-- Times Row -->
            <tr style="background-color: #333; color: #FFF;">
                <td>Departure Time</td>
                <td>Arrival Time</td>
            </tr>
            <tr>
                <td width="50%" ><?php echo "{$schedule->deptime}"; ?></td>
                <td width="50%" ><?php echo "{$schedule->arrtime}"; ?></td>
            </tr>
            
            <!-- Aircraft and Distance Row -->
            <tr style="background-color: #333; color: #FFF;">
                <td>Aircraft</td>
                <td>Distance</td>
            </tr>
            <tr>
                <td width="50%" ><?php echo "{$schedule->aircraft} {$schedule->registration}"; ?></td>
                <td width="50%" ><?php echo "{$schedule->distance}"; ?>nm</td>
            </tr>
            
            <tr style="background-color: #333; color: #FFF;">
                <td><?php echo $schedule->depicao; ?> METAR</td>
                <td><?php echo $schedule->arricao; ?> METAR</td>
            </tr>
            <tr>
                <td width="50%">
					<?php
                    $metar = $_POST['metar'];
                    $url = 'http://metar.vatsim.net/'.$schedule->depicao.'';
                    $page = file_get_contents($url);
                    echo $page;
                    ?>
                </td>
                <td width="50%">
					<?php
                    $metar = $_POST['metar'];
                    $url = 'http://metar.vatsim.net/'.$schedule->arricao.'';
                    $page = file_get_contents($url);
                    echo $page;
                    ?>
                </td>
            </tr>
            
            <!-- Route -->
            <tr style="background-color: #333; color: #FFF;">
                <td colspan="2">Route</td>
            </tr>
            <tr>
                <td colspan="2">
                <?php 
                # If it's empty, insert some blank lines
                if($schedule->route == '')
                {
                    echo '<br /> <br /> <br />';
                }
                else
                {
                    echo strtoupper($schedule->route); 
                }
                ?>
                </td>
            </tr>
            
            <!-- Notes -->
            <tr style="background-color: #333; color: #FFF;">
                <td colspan="2">Notes</td>
            </tr>
            <tr>
                <td colspan="2" style="padding: 6px;">
                <?php 
                    # If it's empty, insert some blank lines
                    if($schedule->notes == '')
                    {
                        echo '<br /> <br /> <br />';
                    }
                    else
                    {
                        echo "{$schedule->notes}"; 
                    }
                ?>
                </td>
            </tr>
            <tr style="background-color: #333; color: #FFF; padding: 5px; width: 100%;">
                <td>Additional Data</td>
            </tr>
            <tr style="width: 100%;">
                <td><a href="http://flightaware.com/analysis/route.rvt?origin=<?php echo $schedule->depicao?>&destination=<?php echo $schedule->arricao?>" target="_blank">View recent IFR Routes data</a></td>
            </tr>
        </table>
        
        <!--
        <h3>Procedures and Information</h3>
        <table width="98%" align="center">
        
            <tr style="background-color: #333; color: #FFF;">
                <td>Charts for <?php echo $schedule->depicao?></td>
                <td>Charts for <?php echo $schedule->arricao?></td>
            </tr>
            <tr align="center">
                <td width="50%" valign="top">
                    <a href="http://www.airnav.com/airport/<?php echo $schedule->depicao?>#ifr" target="_blank">
                    <img border="0" src="http://flightaware.com/resources/airport/<?php echo $schedule->depicao?>/APD/AIRPORT+DIAGRAM/png"
                        width="387px" height="594px" alt="No chart available" /></a>
                </td>
                <td width="50%" valign="top">
                    <a href="http://www.airnav.com/airport/<?php echo $schedule->arricao?>#ifr" target="_blank">
                    <img border="0" src="http://flightaware.com/resources/airport/<?php echo $schedule->arricao?>/APD/AIRPORT+DIAGRAM/png" 
                        width="387px" height="594px" alt="No chart available" /></a>
                </td>
            
            </tr>
        </table>
        
        <h3>Weather</h3>
        <div align="center">
            <p><img src="http://flightaware.com/resources/wx/us_depiction.gif" /></p>
            <p><img src="http://flightaware.com/resources/wx/surface_analysis.gif" /></p>
            <p><img src="http://flightaware.com/resources/wx/national_radar.gif" /></p>
            <p><img src="http://flightaware.com/resources/wx/us_high_level_weather_12z.gif" /></p>
            <p><img src="http://flightaware.com/resources/wx/severe_outlook_day_1.gif" /></p>
            <a href="http://flightaware.com/resources/weather_maps/" target="_blank">View additional weather graphs</a>
        </div>
        <div align="right" style="font-size: small;">Data Courtesy of <a href="http://flightaware.com" target="_new">FlightAware</a></div>
        -->
        <br />
</div>