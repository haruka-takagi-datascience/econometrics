
************************************************************

*SETUP
cd "/Users/harukatakagi/Desktop"
log using covid_analysis.log, replace

*LOAD DATA
use covid_data, clear

*DATA PROCESSING
gen vax_full_squared = vax_full^2
gen svi_verylow = (svi_cat==1)
gen svi_low = (svi_cat==2)
gen svi_moderate = (svi_cat==3)
gen svi_high = (svi_cat==4)
gen svi_veryhigh = (svi_cat==5)
gen large_central_metro = (urban==1)
gen large_fringe_metro = (urban==2)
gen medium_metro = (urban==3)
gen small_metro = (urban==4)
gen micropolitan = (urban==5)
gen noncore = (urban==6)

* Label variables
label var vax_full_squared "Percent fully vaccinated squared: VAXS data"
label var svi_verylow "dummy variable for SVI very low vulnerability"
label var svi_low "dummy variable for SVI low vulnerability"
label var svi_moderate "dummy variable for SVI moderate vulnerability"
label var svi_high "dummy variable for SVI high vulnerability"
label var svi_veryhigh "dummy variable for SVI very high vulnerability"
label var large_central_metro "dummy variable for area in large central metro"
label var large_fringe_metro "dummy variable for area in large fringe metro"
label var medium_metro "dummy variable for area in medium metro"
label var small_metro "dummy variable for area in small metro"
label var micropolitan "dummy variable for area in micropolitan"
label var noncore "dummy variable for area in noncore"
	
*TABLE 1
*TABLE 1.1 (add more things if the variables are used in exploration)
sum death_rate per_gop20 vax_full vax_full_squared cond_obese cond_heart cond_diab svi_verylow svi_low svi_moderate svi_high svi_veryhigh hest_defnot hest_probnot hest_uns survpre_rate deathpre_rate large_central_metro large_fringe_metro medium_metro small_metro micropolitan noncore pct_hispanic pct_amerind pct_asian pct_black pct_natHI pct_white pct_other

asdoc sum death_rate per_gop20 vax_full vax_full_squared cond_obese cond_heart cond_diab svi_verylow svi_low svi_moderate svi_high svi_veryhigh hest_defnot hest_probnot hest_uns survpre_rate deathpre_rate large_central_metro large_fringe_metro medium_metro small_metro micropolitan noncore pct_hispanic pct_amerind pct_asian pct_black pct_natHI pct_white pct_other, save(summary_stats), replace

*TABLE 1.2
gen GOP20=(per_gop20>=50)
tabstat survpre_rate death_rate hest_defnot hest_probnot cond_obese cond_heart cond_diab vax_full, by(GOP20)
asdoc tabstat survpre_rate death_rate hest_defnot hest_probnot cond_obese cond_heart cond_diab vax_full, by(GOP20), save(table_1_2)

*TABLE 4 (add more things if the variables are used in exploration)
describe death_rate per_gop20 vax_full vax_full_squared cond_obese cond_heart cond_diab svi_verylow svi_low svi_moderate svi_high svi_veryhigh hest_defnot hest_probnot hest_uns survpre_rate deathpre_rate large_central_metro large_fringe_metro medium_metro small_metro micropolitan noncore pct_hispanic pct_amerind pct_asian pct_black pct_natHI pct_white pct_other

asdoc describe death_rate per_gop20 vax_full vax_full_squared cond_obese cond_heart cond_diab svi_verylow svi_low svi_moderate svi_high svi_veryhigh hest_defnot hest_probnot hest_uns survpre_rate deathpre_rate large_central_metro large_fringe_metro medium_metro small_metro micropolitan noncore pct_hispanic pct_amerind pct_asian pct_black pct_natHI pct_white pct_other, save(descriptions), replace
	
*TABLE 2
*SLR: column 1
regress death_rate per_gop20
	
*MLR: column 2
regress death_rate per_gop20 vax_full
	
*MLR: column 3
regress death_rate per_gop20 vax_full vax_full_squared
	
*MLR: column 4
regress death_rate per_gop20 vax_full vax_full_squared cond_obese cond_heart cond_diab svi_verylow svi_low svi_moderate svi_high svi_veryhigh hest_defnot hest_probnot hest_uns survpre_rate deathpre_rate large_central_metro large_fringe_metro medium_metro small_metro micropolitan noncore pct_hispanic pct_amerind pct_asian pct_black pct_natHI pct_white pct_other
	
*SECTION 3
*Figure 3.1
twoway (scatter death_rate per_gop20, mcolor(blue) msymbol(circle_hollow) mlwidth(thin))(lfit death_rate per_gop20, lwidth(thick)), xtitle("Percent of votes for GOP president") title("COVID-19 Death rates and Percent votes for GOP") graphregion(color(white))
graph export figure3_1.pdf, replace

*Figure 3.2
hist per_gop20, title("Histogram of Percent votes for GOP president") graphregion(color(white))
graph export figure3_11.pdf, replace

*Figure 3.3
twoway (scatter death_rate vax_full, mcolor(blue) msymbol(circle_hollow) mlwidth(thin))(lfit death_rate vax_full, lwidth(thick)), xtitle("vaccination rate") title("COVID-19 Death rates and vaccination rate") graphregion(color(white))
graph export figure3_5.pdf, replace


* END
log close
