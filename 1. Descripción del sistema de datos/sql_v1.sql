-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';

-- DROP TYPE public.box2d;

CREATE TYPE public.box2d (
	INPUT = box2d_in,
	OUTPUT = box2d_out,
	INTERNALLENGTH = 65,
	ALIGNMENT = 4,
	STORAGE = plain,
	CATEGORY = U,
	DELIMITER = ',');

-- DROP TYPE public.box2df;

CREATE TYPE public.box2df (
	INPUT = box2df_in,
	OUTPUT = box2df_out,
	INTERNALLENGTH = 16,
	ALIGNMENT = 8,
	STORAGE = plain,
	CATEGORY = U,
	DELIMITER = ',');

-- DROP TYPE public.box3d;

CREATE TYPE public.box3d (
	INPUT = box3d_in,
	OUTPUT = box3d_out,
	INTERNALLENGTH = 52,
	ALIGNMENT = 8,
	STORAGE = plain,
	CATEGORY = U,
	DELIMITER = ',');

-- DROP TYPE public.geography;

CREATE TYPE public.geography (
	INPUT = geography_in,
	OUTPUT = geography_out,
	RECEIVE = geography_recv,
	SEND = geography_send,
	TYPMOD_IN = geography_typmod_in,
	TYPMOD_OUT = geography_typmod_out,
	ANALYZE = geography_analyze,
	ALIGNMENT = 8,
	STORAGE = compressed,
	CATEGORY = U,
	DELIMITER = ':');

-- DROP TYPE public.geometry;

CREATE TYPE public.geometry (
	INPUT = geometry_in,
	OUTPUT = geometry_out,
	RECEIVE = geometry_recv,
	SEND = geometry_send,
	TYPMOD_IN = geometry_typmod_in,
	TYPMOD_OUT = geometry_typmod_out,
	ANALYZE = geometry_analyze,
	ALIGNMENT = 8,
	STORAGE = compressed,
	CATEGORY = U,
	DELIMITER = ':');

-- DROP TYPE public.gidx;

CREATE TYPE public.gidx (
	INPUT = gidx_in,
	OUTPUT = gidx_out,
	ALIGNMENT = 8,
	STORAGE = plain,
	CATEGORY = U,
	DELIMITER = ',');

-- DROP TYPE public.spheroid;

CREATE TYPE public.spheroid (
	INPUT = spheroid_in,
	OUTPUT = spheroid_out,
	INTERNALLENGTH = 65,
	ALIGNMENT = 8,
	STORAGE = plain,
	CATEGORY = U,
	DELIMITER = ',');

-- DROP SEQUENCE public.submission_files_registry_id_seq;

CREATE SEQUENCE public.submission_files_registry_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.submission_files_registry_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.submission_files_registry_id_seq TO "admin";

-- DROP SEQUENCE public.submissions_master_id_seq;

CREATE SEQUENCE public.submissions_master_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;

-- Permissions

ALTER SEQUENCE public.submissions_master_id_seq OWNER TO "admin";
GRANT ALL ON SEQUENCE public.submissions_master_id_seq TO "admin";
-- public.data_10_argonne_geothermal_geochemical_database_v2_00 definition

-- Drop table

-- DROP TABLE public.data_10_argonne_geothermal_geochemical_database_v2_00;

CREATE TABLE public.data_10_argonne_geothermal_geochemical_database_v2_00 ( argonne_geothermal_geochemical_dataset text NULL);

-- Permissions

ALTER TABLE public.data_10_argonne_geothermal_geochemical_database_v2_00 OWNER TO "admin";
GRANT ALL ON TABLE public.data_10_argonne_geothermal_geochemical_database_v2_00 TO "admin";


-- public.data_11_355347_morgantowntemperaturedepthreplicates definition

-- Drop table

-- DROP TABLE public.data_11_355347_morgantowntemperaturedepthreplicates;

CREATE TABLE public.data_11_355347_morgantowntemperaturedepthreplicates ( rep int8 NULL, t1km float8 NULL, t1p5km float8 NULL, t2km float8 NULL, t2p5km float8 NULL, t3km float8 NULL, t3p5km float8 NULL, t4km float8 NULL, t4p5km float8 NULL, t5km float8 NULL, tbase float8 NULL);

-- Permissions

ALTER TABLE public.data_11_355347_morgantowntemperaturedepthreplicates OWNER TO "admin";
GRANT ALL ON TABLE public.data_11_355347_morgantowntemperaturedepthreplicates TO "admin";


-- public.data_12_dixie_doe_data_january_december_2014_for_feb definition

-- Drop table

-- DROP TABLE public.data_12_dixie_doe_data_january_december_2014_for_feb;

CREATE TABLE public.data_12_dixie_doe_data_january_december_2014_for_feb ( january_2014_dixie_binary_bottoming_cycle_data text NULL, unnamed_1 text NULL, unnamed_2 text NULL, unnamed_3 text NULL, unnamed_4 text NULL, unnamed_5 text NULL, unnamed_6 text NULL, unnamed_7 text NULL, unnamed_8 float8 NULL, unnamed_9 float8 NULL, unnamed_10 text NULL);

-- Permissions

ALTER TABLE public.data_12_dixie_doe_data_january_december_2014_for_feb OWNER TO "admin";
GRANT ALL ON TABLE public.data_12_dixie_doe_data_january_december_2014_for_feb TO "admin";


-- public.data_13_z_gc definition

-- Drop table

-- DROP TABLE public.data_13_z_gc;

CREATE TABLE public.data_13_z_gc ( id int8 NULL, "label" text NULL, fluidtempe float8 NULL, latdegree float8 NULL, longdegree float8 NULL, ph_field float8 NULL, ph_lab float8 NULL, hg_mgl float8 NULL, deuterium float8 NULL, o18_delta float8 NULL, sio2_cl float8 NULL, b_cl float8 NULL, si_cl float8 NULL, ca_mg float8 NULL, as_cl float8 NULL, na_k float8 NULL);

-- Permissions

ALTER TABLE public.data_13_z_gc OWNER TO "admin";
GRANT ALL ON TABLE public.data_13_z_gc TO "admin";


-- public.data_14_march_2014_summary_beowawe definition

-- Drop table

-- DROP TABLE public.data_14_march_2014_summary_beowawe;

CREATE TABLE public.data_14_march_2014_summary_beowawe ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_14_march_2014_summary_beowawe OWNER TO "admin";
GRANT ALL ON TABLE public.data_14_march_2014_summary_beowawe TO "admin";


-- public.data_14_march_2014_summary_brady_hot_springs definition

-- Drop table

-- DROP TABLE public.data_14_march_2014_summary_brady_hot_springs;

CREATE TABLE public.data_14_march_2014_summary_brady_hot_springs ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_14_march_2014_summary_brady_hot_springs OWNER TO "admin";
GRANT ALL ON TABLE public.data_14_march_2014_summary_brady_hot_springs TO "admin";


-- public.data_14_march_2014_summary_desert_peak definition

-- Drop table

-- DROP TABLE public.data_14_march_2014_summary_desert_peak;

CREATE TABLE public.data_14_march_2014_summary_desert_peak ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_14_march_2014_summary_desert_peak OWNER TO "admin";
GRANT ALL ON TABLE public.data_14_march_2014_summary_desert_peak TO "admin";


-- public.data_14_march_2014_summary_dixie_valley definition

-- Drop table

-- DROP TABLE public.data_14_march_2014_summary_dixie_valley;

CREATE TABLE public.data_14_march_2014_summary_dixie_valley ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_14_march_2014_summary_dixie_valley OWNER TO "admin";
GRANT ALL ON TABLE public.data_14_march_2014_summary_dixie_valley TO "admin";


-- public.data_14_march_2014_summary_steamboat_hills definition

-- Drop table

-- DROP TABLE public.data_14_march_2014_summary_steamboat_hills;

CREATE TABLE public.data_14_march_2014_summary_steamboat_hills ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_14_march_2014_summary_steamboat_hills OWNER TO "admin";
GRANT ALL ON TABLE public.data_14_march_2014_summary_steamboat_hills TO "admin";


-- public.data_15_well_14_2_data_inventory_table definition

-- Drop table

-- DROP TABLE public.data_15_well_14_2_data_inventory_table;

CREATE TABLE public.data_15_well_14_2_data_inventory_table ( roosevelt_kgra_14_2_data_availability text NULL, unnamed_1 text NULL, unnamed_2 text NULL, unnamed_3 text NULL, unnamed_4 text NULL);

-- Permissions

ALTER TABLE public.data_15_well_14_2_data_inventory_table OWNER TO "admin";
GRANT ALL ON TABLE public.data_15_well_14_2_data_inventory_table TO "admin";


-- public.data_16_tusc_fracture_volumes_by_ct_v3_all_boxes definition

-- Drop table

-- DROP TABLE public.data_16_tusc_fracture_volumes_by_ct_v3_all_boxes;

CREATE TABLE public.data_16_tusc_fracture_volumes_by_ct_v3_all_boxes ( tuscorora_ss_pres_119_well text NULL, unnamed_1 float8 NULL, unnamed_2 text NULL);

-- Permissions

ALTER TABLE public.data_16_tusc_fracture_volumes_by_ct_v3_all_boxes OWNER TO "admin";
GRANT ALL ON TABLE public.data_16_tusc_fracture_volumes_by_ct_v3_all_boxes TO "admin";


-- public.data_1_cwrm_09_17_15_1 definition

-- Drop table

-- DROP TABLE public.data_1_cwrm_09_17_15_1;

CREATE TABLE public.data_1_cwrm_09_17_15_1 ( wid text NULL, island text NULL, yr_drilled float8 NULL, init_head text NULL, init_head2 float8 NULL, init_head3 float8 NULL, temp_f float8 NULL, temp_c float8 NULL, ground_el float8 NULL, well_depth float8 NULL);

-- Permissions

ALTER TABLE public.data_1_cwrm_09_17_15_1 OWNER TO "admin";
GRANT ALL ON TABLE public.data_1_cwrm_09_17_15_1 TO "admin";


-- public.data_2_58_32_main_geophysical_well_log definition

-- Drop table

-- DROP TABLE public.data_2_58_32_main_geophysical_well_log;

CREATE TABLE public.data_2_58_32_main_geophysical_well_log ( depth_ft float8 NULL, depth_m float8 NULL, af10 float8 NULL, af20 float8 NULL, af30 float8 NULL, af60 float8 NULL, af90 float8 NULL, ao10 float8 NULL, ao20 float8 NULL, ao30 float8 NULL, ao60 float8 NULL, ao90 float8 NULL, at10 float8 NULL, at20 float8 NULL, at30 float8 NULL, at60 float8 NULL, at90 float8 NULL, aort float8 NULL, aorx float8 NULL, cdf float8 NULL, cftc float8 NULL, cntc float8 NULL, ctem float8 NULL, dcal float8 NULL, dnph float8 NULL, dphz float8 NULL, dsoz float8 NULL, ecgr float8 NULL, ed float8 NULL, gdev float8 NULL, gr float8 NULL, gr_edtc float8 NULL, gtem float8 NULL, hcal float8 NULL, hdra float8 NULL, hdrb float8 NULL, hgr float8 NULL, hmin float8 NULL, hmno float8 NULL, hnpo float8 NULL, hpra float8 NULL, htnp float8 NULL, nd float8 NULL, nphi float8 NULL, npor float8 NULL, pefz float8 NULL, pxnd_hilt float8 NULL, rhoz float8 NULL, rsoz float8 NULL, rwa_hilt float8 NULL, rxo8 float8 NULL, rxoz float8 NULL, sp float8 NULL, spar float8 NULL, stit float8 NULL, tens float8 NULL, tnph float8 NULL, htnp_san float8 NULL, atco10 float8 NULL, atco20 float8 NULL, atco30 float8 NULL, atco60 float8 NULL, atco90 float8 NULL);

-- Permissions

ALTER TABLE public.data_2_58_32_main_geophysical_well_log OWNER TO "admin";
GRANT ALL ON TABLE public.data_2_58_32_main_geophysical_well_log TO "admin";


-- public.data_2_58_32_sonic_log_data definition

-- Drop table

-- DROP TABLE public.data_2_58_32_sonic_log_data;

CREATE TABLE public.data_2_58_32_sonic_log_data ( depth_ft float8 NULL, depth_m float8 NULL, cdf float8 NULL, chrp float8 NULL, chr1 float8 NULL, chr2 float8 NULL, ctem float8 NULL, dcal float8 NULL, dt1r float8 NULL, dt2 float8 NULL, dt2r float8 NULL, dt4p float8 NULL, dt4s float8 NULL, dtco float8 NULL, dtrp float8 NULL, dtrs float8 NULL, dtsm float8 NULL, ed float8 NULL, gr_edtc float8 NULL, gtem float8 NULL, itt float8 NULL, nd float8 NULL, pr float8 NULL, sphi float8 NULL, stit float8 NULL, tens float8 NULL);

-- Permissions

ALTER TABLE public.data_2_58_32_sonic_log_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_2_58_32_sonic_log_data TO "admin";


-- public.data_2_58_32_thermal_conductivity_data definition

-- Drop table

-- DROP TABLE public.data_2_58_32_thermal_conductivity_data;

CREATE TABLE public.data_2_58_32_thermal_conductivity_data ( lower_depth_interval_m float8 NULL, upper_depth_interval_m float8 NULL, matrix_thermal_conductivity_w_m_deg_c float8 NULL);

-- Permissions

ALTER TABLE public.data_2_58_32_thermal_conductivity_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_2_58_32_thermal_conductivity_data TO "admin";


-- public.data_2_58_32_xray_diffraction_data definition

-- Drop table

-- DROP TABLE public.data_2_58_32_xray_diffraction_data;

CREATE TABLE public.data_2_58_32_xray_diffraction_data ( lower_depth_range_m float8 NULL, upper_depth_range_m float8 NULL, smectite text NULL, illite text NULL, chlorite text NULL, interlayered_chlorite_smectite text NULL, chlorite_in_c_s text NULL, kaolinite text NULL, biotite text NULL, hornblende text NULL, augite text NULL, titanite text NULL, apatite text NULL, plagioclase int8 NULL, k_feldspar int8 NULL, quartz int8 NULL, epidote text NULL, calcite text NULL, dolomite float8 NULL, siderite float8 NULL, anhydrite text NULL, hematite text NULL);

-- Permissions

ALTER TABLE public.data_2_58_32_xray_diffraction_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_2_58_32_xray_diffraction_data TO "admin";


-- public.data_2_acord_1_26_digitized_geophysical_well_log definition

-- Drop table

-- DROP TABLE public.data_2_acord_1_26_digitized_geophysical_well_log;

CREATE TABLE public.data_2_acord_1_26_digitized_geophysical_well_log ( depth_ft float8 NULL, depth_m float8 NULL, bad_rhob_gm_cc float8 NULL, bitsize_in float8 NULL, cali_in float8 NULL, drho_g_cm3 float8 NULL, dt_us_f float8 NULL, gamma_ray_splice_ur_hr float8 NULL, gr_process_gap float8 NULL, gr_splice_gapi float8 NULL, lld_splice_ohm_m float8 NULL, llm_splice_ohm_m float8 NULL, lls_splice_ohm_m float8 NULL, neutron_splice_api float8 NULL, rhob_processing_g_cm3 float8 NULL, rhob_splice_g_cm3 float8 NULL, sp_slice_mv float8 NULL, temperature_deep_deg_f float8 NULL, temperature_deep_deg_c float8 NULL, temperature_shallow_deg_f float8 NULL, temperature_shallow_deg_c float8 NULL);

-- Permissions

ALTER TABLE public.data_2_acord_1_26_digitized_geophysical_well_log OWNER TO "admin";
GRANT ALL ON TABLE public.data_2_acord_1_26_digitized_geophysical_well_log TO "admin";


-- public.data_2_well_lithology_from_earth_model definition

-- Drop table

-- DROP TABLE public.data_2_well_lithology_from_earth_model;

CREATE TABLE public.data_2_well_lithology_from_earth_model ( well_id text NULL, "from" int8 NULL, "to" float8 NULL, lithology text NULL);

-- Permissions

ALTER TABLE public.data_2_well_lithology_from_earth_model OWNER TO "admin";
GRANT ALL ON TABLE public.data_2_well_lithology_from_earth_model TO "admin";


-- public.data_2_well_location_from_earth_model definition

-- Drop table

-- DROP TABLE public.data_2_well_location_from_earth_model;

CREATE TABLE public.data_2_well_location_from_earth_model ( well_id text NULL, x float8 NULL, y float8 NULL, z_land_surface float8 NULL, depth_m float8 NULL);

-- Permissions

ALTER TABLE public.data_2_well_location_from_earth_model OWNER TO "admin";
GRANT ALL ON TABLE public.data_2_well_location_from_earth_model TO "admin";


-- public.data_2_well_survey_from_earth_model definition

-- Drop table

-- DROP TABLE public.data_2_well_survey_from_earth_model;

CREATE TABLE public.data_2_well_survey_from_earth_model ( well_id text NULL, depth_m float8 NULL, dip float8 NULL, azimuth float8 NULL);

-- Permissions

ALTER TABLE public.data_2_well_survey_from_earth_model OWNER TO "admin";
GRANT ALL ON TABLE public.data_2_well_survey_from_earth_model TO "admin";


-- public.data_3_20140101_0131_green_machine_florida_canyon_hourly_data definition

-- Drop table

-- DROP TABLE public.data_3_20140101_0131_green_machine_florida_canyon_hourly_data;

CREATE TABLE public.data_3_20140101_0131_green_machine_florida_canyon_hourly_data ( date_time text NULL, total_net_power_x000d_output_calculated text NULL, gross_power_x000d_output_veris text NULL, pump_parasitic_x000d_load text NULL, cooling_fan_parasitic_x000d_load_veris text NULL, geothermal_header_hot_x000d_water_temperature text NULL, hot_water_supply_x000d_temperature text NULL, hot_water_return_x000d_temperature text NULL, hot_water_supply_x000d_flow_rate text NULL, ambient_temperature_x000d_gm_sensor text NULL, notes float8 NULL, meso_west_x000d_weatherdata text NULL, date_time_1 timestamp NULL, ambient_x000d_temperature text NULL, relative_x000d_humidity text NULL, wind_speed text NULL, wind_gust text NULL, wind_x000d_direction text NULL);

-- Permissions

ALTER TABLE public.data_3_20140101_0131_green_machine_florida_canyon_hourly_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_3_20140101_0131_green_machine_florida_canyon_hourly_data TO "admin";


-- public.data_4_2019_06_06_phase2c_poro_perm_global definition

-- Drop table

-- DROP TABLE public.data_4_2019_06_06_phase2c_poro_perm_global;

CREATE TABLE public.data_4_2019_06_06_phase2c_poro_perm_global ( full_domain_element_model_june4_csv text NULL, unnamed_1 text NULL, unnamed_2 text NULL, unnamed_3 text NULL, unnamed_4 text NULL, unnamed_5 text NULL, unnamed_6 text NULL, unnamed_7 text NULL, unnamed_8 text NULL, unnamed_9 text NULL, unnamed_10 text NULL, unnamed_11 text NULL, unnamed_12 float8 NULL, unnamed_13 float8 NULL, unnamed_14 float8 NULL, unnamed_15 float8 NULL);

-- Permissions

ALTER TABLE public.data_4_2019_06_06_phase2c_poro_perm_global OWNER TO "admin";
GRANT ALL ON TABLE public.data_4_2019_06_06_phase2c_poro_perm_global TO "admin";


-- public.data_4_2019_06_12_ptm2_phase2c_native_state_global definition

-- Drop table

-- DROP TABLE public.data_4_2019_06_12_ptm2_phase2c_native_state_global;

CREATE TABLE public.data_4_2019_06_12_ptm2_phase2c_native_state_global ( x float8 NULL, y float8 NULL, z int8 NULL, temperature_c float8 NULL, pressure_pa float8 NULL, sigma_v_pa float8 NULL, sigma_h_max_pa float8 NULL, sigma_h_min_pa float8 NULL);

-- Permissions

ALTER TABLE public.data_4_2019_06_12_ptm2_phase2c_native_state_global OWNER TO "admin";
GRANT ALL ON TABLE public.data_4_2019_06_12_ptm2_phase2c_native_state_global TO "admin";


-- public.data_5_december_2013_summary_blue_mountain definition

-- Drop table

-- DROP TABLE public.data_5_december_2013_summary_blue_mountain;

CREATE TABLE public.data_5_december_2013_summary_blue_mountain ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_5_december_2013_summary_blue_mountain OWNER TO "admin";
GRANT ALL ON TABLE public.data_5_december_2013_summary_blue_mountain TO "admin";


-- public.data_5_december_2013_summary_empire_injection_and_production definition

-- Drop table

-- DROP TABLE public.data_5_december_2013_summary_empire_injection_and_production;

CREATE TABLE public.data_5_december_2013_summary_empire_injection_and_production ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_5_december_2013_summary_empire_injection_and_production OWNER TO "admin";
GRANT ALL ON TABLE public.data_5_december_2013_summary_empire_injection_and_production TO "admin";


-- public.data_5_december_2013_summary_salt_wells definition

-- Drop table

-- DROP TABLE public.data_5_december_2013_summary_salt_wells;

CREATE TABLE public.data_5_december_2013_summary_salt_wells ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_5_december_2013_summary_salt_wells OWNER TO "admin";
GRANT ALL ON TABLE public.data_5_december_2013_summary_salt_wells TO "admin";


-- public.data_5_december_2013_summary_soda_lake definition

-- Drop table

-- DROP TABLE public.data_5_december_2013_summary_soda_lake;

CREATE TABLE public.data_5_december_2013_summary_soda_lake ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_5_december_2013_summary_soda_lake OWNER TO "admin";
GRANT ALL ON TABLE public.data_5_december_2013_summary_soda_lake TO "admin";


-- public.data_5_december_2013_summary_steamboat definition

-- Drop table

-- DROP TABLE public.data_5_december_2013_summary_steamboat;

CREATE TABLE public.data_5_december_2013_summary_steamboat ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_5_december_2013_summary_steamboat OWNER TO "admin";
GRANT ALL ON TABLE public.data_5_december_2013_summary_steamboat TO "admin";


-- public.data_5_december_2013_summary_steamboat_galena definition

-- Drop table

-- DROP TABLE public.data_5_december_2013_summary_steamboat_galena;

CREATE TABLE public.data_5_december_2013_summary_steamboat_galena ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_5_december_2013_summary_steamboat_galena OWNER TO "admin";
GRANT ALL ON TABLE public.data_5_december_2013_summary_steamboat_galena TO "admin";


-- public.data_5_december_2013_summary_steamboat_ii definition

-- Drop table

-- DROP TABLE public.data_5_december_2013_summary_steamboat_ii;

CREATE TABLE public.data_5_december_2013_summary_steamboat_ii ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_5_december_2013_summary_steamboat_ii OWNER TO "admin";
GRANT ALL ON TABLE public.data_5_december_2013_summary_steamboat_ii TO "admin";


-- public.data_5_december_2013_summary_steamboat_iii definition

-- Drop table

-- DROP TABLE public.data_5_december_2013_summary_steamboat_iii;

CREATE TABLE public.data_5_december_2013_summary_steamboat_iii ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_5_december_2013_summary_steamboat_iii OWNER TO "admin";
GRANT ALL ON TABLE public.data_5_december_2013_summary_steamboat_iii TO "admin";


-- public.data_5_december_2013_summary_stillwater definition

-- Drop table

-- DROP TABLE public.data_5_december_2013_summary_stillwater;

CREATE TABLE public.data_5_december_2013_summary_stillwater ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_5_december_2013_summary_stillwater OWNER TO "admin";
GRANT ALL ON TABLE public.data_5_december_2013_summary_stillwater TO "admin";


-- public.data_5_december_2013_summary_wabuska definition

-- Drop table

-- DROP TABLE public.data_5_december_2013_summary_wabuska;

CREATE TABLE public.data_5_december_2013_summary_wabuska ( the_production_and_injection_data_in_this_file_were_inputted text NULL);

-- Permissions

ALTER TABLE public.data_5_december_2013_summary_wabuska OWNER TO "admin";
GRANT ALL ON TABLE public.data_5_december_2013_summary_wabuska TO "admin";


-- public.data_6_20140401_0430_green_machine_florida_canyon_hourly_data definition

-- Drop table

-- DROP TABLE public.data_6_20140401_0430_green_machine_florida_canyon_hourly_data;

CREATE TABLE public.data_6_20140401_0430_green_machine_florida_canyon_hourly_data ( date_time text NULL, total_net_power_x000d_output_calculated text NULL, gross_power_x000d_output_veris text NULL, pump_parasitic_x000d_load text NULL, cooling_fan_parasitic_x000d_load_veris text NULL, geothermal_header_hot_x000d_water_temperature text NULL, hot_water_supply_x000d_temperature text NULL, hot_water_return_x000d_temperature text NULL, hot_water_supply_x000d_flow_rate text NULL, ambient_temperature_x000d_gm_sensor text NULL, notes float8 NULL, meso_west_x000d_weatherdata text NULL, date_time_1 float8 NULL, ambient_x000d_temperature text NULL, relative_x000d_humidity text NULL, wind_speed text NULL, wind_gust text NULL, wind_x000d_direction text NULL);

-- Permissions

ALTER TABLE public.data_6_20140401_0430_green_machine_florida_canyon_hourly_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_6_20140401_0430_green_machine_florida_canyon_hourly_data TO "admin";


-- public.data_7_data_optimal_stripping_rees_from_loaded_media definition

-- Drop table

-- DROP TABLE public.data_7_data_optimal_stripping_rees_from_loaded_media;

CREATE TABLE public.data_7_data_optimal_stripping_rees_from_loaded_media ( sample float8 NULL, unnamed_1 text NULL, unnamed_2 text NULL, unnamed_3 text NULL, "139_la_he" text NULL, "140_ce_he" text NULL, "141_pr_he" text NULL, "146_nd_he" text NULL, "151_eu_he" text NULL, "159_tb_he" text NULL, "163_dy_he" text NULL, "103_rh_istd_he" text NULL, "193_ir_istd_he" text NULL);

-- Permissions

ALTER TABLE public.data_7_data_optimal_stripping_rees_from_loaded_media OWNER TO "admin";
GRANT ALL ON TABLE public.data_7_data_optimal_stripping_rees_from_loaded_media TO "admin";


-- public.data_8_wa_pfa_phase2_completed_100k_map_index definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_completed_100k_map_index;

CREATE TABLE public.data_8_wa_pfa_phase2_completed_100k_map_index ( quad_name text NULL, shape_leng float8 NULL, shape_area float8 NULL, "year" int4 NULL, yr_scale float8 NULL, geometry public.geometry(polygon, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_completed_100k_map_index_geometry ON public.data_8_wa_pfa_phase2_completed_100k_map_index USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_completed_100k_map_index OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_completed_100k_map_index TO "admin";


-- public.data_8_wa_pfa_phase2_completed_24k_map_index definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_completed_24k_map_index;

CREATE TABLE public.data_8_wa_pfa_phase2_completed_24k_map_index ( objectid float8 NULL, pub_source text NULL, pub_number text NULL, quad_name text NULL, url text NULL, citation text NULL, unique_id float8 NULL, shape_leng float8 NULL, shape_area float8 NULL, "year" float8 NULL, yr_scale float8 NULL, geometry public.geometry(geometry, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_completed_24k_map_index_geometry ON public.data_8_wa_pfa_phase2_completed_24k_map_index USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_completed_24k_map_index OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_completed_24k_map_index TO "admin";


-- public.data_8_wa_pfa_phase2_dnr_lands_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_dnr_lands_data;

CREATE TABLE public.data_8_wa_pfa_phase2_dnr_lands_data ( objectid int8 NULL, parcel_sys int8 NULL, geometry public.geometry(geometry, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_dnr_lands_data_geometry ON public.data_8_wa_pfa_phase2_dnr_lands_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_dnr_lands_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_dnr_lands_data TO "admin";


-- public.data_8_wa_pfa_phase2_fault_model_200m definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_fault_model_200m;

CREATE TABLE public.data_8_wa_pfa_phase2_fault_model_200m ( depth_m int4 NULL, geometry public.geometry(geometry, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_fault_model_200m_geometry ON public.data_8_wa_pfa_phase2_fault_model_200m USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_fault_model_200m OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_fault_model_200m TO "admin";


-- public.data_8_wa_pfa_phase2_fault_model_2km definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_fault_model_2km;

CREATE TABLE public.data_8_wa_pfa_phase2_fault_model_2km ( depth_m int4 NULL, geometry public.geometry(geometry, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_fault_model_2km_geometry ON public.data_8_wa_pfa_phase2_fault_model_2km USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_fault_model_2km OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_fault_model_2km TO "admin";


-- public.data_8_wa_pfa_phase2_fault_model_points_200m definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_fault_model_points_200m;

CREATE TABLE public.data_8_wa_pfa_phase2_fault_model_points_200m ( depth_m int4 NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_fault_model_points_200m_geometry ON public.data_8_wa_pfa_phase2_fault_model_points_200m USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_fault_model_points_200m OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_fault_model_points_200m TO "admin";


-- public.data_8_wa_pfa_phase2_fault_model_points_2km definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_fault_model_points_2km;

CREATE TABLE public.data_8_wa_pfa_phase2_fault_model_points_2km ( depth_m int4 NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_fault_model_points_2km_geometry ON public.data_8_wa_pfa_phase2_fault_model_points_2km USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_fault_model_points_2km OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_fault_model_points_2km TO "admin";


-- public.data_8_wa_pfa_phase2_geothermometry_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_geothermometry_data;

CREATE TABLE public.data_8_wa_pfa_phase2_geothermometry_data ( objectid int8 NULL, spring_id float8 NULL, site_name text NULL, alt_spring text NULL, max_temper float8 NULL, flow_rate float8 NULL, mean_surfa float8 NULL, chemistry text NULL, temp_type text NULL, "comments" text NULL, qtz_geomet float8 NULL, na_k_ca_mg float8 NULL, water_type text NULL, o18_d_geot float8 NULL, o18_vs_d_w text NULL, geothermom text NULL, chemical_a text NULL, source_cod text NULL, county_nam text NULL, latitude_d float8 NULL, longitude float8 NULL, township text NULL, "range" text NULL, "section" float8 NULL, section_pa text NULL, p2_temp int8 NULL, delta_geot int8 NULL, charge float8 NULL, n_meas float8 NULL, year_meas float8 NULL, favorab_wt float8 NULL, model_valu float8 NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_geothermometry_data_geometry ON public.data_8_wa_pfa_phase2_geothermometry_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_geothermometry_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_geothermometry_data TO "admin";


-- public.data_8_wa_pfa_phase2_gorge_landuse_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_gorge_landuse_data;

CREATE TABLE public.data_8_wa_pfa_phase2_gorge_landuse_data ( objectid_1 int8 NULL, manage text NULL, mgmt_areas text NULL, gma_sma text NULL, shape_leng float8 NULL, lud_code text NULL, lud_gen text NULL, weight float8 NULL, geometry public.geometry(polygon, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_gorge_landuse_data_geometry ON public.data_8_wa_pfa_phase2_gorge_landuse_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_gorge_landuse_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_gorge_landuse_data TO "admin";


-- public.data_8_wa_pfa_phase2_named_streams_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_named_streams_data;

CREATE TABLE public.data_8_wa_pfa_phase2_named_streams_data ( wc_llid_nr text NULL, wc_ln_type int4 NULL, wc_gnis_nm text NULL, wc_period text NULL, geometry public.geometry(geometry, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_named_streams_data_geometry ON public.data_8_wa_pfa_phase2_named_streams_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_named_streams_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_named_streams_data TO "admin";


-- public.data_8_wa_pfa_phase2_no_drill_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_no_drill_data;

CREATE TABLE public.data_8_wa_pfa_phase2_no_drill_data ( objectid int8 NULL, "name" text NULL, "owner" text NULL, manager text NULL, management text NULL, geometry public.geometry(geometry, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_no_drill_data_geometry ON public.data_8_wa_pfa_phase2_no_drill_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_no_drill_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_no_drill_data TO "admin";


-- public.data_8_wa_pfa_phase2_open_water_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_open_water_data;

CREATE TABLE public.data_8_wa_pfa_phase2_open_water_data ( wbhydro_id int4 NULL, wb_gnis_nm text NULL, wb_period text NULL, geometry public.geometry(polygon, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_open_water_data_geometry ON public.data_8_wa_pfa_phase2_open_water_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_open_water_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_open_water_data TO "admin";


-- public.data_8_wa_pfa_phase2_poly3d_results definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_poly3d_results;

CREATE TABLE public.data_8_wa_pfa_phase2_poly3d_results ( x float8 NULL, y float8 NULL, z int8 NULL, shear float8 NULL, dilation float8 NULL, slip_grad float8 NULL, slip_tend float8 NULL, area text NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_poly3d_results_geometry ON public.data_8_wa_pfa_phase2_poly3d_results USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_poly3d_results OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_poly3d_results TO "admin";


-- public.data_8_wa_pfa_phase2_qintrusive_rocks definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_qintrusive_rocks;

CREATE TABLE public.data_8_wa_pfa_phase2_qintrusive_rocks ( objectid float8 NULL, gunit_txt text NULL, age text NULL, lithology text NULL, named_unit text NULL, "source" text NULL, geometry public.geometry(polygon, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_qintrusive_rocks_geometry ON public.data_8_wa_pfa_phase2_qintrusive_rocks USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_qintrusive_rocks OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_qintrusive_rocks TO "admin";


-- public.data_8_wa_pfa_phase2_slip_and_dilation_tend_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_slip_and_dilation_tend_data;

CREATE TABLE public.data_8_wa_pfa_phase2_slip_and_dilation_tend_data ( slip_tend float8 NULL, dilat_tend float8 NULL, depth_m float8 NULL, geometry public.geometry(linestring, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_slip_and_dilation_tend_data_geometry ON public.data_8_wa_pfa_phase2_slip_and_dilation_tend_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_slip_and_dilation_tend_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_slip_and_dilation_tend_data TO "admin";


-- public.data_8_wa_pfa_phase2_spring_temperature_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_spring_temperature_data;

CREATE TABLE public.data_8_wa_pfa_phase2_spring_temperature_data ( objectid float8 NULL, spring_id float8 NULL, site_name text NULL, alt_spring text NULL, max_temper float8 NULL, flow_rate float8 NULL, mean_surfa float8 NULL, chemistry text NULL, temp_type text NULL, "comments" text NULL, qtz_geomet float8 NULL, na_k_ca_mg float8 NULL, water_type text NULL, o18_d_geot float8 NULL, o18_vs_d_w text NULL, geothermom text NULL, chemical_a text NULL, source_cod text NULL, county_nam text NULL, latitude_d float8 NULL, longitude float8 NULL, township text NULL, "range" text NULL, "section" float8 NULL, section_pa text NULL, uncert_wt int4 NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_spring_temperature_data_geometry ON public.data_8_wa_pfa_phase2_spring_temperature_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_spring_temperature_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_spring_temperature_data TO "admin";


-- public.data_8_wa_pfa_phase2_temperature_gradient_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_temperature_gradient_data;

CREATE TABLE public.data_8_wa_pfa_phase2_temperature_gradient_data ( objectid int8 NULL, latitude float8 NULL, longitude float8 NULL, depth_mete float8 NULL, surface_te float8 NULL, test_date timestamp NULL, source_cod text NULL, model_valu float8 NULL, uncert_wt float8 NULL, favorab_wt float8 NULL, temp_grad float8 NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_temperature_gradient_data_geometry ON public.data_8_wa_pfa_phase2_temperature_gradient_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_temperature_gradient_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_temperature_gradient_data TO "admin";


-- public.data_8_wa_pfa_phase2_transmission_lines_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_transmission_lines_data;

CREATE TABLE public.data_8_wa_pfa_phase2_transmission_lines_data ( objectid int4 NULL, geometry public.geometry(linestring, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_transmission_lines_data_geometry ON public.data_8_wa_pfa_phase2_transmission_lines_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_transmission_lines_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_transmission_lines_data TO "admin";


-- public.data_8_wa_pfa_phase2_volcanic_vents_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_volcanic_vents_data;

CREATE TABLE public.data_8_wa_pfa_phase2_volcanic_vents_data ( objectid float8 NULL, vent_id float8 NULL, vent_name text NULL, feature_ty text NULL, vent_group text NULL, unit_name text NULL, lithology text NULL, unit_age text NULL, unit_age_k text NULL, "comments" text NULL, buffer_km float8 NULL, weight float8 NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_volcanic_vents_data_geometry ON public.data_8_wa_pfa_phase2_volcanic_vents_data USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_volcanic_vents_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_volcanic_vents_data TO "admin";


-- public.data_8_wa_pfa_phase2_vpvs_data_200m_depth definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_vpvs_data_200m_depth;

CREATE TABLE public.data_8_wa_pfa_phase2_vpvs_data_200m_depth ( longitude float8 NULL, latitude float8 NULL, "depth" float8 NULL, vp float8 NULL, vpsens float8 NULL, vs float8 NULL, vssens float8 NULL, vp_vs float8 NULL, "error" float8 NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_vpvs_data_200m_depth_geometry ON public.data_8_wa_pfa_phase2_vpvs_data_200m_depth USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_vpvs_data_200m_depth OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_vpvs_data_200m_depth TO "admin";


-- public.data_8_wa_pfa_phase2_vpvs_data_2km_depth definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_vpvs_data_2km_depth;

CREATE TABLE public.data_8_wa_pfa_phase2_vpvs_data_2km_depth ( longitude float8 NULL, latitude float8 NULL, "depth" float8 NULL, vp float8 NULL, vpsens float8 NULL, vs float8 NULL, vssens float8 NULL, vp_vs float8 NULL, "error" float8 NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_vpvs_data_2km_depth_geometry ON public.data_8_wa_pfa_phase2_vpvs_data_2km_depth USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_vpvs_data_2km_depth OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_vpvs_data_2km_depth TO "admin";


-- public.data_8_wa_pfa_phase2_vpvs_model_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_vpvs_model_data;

CREATE TABLE public.data_8_wa_pfa_phase2_vpvs_model_data ( longitude float8 NULL, latitude float8 NULL, "depth" float8 NULL, vp float8 NULL, vpsens float8 NULL, vs float8 NULL, vssens float8 NULL, vp_vs float8 NULL);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_vpvs_model_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_vpvs_model_data TO "admin";


-- public.data_8_wa_pfa_phase2_vs_ambient_data_200m_depth definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_vs_ambient_data_200m_depth;

CREATE TABLE public.data_8_wa_pfa_phase2_vs_ambient_data_200m_depth ( lon float8 NULL, lat float8 NULL, top_km float8 NULL, bot_km int8 NULL, vs_unc float8 NULL, vs_kms float8 NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_vs_ambient_data_200m_depth_geometry ON public.data_8_wa_pfa_phase2_vs_ambient_data_200m_depth USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_vs_ambient_data_200m_depth OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_vs_ambient_data_200m_depth TO "admin";


-- public.data_8_wa_pfa_phase2_vs_ambient_data_2km_depth definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_vs_ambient_data_2km_depth;

CREATE TABLE public.data_8_wa_pfa_phase2_vs_ambient_data_2km_depth ( lon float8 NULL, lat float8 NULL, top_km int8 NULL, bot_km float8 NULL, vs_unc float8 NULL, vs_kms float8 NULL, geometry public.geometry(point, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_vs_ambient_data_2km_depth_geometry ON public.data_8_wa_pfa_phase2_vs_ambient_data_2km_depth USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_vs_ambient_data_2km_depth OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_vs_ambient_data_2km_depth TO "admin";


-- public.data_8_wa_pfa_phase2_vs_model_data definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_vs_model_data;

CREATE TABLE public.data_8_wa_pfa_phase2_vs_model_data ( lon float8 NULL, lat float8 NULL, top_km int8 NULL, bot_km float8 NULL, vs_kmpersecond float8 NULL);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_vs_model_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_vs_model_data TO "admin";


-- public.data_8_wa_pfa_phase2_water_from_100k_maps definition

-- Drop table

-- DROP TABLE public.data_8_wa_pfa_phase2_water_from_100k_maps;

CREATE TABLE public.data_8_wa_pfa_phase2_water_from_100k_maps ( objectid float8 NULL, geologic_u text NULL, geologic_a text NULL, lithology text NULL, named_unit text NULL, age_lithol text NULL, shape_leng float8 NULL, shape_area float8 NULL, geometry public.geometry(geometry, 2927) NULL);
CREATE INDEX idx_data_8_wa_pfa_phase2_water_from_100k_maps_geometry ON public.data_8_wa_pfa_phase2_water_from_100k_maps USING gist (geometry);

-- Permissions

ALTER TABLE public.data_8_wa_pfa_phase2_water_from_100k_maps OWNER TO "admin";
GRANT ALL ON TABLE public.data_8_wa_pfa_phase2_water_from_100k_maps TO "admin";


-- public.data_9_20130901_0930_green_machine_florida_canyon_hourly_data definition

-- Drop table

-- DROP TABLE public.data_9_20130901_0930_green_machine_florida_canyon_hourly_data;

CREATE TABLE public.data_9_20130901_0930_green_machine_florida_canyon_hourly_data ( date_time text NULL, total_net_power_x000d_output_calculated text NULL, gross_power_x000d_output_veris text NULL, pump_parasitic_x000d_load text NULL, cooling_fan_parasitic_x000d_load_veris text NULL, geothermal_header_hot_x000d_water_temperature text NULL, hot_water_supply_x000d_temperature text NULL, hot_water_return_x000d_temperature text NULL, hot_water_supply_x000d_flow_rate text NULL, ambient_temperature_x000d_gm_sensor text NULL, notes float8 NULL, meso_west_x000d_weatherdata text NULL, date_time_1 text NULL, ambient_x000d_temperature text NULL, relative_x000d_humidity text NULL, wind_speed text NULL, wind_gust text NULL, wind_x000d_direction text NULL);

-- Permissions

ALTER TABLE public.data_9_20130901_0930_green_machine_florida_canyon_hourly_data OWNER TO "admin";
GRANT ALL ON TABLE public.data_9_20130901_0930_green_machine_florida_canyon_hourly_data TO "admin";


-- public.spatial_ref_sys definition

-- Drop table

-- DROP TABLE public.spatial_ref_sys;

CREATE TABLE public.spatial_ref_sys ( srid int4 NOT NULL, auth_name varchar(256) NULL, auth_srid int4 NULL, srtext varchar(2048) NULL, proj4text varchar(2048) NULL, CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid), CONSTRAINT spatial_ref_sys_srid_check CHECK (((srid > 0) AND (srid <= 998999))));

-- Permissions

ALTER TABLE public.spatial_ref_sys OWNER TO "admin";


-- public.submissions_master definition

-- Drop table

-- DROP TABLE public.submissions_master;

CREATE TABLE public.submissions_master ( id serial4 NOT NULL, original_submission_id text NOT NULL, title text NULL, description text NULL, authors text NULL, keywords jsonb NULL, ingested_at timestamp DEFAULT CURRENT_TIMESTAMP NULL, CONSTRAINT submissions_master_original_submission_id_key UNIQUE (original_submission_id), CONSTRAINT submissions_master_pkey PRIMARY KEY (id));

-- Permissions

ALTER TABLE public.submissions_master OWNER TO "admin";
GRANT ALL ON TABLE public.submissions_master TO "admin";


-- public.submission_files_registry definition

-- Drop table

-- DROP TABLE public.submission_files_registry;

CREATE TABLE public.submission_files_registry ( id serial4 NOT NULL, submission_id int4 NULL, original_filename text NULL, file_type text NULL, db_table_name text NULL, ingested_at timestamp DEFAULT CURRENT_TIMESTAMP NULL, CONSTRAINT submission_files_registry_pkey PRIMARY KEY (id), CONSTRAINT submission_files_registry_submission_id_fkey FOREIGN KEY (submission_id) REFERENCES public.submissions_master(id));

-- Permissions

ALTER TABLE public.submission_files_registry OWNER TO "admin";
GRANT ALL ON TABLE public.submission_files_registry TO "admin";


-- public.geography_columns source

CREATE OR REPLACE VIEW public.geography_columns
AS SELECT current_database() AS f_table_catalog,
    n.nspname AS f_table_schema,
    c.relname AS f_table_name,
    a.attname AS f_geography_column,
    postgis_typmod_dims(a.atttypmod) AS coord_dimension,
    postgis_typmod_srid(a.atttypmod) AS srid,
    postgis_typmod_type(a.atttypmod) AS type
   FROM pg_class c,
    pg_attribute a,
    pg_type t,
    pg_namespace n
  WHERE t.typname = 'geography'::name AND a.attisdropped = false AND a.atttypid = t.oid AND a.attrelid = c.oid AND c.relnamespace = n.oid AND (c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'm'::"char", 'f'::"char", 'p'::"char"])) AND NOT pg_is_other_temp_schema(c.relnamespace) AND has_table_privilege(c.oid, 'SELECT'::text);

-- Permissions

ALTER TABLE public.geography_columns OWNER TO "admin";


-- public.geometry_columns source

CREATE OR REPLACE VIEW public.geometry_columns
AS SELECT current_database()::character varying(256) AS f_table_catalog,
    n.nspname AS f_table_schema,
    c.relname AS f_table_name,
    a.attname AS f_geometry_column,
    COALESCE(postgis_typmod_dims(a.atttypmod), sn.ndims, 2) AS coord_dimension,
    COALESCE(NULLIF(postgis_typmod_srid(a.atttypmod), 0), sr.srid, 0) AS srid,
    replace(replace(COALESCE(NULLIF(upper(postgis_typmod_type(a.atttypmod)), 'GEOMETRY'::text), st.type, 'GEOMETRY'::text), 'ZM'::text, ''::text), 'Z'::text, ''::text)::character varying(30) AS type
   FROM pg_class c
     JOIN pg_attribute a ON a.attrelid = c.oid AND NOT a.attisdropped
     JOIN pg_namespace n ON c.relnamespace = n.oid
     JOIN pg_type t ON a.atttypid = t.oid
     LEFT JOIN ( SELECT s.connamespace,
            s.conrelid,
            s.conkey,
            replace(split_part(s.consrc, ''''::text, 2), ')'::text, ''::text) AS type
           FROM ( SELECT pg_constraint.connamespace,
                    pg_constraint.conrelid,
                    pg_constraint.conkey,
                    pg_get_constraintdef(pg_constraint.oid) AS consrc
                   FROM pg_constraint) s
          WHERE s.consrc ~~* '%geometrytype(% = %'::text) st ON st.connamespace = n.oid AND st.conrelid = c.oid AND (a.attnum = ANY (st.conkey))
     LEFT JOIN ( SELECT s.connamespace,
            s.conrelid,
            s.conkey,
            replace(split_part(s.consrc, ' = '::text, 2), ')'::text, ''::text)::integer AS ndims
           FROM ( SELECT pg_constraint.connamespace,
                    pg_constraint.conrelid,
                    pg_constraint.conkey,
                    pg_get_constraintdef(pg_constraint.oid) AS consrc
                   FROM pg_constraint) s
          WHERE s.consrc ~~* '%ndims(% = %'::text) sn ON sn.connamespace = n.oid AND sn.conrelid = c.oid AND (a.attnum = ANY (sn.conkey))
     LEFT JOIN ( SELECT s.connamespace,
            s.conrelid,
            s.conkey,
            replace(replace(split_part(s.consrc, ' = '::text, 2), ')'::text, ''::text), '('::text, ''::text)::integer AS srid
           FROM ( SELECT pg_constraint.connamespace,
                    pg_constraint.conrelid,
                    pg_constraint.conkey,
                    pg_get_constraintdef(pg_constraint.oid) AS consrc
                   FROM pg_constraint) s
          WHERE s.consrc ~~* '%srid(% = %'::text) sr ON sr.connamespace = n.oid AND sr.conrelid = c.oid AND (a.attnum = ANY (sr.conkey))
  WHERE (c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'm'::"char", 'f'::"char", 'p'::"char"])) AND NOT c.relname = 'raster_columns'::name AND t.typname = 'geometry'::name AND NOT pg_is_other_temp_schema(c.relnamespace) AND has_table_privilege(c.oid, 'SELECT'::text);

-- Permissions

ALTER TABLE public.geometry_columns OWNER TO "admin";



-- DROP FUNCTION public._postgis_deprecate(text, text, text);

CREATE OR REPLACE FUNCTION public._postgis_deprecate(oldname text, newname text, version text)
 RETURNS void
 LANGUAGE plpgsql
 IMMUTABLE STRICT COST 250
AS $function$
DECLARE
  curver_text text;
BEGIN
  --
  -- Raises a NOTICE if it was deprecated in this version,
  -- a WARNING if in a previous version (only up to minor version checked)
  --
	curver_text := '3.5.2';
	IF pg_catalog.split_part(curver_text,'.',1)::int > pg_catalog.split_part(version,'.',1)::int OR
	   ( pg_catalog.split_part(curver_text,'.',1) = pg_catalog.split_part(version,'.',1) AND
		 pg_catalog.split_part(curver_text,'.',2) != split_part(version,'.',2) )
	THEN
	  RAISE WARNING '% signature was deprecated in %. Please use %', oldname, version, newname;
	ELSE
	  RAISE DEBUG '% signature was deprecated in %. Please use %', oldname, version, newname;
	END IF;
END;
$function$
;

-- Permissions

ALTER FUNCTION public._postgis_deprecate(text, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public._postgis_deprecate(text, text, text) TO "admin";

-- DROP FUNCTION public._postgis_index_extent(regclass, text);

CREATE OR REPLACE FUNCTION public._postgis_index_extent(tbl regclass, col text)
 RETURNS box2d
 LANGUAGE c
 STABLE STRICT
AS '$libdir/postgis-3', $function$_postgis_gserialized_index_extent$function$
;

-- Permissions

ALTER FUNCTION public._postgis_index_extent(regclass, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public._postgis_index_extent(regclass, text) TO "admin";

-- DROP FUNCTION public._postgis_join_selectivity(regclass, text, regclass, text, text);

CREATE OR REPLACE FUNCTION public._postgis_join_selectivity(regclass, text, regclass, text, text DEFAULT '2'::text)
 RETURNS double precision
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$_postgis_gserialized_joinsel$function$
;

-- Permissions

ALTER FUNCTION public._postgis_join_selectivity(regclass, text, regclass, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public._postgis_join_selectivity(regclass, text, regclass, text, text) TO "admin";

-- DROP FUNCTION public._postgis_pgsql_version();

CREATE OR REPLACE FUNCTION public._postgis_pgsql_version()
 RETURNS text
 LANGUAGE sql
 STABLE
AS $function$
	SELECT CASE WHEN pg_catalog.split_part(s,'.',1)::integer > 9 THEN pg_catalog.split_part(s,'.',1) || '0'
	ELSE pg_catalog.split_part(s,'.', 1) || pg_catalog.split_part(s,'.', 2) END AS v
	FROM pg_catalog.substring(version(), E'PostgreSQL ([0-9\\.]+)') AS s;
$function$
;

-- Permissions

ALTER FUNCTION public._postgis_pgsql_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public._postgis_pgsql_version() TO "admin";

-- DROP FUNCTION public._postgis_scripts_pgsql_version();

CREATE OR REPLACE FUNCTION public._postgis_scripts_pgsql_version()
 RETURNS text
 LANGUAGE sql
 IMMUTABLE
AS $function$SELECT '170'::text AS version$function$
;

-- Permissions

ALTER FUNCTION public._postgis_scripts_pgsql_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public._postgis_scripts_pgsql_version() TO "admin";

-- DROP FUNCTION public._postgis_selectivity(regclass, text, geometry, text);

CREATE OR REPLACE FUNCTION public._postgis_selectivity(tbl regclass, att_name text, geom geometry, mode text DEFAULT '2'::text)
 RETURNS double precision
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$_postgis_gserialized_sel$function$
;

-- Permissions

ALTER FUNCTION public._postgis_selectivity(regclass, text, geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public._postgis_selectivity(regclass, text, geometry, text) TO "admin";

-- DROP FUNCTION public._postgis_stats(regclass, text, text);

CREATE OR REPLACE FUNCTION public._postgis_stats(tbl regclass, att_name text, text DEFAULT '2'::text)
 RETURNS text
 LANGUAGE c
 PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$_postgis_gserialized_stats$function$
;

-- Permissions

ALTER FUNCTION public._postgis_stats(regclass, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public._postgis_stats(regclass, text, text) TO "admin";

-- DROP FUNCTION public._st_3ddfullywithin(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public._st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_dfullywithin3d$function$
;

-- Permissions

ALTER FUNCTION public._st_3ddfullywithin(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_3ddfullywithin(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public._st_3ddwithin(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public._st_3ddwithin(geom1 geometry, geom2 geometry, double precision)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_dwithin3d$function$
;

-- Permissions

ALTER FUNCTION public._st_3ddwithin(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_3ddwithin(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public._st_3dintersects(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_3dintersects(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_3DIntersects$function$
;

-- Permissions

ALTER FUNCTION public._st_3dintersects(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_3dintersects(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_asgml(int4, geometry, int4, int4, text, text);

CREATE OR REPLACE FUNCTION public._st_asgml(integer, geometry, integer, integer, text, text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asGML$function$
;

-- Permissions

ALTER FUNCTION public._st_asgml(int4, geometry, int4, int4, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_asgml(int4, geometry, int4, int4, text, text) TO "admin";

-- DROP FUNCTION public._st_asx3d(int4, geometry, int4, int4, text);

CREATE OR REPLACE FUNCTION public._st_asx3d(integer, geometry, integer, integer, text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asX3D$function$
;

-- Permissions

ALTER FUNCTION public._st_asx3d(int4, geometry, int4, int4, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_asx3d(int4, geometry, int4, int4, text) TO "admin";

-- DROP FUNCTION public._st_bestsrid(geography);

CREATE OR REPLACE FUNCTION public._st_bestsrid(geography)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$geography_bestsrid$function$
;

-- Permissions

ALTER FUNCTION public._st_bestsrid(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_bestsrid(geography) TO "admin";

-- DROP FUNCTION public._st_bestsrid(geography, geography);

CREATE OR REPLACE FUNCTION public._st_bestsrid(geography, geography)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$geography_bestsrid$function$
;

-- Permissions

ALTER FUNCTION public._st_bestsrid(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_bestsrid(geography, geography) TO "admin";

-- DROP FUNCTION public._st_concavehull(geometry);

CREATE OR REPLACE FUNCTION public._st_concavehull(param_inputgeom geometry)
 RETURNS geometry
 LANGUAGE plpgsql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$
	DECLARE
	vexhull public.geometry;
	var_resultgeom public.geometry;
	var_inputgeom public.geometry;
	vexring public.geometry;
	cavering public.geometry;
	cavept public.geometry[];
	seglength double precision;
	var_tempgeom public.geometry;
	scale_factor float := 1;
	i integer;
	BEGIN
		-- First compute the ConvexHull of the geometry
		vexhull := public.ST_ConvexHull(param_inputgeom);
		var_inputgeom := param_inputgeom;
		--A point really has no concave hull
		IF public.ST_GeometryType(vexhull) = 'ST_Point' OR public.ST_GeometryType(vexHull) = 'ST_LineString' THEN
			RETURN vexhull;
		END IF;

		-- convert the hull perimeter to a linestring so we can manipulate individual points
		vexring := CASE WHEN public.ST_GeometryType(vexhull) = 'ST_LineString' THEN vexhull ELSE public.ST_ExteriorRing(vexhull) END;
		IF abs(public.ST_X(public.ST_PointN(vexring,1))) < 1 THEN --scale the geometry to prevent stupid precision errors - not sure it works so make low for now
			scale_factor := 100;
			vexring := public.ST_Scale(vexring, scale_factor,scale_factor);
			var_inputgeom := public.ST_Scale(var_inputgeom, scale_factor, scale_factor);
			--RAISE NOTICE 'Scaling';
		END IF;
		seglength := public.ST_Length(vexring)/least(public.ST_NPoints(vexring)*2,1000) ;

		vexring := public.ST_Segmentize(vexring, seglength);
		-- find the point on the original geom that is closest to each point of the convex hull and make a new linestring out of it.
		cavering := public.ST_Collect(
			ARRAY(

				SELECT
					public.ST_ClosestPoint(var_inputgeom, pt ) As the_geom
					FROM (
						SELECT  public.ST_PointN(vexring, n ) As pt, n
							FROM
							generate_series(1, public.ST_NPoints(vexring) ) As n
						) As pt

				)
			)
		;

		var_resultgeom := public.ST_MakeLine(geom)
			FROM public.ST_Dump(cavering) As foo;

		IF public.ST_IsSimple(var_resultgeom) THEN
			var_resultgeom := public.ST_MakePolygon(var_resultgeom);
			--RAISE NOTICE 'is Simple: %', var_resultgeom;
		ELSE 
			--RAISE NOTICE 'is not Simple: %', var_resultgeom;
			var_resultgeom := public.ST_ConvexHull(var_resultgeom);
		END IF;

		IF scale_factor > 1 THEN -- scale the result back
			var_resultgeom := public.ST_Scale(var_resultgeom, 1/scale_factor, 1/scale_factor);
		END IF;

		-- make sure result covers original (#3638)
		-- Using ST_UnaryUnion since SFCGAL doesn't replace with its own implementation
		-- and SFCGAL one chokes for some reason
		var_resultgeom := public.ST_UnaryUnion(public.ST_Collect(param_inputgeom, var_resultgeom) );
		RETURN var_resultgeom;

	END;
$function$
;

-- Permissions

ALTER FUNCTION public._st_concavehull(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_concavehull(geometry) TO "admin";

-- DROP FUNCTION public._st_contains(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_contains(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$contains$function$
;

-- Permissions

ALTER FUNCTION public._st_contains(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_contains(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_containsproperly(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_containsproperly(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$containsproperly$function$
;

-- Permissions

ALTER FUNCTION public._st_containsproperly(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_containsproperly(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_coveredby(geography, geography);

CREATE OR REPLACE FUNCTION public._st_coveredby(geog1 geography, geog2 geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$geography_coveredby$function$
;

-- Permissions

ALTER FUNCTION public._st_coveredby(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_coveredby(geography, geography) TO "admin";

-- DROP FUNCTION public._st_coveredby(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_coveredby(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$coveredby$function$
;

-- Permissions

ALTER FUNCTION public._st_coveredby(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_coveredby(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_covers(geography, geography);

CREATE OR REPLACE FUNCTION public._st_covers(geog1 geography, geog2 geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$geography_covers$function$
;

-- Permissions

ALTER FUNCTION public._st_covers(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_covers(geography, geography) TO "admin";

-- DROP FUNCTION public._st_covers(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_covers(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$covers$function$
;

-- Permissions

ALTER FUNCTION public._st_covers(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_covers(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_crosses(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_crosses(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$crosses$function$
;

-- Permissions

ALTER FUNCTION public._st_crosses(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_crosses(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_dfullywithin(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public._st_dfullywithin(geom1 geometry, geom2 geometry, double precision)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_dfullywithin$function$
;

-- Permissions

ALTER FUNCTION public._st_dfullywithin(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_dfullywithin(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public._st_distancetree(geography, geography);

CREATE OR REPLACE FUNCTION public._st_distancetree(geography, geography)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$SELECT public._ST_DistanceTree($1, $2, 0.0, true)$function$
;

-- Permissions

ALTER FUNCTION public._st_distancetree(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_distancetree(geography, geography) TO "admin";

-- DROP FUNCTION public._st_distancetree(geography, geography, float8, bool);

CREATE OR REPLACE FUNCTION public._st_distancetree(geography, geography, double precision, boolean)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE STRICT COST 5000
AS '$libdir/postgis-3', $function$geography_distance_tree$function$
;

-- Permissions

ALTER FUNCTION public._st_distancetree(geography, geography, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_distancetree(geography, geography, float8, bool) TO "admin";

-- DROP FUNCTION public._st_distanceuncached(geography, geography, float8, bool);

CREATE OR REPLACE FUNCTION public._st_distanceuncached(geography, geography, double precision, boolean)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE STRICT COST 5000
AS '$libdir/postgis-3', $function$geography_distance_uncached$function$
;

-- Permissions

ALTER FUNCTION public._st_distanceuncached(geography, geography, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_distanceuncached(geography, geography, float8, bool) TO "admin";

-- DROP FUNCTION public._st_distanceuncached(geography, geography, bool);

CREATE OR REPLACE FUNCTION public._st_distanceuncached(geography, geography, boolean)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$SELECT public._ST_DistanceUnCached($1, $2, 0.0, $3)$function$
;

-- Permissions

ALTER FUNCTION public._st_distanceuncached(geography, geography, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_distanceuncached(geography, geography, bool) TO "admin";

-- DROP FUNCTION public._st_distanceuncached(geography, geography);

CREATE OR REPLACE FUNCTION public._st_distanceuncached(geography, geography)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$SELECT public._ST_DistanceUnCached($1, $2, 0.0, true)$function$
;

-- Permissions

ALTER FUNCTION public._st_distanceuncached(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_distanceuncached(geography, geography) TO "admin";

-- DROP FUNCTION public._st_dwithin(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public._st_dwithin(geom1 geometry, geom2 geometry, double precision)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_dwithin$function$
;

-- Permissions

ALTER FUNCTION public._st_dwithin(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_dwithin(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public._st_dwithin(geography, geography, float8, bool);

CREATE OR REPLACE FUNCTION public._st_dwithin(geog1 geography, geog2 geography, tolerance double precision, use_spheroid boolean DEFAULT true)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$geography_dwithin$function$
;

-- Permissions

ALTER FUNCTION public._st_dwithin(geography, geography, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_dwithin(geography, geography, float8, bool) TO "admin";

-- DROP FUNCTION public._st_dwithinuncached(geography, geography, float8, bool);

CREATE OR REPLACE FUNCTION public._st_dwithinuncached(geography, geography, double precision, boolean)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE STRICT COST 5000
AS '$libdir/postgis-3', $function$geography_dwithin_uncached$function$
;

-- Permissions

ALTER FUNCTION public._st_dwithinuncached(geography, geography, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_dwithinuncached(geography, geography, float8, bool) TO "admin";

-- DROP FUNCTION public._st_dwithinuncached(geography, geography, float8);

CREATE OR REPLACE FUNCTION public._st_dwithinuncached(geography, geography, double precision)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE
AS $function$SELECT $1 OPERATOR(public.&&) public._ST_Expand($2,$3) AND $2 OPERATOR(public.&&) public._ST_Expand($1,$3) AND public._ST_DWithinUnCached($1, $2, $3, true)$function$
;

-- Permissions

ALTER FUNCTION public._st_dwithinuncached(geography, geography, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_dwithinuncached(geography, geography, float8) TO "admin";

-- DROP FUNCTION public._st_equals(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_equals(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Equals$function$
;

-- Permissions

ALTER FUNCTION public._st_equals(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_equals(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_expand(geography, float8);

CREATE OR REPLACE FUNCTION public._st_expand(geography, double precision)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$geography_expand$function$
;

-- Permissions

ALTER FUNCTION public._st_expand(geography, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_expand(geography, float8) TO "admin";

-- DROP FUNCTION public._st_geomfromgml(text, int4);

CREATE OR REPLACE FUNCTION public._st_geomfromgml(text, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$geom_from_gml$function$
;

-- Permissions

ALTER FUNCTION public._st_geomfromgml(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_geomfromgml(text, int4) TO "admin";

-- DROP FUNCTION public._st_intersects(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_intersects(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Intersects$function$
;

-- Permissions

ALTER FUNCTION public._st_intersects(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_intersects(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_linecrossingdirection(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_linecrossingdirection(line1 geometry, line2 geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_LineCrossingDirection$function$
;

-- Permissions

ALTER FUNCTION public._st_linecrossingdirection(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_linecrossingdirection(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_longestline(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_longestline(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_longestline2d$function$
;

-- Permissions

ALTER FUNCTION public._st_longestline(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_longestline(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_maxdistance(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_maxdistance(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_maxdistance2d_linestring$function$
;

-- Permissions

ALTER FUNCTION public._st_maxdistance(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_maxdistance(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_orderingequals(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_orderingequals(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_same$function$
;

-- Permissions

ALTER FUNCTION public._st_orderingequals(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_orderingequals(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_overlaps(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_overlaps(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$overlaps$function$
;

-- Permissions

ALTER FUNCTION public._st_overlaps(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_overlaps(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_pointoutside(geography);

CREATE OR REPLACE FUNCTION public._st_pointoutside(geography)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/postgis-3', $function$geography_point_outside$function$
;

-- Permissions

ALTER FUNCTION public._st_pointoutside(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_pointoutside(geography) TO "admin";

-- DROP FUNCTION public._st_sortablehash(geometry);

CREATE OR REPLACE FUNCTION public._st_sortablehash(geom geometry)
 RETURNS bigint
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$_ST_SortableHash$function$
;

-- Permissions

ALTER FUNCTION public._st_sortablehash(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_sortablehash(geometry) TO "admin";

-- DROP FUNCTION public._st_touches(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_touches(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$touches$function$
;

-- Permissions

ALTER FUNCTION public._st_touches(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_touches(geometry, geometry) TO "admin";

-- DROP FUNCTION public._st_voronoi(geometry, geometry, float8, bool);

CREATE OR REPLACE FUNCTION public._st_voronoi(g1 geometry, clip geometry DEFAULT NULL::geometry, tolerance double precision DEFAULT 0.0, return_polygons boolean DEFAULT true)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 5000
AS '$libdir/postgis-3', $function$ST_Voronoi$function$
;

-- Permissions

ALTER FUNCTION public._st_voronoi(geometry, geometry, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_voronoi(geometry, geometry, float8, bool) TO "admin";

-- DROP FUNCTION public._st_within(geometry, geometry);

CREATE OR REPLACE FUNCTION public._st_within(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$SELECT public._ST_Contains($2,$1)$function$
;

-- Permissions

ALTER FUNCTION public._st_within(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public._st_within(geometry, geometry) TO "admin";

-- DROP FUNCTION public.addgeometrycolumn(varchar, varchar, int4, varchar, int4, bool);

CREATE OR REPLACE FUNCTION public.addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true)
 RETURNS text
 LANGUAGE plpgsql
 STRICT
AS $function$
DECLARE
	ret  text;
BEGIN
	SELECT public.AddGeometryColumn('','',$1,$2,$3,$4,$5, $6) into ret;
	RETURN ret;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.addgeometrycolumn(varchar, varchar, int4, varchar, int4, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.addgeometrycolumn(varchar, varchar, int4, varchar, int4, bool) TO "admin";

-- DROP FUNCTION public.addgeometrycolumn(varchar, varchar, varchar, varchar, int4, varchar, int4, bool);

CREATE OR REPLACE FUNCTION public.addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true)
 RETURNS text
 LANGUAGE plpgsql
 STRICT
AS $function$
DECLARE
	rec RECORD;
	sr varchar;
	real_schema name;
	sql text;
	new_srid integer;

BEGIN

	-- Verify geometry type
	IF (postgis_type_name(new_type,new_dim) IS NULL )
	THEN
		RAISE EXCEPTION 'Invalid type name "%(%)" - valid ones are:
	POINT, MULTIPOINT,
	LINESTRING, MULTILINESTRING,
	POLYGON, MULTIPOLYGON,
	CIRCULARSTRING, COMPOUNDCURVE, MULTICURVE,
	CURVEPOLYGON, MULTISURFACE,
	GEOMETRY, GEOMETRYCOLLECTION,
	POINTM, MULTIPOINTM,
	LINESTRINGM, MULTILINESTRINGM,
	POLYGONM, MULTIPOLYGONM,
	CIRCULARSTRINGM, COMPOUNDCURVEM, MULTICURVEM
	CURVEPOLYGONM, MULTISURFACEM, TRIANGLE, TRIANGLEM,
	POLYHEDRALSURFACE, POLYHEDRALSURFACEM, TIN, TINM
	or GEOMETRYCOLLECTIONM', new_type, new_dim;
		RETURN 'fail';
	END IF;

	-- Verify dimension
	IF ( (new_dim >4) OR (new_dim <2) ) THEN
		RAISE EXCEPTION 'invalid dimension';
		RETURN 'fail';
	END IF;

	IF ( (new_type LIKE '%M') AND (new_dim!=3) ) THEN
		RAISE EXCEPTION 'TypeM needs 3 dimensions';
		RETURN 'fail';
	END IF;

	-- Verify SRID
	IF ( new_srid_in > 0 ) THEN
		IF new_srid_in > 998999 THEN
			RAISE EXCEPTION 'AddGeometryColumn() - SRID must be <= %', 998999;
		END IF;
		new_srid := new_srid_in;
		SELECT SRID INTO sr FROM public.spatial_ref_sys WHERE SRID = new_srid;
		IF NOT FOUND THEN
			RAISE EXCEPTION 'AddGeometryColumn() - invalid SRID';
			RETURN 'fail';
		END IF;
	ELSE
		new_srid := public.ST_SRID('POINT EMPTY'::public.geometry);
		IF ( new_srid_in != new_srid ) THEN
			RAISE NOTICE 'SRID value % converted to the officially unknown SRID value %', new_srid_in, new_srid;
		END IF;
	END IF;

	-- Verify schema
	IF ( schema_name IS NOT NULL AND schema_name != '' ) THEN
		sql := 'SELECT nspname FROM pg_namespace ' ||
			'WHERE text(nspname) = ' || quote_literal(schema_name) ||
			'LIMIT 1';
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Schema % is not a valid schemaname', quote_literal(schema_name);
			RETURN 'fail';
		END IF;
	END IF;

	IF ( real_schema IS NULL ) THEN
		RAISE DEBUG 'Detecting schema';
		sql := 'SELECT n.nspname AS schemaname ' ||
			'FROM pg_catalog.pg_class c ' ||
			  'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' ||
			'WHERE c.relkind = ' || quote_literal('r') ||
			' AND n.nspname NOT IN (' || quote_literal('pg_catalog') || ', ' || quote_literal('pg_toast') || ')' ||
			' AND pg_catalog.pg_table_is_visible(c.oid)' ||
			' AND c.relname = ' || quote_literal(table_name);
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Table % does not occur in the search_path', quote_literal(table_name);
			RETURN 'fail';
		END IF;
	END IF;

	-- Add geometry column to table
	IF use_typmod THEN
		 sql := 'ALTER TABLE ' ||
			quote_ident(real_schema) || '.' || quote_ident(table_name)
			|| ' ADD COLUMN ' || quote_ident(column_name) ||
			' geometry(' || public.postgis_type_name(new_type, new_dim) || ', ' || new_srid::text || ')';
		RAISE DEBUG '%', sql;
	ELSE
		sql := 'ALTER TABLE ' ||
			quote_ident(real_schema) || '.' || quote_ident(table_name)
			|| ' ADD COLUMN ' || quote_ident(column_name) ||
			' geometry ';
		RAISE DEBUG '%', sql;
	END IF;
	EXECUTE sql;

	IF NOT use_typmod THEN
		-- Add table CHECKs
		sql := 'ALTER TABLE ' ||
			quote_ident(real_schema) || '.' || quote_ident(table_name)
			|| ' ADD CONSTRAINT '
			|| quote_ident('enforce_srid_' || column_name)
			|| ' CHECK (st_srid(' || quote_ident(column_name) ||
			') = ' || new_srid::text || ')' ;
		RAISE DEBUG '%', sql;
		EXECUTE sql;

		sql := 'ALTER TABLE ' ||
			quote_ident(real_schema) || '.' || quote_ident(table_name)
			|| ' ADD CONSTRAINT '
			|| quote_ident('enforce_dims_' || column_name)
			|| ' CHECK (st_ndims(' || quote_ident(column_name) ||
			') = ' || new_dim::text || ')' ;
		RAISE DEBUG '%', sql;
		EXECUTE sql;

		IF ( NOT (new_type = 'GEOMETRY')) THEN
			sql := 'ALTER TABLE ' ||
				quote_ident(real_schema) || '.' || quote_ident(table_name) || ' ADD CONSTRAINT ' ||
				quote_ident('enforce_geotype_' || column_name) ||
				' CHECK (GeometryType(' ||
				quote_ident(column_name) || ')=' ||
				quote_literal(new_type) || ' OR (' ||
				quote_ident(column_name) || ') is null)';
			RAISE DEBUG '%', sql;
			EXECUTE sql;
		END IF;
	END IF;

	RETURN
		real_schema || '.' ||
		table_name || '.' || column_name ||
		' SRID:' || new_srid::text ||
		' TYPE:' || new_type ||
		' DIMS:' || new_dim::text || ' ';
END;
$function$
;

-- Permissions

ALTER FUNCTION public.addgeometrycolumn(varchar, varchar, varchar, varchar, int4, varchar, int4, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.addgeometrycolumn(varchar, varchar, varchar, varchar, int4, varchar, int4, bool) TO "admin";

-- DROP FUNCTION public.addgeometrycolumn(varchar, varchar, varchar, int4, varchar, int4, bool);

CREATE OR REPLACE FUNCTION public.addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean DEFAULT true)
 RETURNS text
 LANGUAGE plpgsql
 STABLE STRICT
AS $function$
DECLARE
	ret  text;
BEGIN
	SELECT public.AddGeometryColumn('',$1,$2,$3,$4,$5,$6,$7) into ret;
	RETURN ret;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.addgeometrycolumn(varchar, varchar, varchar, int4, varchar, int4, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.addgeometrycolumn(varchar, varchar, varchar, int4, varchar, int4, bool) TO "admin";

-- DROP FUNCTION public.box(box3d);

CREATE OR REPLACE FUNCTION public.box(box3d)
 RETURNS box
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$BOX3D_to_BOX$function$
;

-- Permissions

ALTER FUNCTION public.box(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box(box3d) TO "admin";

-- DROP FUNCTION public.box(geometry);

CREATE OR REPLACE FUNCTION public.box(geometry)
 RETURNS box
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_to_BOX$function$
;

-- Permissions

ALTER FUNCTION public.box(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box(geometry) TO "admin";

-- DROP FUNCTION public.box2d(geometry);

CREATE OR REPLACE FUNCTION public.box2d(geometry)
 RETURNS box2d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_to_BOX2D$function$
;

-- Permissions

ALTER FUNCTION public.box2d(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box2d(geometry) TO "admin";

-- DROP FUNCTION public.box2d(box3d);

CREATE OR REPLACE FUNCTION public.box2d(box3d)
 RETURNS box2d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$BOX3D_to_BOX2D$function$
;

-- Permissions

ALTER FUNCTION public.box2d(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box2d(box3d) TO "admin";

-- DROP FUNCTION public.box2d_in(cstring);

CREATE OR REPLACE FUNCTION public.box2d_in(cstring)
 RETURNS box2d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX2D_in$function$
;

-- Permissions

ALTER FUNCTION public.box2d_in(cstring) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box2d_in(cstring) TO "admin";

-- DROP FUNCTION public.box2d_out(box2d);

CREATE OR REPLACE FUNCTION public.box2d_out(box2d)
 RETURNS cstring
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX2D_out$function$
;

-- Permissions

ALTER FUNCTION public.box2d_out(box2d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box2d_out(box2d) TO "admin";

-- DROP FUNCTION public.box2df_in(cstring);

CREATE OR REPLACE FUNCTION public.box2df_in(cstring)
 RETURNS box2df
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$box2df_in$function$
;

-- Permissions

ALTER FUNCTION public.box2df_in(cstring) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box2df_in(cstring) TO "admin";

-- DROP FUNCTION public.box2df_out(box2df);

CREATE OR REPLACE FUNCTION public.box2df_out(box2df)
 RETURNS cstring
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$box2df_out$function$
;

-- Permissions

ALTER FUNCTION public.box2df_out(box2df) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box2df_out(box2df) TO "admin";

-- DROP FUNCTION public.box3d(box2d);

CREATE OR REPLACE FUNCTION public.box3d(box2d)
 RETURNS box3d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$BOX2D_to_BOX3D$function$
;

-- Permissions

ALTER FUNCTION public.box3d(box2d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box3d(box2d) TO "admin";

-- DROP FUNCTION public.box3d(geometry);

CREATE OR REPLACE FUNCTION public.box3d(geometry)
 RETURNS box3d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_to_BOX3D$function$
;

-- Permissions

ALTER FUNCTION public.box3d(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box3d(geometry) TO "admin";

-- DROP FUNCTION public.box3d_in(cstring);

CREATE OR REPLACE FUNCTION public.box3d_in(cstring)
 RETURNS box3d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX3D_in$function$
;

-- Permissions

ALTER FUNCTION public.box3d_in(cstring) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box3d_in(cstring) TO "admin";

-- DROP FUNCTION public.box3d_out(box3d);

CREATE OR REPLACE FUNCTION public.box3d_out(box3d)
 RETURNS cstring
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX3D_out$function$
;

-- Permissions

ALTER FUNCTION public.box3d_out(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box3d_out(box3d) TO "admin";

-- DROP FUNCTION public.box3dtobox(box3d);

CREATE OR REPLACE FUNCTION public.box3dtobox(box3d)
 RETURNS box
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$BOX3D_to_BOX$function$
;

-- Permissions

ALTER FUNCTION public.box3dtobox(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.box3dtobox(box3d) TO "admin";

-- DROP FUNCTION public."bytea"(geography);

CREATE OR REPLACE FUNCTION public.bytea(geography)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_to_bytea$function$
;

-- Permissions

ALTER FUNCTION public."bytea"(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public."bytea"(geography) TO "admin";

-- DROP FUNCTION public."bytea"(geometry);

CREATE OR REPLACE FUNCTION public.bytea(geometry)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_to_bytea$function$
;

-- Permissions

ALTER FUNCTION public."bytea"(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public."bytea"(geometry) TO "admin";

-- DROP FUNCTION public.contains_2d(geometry, box2df);

CREATE OR REPLACE FUNCTION public.contains_2d(geometry, box2df)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
AS $function$SELECT $2 OPERATOR(public.@) $1;$function$
;

-- Permissions

ALTER FUNCTION public.contains_2d(geometry, box2df) OWNER TO "admin";
GRANT ALL ON FUNCTION public.contains_2d(geometry, box2df) TO "admin";

-- DROP FUNCTION public.contains_2d(box2df, geometry);

CREATE OR REPLACE FUNCTION public.contains_2d(box2df, geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_contains_box2df_geom_2d$function$
;

-- Permissions

ALTER FUNCTION public.contains_2d(box2df, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.contains_2d(box2df, geometry) TO "admin";

-- DROP FUNCTION public.contains_2d(box2df, box2df);

CREATE OR REPLACE FUNCTION public.contains_2d(box2df, box2df)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_contains_box2df_box2df_2d$function$
;

-- Permissions

ALTER FUNCTION public.contains_2d(box2df, box2df) OWNER TO "admin";
GRANT ALL ON FUNCTION public.contains_2d(box2df, box2df) TO "admin";

-- DROP FUNCTION public.daitch_mokotoff(text);

CREATE OR REPLACE FUNCTION public.daitch_mokotoff(text)
 RETURNS text[]
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$daitch_mokotoff$function$
;

-- Permissions

ALTER FUNCTION public.daitch_mokotoff(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.daitch_mokotoff(text) TO "admin";

-- DROP FUNCTION public.difference(text, text);

CREATE OR REPLACE FUNCTION public.difference(text, text)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$difference$function$
;

-- Permissions

ALTER FUNCTION public.difference(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.difference(text, text) TO "admin";

-- DROP FUNCTION public.dmetaphone(text);

CREATE OR REPLACE FUNCTION public.dmetaphone(text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$dmetaphone$function$
;

-- Permissions

ALTER FUNCTION public.dmetaphone(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.dmetaphone(text) TO "admin";

-- DROP FUNCTION public.dmetaphone_alt(text);

CREATE OR REPLACE FUNCTION public.dmetaphone_alt(text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$dmetaphone_alt$function$
;

-- Permissions

ALTER FUNCTION public.dmetaphone_alt(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.dmetaphone_alt(text) TO "admin";

-- DROP FUNCTION public.dropgeometrycolumn(varchar, varchar);

CREATE OR REPLACE FUNCTION public.dropgeometrycolumn(table_name character varying, column_name character varying)
 RETURNS text
 LANGUAGE plpgsql
 STRICT
AS $function$
DECLARE
	ret text;
BEGIN
	SELECT public.DropGeometryColumn('','',$1,$2) into ret;
	RETURN ret;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.dropgeometrycolumn(varchar, varchar) OWNER TO "admin";
GRANT ALL ON FUNCTION public.dropgeometrycolumn(varchar, varchar) TO "admin";

-- DROP FUNCTION public.dropgeometrycolumn(varchar, varchar, varchar, varchar);

CREATE OR REPLACE FUNCTION public.dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying)
 RETURNS text
 LANGUAGE plpgsql
 STRICT
AS $function$
DECLARE
	myrec RECORD;
	okay boolean;
	real_schema name;

BEGIN

	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = false;

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := true;
		END LOOP;

		IF ( okay <>  true ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT current_schema() into real_schema;
	END IF;

	-- Find out if the column is in the geometry_columns table
	okay = false;
	FOR myrec IN SELECT * from public.geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := true;
	END LOOP;
	IF (okay <> true) THEN
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN false;
	END IF;

	-- Remove table column
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' DROP COLUMN ' ||
		quote_ident(column_name);

	RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';

END;
$function$
;

-- Permissions

ALTER FUNCTION public.dropgeometrycolumn(varchar, varchar, varchar, varchar) OWNER TO "admin";
GRANT ALL ON FUNCTION public.dropgeometrycolumn(varchar, varchar, varchar, varchar) TO "admin";

-- DROP FUNCTION public.dropgeometrycolumn(varchar, varchar, varchar);

CREATE OR REPLACE FUNCTION public.dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying)
 RETURNS text
 LANGUAGE plpgsql
 STRICT
AS $function$
DECLARE
	ret text;
BEGIN
	SELECT public.DropGeometryColumn('',$1,$2,$3) into ret;
	RETURN ret;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.dropgeometrycolumn(varchar, varchar, varchar) OWNER TO "admin";
GRANT ALL ON FUNCTION public.dropgeometrycolumn(varchar, varchar, varchar) TO "admin";

-- DROP FUNCTION public.dropgeometrytable(varchar, varchar);

CREATE OR REPLACE FUNCTION public.dropgeometrytable(schema_name character varying, table_name character varying)
 RETURNS text
 LANGUAGE sql
 STRICT
AS $function$ SELECT public.DropGeometryTable('',$1,$2) $function$
;

-- Permissions

ALTER FUNCTION public.dropgeometrytable(varchar, varchar) OWNER TO "admin";
GRANT ALL ON FUNCTION public.dropgeometrytable(varchar, varchar) TO "admin";

-- DROP FUNCTION public.dropgeometrytable(varchar);

CREATE OR REPLACE FUNCTION public.dropgeometrytable(table_name character varying)
 RETURNS text
 LANGUAGE sql
 STRICT
AS $function$ SELECT public.DropGeometryTable('','',$1) $function$
;

-- Permissions

ALTER FUNCTION public.dropgeometrytable(varchar) OWNER TO "admin";
GRANT ALL ON FUNCTION public.dropgeometrytable(varchar) TO "admin";

-- DROP FUNCTION public.dropgeometrytable(varchar, varchar, varchar);

CREATE OR REPLACE FUNCTION public.dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying)
 RETURNS text
 LANGUAGE plpgsql
 STRICT
AS $function$
DECLARE
	real_schema name;

BEGIN

	IF ( schema_name = '' ) THEN
		SELECT current_schema() into real_schema;
	ELSE
		real_schema = schema_name;
	END IF;

	-- TODO: Should we warn if table doesn't exist probably instead just saying dropped
	-- Remove table
	EXECUTE 'DROP TABLE IF EXISTS '
		|| quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' RESTRICT';

	RETURN
		real_schema || '.' ||
		table_name ||' dropped.';

END;
$function$
;

-- Permissions

ALTER FUNCTION public.dropgeometrytable(varchar, varchar, varchar) OWNER TO "admin";
GRANT ALL ON FUNCTION public.dropgeometrytable(varchar, varchar, varchar) TO "admin";

-- DROP FUNCTION public."equals"(geometry, geometry);

CREATE OR REPLACE FUNCTION public.equals(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_Equals$function$
;

-- Permissions

ALTER FUNCTION public."equals"(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public."equals"(geometry, geometry) TO "admin";

-- DROP FUNCTION public.find_srid(varchar, varchar, varchar);

CREATE OR REPLACE FUNCTION public.find_srid(character varying, character varying, character varying)
 RETURNS integer
 LANGUAGE plpgsql
 STABLE PARALLEL SAFE STRICT
AS $function$
DECLARE
	schem varchar =  $1;
	tabl varchar = $2;
	sr int4;
BEGIN
-- if the table contains a . and the schema is empty
-- split the table into a schema and a table
-- otherwise drop through to default behavior
	IF ( schem = '' and strpos(tabl,'.') > 0 ) THEN
	 schem = substr(tabl,1,strpos(tabl,'.')-1);
	 tabl = substr(tabl,length(schem)+2);
	END IF;

	select SRID into sr from public.geometry_columns where (f_table_schema = schem or schem = '') and f_table_name = tabl and f_geometry_column = $3;
	IF NOT FOUND THEN
	   RAISE EXCEPTION 'find_srid() - could not find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase mismatch?';
	END IF;
	return sr;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.find_srid(varchar, varchar, varchar) OWNER TO "admin";
GRANT ALL ON FUNCTION public.find_srid(varchar, varchar, varchar) TO "admin";

-- DROP FUNCTION public.geog_brin_inclusion_add_value(internal, internal, internal, internal);

CREATE OR REPLACE FUNCTION public.geog_brin_inclusion_add_value(internal, internal, internal, internal)
 RETURNS boolean
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$geog_brin_inclusion_add_value$function$
;

-- Permissions

ALTER FUNCTION public.geog_brin_inclusion_add_value(internal, internal, internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geog_brin_inclusion_add_value(internal, internal, internal, internal) TO "admin";

-- DROP FUNCTION public.geog_brin_inclusion_merge(internal, internal);

CREATE OR REPLACE FUNCTION public.geog_brin_inclusion_merge(internal, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$geog_brin_inclusion_merge$function$
;

-- Permissions

ALTER FUNCTION public.geog_brin_inclusion_merge(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geog_brin_inclusion_merge(internal, internal) TO "admin";

-- DROP FUNCTION public.geography(geometry);

CREATE OR REPLACE FUNCTION public.geography(geometry)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_from_geometry$function$
;

-- Permissions

ALTER FUNCTION public.geography(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography(geometry) TO "admin";

-- DROP FUNCTION public.geography(bytea);

CREATE OR REPLACE FUNCTION public.geography(bytea)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_from_binary$function$
;

-- Permissions

ALTER FUNCTION public.geography(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography(bytea) TO "admin";

-- DROP FUNCTION public.geography(geography, int4, bool);

CREATE OR REPLACE FUNCTION public.geography(geography, integer, boolean)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_enforce_typmod$function$
;

-- Permissions

ALTER FUNCTION public.geography(geography, int4, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography(geography, int4, bool) TO "admin";

-- DROP FUNCTION public.geography_analyze(internal);

CREATE OR REPLACE FUNCTION public.geography_analyze(internal)
 RETURNS boolean
 LANGUAGE c
 STRICT
AS '$libdir/postgis-3', $function$gserialized_analyze_nd$function$
;

-- Permissions

ALTER FUNCTION public.geography_analyze(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_analyze(internal) TO "admin";

-- DROP FUNCTION public.geography_cmp(geography, geography);

CREATE OR REPLACE FUNCTION public.geography_cmp(geography, geography)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_cmp$function$
;

-- Permissions

ALTER FUNCTION public.geography_cmp(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_cmp(geography, geography) TO "admin";

-- DROP FUNCTION public.geography_distance_knn(geography, geography);

CREATE OR REPLACE FUNCTION public.geography_distance_knn(geography, geography)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 100
AS '$libdir/postgis-3', $function$geography_distance_knn$function$
;

-- Permissions

ALTER FUNCTION public.geography_distance_knn(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_distance_knn(geography, geography) TO "admin";

-- DROP FUNCTION public.geography_eq(geography, geography);

CREATE OR REPLACE FUNCTION public.geography_eq(geography, geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_eq$function$
;

-- Permissions

ALTER FUNCTION public.geography_eq(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_eq(geography, geography) TO "admin";

-- DROP FUNCTION public.geography_ge(geography, geography);

CREATE OR REPLACE FUNCTION public.geography_ge(geography, geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_ge$function$
;

-- Permissions

ALTER FUNCTION public.geography_ge(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_ge(geography, geography) TO "admin";

-- DROP FUNCTION public.geography_gist_compress(internal);

CREATE OR REPLACE FUNCTION public.geography_gist_compress(internal)
 RETURNS internal
 LANGUAGE c
AS '$libdir/postgis-3', $function$gserialized_gist_compress$function$
;

-- Permissions

ALTER FUNCTION public.geography_gist_compress(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_gist_compress(internal) TO "admin";

-- DROP FUNCTION public.geography_gist_consistent(internal, geography, int4);

CREATE OR REPLACE FUNCTION public.geography_gist_consistent(internal, geography, integer)
 RETURNS boolean
 LANGUAGE c
AS '$libdir/postgis-3', $function$gserialized_gist_consistent$function$
;

-- Permissions

ALTER FUNCTION public.geography_gist_consistent(internal, geography, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_gist_consistent(internal, geography, int4) TO "admin";

-- DROP FUNCTION public.geography_gist_decompress(internal);

CREATE OR REPLACE FUNCTION public.geography_gist_decompress(internal)
 RETURNS internal
 LANGUAGE c
AS '$libdir/postgis-3', $function$gserialized_gist_decompress$function$
;

-- Permissions

ALTER FUNCTION public.geography_gist_decompress(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_gist_decompress(internal) TO "admin";

-- DROP FUNCTION public.geography_gist_distance(internal, geography, int4);

CREATE OR REPLACE FUNCTION public.geography_gist_distance(internal, geography, integer)
 RETURNS double precision
 LANGUAGE c
AS '$libdir/postgis-3', $function$gserialized_gist_geog_distance$function$
;

-- Permissions

ALTER FUNCTION public.geography_gist_distance(internal, geography, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_gist_distance(internal, geography, int4) TO "admin";

-- DROP FUNCTION public.geography_gist_penalty(internal, internal, internal);

CREATE OR REPLACE FUNCTION public.geography_gist_penalty(internal, internal, internal)
 RETURNS internal
 LANGUAGE c
AS '$libdir/postgis-3', $function$gserialized_gist_penalty$function$
;

-- Permissions

ALTER FUNCTION public.geography_gist_penalty(internal, internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_gist_penalty(internal, internal, internal) TO "admin";

-- DROP FUNCTION public.geography_gist_picksplit(internal, internal);

CREATE OR REPLACE FUNCTION public.geography_gist_picksplit(internal, internal)
 RETURNS internal
 LANGUAGE c
AS '$libdir/postgis-3', $function$gserialized_gist_picksplit$function$
;

-- Permissions

ALTER FUNCTION public.geography_gist_picksplit(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_gist_picksplit(internal, internal) TO "admin";

-- DROP FUNCTION public.geography_gist_same(box2d, box2d, internal);

CREATE OR REPLACE FUNCTION public.geography_gist_same(box2d, box2d, internal)
 RETURNS internal
 LANGUAGE c
AS '$libdir/postgis-3', $function$gserialized_gist_same$function$
;

-- Permissions

ALTER FUNCTION public.geography_gist_same(box2d, box2d, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_gist_same(box2d, box2d, internal) TO "admin";

-- DROP FUNCTION public.geography_gist_union(bytea, internal);

CREATE OR REPLACE FUNCTION public.geography_gist_union(bytea, internal)
 RETURNS internal
 LANGUAGE c
AS '$libdir/postgis-3', $function$gserialized_gist_union$function$
;

-- Permissions

ALTER FUNCTION public.geography_gist_union(bytea, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_gist_union(bytea, internal) TO "admin";

-- DROP FUNCTION public.geography_gt(geography, geography);

CREATE OR REPLACE FUNCTION public.geography_gt(geography, geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_gt$function$
;

-- Permissions

ALTER FUNCTION public.geography_gt(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_gt(geography, geography) TO "admin";

-- DROP FUNCTION public.geography_in(cstring, oid, int4);

CREATE OR REPLACE FUNCTION public.geography_in(cstring, oid, integer)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_in$function$
;

-- Permissions

ALTER FUNCTION public.geography_in(cstring, oid, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_in(cstring, oid, int4) TO "admin";

-- DROP FUNCTION public.geography_le(geography, geography);

CREATE OR REPLACE FUNCTION public.geography_le(geography, geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_le$function$
;

-- Permissions

ALTER FUNCTION public.geography_le(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_le(geography, geography) TO "admin";

-- DROP FUNCTION public.geography_lt(geography, geography);

CREATE OR REPLACE FUNCTION public.geography_lt(geography, geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_lt$function$
;

-- Permissions

ALTER FUNCTION public.geography_lt(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_lt(geography, geography) TO "admin";

-- DROP FUNCTION public.geography_out(geography);

CREATE OR REPLACE FUNCTION public.geography_out(geography)
 RETURNS cstring
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_out$function$
;

-- Permissions

ALTER FUNCTION public.geography_out(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_out(geography) TO "admin";

-- DROP FUNCTION public.geography_overlaps(geography, geography);

CREATE OR REPLACE FUNCTION public.geography_overlaps(geography, geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_overlaps$function$
;

-- Permissions

ALTER FUNCTION public.geography_overlaps(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_overlaps(geography, geography) TO "admin";

-- DROP FUNCTION public.geography_recv(internal, oid, int4);

CREATE OR REPLACE FUNCTION public.geography_recv(internal, oid, integer)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_recv$function$
;

-- Permissions

ALTER FUNCTION public.geography_recv(internal, oid, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_recv(internal, oid, int4) TO "admin";

-- DROP FUNCTION public.geography_send(geography);

CREATE OR REPLACE FUNCTION public.geography_send(geography)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_send$function$
;

-- Permissions

ALTER FUNCTION public.geography_send(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_send(geography) TO "admin";

-- DROP FUNCTION public.geography_spgist_choose_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geography_spgist_choose_nd(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_choose_nd$function$
;

-- Permissions

ALTER FUNCTION public.geography_spgist_choose_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_spgist_choose_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geography_spgist_compress_nd(internal);

CREATE OR REPLACE FUNCTION public.geography_spgist_compress_nd(internal)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_compress_nd$function$
;

-- Permissions

ALTER FUNCTION public.geography_spgist_compress_nd(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_spgist_compress_nd(internal) TO "admin";

-- DROP FUNCTION public.geography_spgist_config_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geography_spgist_config_nd(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_config_nd$function$
;

-- Permissions

ALTER FUNCTION public.geography_spgist_config_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_spgist_config_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geography_spgist_inner_consistent_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geography_spgist_inner_consistent_nd(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_inner_consistent_nd$function$
;

-- Permissions

ALTER FUNCTION public.geography_spgist_inner_consistent_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_spgist_inner_consistent_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geography_spgist_leaf_consistent_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geography_spgist_leaf_consistent_nd(internal, internal)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_leaf_consistent_nd$function$
;

-- Permissions

ALTER FUNCTION public.geography_spgist_leaf_consistent_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_spgist_leaf_consistent_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geography_spgist_picksplit_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geography_spgist_picksplit_nd(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_picksplit_nd$function$
;

-- Permissions

ALTER FUNCTION public.geography_spgist_picksplit_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_spgist_picksplit_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geography_typmod_in(_cstring);

CREATE OR REPLACE FUNCTION public.geography_typmod_in(cstring[])
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_typmod_in$function$
;

-- Permissions

ALTER FUNCTION public.geography_typmod_in(_cstring) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_typmod_in(_cstring) TO "admin";

-- DROP FUNCTION public.geography_typmod_out(int4);

CREATE OR REPLACE FUNCTION public.geography_typmod_out(integer)
 RETURNS cstring
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$postgis_typmod_out$function$
;

-- Permissions

ALTER FUNCTION public.geography_typmod_out(int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geography_typmod_out(int4) TO "admin";

-- DROP FUNCTION public.geom2d_brin_inclusion_add_value(internal, internal, internal, internal);

CREATE OR REPLACE FUNCTION public.geom2d_brin_inclusion_add_value(internal, internal, internal, internal)
 RETURNS boolean
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$geom2d_brin_inclusion_add_value$function$
;

-- Permissions

ALTER FUNCTION public.geom2d_brin_inclusion_add_value(internal, internal, internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geom2d_brin_inclusion_add_value(internal, internal, internal, internal) TO "admin";

-- DROP FUNCTION public.geom2d_brin_inclusion_merge(internal, internal);

CREATE OR REPLACE FUNCTION public.geom2d_brin_inclusion_merge(internal, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$geom2d_brin_inclusion_merge$function$
;

-- Permissions

ALTER FUNCTION public.geom2d_brin_inclusion_merge(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geom2d_brin_inclusion_merge(internal, internal) TO "admin";

-- DROP FUNCTION public.geom3d_brin_inclusion_add_value(internal, internal, internal, internal);

CREATE OR REPLACE FUNCTION public.geom3d_brin_inclusion_add_value(internal, internal, internal, internal)
 RETURNS boolean
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$geom3d_brin_inclusion_add_value$function$
;

-- Permissions

ALTER FUNCTION public.geom3d_brin_inclusion_add_value(internal, internal, internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geom3d_brin_inclusion_add_value(internal, internal, internal, internal) TO "admin";

-- DROP FUNCTION public.geom3d_brin_inclusion_merge(internal, internal);

CREATE OR REPLACE FUNCTION public.geom3d_brin_inclusion_merge(internal, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$geom3d_brin_inclusion_merge$function$
;

-- Permissions

ALTER FUNCTION public.geom3d_brin_inclusion_merge(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geom3d_brin_inclusion_merge(internal, internal) TO "admin";

-- DROP FUNCTION public.geom4d_brin_inclusion_add_value(internal, internal, internal, internal);

CREATE OR REPLACE FUNCTION public.geom4d_brin_inclusion_add_value(internal, internal, internal, internal)
 RETURNS boolean
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$geom4d_brin_inclusion_add_value$function$
;

-- Permissions

ALTER FUNCTION public.geom4d_brin_inclusion_add_value(internal, internal, internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geom4d_brin_inclusion_add_value(internal, internal, internal, internal) TO "admin";

-- DROP FUNCTION public.geom4d_brin_inclusion_merge(internal, internal);

CREATE OR REPLACE FUNCTION public.geom4d_brin_inclusion_merge(internal, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$geom4d_brin_inclusion_merge$function$
;

-- Permissions

ALTER FUNCTION public.geom4d_brin_inclusion_merge(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geom4d_brin_inclusion_merge(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry(box3d);

CREATE OR REPLACE FUNCTION public.geometry(box3d)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$BOX3D_to_LWGEOM$function$
;

-- Permissions

ALTER FUNCTION public.geometry(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry(box3d) TO "admin";

-- DROP FUNCTION public.geometry(polygon);

CREATE OR REPLACE FUNCTION public.geometry(polygon)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$polygon_to_geometry$function$
;

-- Permissions

ALTER FUNCTION public.geometry(polygon) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry(polygon) TO "admin";

-- DROP FUNCTION public.geometry(path);

CREATE OR REPLACE FUNCTION public.geometry(path)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$path_to_geometry$function$
;

-- Permissions

ALTER FUNCTION public.geometry(path) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry(path) TO "admin";

-- DROP FUNCTION public.geometry(box2d);

CREATE OR REPLACE FUNCTION public.geometry(box2d)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$BOX2D_to_LWGEOM$function$
;

-- Permissions

ALTER FUNCTION public.geometry(box2d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry(box2d) TO "admin";

-- DROP FUNCTION public.geometry(geometry, int4, bool);

CREATE OR REPLACE FUNCTION public.geometry(geometry, integer, boolean)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geometry_enforce_typmod$function$
;

-- Permissions

ALTER FUNCTION public.geometry(geometry, int4, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry(geometry, int4, bool) TO "admin";

-- DROP FUNCTION public.geometry(geography);

CREATE OR REPLACE FUNCTION public.geometry(geography)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geometry_from_geography$function$
;

-- Permissions

ALTER FUNCTION public.geometry(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry(geography) TO "admin";

-- DROP FUNCTION public.geometry(point);

CREATE OR REPLACE FUNCTION public.geometry(point)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$point_to_geometry$function$
;

-- Permissions

ALTER FUNCTION public.geometry(point) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry(point) TO "admin";

-- DROP FUNCTION public.geometry(bytea);

CREATE OR REPLACE FUNCTION public.geometry(bytea)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_from_bytea$function$
;

-- Permissions

ALTER FUNCTION public.geometry(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry(bytea) TO "admin";

-- DROP FUNCTION public.geometry(text);

CREATE OR REPLACE FUNCTION public.geometry(text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$parse_WKT_lwgeom$function$
;

-- Permissions

ALTER FUNCTION public.geometry(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry(text) TO "admin";

-- DROP FUNCTION public.geometry_above(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_above(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_above_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_above(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_above(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_analyze(internal);

CREATE OR REPLACE FUNCTION public.geometry_analyze(internal)
 RETURNS boolean
 LANGUAGE c
 STRICT
AS '$libdir/postgis-3', $function$gserialized_analyze_nd$function$
;

-- Permissions

ALTER FUNCTION public.geometry_analyze(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_analyze(internal) TO "admin";

-- DROP FUNCTION public.geometry_below(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_below(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_below_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_below(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_below(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_cmp(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_cmp(geom1 geometry, geom2 geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$lwgeom_cmp$function$
;

-- Permissions

ALTER FUNCTION public.geometry_cmp(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_cmp(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_contained_3d(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_contained_3d(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_contained_3d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_contained_3d(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_contained_3d(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_contains(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_contains(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_contains_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_contains(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_contains(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_contains_3d(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_contains_3d(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_contains_3d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_contains_3d(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_contains_3d(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_contains_nd(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_contains_nd(geometry, geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_contains$function$
;

-- Permissions

ALTER FUNCTION public.geometry_contains_nd(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_contains_nd(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_distance_box(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_distance_box(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_distance_box_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_distance_box(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_distance_box(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_distance_centroid(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_distance_centroid(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_Distance$function$
;

-- Permissions

ALTER FUNCTION public.geometry_distance_centroid(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_distance_centroid(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_distance_centroid_nd(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_distance_centroid_nd(geometry, geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_distance_nd$function$
;

-- Permissions

ALTER FUNCTION public.geometry_distance_centroid_nd(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_distance_centroid_nd(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_distance_cpa(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_distance_cpa(geometry, geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_DistanceCPA$function$
;

-- Permissions

ALTER FUNCTION public.geometry_distance_cpa(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_distance_cpa(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_eq(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_eq(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$lwgeom_eq$function$
;

-- Permissions

ALTER FUNCTION public.geometry_eq(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_eq(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_ge(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_ge(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$lwgeom_ge$function$
;

-- Permissions

ALTER FUNCTION public.geometry_ge(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_ge(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_gist_compress_2d(internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_compress_2d(internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_compress_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_compress_2d(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_compress_2d(internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_compress_nd(internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_compress_nd(internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_compress$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_compress_nd(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_compress_nd(internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_consistent_2d(internal, geometry, int4);

CREATE OR REPLACE FUNCTION public.geometry_gist_consistent_2d(internal, geometry, integer)
 RETURNS boolean
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_consistent_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_consistent_2d(internal, geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_consistent_2d(internal, geometry, int4) TO "admin";

-- DROP FUNCTION public.geometry_gist_consistent_nd(internal, geometry, int4);

CREATE OR REPLACE FUNCTION public.geometry_gist_consistent_nd(internal, geometry, integer)
 RETURNS boolean
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_consistent$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_consistent_nd(internal, geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_consistent_nd(internal, geometry, int4) TO "admin";

-- DROP FUNCTION public.geometry_gist_decompress_2d(internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_decompress_2d(internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_decompress_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_decompress_2d(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_decompress_2d(internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_decompress_nd(internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_decompress_nd(internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_decompress$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_decompress_nd(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_decompress_nd(internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_distance_2d(internal, geometry, int4);

CREATE OR REPLACE FUNCTION public.geometry_gist_distance_2d(internal, geometry, integer)
 RETURNS double precision
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_distance_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_distance_2d(internal, geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_distance_2d(internal, geometry, int4) TO "admin";

-- DROP FUNCTION public.geometry_gist_distance_nd(internal, geometry, int4);

CREATE OR REPLACE FUNCTION public.geometry_gist_distance_nd(internal, geometry, integer)
 RETURNS double precision
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_distance$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_distance_nd(internal, geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_distance_nd(internal, geometry, int4) TO "admin";

-- DROP FUNCTION public.geometry_gist_penalty_2d(internal, internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_penalty_2d(internal, internal, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_penalty_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_penalty_2d(internal, internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_penalty_2d(internal, internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_penalty_nd(internal, internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_penalty_nd(internal, internal, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_penalty$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_penalty_nd(internal, internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_penalty_nd(internal, internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_picksplit_2d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_picksplit_2d(internal, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_picksplit_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_picksplit_2d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_picksplit_2d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_picksplit_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_picksplit_nd(internal, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_picksplit$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_picksplit_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_picksplit_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_same_2d(geometry, geometry, internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_same_2d(geom1 geometry, geom2 geometry, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_same_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_same_2d(geometry, geometry, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_same_2d(geometry, geometry, internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_same_nd(geometry, geometry, internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_same_nd(geometry, geometry, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_same$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_same_nd(geometry, geometry, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_same_nd(geometry, geometry, internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_sortsupport_2d(internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_sortsupport_2d(internal)
 RETURNS void
 LANGUAGE c
 STRICT
AS '$libdir/postgis-3', $function$gserialized_gist_sortsupport_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_sortsupport_2d(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_sortsupport_2d(internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_union_2d(bytea, internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_union_2d(bytea, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_union_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_union_2d(bytea, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_union_2d(bytea, internal) TO "admin";

-- DROP FUNCTION public.geometry_gist_union_nd(bytea, internal);

CREATE OR REPLACE FUNCTION public.geometry_gist_union_nd(bytea, internal)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_union$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gist_union_nd(bytea, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gist_union_nd(bytea, internal) TO "admin";

-- DROP FUNCTION public.geometry_gt(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_gt(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$lwgeom_gt$function$
;

-- Permissions

ALTER FUNCTION public.geometry_gt(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_gt(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_hash(geometry);

CREATE OR REPLACE FUNCTION public.geometry_hash(geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$lwgeom_hash$function$
;

-- Permissions

ALTER FUNCTION public.geometry_hash(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_hash(geometry) TO "admin";

-- DROP FUNCTION public.geometry_in(cstring);

CREATE OR REPLACE FUNCTION public.geometry_in(cstring)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_in$function$
;

-- Permissions

ALTER FUNCTION public.geometry_in(cstring) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_in(cstring) TO "admin";

-- DROP FUNCTION public.geometry_le(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_le(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$lwgeom_le$function$
;

-- Permissions

ALTER FUNCTION public.geometry_le(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_le(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_left(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_left(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_left_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_left(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_left(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_lt(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_lt(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$lwgeom_lt$function$
;

-- Permissions

ALTER FUNCTION public.geometry_lt(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_lt(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_neq(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_neq(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$lwgeom_neq$function$
;

-- Permissions

ALTER FUNCTION public.geometry_neq(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_neq(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_out(geometry);

CREATE OR REPLACE FUNCTION public.geometry_out(geometry)
 RETURNS cstring
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_out$function$
;

-- Permissions

ALTER FUNCTION public.geometry_out(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_out(geometry) TO "admin";

-- DROP FUNCTION public.geometry_overabove(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_overabove(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_overabove_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_overabove(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_overabove(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_overbelow(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_overbelow(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_overbelow_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_overbelow(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_overbelow(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_overlaps(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_overlaps(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_overlaps_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_overlaps(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_overlaps(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_overlaps_3d(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_overlaps_3d(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_overlaps_3d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_overlaps_3d(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_overlaps_3d(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_overlaps_nd(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_overlaps_nd(geometry, geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_overlaps$function$
;

-- Permissions

ALTER FUNCTION public.geometry_overlaps_nd(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_overlaps_nd(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_overleft(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_overleft(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_overleft_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_overleft(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_overleft(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_overright(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_overright(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_overright_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_overright(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_overright(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_recv(internal);

CREATE OR REPLACE FUNCTION public.geometry_recv(internal)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_recv$function$
;

-- Permissions

ALTER FUNCTION public.geometry_recv(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_recv(internal) TO "admin";

-- DROP FUNCTION public.geometry_right(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_right(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_right_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_right(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_right(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_same(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_same(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_same_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_same(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_same(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_same_3d(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_same_3d(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_same_3d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_same_3d(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_same_3d(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_same_nd(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_same_nd(geometry, geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_same$function$
;

-- Permissions

ALTER FUNCTION public.geometry_same_nd(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_same_nd(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_send(geometry);

CREATE OR REPLACE FUNCTION public.geometry_send(geometry)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_send$function$
;

-- Permissions

ALTER FUNCTION public.geometry_send(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_send(geometry) TO "admin";

-- DROP FUNCTION public.geometry_sortsupport(internal);

CREATE OR REPLACE FUNCTION public.geometry_sortsupport(internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$lwgeom_sortsupport$function$
;

-- Permissions

ALTER FUNCTION public.geometry_sortsupport(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_sortsupport(internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_choose_2d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_choose_2d(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_choose_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_choose_2d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_choose_2d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_choose_3d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_choose_3d(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_choose_3d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_choose_3d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_choose_3d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_choose_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_choose_nd(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_choose_nd$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_choose_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_choose_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_compress_2d(internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_compress_2d(internal)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_compress_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_compress_2d(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_compress_2d(internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_compress_3d(internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_compress_3d(internal)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_compress_3d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_compress_3d(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_compress_3d(internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_compress_nd(internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_compress_nd(internal)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_compress_nd$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_compress_nd(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_compress_nd(internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_config_2d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_config_2d(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_config_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_config_2d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_config_2d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_config_3d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_config_3d(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_config_3d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_config_3d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_config_3d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_config_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_config_nd(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_config_nd$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_config_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_config_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_inner_consistent_2d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_inner_consistent_2d(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_inner_consistent_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_inner_consistent_2d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_inner_consistent_2d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_inner_consistent_3d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_inner_consistent_3d(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_inner_consistent_3d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_inner_consistent_3d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_inner_consistent_3d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_inner_consistent_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_inner_consistent_nd(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_inner_consistent_nd$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_inner_consistent_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_inner_consistent_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_leaf_consistent_2d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_leaf_consistent_2d(internal, internal)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_leaf_consistent_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_leaf_consistent_2d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_leaf_consistent_2d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_leaf_consistent_3d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_leaf_consistent_3d(internal, internal)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_leaf_consistent_3d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_leaf_consistent_3d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_leaf_consistent_3d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_leaf_consistent_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_leaf_consistent_nd(internal, internal)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_leaf_consistent_nd$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_leaf_consistent_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_leaf_consistent_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_picksplit_2d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_picksplit_2d(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_picksplit_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_picksplit_2d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_picksplit_2d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_picksplit_3d(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_picksplit_3d(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_picksplit_3d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_picksplit_3d(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_picksplit_3d(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_spgist_picksplit_nd(internal, internal);

CREATE OR REPLACE FUNCTION public.geometry_spgist_picksplit_nd(internal, internal)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_spgist_picksplit_nd$function$
;

-- Permissions

ALTER FUNCTION public.geometry_spgist_picksplit_nd(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_spgist_picksplit_nd(internal, internal) TO "admin";

-- DROP FUNCTION public.geometry_typmod_in(_cstring);

CREATE OR REPLACE FUNCTION public.geometry_typmod_in(cstring[])
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geometry_typmod_in$function$
;

-- Permissions

ALTER FUNCTION public.geometry_typmod_in(_cstring) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_typmod_in(_cstring) TO "admin";

-- DROP FUNCTION public.geometry_typmod_out(int4);

CREATE OR REPLACE FUNCTION public.geometry_typmod_out(integer)
 RETURNS cstring
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$postgis_typmod_out$function$
;

-- Permissions

ALTER FUNCTION public.geometry_typmod_out(int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_typmod_out(int4) TO "admin";

-- DROP FUNCTION public.geometry_within(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_within(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_within_2d$function$
;

-- Permissions

ALTER FUNCTION public.geometry_within(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_within(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometry_within_nd(geometry, geometry);

CREATE OR REPLACE FUNCTION public.geometry_within_nd(geometry, geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_within$function$
;

-- Permissions

ALTER FUNCTION public.geometry_within_nd(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometry_within_nd(geometry, geometry) TO "admin";

-- DROP FUNCTION public.geometrytype(geography);

CREATE OR REPLACE FUNCTION public.geometrytype(geography)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_getTYPE$function$
;

-- Permissions

ALTER FUNCTION public.geometrytype(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometrytype(geography) TO "admin";

-- DROP FUNCTION public.geometrytype(geometry);

CREATE OR REPLACE FUNCTION public.geometrytype(geometry)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_getTYPE$function$
;

-- Permissions

ALTER FUNCTION public.geometrytype(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geometrytype(geometry) TO "admin";

-- DROP FUNCTION public.geomfromewkb(bytea);

CREATE OR REPLACE FUNCTION public.geomfromewkb(bytea)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOMFromEWKB$function$
;

-- Permissions

ALTER FUNCTION public.geomfromewkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geomfromewkb(bytea) TO "admin";

-- DROP FUNCTION public.geomfromewkt(text);

CREATE OR REPLACE FUNCTION public.geomfromewkt(text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$parse_WKT_lwgeom$function$
;

-- Permissions

ALTER FUNCTION public.geomfromewkt(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.geomfromewkt(text) TO "admin";

-- DROP FUNCTION public.get_proj4_from_srid(int4);

CREATE OR REPLACE FUNCTION public.get_proj4_from_srid(integer)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$
	BEGIN
	RETURN proj4text::text FROM public.spatial_ref_sys WHERE srid= $1;
	END;
	$function$
;

-- Permissions

ALTER FUNCTION public.get_proj4_from_srid(int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.get_proj4_from_srid(int4) TO "admin";

-- DROP FUNCTION public.gidx_in(cstring);

CREATE OR REPLACE FUNCTION public.gidx_in(cstring)
 RETURNS gidx
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gidx_in$function$
;

-- Permissions

ALTER FUNCTION public.gidx_in(cstring) OWNER TO "admin";
GRANT ALL ON FUNCTION public.gidx_in(cstring) TO "admin";

-- DROP FUNCTION public.gidx_out(gidx);

CREATE OR REPLACE FUNCTION public.gidx_out(gidx)
 RETURNS cstring
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gidx_out$function$
;

-- Permissions

ALTER FUNCTION public.gidx_out(gidx) OWNER TO "admin";
GRANT ALL ON FUNCTION public.gidx_out(gidx) TO "admin";

-- DROP FUNCTION public.gserialized_gist_joinsel_2d(internal, oid, internal, int2);

CREATE OR REPLACE FUNCTION public.gserialized_gist_joinsel_2d(internal, oid, internal, smallint)
 RETURNS double precision
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_joinsel_2d$function$
;

-- Permissions

ALTER FUNCTION public.gserialized_gist_joinsel_2d(internal, oid, internal, int2) OWNER TO "admin";
GRANT ALL ON FUNCTION public.gserialized_gist_joinsel_2d(internal, oid, internal, int2) TO "admin";

-- DROP FUNCTION public.gserialized_gist_joinsel_nd(internal, oid, internal, int2);

CREATE OR REPLACE FUNCTION public.gserialized_gist_joinsel_nd(internal, oid, internal, smallint)
 RETURNS double precision
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_joinsel_nd$function$
;

-- Permissions

ALTER FUNCTION public.gserialized_gist_joinsel_nd(internal, oid, internal, int2) OWNER TO "admin";
GRANT ALL ON FUNCTION public.gserialized_gist_joinsel_nd(internal, oid, internal, int2) TO "admin";

-- DROP FUNCTION public.gserialized_gist_sel_2d(internal, oid, internal, int4);

CREATE OR REPLACE FUNCTION public.gserialized_gist_sel_2d(internal, oid, internal, integer)
 RETURNS double precision
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_sel_2d$function$
;

-- Permissions

ALTER FUNCTION public.gserialized_gist_sel_2d(internal, oid, internal, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.gserialized_gist_sel_2d(internal, oid, internal, int4) TO "admin";

-- DROP FUNCTION public.gserialized_gist_sel_nd(internal, oid, internal, int4);

CREATE OR REPLACE FUNCTION public.gserialized_gist_sel_nd(internal, oid, internal, integer)
 RETURNS double precision
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/postgis-3', $function$gserialized_gist_sel_nd$function$
;

-- Permissions

ALTER FUNCTION public.gserialized_gist_sel_nd(internal, oid, internal, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.gserialized_gist_sel_nd(internal, oid, internal, int4) TO "admin";

-- DROP FUNCTION public.is_contained_2d(box2df, box2df);

CREATE OR REPLACE FUNCTION public.is_contained_2d(box2df, box2df)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_contains_box2df_box2df_2d$function$
;

-- Permissions

ALTER FUNCTION public.is_contained_2d(box2df, box2df) OWNER TO "admin";
GRANT ALL ON FUNCTION public.is_contained_2d(box2df, box2df) TO "admin";

-- DROP FUNCTION public.is_contained_2d(geometry, box2df);

CREATE OR REPLACE FUNCTION public.is_contained_2d(geometry, box2df)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
AS $function$SELECT $2 OPERATOR(public.~) $1;$function$
;

-- Permissions

ALTER FUNCTION public.is_contained_2d(geometry, box2df) OWNER TO "admin";
GRANT ALL ON FUNCTION public.is_contained_2d(geometry, box2df) TO "admin";

-- DROP FUNCTION public.is_contained_2d(box2df, geometry);

CREATE OR REPLACE FUNCTION public.is_contained_2d(box2df, geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_within_box2df_geom_2d$function$
;

-- Permissions

ALTER FUNCTION public.is_contained_2d(box2df, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.is_contained_2d(box2df, geometry) TO "admin";

-- DROP FUNCTION public."json"(geometry);

CREATE OR REPLACE FUNCTION public."json"(geometry)
 RETURNS json
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geometry_to_json$function$
;

-- Permissions

ALTER FUNCTION public."json"(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public."json"(geometry) TO "admin";

-- DROP FUNCTION public."jsonb"(geometry);

CREATE OR REPLACE FUNCTION public.jsonb(geometry)
 RETURNS jsonb
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geometry_to_jsonb$function$
;

-- Permissions

ALTER FUNCTION public."jsonb"(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public."jsonb"(geometry) TO "admin";

-- DROP FUNCTION public.levenshtein(text, text, int4, int4, int4);

CREATE OR REPLACE FUNCTION public.levenshtein(text, text, integer, integer, integer)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$levenshtein_with_costs$function$
;

-- Permissions

ALTER FUNCTION public.levenshtein(text, text, int4, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.levenshtein(text, text, int4, int4, int4) TO "admin";

-- DROP FUNCTION public.levenshtein(text, text);

CREATE OR REPLACE FUNCTION public.levenshtein(text, text)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$levenshtein$function$
;

-- Permissions

ALTER FUNCTION public.levenshtein(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.levenshtein(text, text) TO "admin";

-- DROP FUNCTION public.levenshtein_less_equal(text, text, int4, int4, int4, int4);

CREATE OR REPLACE FUNCTION public.levenshtein_less_equal(text, text, integer, integer, integer, integer)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$levenshtein_less_equal_with_costs$function$
;

-- Permissions

ALTER FUNCTION public.levenshtein_less_equal(text, text, int4, int4, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.levenshtein_less_equal(text, text, int4, int4, int4, int4) TO "admin";

-- DROP FUNCTION public.levenshtein_less_equal(text, text, int4);

CREATE OR REPLACE FUNCTION public.levenshtein_less_equal(text, text, integer)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$levenshtein_less_equal$function$
;

-- Permissions

ALTER FUNCTION public.levenshtein_less_equal(text, text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.levenshtein_less_equal(text, text, int4) TO "admin";

-- DROP FUNCTION public.metaphone(text, int4);

CREATE OR REPLACE FUNCTION public.metaphone(text, integer)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$metaphone$function$
;

-- Permissions

ALTER FUNCTION public.metaphone(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.metaphone(text, int4) TO "admin";

-- DROP FUNCTION public.overlaps_2d(box2df, box2df);

CREATE OR REPLACE FUNCTION public.overlaps_2d(box2df, box2df)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_contains_box2df_box2df_2d$function$
;

-- Permissions

ALTER FUNCTION public.overlaps_2d(box2df, box2df) OWNER TO "admin";
GRANT ALL ON FUNCTION public.overlaps_2d(box2df, box2df) TO "admin";

-- DROP FUNCTION public.overlaps_2d(geometry, box2df);

CREATE OR REPLACE FUNCTION public.overlaps_2d(geometry, box2df)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
AS $function$SELECT $2 OPERATOR(public.&&) $1;$function$
;

-- Permissions

ALTER FUNCTION public.overlaps_2d(geometry, box2df) OWNER TO "admin";
GRANT ALL ON FUNCTION public.overlaps_2d(geometry, box2df) TO "admin";

-- DROP FUNCTION public.overlaps_2d(box2df, geometry);

CREATE OR REPLACE FUNCTION public.overlaps_2d(box2df, geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_overlaps_box2df_geom_2d$function$
;

-- Permissions

ALTER FUNCTION public.overlaps_2d(box2df, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.overlaps_2d(box2df, geometry) TO "admin";

-- DROP FUNCTION public.overlaps_geog(geography, gidx);

CREATE OR REPLACE FUNCTION public.overlaps_geog(geography, gidx)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE STRICT
AS $function$SELECT $2 OPERATOR(public.&&) $1;$function$
;

-- Permissions

ALTER FUNCTION public.overlaps_geog(geography, gidx) OWNER TO "admin";
GRANT ALL ON FUNCTION public.overlaps_geog(geography, gidx) TO "admin";

-- DROP FUNCTION public.overlaps_geog(gidx, gidx);

CREATE OR REPLACE FUNCTION public.overlaps_geog(gidx, gidx)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/postgis-3', $function$gserialized_gidx_gidx_overlaps$function$
;

-- Permissions

ALTER FUNCTION public.overlaps_geog(gidx, gidx) OWNER TO "admin";
GRANT ALL ON FUNCTION public.overlaps_geog(gidx, gidx) TO "admin";

-- DROP FUNCTION public.overlaps_geog(gidx, geography);

CREATE OR REPLACE FUNCTION public.overlaps_geog(gidx, geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/postgis-3', $function$gserialized_gidx_geog_overlaps$function$
;

-- Permissions

ALTER FUNCTION public.overlaps_geog(gidx, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.overlaps_geog(gidx, geography) TO "admin";

-- DROP FUNCTION public.overlaps_nd(gidx, geometry);

CREATE OR REPLACE FUNCTION public.overlaps_nd(gidx, geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_gidx_geom_overlaps$function$
;

-- Permissions

ALTER FUNCTION public.overlaps_nd(gidx, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.overlaps_nd(gidx, geometry) TO "admin";

-- DROP FUNCTION public.overlaps_nd(gidx, gidx);

CREATE OR REPLACE FUNCTION public.overlaps_nd(gidx, gidx)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$gserialized_gidx_gidx_overlaps$function$
;

-- Permissions

ALTER FUNCTION public.overlaps_nd(gidx, gidx) OWNER TO "admin";
GRANT ALL ON FUNCTION public.overlaps_nd(gidx, gidx) TO "admin";

-- DROP FUNCTION public.overlaps_nd(geometry, gidx);

CREATE OR REPLACE FUNCTION public.overlaps_nd(geometry, gidx)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 1
AS $function$SELECT $2 OPERATOR(public.&&&) $1;$function$
;

-- Permissions

ALTER FUNCTION public.overlaps_nd(geometry, gidx) OWNER TO "admin";
GRANT ALL ON FUNCTION public.overlaps_nd(geometry, gidx) TO "admin";

-- DROP FUNCTION public."path"(geometry);

CREATE OR REPLACE FUNCTION public.path(geometry)
 RETURNS path
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geometry_to_path$function$
;

-- Permissions

ALTER FUNCTION public."path"(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public."path"(geometry) TO "admin";

-- DROP FUNCTION public.pgis_asflatgeobuf_finalfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_asflatgeobuf_finalfn(internal)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asflatgeobuf_finalfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asflatgeobuf_finalfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asflatgeobuf_finalfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement);

CREATE OR REPLACE FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$pgis_asflatgeobuf_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement) TO "admin";

-- DROP FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement, bool);

CREATE OR REPLACE FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement, boolean)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$pgis_asflatgeobuf_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement, bool) TO "admin";

-- DROP FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement, bool, text);

CREATE OR REPLACE FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement, boolean, text)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$pgis_asflatgeobuf_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement, bool, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asflatgeobuf_transfn(internal, anyelement, bool, text) TO "admin";

-- DROP FUNCTION public.pgis_asgeobuf_finalfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_asgeobuf_finalfn(internal)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asgeobuf_finalfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asgeobuf_finalfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asgeobuf_finalfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_asgeobuf_transfn(internal, anyelement, text);

CREATE OR REPLACE FUNCTION public.pgis_asgeobuf_transfn(internal, anyelement, text)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$pgis_asgeobuf_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asgeobuf_transfn(internal, anyelement, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asgeobuf_transfn(internal, anyelement, text) TO "admin";

-- DROP FUNCTION public.pgis_asgeobuf_transfn(internal, anyelement);

CREATE OR REPLACE FUNCTION public.pgis_asgeobuf_transfn(internal, anyelement)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$pgis_asgeobuf_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asgeobuf_transfn(internal, anyelement) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asgeobuf_transfn(internal, anyelement) TO "admin";

-- DROP FUNCTION public.pgis_asmvt_combinefn(internal, internal);

CREATE OR REPLACE FUNCTION public.pgis_asmvt_combinefn(internal, internal)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asmvt_combinefn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asmvt_combinefn(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asmvt_combinefn(internal, internal) TO "admin";

-- DROP FUNCTION public.pgis_asmvt_deserialfn(bytea, internal);

CREATE OR REPLACE FUNCTION public.pgis_asmvt_deserialfn(bytea, internal)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asmvt_deserialfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asmvt_deserialfn(bytea, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asmvt_deserialfn(bytea, internal) TO "admin";

-- DROP FUNCTION public.pgis_asmvt_finalfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_asmvt_finalfn(internal)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asmvt_finalfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asmvt_finalfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asmvt_finalfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_asmvt_serialfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_asmvt_serialfn(internal)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asmvt_serialfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asmvt_serialfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asmvt_serialfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, int4);

CREATE OR REPLACE FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, integer)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asmvt_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, int4) TO "admin";

-- DROP FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, int4, text);

CREATE OR REPLACE FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, integer, text)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asmvt_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, int4, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, int4, text) TO "admin";

-- DROP FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text);

CREATE OR REPLACE FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asmvt_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text) TO "admin";

-- DROP FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, int4, text, text);

CREATE OR REPLACE FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, integer, text, text)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asmvt_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, int4, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, int4, text, text) TO "admin";

-- DROP FUNCTION public.pgis_asmvt_transfn(internal, anyelement);

CREATE OR REPLACE FUNCTION public.pgis_asmvt_transfn(internal, anyelement)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_asmvt_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_asmvt_transfn(internal, anyelement) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_asmvt_transfn(internal, anyelement) TO "admin";

-- DROP FUNCTION public.pgis_geometry_accum_transfn(internal, geometry);

CREATE OR REPLACE FUNCTION public.pgis_geometry_accum_transfn(internal, geometry)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$pgis_geometry_accum_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_accum_transfn(internal, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_accum_transfn(internal, geometry) TO "admin";

-- DROP FUNCTION public.pgis_geometry_accum_transfn(internal, geometry, float8);

CREATE OR REPLACE FUNCTION public.pgis_geometry_accum_transfn(internal, geometry, double precision)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$pgis_geometry_accum_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_accum_transfn(internal, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_accum_transfn(internal, geometry, float8) TO "admin";

-- DROP FUNCTION public.pgis_geometry_accum_transfn(internal, geometry, float8, int4);

CREATE OR REPLACE FUNCTION public.pgis_geometry_accum_transfn(internal, geometry, double precision, integer)
 RETURNS internal
 LANGUAGE c
 PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$pgis_geometry_accum_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_accum_transfn(internal, geometry, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_accum_transfn(internal, geometry, float8, int4) TO "admin";

-- DROP FUNCTION public.pgis_geometry_clusterintersecting_finalfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_geometry_clusterintersecting_finalfn(internal)
 RETURNS geometry[]
 LANGUAGE c
 PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_geometry_clusterintersecting_finalfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_clusterintersecting_finalfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_clusterintersecting_finalfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_geometry_clusterwithin_finalfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_geometry_clusterwithin_finalfn(internal)
 RETURNS geometry[]
 LANGUAGE c
 PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_geometry_clusterwithin_finalfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_clusterwithin_finalfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_clusterwithin_finalfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_geometry_collect_finalfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_geometry_collect_finalfn(internal)
 RETURNS geometry
 LANGUAGE c
 PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_geometry_collect_finalfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_collect_finalfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_collect_finalfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_geometry_coverageunion_finalfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_geometry_coverageunion_finalfn(internal)
 RETURNS geometry
 LANGUAGE c
 PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_geometry_coverageunion_finalfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_coverageunion_finalfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_coverageunion_finalfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_geometry_makeline_finalfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_geometry_makeline_finalfn(internal)
 RETURNS geometry
 LANGUAGE c
 PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_geometry_makeline_finalfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_makeline_finalfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_makeline_finalfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_geometry_polygonize_finalfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_geometry_polygonize_finalfn(internal)
 RETURNS geometry
 LANGUAGE c
 PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_geometry_polygonize_finalfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_polygonize_finalfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_polygonize_finalfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_geometry_union_parallel_combinefn(internal, internal);

CREATE OR REPLACE FUNCTION public.pgis_geometry_union_parallel_combinefn(internal, internal)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE
AS '$libdir/postgis-3', $function$pgis_geometry_union_parallel_combinefn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_union_parallel_combinefn(internal, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_union_parallel_combinefn(internal, internal) TO "admin";

-- DROP FUNCTION public.pgis_geometry_union_parallel_deserialfn(bytea, internal);

CREATE OR REPLACE FUNCTION public.pgis_geometry_union_parallel_deserialfn(bytea, internal)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$pgis_geometry_union_parallel_deserialfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_union_parallel_deserialfn(bytea, internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_union_parallel_deserialfn(bytea, internal) TO "admin";

-- DROP FUNCTION public.pgis_geometry_union_parallel_finalfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_geometry_union_parallel_finalfn(internal)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$pgis_geometry_union_parallel_finalfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_union_parallel_finalfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_union_parallel_finalfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_geometry_union_parallel_serialfn(internal);

CREATE OR REPLACE FUNCTION public.pgis_geometry_union_parallel_serialfn(internal)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$pgis_geometry_union_parallel_serialfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_union_parallel_serialfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_union_parallel_serialfn(internal) TO "admin";

-- DROP FUNCTION public.pgis_geometry_union_parallel_transfn(internal, geometry, float8);

CREATE OR REPLACE FUNCTION public.pgis_geometry_union_parallel_transfn(internal, geometry, double precision)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$pgis_geometry_union_parallel_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_union_parallel_transfn(internal, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_union_parallel_transfn(internal, geometry, float8) TO "admin";

-- DROP FUNCTION public.pgis_geometry_union_parallel_transfn(internal, geometry);

CREATE OR REPLACE FUNCTION public.pgis_geometry_union_parallel_transfn(internal, geometry)
 RETURNS internal
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE
AS '$libdir/postgis-3', $function$pgis_geometry_union_parallel_transfn$function$
;

-- Permissions

ALTER FUNCTION public.pgis_geometry_union_parallel_transfn(internal, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.pgis_geometry_union_parallel_transfn(internal, geometry) TO "admin";

-- DROP FUNCTION public.point(geometry);

CREATE OR REPLACE FUNCTION public.point(geometry)
 RETURNS point
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geometry_to_point$function$
;

-- Permissions

ALTER FUNCTION public.point(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.point(geometry) TO "admin";

-- DROP FUNCTION public.polygon(geometry);

CREATE OR REPLACE FUNCTION public.polygon(geometry)
 RETURNS polygon
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geometry_to_polygon$function$
;

-- Permissions

ALTER FUNCTION public.polygon(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.polygon(geometry) TO "admin";

-- DROP FUNCTION public.populate_geometry_columns(bool);

CREATE OR REPLACE FUNCTION public.populate_geometry_columns(use_typmod boolean DEFAULT true)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
	inserted	integer;
	oldcount	integer;
	probed	  integer;
	stale	   integer;
	gcs		 RECORD;
	gc		  RECORD;
	gsrid	   integer;
	gndims	  integer;
	gtype	   text;
	query	   text;
	gc_is_valid boolean;

BEGIN
	SELECT count(*) INTO oldcount FROM public.geometry_columns;
	inserted := 0;

	-- Count the number of geometry columns in all tables and views
	SELECT count(DISTINCT c.oid) INTO probed
	FROM pg_class c,
		 pg_attribute a,
		 pg_type t,
		 pg_namespace n
	WHERE c.relkind IN('r','v','f', 'p')
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%' AND c.relname != 'raster_columns' ;

	-- Iterate through all non-dropped geometry columns
	RAISE DEBUG 'Processing Tables.....';

	FOR gcs IN
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind IN( 'r', 'f', 'p')
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%' AND c.relname != 'raster_columns'
	LOOP

		inserted := inserted + public.populate_geometry_columns(gcs.oid, use_typmod);
	END LOOP;

	IF oldcount > inserted THEN
		stale = oldcount-inserted;
	ELSE
		stale = 0;
	END IF;

	RETURN 'probed:' ||probed|| ' inserted:'||inserted;
END

$function$
;

-- Permissions

ALTER FUNCTION public.populate_geometry_columns(bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.populate_geometry_columns(bool) TO "admin";

-- DROP FUNCTION public.populate_geometry_columns(oid, bool);

CREATE OR REPLACE FUNCTION public.populate_geometry_columns(tbl_oid oid, use_typmod boolean DEFAULT true)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
	gcs		 RECORD;
	gc		  RECORD;
	gc_old	  RECORD;
	gsrid	   integer;
	gndims	  integer;
	gtype	   text;
	query	   text;
	gc_is_valid boolean;
	inserted	integer;
	constraint_successful boolean := false;

BEGIN
	inserted := 0;

	-- Iterate through all geometry columns in this table
	FOR gcs IN
	SELECT n.nspname, c.relname, a.attname, c.relkind
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind IN('r', 'f', 'p')
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%'
		AND c.oid = tbl_oid
	LOOP

		RAISE DEBUG 'Processing column %.%.%', gcs.nspname, gcs.relname, gcs.attname;

		gc_is_valid := true;
		-- Find the srid, coord_dimension, and type of current geometry
		-- in geometry_columns -- which is now a view

		SELECT type, srid, coord_dimension, gcs.relkind INTO gc_old
			FROM geometry_columns
			WHERE f_table_schema = gcs.nspname AND f_table_name = gcs.relname AND f_geometry_column = gcs.attname;

		IF upper(gc_old.type) = 'GEOMETRY' THEN
		-- This is an unconstrained geometry we need to do something
		-- We need to figure out what to set the type by inspecting the data
			EXECUTE 'SELECT public.ST_srid(' || quote_ident(gcs.attname) || ') As srid, public.GeometryType(' || quote_ident(gcs.attname) || ') As type, public.ST_NDims(' || quote_ident(gcs.attname) || ') As dims ' ||
					 ' FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) ||
					 ' WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1;'
				INTO gc;
			IF gc IS NULL THEN -- there is no data so we can not determine geometry type
				RAISE WARNING 'No data in table %.%, so no information to determine geometry type and srid', gcs.nspname, gcs.relname;
				RETURN 0;
			END IF;
			gsrid := gc.srid; gtype := gc.type; gndims := gc.dims;

			IF use_typmod THEN
				BEGIN
					EXECUTE 'ALTER TABLE ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' ALTER COLUMN ' || quote_ident(gcs.attname) ||
						' TYPE geometry(' || postgis_type_name(gtype, gndims, true) || ', ' || gsrid::text  || ') ';
					inserted := inserted + 1;
				EXCEPTION
						WHEN invalid_parameter_value OR feature_not_supported THEN
						RAISE WARNING 'Could not convert ''%'' in ''%.%'' to use typmod with srid %, type %: %', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), gsrid, postgis_type_name(gtype, gndims, true), SQLERRM;
							gc_is_valid := false;
				END;

			ELSE
				-- Try to apply srid check to column
				constraint_successful = false;
				IF (gsrid > 0 AND postgis_constraint_srid(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
					BEGIN
						EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) ||
								 ' ADD CONSTRAINT ' || quote_ident('enforce_srid_' || gcs.attname) ||
								 ' CHECK (ST_srid(' || quote_ident(gcs.attname) || ') = ' || gsrid || ')';
						constraint_successful := true;
					EXCEPTION
						WHEN check_violation THEN
							RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (st_srid(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gsrid;
							gc_is_valid := false;
					END;
				END IF;

				-- Try to apply ndims check to column
				IF (gndims IS NOT NULL AND postgis_constraint_dims(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
					BEGIN
						EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
								 ADD CONSTRAINT ' || quote_ident('enforce_dims_' || gcs.attname) || '
								 CHECK (st_ndims(' || quote_ident(gcs.attname) || ') = '||gndims||')';
						constraint_successful := true;
					EXCEPTION
						WHEN check_violation THEN
							RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (st_ndims(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gndims;
							gc_is_valid := false;
					END;
				END IF;

				-- Try to apply geometrytype check to column
				IF (gtype IS NOT NULL AND postgis_constraint_type(gcs.nspname, gcs.relname,gcs.attname) IS NULL ) THEN
					BEGIN
						EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
						ADD CONSTRAINT ' || quote_ident('enforce_geotype_' || gcs.attname) || '
						CHECK (geometrytype(' || quote_ident(gcs.attname) || ') = ' || quote_literal(gtype) || ')';
						constraint_successful := true;
					EXCEPTION
						WHEN check_violation THEN
							-- No geometry check can be applied. This column contains a number of geometry types.
							RAISE WARNING 'Could not add geometry type check (%) to table column: %.%.%', gtype, quote_ident(gcs.nspname),quote_ident(gcs.relname),quote_ident(gcs.attname);
					END;
				END IF;
				 --only count if we were successful in applying at least one constraint
				IF constraint_successful THEN
					inserted := inserted + 1;
				END IF;
			END IF;
		END IF;

	END LOOP;

	RETURN inserted;
END

$function$
;

-- Permissions

ALTER FUNCTION public.populate_geometry_columns(oid, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.populate_geometry_columns(oid, bool) TO "admin";

-- DROP FUNCTION public.postgis_addbbox(geometry);

CREATE OR REPLACE FUNCTION public.postgis_addbbox(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_addBBOX$function$
;

-- Permissions

ALTER FUNCTION public.postgis_addbbox(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_addbbox(geometry) TO "admin";

-- DROP FUNCTION public.postgis_cache_bbox();

CREATE OR REPLACE FUNCTION public.postgis_cache_bbox()
 RETURNS trigger
 LANGUAGE c
AS '$libdir/postgis-3', $function$cache_bbox$function$
;

-- Permissions

ALTER FUNCTION public.postgis_cache_bbox() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_cache_bbox() TO "admin";

-- DROP FUNCTION public.postgis_constraint_dims(text, text, text);

CREATE OR REPLACE FUNCTION public.postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text)
 RETURNS integer
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT COST 250
AS $function$
SELECT  replace(split_part(s.consrc, ' = ', 2), ')', '')::integer
		 FROM pg_class c, pg_namespace n, pg_attribute a
		 , (SELECT connamespace, conrelid, conkey, pg_get_constraintdef(oid) As consrc
			FROM pg_constraint) AS s
		 WHERE n.nspname = $1
		 AND c.relname = $2
		 AND a.attname = $3
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%ndims(% = %';
$function$
;

-- Permissions

ALTER FUNCTION public.postgis_constraint_dims(text, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_constraint_dims(text, text, text) TO "admin";

-- DROP FUNCTION public.postgis_constraint_srid(text, text, text);

CREATE OR REPLACE FUNCTION public.postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text)
 RETURNS integer
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT COST 250
AS $function$
SELECT replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '')::integer
		 FROM pg_class c, pg_namespace n, pg_attribute a
		 , (SELECT connamespace, conrelid, conkey, pg_get_constraintdef(oid) As consrc
			FROM pg_constraint) AS s
		 WHERE n.nspname = $1
		 AND c.relname = $2
		 AND a.attname = $3
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%srid(% = %';
$function$
;

-- Permissions

ALTER FUNCTION public.postgis_constraint_srid(text, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_constraint_srid(text, text, text) TO "admin";

-- DROP FUNCTION public.postgis_constraint_type(text, text, text);

CREATE OR REPLACE FUNCTION public.postgis_constraint_type(geomschema text, geomtable text, geomcolumn text)
 RETURNS character varying
 LANGUAGE sql
 STABLE PARALLEL SAFE STRICT COST 250
AS $function$
SELECT  replace(split_part(s.consrc, '''', 2), ')', '')::varchar
		 FROM pg_class c, pg_namespace n, pg_attribute a
		 , (SELECT connamespace, conrelid, conkey, pg_get_constraintdef(oid) As consrc
			FROM pg_constraint) AS s
		 WHERE n.nspname = $1
		 AND c.relname = $2
		 AND a.attname = $3
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%geometrytype(% = %';
$function$
;

-- Permissions

ALTER FUNCTION public.postgis_constraint_type(text, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_constraint_type(text, text, text) TO "admin";

-- DROP FUNCTION public.postgis_dropbbox(geometry);

CREATE OR REPLACE FUNCTION public.postgis_dropbbox(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_dropBBOX$function$
;

-- Permissions

ALTER FUNCTION public.postgis_dropbbox(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_dropbbox(geometry) TO "admin";

-- DROP FUNCTION public.postgis_extensions_upgrade(text);

CREATE OR REPLACE FUNCTION public.postgis_extensions_upgrade(target_version text DEFAULT NULL::text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
	rec record;
	sql text;
	var_schema text;
BEGIN

	FOR rec IN
		SELECT name, default_version, installed_version
		FROM pg_catalog.pg_available_extensions
		WHERE name IN (
			'postgis',
			'postgis_raster',
			'postgis_sfcgal',
			'postgis_topology',
			'postgis_tiger_geocoder'
		)
		ORDER BY length(name) -- this is to make sure 'postgis' is first !
	LOOP --{

		IF target_version IS NULL THEN
			target_version := rec.default_version;
		END IF;

		IF rec.installed_version IS NULL THEN --{
			-- If the support installed by available extension
			-- is found unpackaged, we package it
			IF --{
				 -- PostGIS is always available (this function is part of it)
				 rec.name = 'postgis'

				 -- PostGIS raster is available if type 'raster' exists
				 OR ( rec.name = 'postgis_raster' AND EXISTS (
							SELECT 1 FROM pg_catalog.pg_type
							WHERE typname = 'raster' ) )

				 -- PostGIS SFCGAL is available if
				 -- 'postgis_sfcgal_version' function exists
				 OR ( rec.name = 'postgis_sfcgal' AND EXISTS (
							SELECT 1 FROM pg_catalog.pg_proc
							WHERE proname = 'postgis_sfcgal_version' ) )

				 -- PostGIS Topology is available if
				 -- 'topology.topology' table exists
				 -- NOTE: watch out for https://trac.osgeo.org/postgis/ticket/2503
				 OR ( rec.name = 'postgis_topology' AND EXISTS (
							SELECT 1 FROM pg_catalog.pg_class c
							JOIN pg_catalog.pg_namespace n ON (c.relnamespace = n.oid )
							WHERE n.nspname = 'topology' AND c.relname = 'topology') )

				 OR ( rec.name = 'postgis_tiger_geocoder' AND EXISTS (
							SELECT 1 FROM pg_catalog.pg_class c
							JOIN pg_catalog.pg_namespace n ON (c.relnamespace = n.oid )
							WHERE n.nspname = 'tiger' AND c.relname = 'geocode_settings') )
			THEN --}{ -- the code is unpackaged
				-- Force install in same schema as postgis
				SELECT INTO var_schema n.nspname
				  FROM pg_namespace n, pg_proc p
				  WHERE p.proname = 'postgis_full_version'
					AND n.oid = p.pronamespace
				  LIMIT 1;
				IF rec.name NOT IN('postgis_topology', 'postgis_tiger_geocoder')
				THEN
					sql := format(
							  'CREATE EXTENSION %1$I SCHEMA %2$I VERSION unpackaged;'
							  'ALTER EXTENSION %1$I UPDATE TO %3$I',
							  rec.name, var_schema, target_version);
				ELSE
					sql := format(
							 'CREATE EXTENSION %1$I VERSION unpackaged;'
							 'ALTER EXTENSION %1$I UPDATE TO %2$I',
							 rec.name, target_version);
				END IF;
				RAISE NOTICE 'Packaging and updating %', rec.name;
				RAISE DEBUG '%', sql;
				EXECUTE sql;
			ELSE
				RAISE DEBUG 'Skipping % (not in use)', rec.name;
			END IF; --}
		ELSE -- The code is already packaged, upgrade it --}{
			sql = format(
				'ALTER EXTENSION %1$I UPDATE TO "ANY";'
				'ALTER EXTENSION %1$I UPDATE TO %2$I',
				rec.name, target_version
				);
			RAISE NOTICE 'Updating extension % %', rec.name, rec.installed_version;
			RAISE DEBUG '%', sql;
			EXECUTE sql;
		END IF; --}

	END LOOP; --}

	RETURN format(
		'Upgrade to version %s completed, run SELECT postgis_full_version(); for details',
		target_version
	);


END
$function$
;

-- Permissions

ALTER FUNCTION public.postgis_extensions_upgrade(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_extensions_upgrade(text) TO "admin";

-- DROP FUNCTION public.postgis_full_version();

CREATE OR REPLACE FUNCTION public.postgis_full_version()
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
DECLARE
	libver text;
	librev text;
	projver text;
	projver_compiled text;
	geosver text;
	geosver_compiled text;
	sfcgalver text;
	gdalver text := NULL;
	libxmlver text;
	liblwgeomver text;
	dbproc text;
	relproc text;
	fullver text;
	rast_lib_ver text := NULL;
	rast_scr_ver text := NULL;
	topo_scr_ver text := NULL;
	json_lib_ver text;
	protobuf_lib_ver text;
	wagyu_lib_ver text;
	sfcgal_lib_ver text;
	sfcgal_scr_ver text;
	pgsql_scr_ver text;
	pgsql_ver text;
	core_is_extension bool;
BEGIN
	SELECT public.postgis_lib_version() INTO libver;
	SELECT public.postgis_proj_version() INTO projver;
	SELECT public.postgis_geos_version() INTO geosver;
	SELECT public.postgis_geos_compiled_version() INTO geosver_compiled;
	SELECT public.postgis_proj_compiled_version() INTO projver_compiled;
	SELECT public.postgis_libjson_version() INTO json_lib_ver;
	SELECT public.postgis_libprotobuf_version() INTO protobuf_lib_ver;
	SELECT public.postgis_wagyu_version() INTO wagyu_lib_ver;
	SELECT public._postgis_scripts_pgsql_version() INTO pgsql_scr_ver;
	SELECT public._postgis_pgsql_version() INTO pgsql_ver;
	BEGIN
		SELECT public.postgis_gdal_version() INTO gdalver;
	EXCEPTION
		WHEN undefined_function THEN
			RAISE DEBUG 'Function postgis_gdal_version() not found.  Is raster support enabled and rtpostgis.sql installed?';
	END;
	BEGIN
		SELECT public.postgis_sfcgal_full_version() INTO sfcgalver;
		BEGIN
			SELECT public.postgis_sfcgal_scripts_installed() INTO sfcgal_scr_ver;
		EXCEPTION
			WHEN undefined_function THEN
				sfcgal_scr_ver := 'missing';
		END;
	EXCEPTION
		WHEN undefined_function THEN
			RAISE DEBUG 'Function postgis_sfcgal_scripts_installed() not found. Is sfcgal support enabled and sfcgal.sql installed?';
	END;
	SELECT public.postgis_liblwgeom_version() INTO liblwgeomver;
	SELECT public.postgis_libxml_version() INTO libxmlver;
	SELECT public.postgis_scripts_installed() INTO dbproc;
	SELECT public.postgis_scripts_released() INTO relproc;
	SELECT public.postgis_lib_revision() INTO librev;
	BEGIN
		SELECT topology.postgis_topology_scripts_installed() INTO topo_scr_ver;
	EXCEPTION
		WHEN undefined_function OR invalid_schema_name THEN
			RAISE DEBUG 'Function postgis_topology_scripts_installed() not found. Is topology support enabled and topology.sql installed?';
		WHEN insufficient_privilege THEN
			RAISE NOTICE 'Topology support cannot be inspected. Is current user granted USAGE on schema "topology" ?';
		WHEN OTHERS THEN
			RAISE NOTICE 'Function postgis_topology_scripts_installed() could not be called: % (%)', SQLERRM, SQLSTATE;
	END;

	BEGIN
		SELECT postgis_raster_scripts_installed() INTO rast_scr_ver;
	EXCEPTION
		WHEN undefined_function THEN
			RAISE DEBUG 'Function postgis_raster_scripts_installed() not found. Is raster support enabled and rtpostgis.sql installed?';
		WHEN OTHERS THEN
			RAISE NOTICE 'Function postgis_raster_scripts_installed() could not be called: % (%)', SQLERRM, SQLSTATE;
	END;

	BEGIN
		SELECT public.postgis_raster_lib_version() INTO rast_lib_ver;
	EXCEPTION
		WHEN undefined_function THEN
			RAISE DEBUG 'Function postgis_raster_lib_version() not found. Is raster support enabled and rtpostgis.sql installed?';
		WHEN OTHERS THEN
			RAISE NOTICE 'Function postgis_raster_lib_version() could not be called: % (%)', SQLERRM, SQLSTATE;
	END;

	fullver = 'POSTGIS="' || libver;

	IF  librev IS NOT NULL THEN
		fullver = fullver || ' ' || librev;
	END IF;

	fullver = fullver || '"';

	IF EXISTS (
		SELECT * FROM pg_catalog.pg_extension
		WHERE extname = 'postgis')
	THEN
			fullver = fullver || ' [EXTENSION]';
			core_is_extension := true;
	ELSE
			core_is_extension := false;
	END IF;

	IF liblwgeomver != relproc THEN
		fullver = fullver || ' (liblwgeom version mismatch: "' || liblwgeomver || '")';
	END IF;

	fullver = fullver || ' PGSQL="' || pgsql_scr_ver || '"';
	IF pgsql_scr_ver != pgsql_ver THEN
		fullver = fullver || ' (procs need upgrade for use with PostgreSQL "' || pgsql_ver || '")';
	END IF;

	IF  geosver IS NOT NULL THEN
		fullver = fullver || ' GEOS="' || geosver || '"';
		IF (string_to_array(geosver, '.'))[1:2] != (string_to_array(geosver_compiled, '.'))[1:2]
		THEN
			fullver = format('%s (compiled against GEOS %s)', fullver, geosver_compiled);
		END IF;
	END IF;

	IF  sfcgalver IS NOT NULL THEN
		fullver = fullver || ' SFCGAL="' || sfcgalver || '"';
	END IF;

	IF  projver IS NOT NULL THEN
		fullver = fullver || ' PROJ="' || projver || '"';
		IF (string_to_array(projver, '.'))[1:3] != (string_to_array(projver_compiled, '.'))[1:3]
		THEN
			fullver = format('%s (compiled against PROJ %s)', fullver, projver_compiled);
		END IF;
	END IF;

	IF  gdalver IS NOT NULL THEN
		fullver = fullver || ' GDAL="' || gdalver || '"';
	END IF;

	IF  libxmlver IS NOT NULL THEN
		fullver = fullver || ' LIBXML="' || libxmlver || '"';
	END IF;

	IF json_lib_ver IS NOT NULL THEN
		fullver = fullver || ' LIBJSON="' || json_lib_ver || '"';
	END IF;

	IF protobuf_lib_ver IS NOT NULL THEN
		fullver = fullver || ' LIBPROTOBUF="' || protobuf_lib_ver || '"';
	END IF;

	IF wagyu_lib_ver IS NOT NULL THEN
		fullver = fullver || ' WAGYU="' || wagyu_lib_ver || '"';
	END IF;

	IF dbproc != relproc THEN
		fullver = fullver || ' (core procs from "' || dbproc || '" need upgrade)';
	END IF;

	IF topo_scr_ver IS NOT NULL THEN
		fullver = fullver || ' TOPOLOGY';
		IF topo_scr_ver != relproc THEN
			fullver = fullver || ' (topology procs from "' || topo_scr_ver || '" need upgrade)';
		END IF;
		IF core_is_extension AND NOT EXISTS (
			SELECT * FROM pg_catalog.pg_extension
			WHERE extname = 'postgis_topology')
		THEN
				fullver = fullver || ' [UNPACKAGED!]';
		END IF;
	END IF;

	IF rast_lib_ver IS NOT NULL THEN
		fullver = fullver || ' RASTER';
		IF rast_lib_ver != relproc THEN
			fullver = fullver || ' (raster lib from "' || rast_lib_ver || '" need upgrade)';
		END IF;
		IF core_is_extension AND NOT EXISTS (
			SELECT * FROM pg_catalog.pg_extension
			WHERE extname = 'postgis_raster')
		THEN
				fullver = fullver || ' [UNPACKAGED!]';
		END IF;
	END IF;

	IF rast_scr_ver IS NOT NULL AND rast_scr_ver != relproc THEN
		fullver = fullver || ' (raster procs from "' || rast_scr_ver || '" need upgrade)';
	END IF;

	IF sfcgal_scr_ver IS NOT NULL AND sfcgal_scr_ver != relproc THEN
		fullver = fullver || ' (sfcgal procs from "' || sfcgal_scr_ver || '" need upgrade)';
	END IF;

	-- Check for the presence of deprecated functions
	IF EXISTS ( SELECT oid FROM pg_catalog.pg_proc WHERE proname LIKE '%_deprecated_by_postgis_%' )
	THEN
		fullver = fullver || ' (deprecated functions exist, upgrade is not complete)';
	END IF;

	RETURN fullver;
END
$function$
;

-- Permissions

ALTER FUNCTION public.postgis_full_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_full_version() TO "admin";

-- DROP FUNCTION public.postgis_geos_compiled_version();

CREATE OR REPLACE FUNCTION public.postgis_geos_compiled_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_geos_compiled_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_geos_compiled_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_geos_compiled_version() TO "admin";

-- DROP FUNCTION public.postgis_geos_noop(geometry);

CREATE OR REPLACE FUNCTION public.postgis_geos_noop(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$GEOSnoop$function$
;

-- Permissions

ALTER FUNCTION public.postgis_geos_noop(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_geos_noop(geometry) TO "admin";

-- DROP FUNCTION public.postgis_geos_version();

CREATE OR REPLACE FUNCTION public.postgis_geos_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_geos_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_geos_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_geos_version() TO "admin";

-- DROP FUNCTION public.postgis_getbbox(geometry);

CREATE OR REPLACE FUNCTION public.postgis_getbbox(geometry)
 RETURNS box2d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_to_BOX2DF$function$
;

-- Permissions

ALTER FUNCTION public.postgis_getbbox(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_getbbox(geometry) TO "admin";

-- DROP FUNCTION public.postgis_hasbbox(geometry);

CREATE OR REPLACE FUNCTION public.postgis_hasbbox(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_hasBBOX$function$
;

-- Permissions

ALTER FUNCTION public.postgis_hasbbox(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_hasbbox(geometry) TO "admin";

-- DROP FUNCTION public.postgis_index_supportfn(internal);

CREATE OR REPLACE FUNCTION public.postgis_index_supportfn(internal)
 RETURNS internal
 LANGUAGE c
AS '$libdir/postgis-3', $function$postgis_index_supportfn$function$
;

-- Permissions

ALTER FUNCTION public.postgis_index_supportfn(internal) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_index_supportfn(internal) TO "admin";

-- DROP FUNCTION public.postgis_lib_build_date();

CREATE OR REPLACE FUNCTION public.postgis_lib_build_date()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_lib_build_date$function$
;

-- Permissions

ALTER FUNCTION public.postgis_lib_build_date() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_lib_build_date() TO "admin";

-- DROP FUNCTION public.postgis_lib_revision();

CREATE OR REPLACE FUNCTION public.postgis_lib_revision()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_lib_revision$function$
;

-- Permissions

ALTER FUNCTION public.postgis_lib_revision() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_lib_revision() TO "admin";

-- DROP FUNCTION public.postgis_lib_version();

CREATE OR REPLACE FUNCTION public.postgis_lib_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_lib_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_lib_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_lib_version() TO "admin";

-- DROP FUNCTION public.postgis_libjson_version();

CREATE OR REPLACE FUNCTION public.postgis_libjson_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$postgis_libjson_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_libjson_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_libjson_version() TO "admin";

-- DROP FUNCTION public.postgis_liblwgeom_version();

CREATE OR REPLACE FUNCTION public.postgis_liblwgeom_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_liblwgeom_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_liblwgeom_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_liblwgeom_version() TO "admin";

-- DROP FUNCTION public.postgis_libprotobuf_version();

CREATE OR REPLACE FUNCTION public.postgis_libprotobuf_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/postgis-3', $function$postgis_libprotobuf_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_libprotobuf_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_libprotobuf_version() TO "admin";

-- DROP FUNCTION public.postgis_libxml_version();

CREATE OR REPLACE FUNCTION public.postgis_libxml_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_libxml_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_libxml_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_libxml_version() TO "admin";

-- DROP FUNCTION public.postgis_noop(geometry);

CREATE OR REPLACE FUNCTION public.postgis_noop(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_noop$function$
;

-- Permissions

ALTER FUNCTION public.postgis_noop(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_noop(geometry) TO "admin";

-- DROP FUNCTION public.postgis_proj_compiled_version();

CREATE OR REPLACE FUNCTION public.postgis_proj_compiled_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_proj_compiled_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_proj_compiled_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_proj_compiled_version() TO "admin";

-- DROP FUNCTION public.postgis_proj_version();

CREATE OR REPLACE FUNCTION public.postgis_proj_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_proj_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_proj_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_proj_version() TO "admin";

-- DROP FUNCTION public.postgis_scripts_build_date();

CREATE OR REPLACE FUNCTION public.postgis_scripts_build_date()
 RETURNS text
 LANGUAGE sql
 IMMUTABLE
AS $function$SELECT '2025-01-19 06:35:59'::text AS version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_scripts_build_date() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_scripts_build_date() TO "admin";

-- DROP FUNCTION public.postgis_scripts_installed();

CREATE OR REPLACE FUNCTION public.postgis_scripts_installed()
 RETURNS text
 LANGUAGE sql
 IMMUTABLE
AS $function$ SELECT trim('3.5.2'::text || $rev$ dea6d0a $rev$) AS version $function$
;

-- Permissions

ALTER FUNCTION public.postgis_scripts_installed() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_scripts_installed() TO "admin";

-- DROP FUNCTION public.postgis_scripts_released();

CREATE OR REPLACE FUNCTION public.postgis_scripts_released()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_scripts_released$function$
;

-- Permissions

ALTER FUNCTION public.postgis_scripts_released() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_scripts_released() TO "admin";

-- DROP FUNCTION public.postgis_srs(text, text);

CREATE OR REPLACE FUNCTION public.postgis_srs(auth_name text, auth_srid text)
 RETURNS TABLE(auth_name text, auth_srid text, srname text, srtext text, proj4text text, point_sw geometry, point_ne geometry)
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$postgis_srs_entry$function$
;

-- Permissions

ALTER FUNCTION public.postgis_srs(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_srs(text, text) TO "admin";

-- DROP FUNCTION public.postgis_srs_all();

CREATE OR REPLACE FUNCTION public.postgis_srs_all()
 RETURNS TABLE(auth_name text, auth_srid text, srname text, srtext text, proj4text text, point_sw geometry, point_ne geometry)
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$postgis_srs_entry_all$function$
;

-- Permissions

ALTER FUNCTION public.postgis_srs_all() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_srs_all() TO "admin";

-- DROP FUNCTION public.postgis_srs_codes(text);

CREATE OR REPLACE FUNCTION public.postgis_srs_codes(auth_name text)
 RETURNS SETOF text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$postgis_srs_codes$function$
;

-- Permissions

ALTER FUNCTION public.postgis_srs_codes(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_srs_codes(text) TO "admin";

-- DROP FUNCTION public.postgis_srs_search(geometry, text);

CREATE OR REPLACE FUNCTION public.postgis_srs_search(bounds geometry, authname text DEFAULT 'EPSG'::text)
 RETURNS TABLE(auth_name text, auth_srid text, srname text, srtext text, proj4text text, point_sw geometry, point_ne geometry)
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$postgis_srs_search$function$
;

-- Permissions

ALTER FUNCTION public.postgis_srs_search(geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_srs_search(geometry, text) TO "admin";

-- DROP FUNCTION public.postgis_svn_version();

CREATE OR REPLACE FUNCTION public.postgis_svn_version()
 RETURNS text
 LANGUAGE sql
 IMMUTABLE
AS $function$
	SELECT public._postgis_deprecate(
		'postgis_svn_version', 'postgis_lib_revision', '3.1.0');
	SELECT public.postgis_lib_revision();
$function$
;

-- Permissions

ALTER FUNCTION public.postgis_svn_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_svn_version() TO "admin";

-- DROP FUNCTION public.postgis_transform_geometry(geometry, text, text, int4);

CREATE OR REPLACE FUNCTION public.postgis_transform_geometry(geom geometry, text, text, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$transform_geom$function$
;

-- Permissions

ALTER FUNCTION public.postgis_transform_geometry(geometry, text, text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_transform_geometry(geometry, text, text, int4) TO "admin";

-- DROP FUNCTION public.postgis_transform_pipeline_geometry(geometry, text, bool, int4);

CREATE OR REPLACE FUNCTION public.postgis_transform_pipeline_geometry(geom geometry, pipeline text, forward boolean, to_srid integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$transform_pipeline_geom$function$
;

-- Permissions

ALTER FUNCTION public.postgis_transform_pipeline_geometry(geometry, text, bool, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_transform_pipeline_geometry(geometry, text, bool, int4) TO "admin";

-- DROP FUNCTION public.postgis_type_name(varchar, int4, bool);

CREATE OR REPLACE FUNCTION public.postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean DEFAULT true)
 RETURNS character varying
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$
	SELECT CASE WHEN $3 THEN new_name ELSE old_name END As geomname
	FROM
	( VALUES
			('GEOMETRY', 'Geometry', 2),
			('GEOMETRY', 'GeometryZ', 3),
			('GEOMETRYM', 'GeometryM', 3),
			('GEOMETRY', 'GeometryZM', 4),

			('GEOMETRYCOLLECTION', 'GeometryCollection', 2),
			('GEOMETRYCOLLECTION', 'GeometryCollectionZ', 3),
			('GEOMETRYCOLLECTIONM', 'GeometryCollectionM', 3),
			('GEOMETRYCOLLECTION', 'GeometryCollectionZM', 4),

			('POINT', 'Point', 2),
			('POINT', 'PointZ', 3),
			('POINTM','PointM', 3),
			('POINT', 'PointZM', 4),

			('MULTIPOINT','MultiPoint', 2),
			('MULTIPOINT','MultiPointZ', 3),
			('MULTIPOINTM','MultiPointM', 3),
			('MULTIPOINT','MultiPointZM', 4),

			('POLYGON', 'Polygon', 2),
			('POLYGON', 'PolygonZ', 3),
			('POLYGONM', 'PolygonM', 3),
			('POLYGON', 'PolygonZM', 4),

			('MULTIPOLYGON', 'MultiPolygon', 2),
			('MULTIPOLYGON', 'MultiPolygonZ', 3),
			('MULTIPOLYGONM', 'MultiPolygonM', 3),
			('MULTIPOLYGON', 'MultiPolygonZM', 4),

			('MULTILINESTRING', 'MultiLineString', 2),
			('MULTILINESTRING', 'MultiLineStringZ', 3),
			('MULTILINESTRINGM', 'MultiLineStringM', 3),
			('MULTILINESTRING', 'MultiLineStringZM', 4),

			('LINESTRING', 'LineString', 2),
			('LINESTRING', 'LineStringZ', 3),
			('LINESTRINGM', 'LineStringM', 3),
			('LINESTRING', 'LineStringZM', 4),

			('CIRCULARSTRING', 'CircularString', 2),
			('CIRCULARSTRING', 'CircularStringZ', 3),
			('CIRCULARSTRINGM', 'CircularStringM' ,3),
			('CIRCULARSTRING', 'CircularStringZM', 4),

			('COMPOUNDCURVE', 'CompoundCurve', 2),
			('COMPOUNDCURVE', 'CompoundCurveZ', 3),
			('COMPOUNDCURVEM', 'CompoundCurveM', 3),
			('COMPOUNDCURVE', 'CompoundCurveZM', 4),

			('CURVEPOLYGON', 'CurvePolygon', 2),
			('CURVEPOLYGON', 'CurvePolygonZ', 3),
			('CURVEPOLYGONM', 'CurvePolygonM', 3),
			('CURVEPOLYGON', 'CurvePolygonZM', 4),

			('MULTICURVE', 'MultiCurve', 2),
			('MULTICURVE', 'MultiCurveZ', 3),
			('MULTICURVEM', 'MultiCurveM', 3),
			('MULTICURVE', 'MultiCurveZM', 4),

			('MULTISURFACE', 'MultiSurface', 2),
			('MULTISURFACE', 'MultiSurfaceZ', 3),
			('MULTISURFACEM', 'MultiSurfaceM', 3),
			('MULTISURFACE', 'MultiSurfaceZM', 4),

			('POLYHEDRALSURFACE', 'PolyhedralSurface', 2),
			('POLYHEDRALSURFACE', 'PolyhedralSurfaceZ', 3),
			('POLYHEDRALSURFACEM', 'PolyhedralSurfaceM', 3),
			('POLYHEDRALSURFACE', 'PolyhedralSurfaceZM', 4),

			('TRIANGLE', 'Triangle', 2),
			('TRIANGLE', 'TriangleZ', 3),
			('TRIANGLEM', 'TriangleM', 3),
			('TRIANGLE', 'TriangleZM', 4),

			('TIN', 'Tin', 2),
			('TIN', 'TinZ', 3),
			('TINM', 'TinM', 3),
			('TIN', 'TinZM', 4) )
			 As g(old_name, new_name, coord_dimension)
	WHERE (upper(old_name) = upper($1) OR upper(new_name) = upper($1))
		AND coord_dimension = $2;
$function$
;

-- Permissions

ALTER FUNCTION public.postgis_type_name(varchar, int4, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_type_name(varchar, int4, bool) TO "admin";

-- DROP FUNCTION public.postgis_typmod_dims(int4);

CREATE OR REPLACE FUNCTION public.postgis_typmod_dims(integer)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$postgis_typmod_dims$function$
;

-- Permissions

ALTER FUNCTION public.postgis_typmod_dims(int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_typmod_dims(int4) TO "admin";

-- DROP FUNCTION public.postgis_typmod_srid(int4);

CREATE OR REPLACE FUNCTION public.postgis_typmod_srid(integer)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$postgis_typmod_srid$function$
;

-- Permissions

ALTER FUNCTION public.postgis_typmod_srid(int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_typmod_srid(int4) TO "admin";

-- DROP FUNCTION public.postgis_typmod_type(int4);

CREATE OR REPLACE FUNCTION public.postgis_typmod_type(integer)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$postgis_typmod_type$function$
;

-- Permissions

ALTER FUNCTION public.postgis_typmod_type(int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_typmod_type(int4) TO "admin";

-- DROP FUNCTION public.postgis_version();

CREATE OR REPLACE FUNCTION public.postgis_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_version() TO "admin";

-- DROP FUNCTION public.postgis_wagyu_version();

CREATE OR REPLACE FUNCTION public.postgis_wagyu_version()
 RETURNS text
 LANGUAGE c
 IMMUTABLE
AS '$libdir/postgis-3', $function$postgis_wagyu_version$function$
;

-- Permissions

ALTER FUNCTION public.postgis_wagyu_version() OWNER TO "admin";
GRANT ALL ON FUNCTION public.postgis_wagyu_version() TO "admin";

-- DROP FUNCTION public.soundex(text);

CREATE OR REPLACE FUNCTION public.soundex(text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$soundex$function$
;

-- Permissions

ALTER FUNCTION public.soundex(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.soundex(text) TO "admin";

-- DROP FUNCTION public.spheroid_in(cstring);

CREATE OR REPLACE FUNCTION public.spheroid_in(cstring)
 RETURNS spheroid
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$ellipsoid_in$function$
;

-- Permissions

ALTER FUNCTION public.spheroid_in(cstring) OWNER TO "admin";
GRANT ALL ON FUNCTION public.spheroid_in(cstring) TO "admin";

-- DROP FUNCTION public.spheroid_out(spheroid);

CREATE OR REPLACE FUNCTION public.spheroid_out(spheroid)
 RETURNS cstring
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$ellipsoid_out$function$
;

-- Permissions

ALTER FUNCTION public.spheroid_out(spheroid) OWNER TO "admin";
GRANT ALL ON FUNCTION public.spheroid_out(spheroid) TO "admin";

-- DROP FUNCTION public.st_3dclosestpoint(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_3dclosestpoint(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_closestpoint3d$function$
;

-- Permissions

ALTER FUNCTION public.st_3dclosestpoint(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3dclosestpoint(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_3ddfullywithin(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_3ddfullywithin(geom1 geometry, geom2 geometry, double precision)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$LWGEOM_dfullywithin3d$function$
;

-- Permissions

ALTER FUNCTION public.st_3ddfullywithin(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3ddfullywithin(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_3ddistance(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_3ddistance(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_3DDistance$function$
;

-- Permissions

ALTER FUNCTION public.st_3ddistance(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3ddistance(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_3ddwithin(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_3ddwithin(geom1 geometry, geom2 geometry, double precision)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$LWGEOM_dwithin3d$function$
;

-- Permissions

ALTER FUNCTION public.st_3ddwithin(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3ddwithin(geometry, geometry, float8) TO "admin";

-- DROP AGGREGATE public.st_3dextent(geometry);

CREATE OR REPLACE AGGREGATE public.st_3dextent(public.geometry) (
	SFUNC = public.st_combinebbox,
	STYPE = box3d
);

-- Permissions

ALTER AGGREGATE public.st_3dextent(geometry) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_3dextent(geometry) TO "admin";

-- DROP FUNCTION public.st_3dintersects(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_3dintersects(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$ST_3DIntersects$function$
;

-- Permissions

ALTER FUNCTION public.st_3dintersects(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3dintersects(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_3dlength(geometry);

CREATE OR REPLACE FUNCTION public.st_3dlength(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_length_linestring$function$
;

-- Permissions

ALTER FUNCTION public.st_3dlength(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3dlength(geometry) TO "admin";

-- DROP FUNCTION public.st_3dlineinterpolatepoint(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_3dlineinterpolatepoint(geometry, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_3DLineInterpolatePoint$function$
;

-- Permissions

ALTER FUNCTION public.st_3dlineinterpolatepoint(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3dlineinterpolatepoint(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_3dlongestline(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_3dlongestline(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_longestline3d$function$
;

-- Permissions

ALTER FUNCTION public.st_3dlongestline(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3dlongestline(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_3dmakebox(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_3dmakebox(geom1 geometry, geom2 geometry)
 RETURNS box3d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$BOX3D_construct$function$
;

-- Permissions

ALTER FUNCTION public.st_3dmakebox(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3dmakebox(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_3dmaxdistance(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_3dmaxdistance(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_maxdistance3d$function$
;

-- Permissions

ALTER FUNCTION public.st_3dmaxdistance(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3dmaxdistance(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_3dperimeter(geometry);

CREATE OR REPLACE FUNCTION public.st_3dperimeter(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_perimeter_poly$function$
;

-- Permissions

ALTER FUNCTION public.st_3dperimeter(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3dperimeter(geometry) TO "admin";

-- DROP FUNCTION public.st_3dshortestline(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_3dshortestline(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_shortestline3d$function$
;

-- Permissions

ALTER FUNCTION public.st_3dshortestline(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_3dshortestline(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_addmeasure(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_addmeasure(geometry, double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_AddMeasure$function$
;

-- Permissions

ALTER FUNCTION public.st_addmeasure(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_addmeasure(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_addpoint(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_addpoint(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_addpoint$function$
;

-- Permissions

ALTER FUNCTION public.st_addpoint(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_addpoint(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_addpoint(geometry, geometry, int4);

CREATE OR REPLACE FUNCTION public.st_addpoint(geom1 geometry, geom2 geometry, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_addpoint$function$
;

-- Permissions

ALTER FUNCTION public.st_addpoint(geometry, geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_addpoint(geometry, geometry, int4) TO "admin";

-- DROP FUNCTION public.st_affine(geometry, float8, float8, float8, float8, float8, float8, float8, float8, float8, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_affine$function$
;

-- Permissions

ALTER FUNCTION public.st_affine(geometry, float8, float8, float8, float8, float8, float8, float8, float8, float8, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_affine(geometry, float8, float8, float8, float8, float8, float8, float8, float8, float8, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_affine(geometry, float8, float8, float8, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_affine(geometry, float8, float8, float8, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_affine(geometry, float8, float8, float8, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_angle(geometry, geometry, geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_angle(pt1 geometry, pt2 geometry, pt3 geometry, pt4 geometry DEFAULT '0101000000000000000000F87F000000000000F87F'::geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_angle$function$
;

-- Permissions

ALTER FUNCTION public.st_angle(geometry, geometry, geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_angle(geometry, geometry, geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_angle(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_angle(line1 geometry, line2 geometry)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Angle(public.St_StartPoint($1), public.ST_EndPoint($1), public.ST_StartPoint($2), public.ST_EndPoint($2))$function$
;

-- Permissions

ALTER FUNCTION public.st_angle(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_angle(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_area(text);

CREATE OR REPLACE FUNCTION public.st_area(text)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ SELECT public.ST_Area($1::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_area(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_area(text) TO "admin";

-- DROP FUNCTION public.st_area(geometry);

CREATE OR REPLACE FUNCTION public.st_area(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_Area$function$
;

-- Permissions

ALTER FUNCTION public.st_area(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_area(geometry) TO "admin";

-- DROP FUNCTION public.st_area(geography, bool);

CREATE OR REPLACE FUNCTION public.st_area(geog geography, use_spheroid boolean DEFAULT true)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$geography_area$function$
;

-- Permissions

ALTER FUNCTION public.st_area(geography, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_area(geography, bool) TO "admin";

-- DROP FUNCTION public.st_area2d(geometry);

CREATE OR REPLACE FUNCTION public.st_area2d(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_Area$function$
;

-- Permissions

ALTER FUNCTION public.st_area2d(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_area2d(geometry) TO "admin";

-- DROP FUNCTION public.st_asbinary(geography);

CREATE OR REPLACE FUNCTION public.st_asbinary(geography)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_asBinary$function$
;

-- Permissions

ALTER FUNCTION public.st_asbinary(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asbinary(geography) TO "admin";

-- DROP FUNCTION public.st_asbinary(geometry);

CREATE OR REPLACE FUNCTION public.st_asbinary(geometry)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_asBinary$function$
;

-- Permissions

ALTER FUNCTION public.st_asbinary(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asbinary(geometry) TO "admin";

-- DROP FUNCTION public.st_asbinary(geometry, text);

CREATE OR REPLACE FUNCTION public.st_asbinary(geometry, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_asBinary$function$
;

-- Permissions

ALTER FUNCTION public.st_asbinary(geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asbinary(geometry, text) TO "admin";

-- DROP FUNCTION public.st_asbinary(geography, text);

CREATE OR REPLACE FUNCTION public.st_asbinary(geography, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$LWGEOM_asBinary$function$
;

-- Permissions

ALTER FUNCTION public.st_asbinary(geography, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asbinary(geography, text) TO "admin";

-- DROP FUNCTION public.st_asencodedpolyline(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_asencodedpolyline(geom geometry, nprecision integer DEFAULT 5)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asEncodedPolyline$function$
;

-- Permissions

ALTER FUNCTION public.st_asencodedpolyline(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asencodedpolyline(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_asewkb(geometry);

CREATE OR REPLACE FUNCTION public.st_asewkb(geometry)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$WKBFromLWGEOM$function$
;

-- Permissions

ALTER FUNCTION public.st_asewkb(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asewkb(geometry) TO "admin";

-- DROP FUNCTION public.st_asewkb(geometry, text);

CREATE OR REPLACE FUNCTION public.st_asewkb(geometry, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$WKBFromLWGEOM$function$
;

-- Permissions

ALTER FUNCTION public.st_asewkb(geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asewkb(geometry, text) TO "admin";

-- DROP FUNCTION public.st_asewkt(text);

CREATE OR REPLACE FUNCTION public.st_asewkt(text)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$ SELECT public.ST_AsEWKT($1::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_asewkt(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asewkt(text) TO "admin";

-- DROP FUNCTION public.st_asewkt(geography, int4);

CREATE OR REPLACE FUNCTION public.st_asewkt(geography, integer)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asEWKT$function$
;

-- Permissions

ALTER FUNCTION public.st_asewkt(geography, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asewkt(geography, int4) TO "admin";

-- DROP FUNCTION public.st_asewkt(geometry);

CREATE OR REPLACE FUNCTION public.st_asewkt(geometry)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asEWKT$function$
;

-- Permissions

ALTER FUNCTION public.st_asewkt(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asewkt(geometry) TO "admin";

-- DROP FUNCTION public.st_asewkt(geography);

CREATE OR REPLACE FUNCTION public.st_asewkt(geography)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asEWKT$function$
;

-- Permissions

ALTER FUNCTION public.st_asewkt(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asewkt(geography) TO "admin";

-- DROP FUNCTION public.st_asewkt(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_asewkt(geometry, integer)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asEWKT$function$
;

-- Permissions

ALTER FUNCTION public.st_asewkt(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asewkt(geometry, int4) TO "admin";

-- DROP AGGREGATE public.st_asflatgeobuf(anyelement, bool);

-- Aggregate function public.st_asflatgeobuf(anyelement, bool)
-- ERROR: more than one function named "public.st_asflatgeobuf";

-- Permissions

ALTER AGGREGATE public.st_asflatgeobuf(anyelement, bool) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_asflatgeobuf(anyelement, bool) TO "admin";

-- DROP AGGREGATE public.st_asflatgeobuf(anyelement, bool, text);

-- Aggregate function public.st_asflatgeobuf(anyelement, bool, text)
-- ERROR: more than one function named "public.st_asflatgeobuf";

-- Permissions

ALTER AGGREGATE public.st_asflatgeobuf(anyelement, bool, text) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_asflatgeobuf(anyelement, bool, text) TO "admin";

-- DROP AGGREGATE public.st_asflatgeobuf(anyelement);

-- Aggregate function public.st_asflatgeobuf(anyelement)
-- ERROR: more than one function named "public.st_asflatgeobuf";

-- Permissions

ALTER AGGREGATE public.st_asflatgeobuf(anyelement) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_asflatgeobuf(anyelement) TO "admin";

-- DROP AGGREGATE public.st_asgeobuf(anyelement);

-- Aggregate function public.st_asgeobuf(anyelement)
-- ERROR: more than one function named "public.st_asgeobuf";

-- Permissions

ALTER AGGREGATE public.st_asgeobuf(anyelement) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_asgeobuf(anyelement) TO "admin";

-- DROP AGGREGATE public.st_asgeobuf(anyelement, text);

-- Aggregate function public.st_asgeobuf(anyelement, text)
-- ERROR: more than one function named "public.st_asgeobuf";

-- Permissions

ALTER AGGREGATE public.st_asgeobuf(anyelement, text) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_asgeobuf(anyelement, text) TO "admin";

-- DROP FUNCTION public.st_asgeojson(geometry, int4, int4);

CREATE OR REPLACE FUNCTION public.st_asgeojson(geom geometry, maxdecimaldigits integer DEFAULT 9, options integer DEFAULT 8)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asGeoJson$function$
;

-- Permissions

ALTER FUNCTION public.st_asgeojson(geometry, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asgeojson(geometry, int4, int4) TO "admin";

-- DROP FUNCTION public.st_asgeojson(geography, int4, int4);

CREATE OR REPLACE FUNCTION public.st_asgeojson(geog geography, maxdecimaldigits integer DEFAULT 9, options integer DEFAULT 0)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_as_geojson$function$
;

-- Permissions

ALTER FUNCTION public.st_asgeojson(geography, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asgeojson(geography, int4, int4) TO "admin";

-- DROP FUNCTION public.st_asgeojson(text);

CREATE OR REPLACE FUNCTION public.st_asgeojson(text)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$ SELECT public.ST_AsGeoJson($1::public.geometry, 9, 0);  $function$
;

-- Permissions

ALTER FUNCTION public.st_asgeojson(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asgeojson(text) TO "admin";

-- DROP FUNCTION public.st_asgeojson(record, text, int4, bool, text);

CREATE OR REPLACE FUNCTION public.st_asgeojson(r record, geom_column text DEFAULT ''::text, maxdecimaldigits integer DEFAULT 9, pretty_bool boolean DEFAULT false, id_column text DEFAULT ''::text)
 RETURNS text
 LANGUAGE c
 STABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_AsGeoJsonRow$function$
;

-- Permissions

ALTER FUNCTION public.st_asgeojson(record, text, int4, bool, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asgeojson(record, text, int4, bool, text) TO "admin";

-- DROP FUNCTION public.st_asgml(int4, geometry, int4, int4, text, text);

CREATE OR REPLACE FUNCTION public.st_asgml(version integer, geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0, nprefix text DEFAULT NULL::text, id text DEFAULT NULL::text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asGML$function$
;

-- Permissions

ALTER FUNCTION public.st_asgml(int4, geometry, int4, int4, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asgml(int4, geometry, int4, int4, text, text) TO "admin";

-- DROP FUNCTION public.st_asgml(int4, geography, int4, int4, text, text);

CREATE OR REPLACE FUNCTION public.st_asgml(version integer, geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0, nprefix text DEFAULT 'gml'::text, id text DEFAULT ''::text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_as_gml$function$
;

-- Permissions

ALTER FUNCTION public.st_asgml(int4, geography, int4, int4, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asgml(int4, geography, int4, int4, text, text) TO "admin";

-- DROP FUNCTION public.st_asgml(text);

CREATE OR REPLACE FUNCTION public.st_asgml(text)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$ SELECT public._ST_AsGML(2,$1::public.geometry,15,0, NULL, NULL);  $function$
;

-- Permissions

ALTER FUNCTION public.st_asgml(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asgml(text) TO "admin";

-- DROP FUNCTION public.st_asgml(geometry, int4, int4);

CREATE OR REPLACE FUNCTION public.st_asgml(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asGML$function$
;

-- Permissions

ALTER FUNCTION public.st_asgml(geometry, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asgml(geometry, int4, int4) TO "admin";

-- DROP FUNCTION public.st_asgml(geography, int4, int4, text, text);

CREATE OR REPLACE FUNCTION public.st_asgml(geog geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0, nprefix text DEFAULT 'gml'::text, id text DEFAULT ''::text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_as_gml$function$
;

-- Permissions

ALTER FUNCTION public.st_asgml(geography, int4, int4, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asgml(geography, int4, int4, text, text) TO "admin";

-- DROP FUNCTION public.st_ashexewkb(geometry);

CREATE OR REPLACE FUNCTION public.st_ashexewkb(geometry)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_asHEXEWKB$function$
;

-- Permissions

ALTER FUNCTION public.st_ashexewkb(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_ashexewkb(geometry) TO "admin";

-- DROP FUNCTION public.st_ashexewkb(geometry, text);

CREATE OR REPLACE FUNCTION public.st_ashexewkb(geometry, text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_asHEXEWKB$function$
;

-- Permissions

ALTER FUNCTION public.st_ashexewkb(geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_ashexewkb(geometry, text) TO "admin";

-- DROP FUNCTION public.st_askml(geometry, int4, text);

CREATE OR REPLACE FUNCTION public.st_askml(geom geometry, maxdecimaldigits integer DEFAULT 15, nprefix text DEFAULT ''::text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asKML$function$
;

-- Permissions

ALTER FUNCTION public.st_askml(geometry, int4, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_askml(geometry, int4, text) TO "admin";

-- DROP FUNCTION public.st_askml(text);

CREATE OR REPLACE FUNCTION public.st_askml(text)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$ SELECT public.ST_AsKML($1::public.geometry, 15);  $function$
;

-- Permissions

ALTER FUNCTION public.st_askml(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_askml(text) TO "admin";

-- DROP FUNCTION public.st_askml(geography, int4, text);

CREATE OR REPLACE FUNCTION public.st_askml(geog geography, maxdecimaldigits integer DEFAULT 15, nprefix text DEFAULT ''::text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_as_kml$function$
;

-- Permissions

ALTER FUNCTION public.st_askml(geography, int4, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_askml(geography, int4, text) TO "admin";

-- DROP FUNCTION public.st_aslatlontext(geometry, text);

CREATE OR REPLACE FUNCTION public.st_aslatlontext(geom geometry, tmpl text DEFAULT ''::text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_to_latlon$function$
;

-- Permissions

ALTER FUNCTION public.st_aslatlontext(geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_aslatlontext(geometry, text) TO "admin";

-- DROP FUNCTION public.st_asmarc21(geometry, text);

CREATE OR REPLACE FUNCTION public.st_asmarc21(geom geometry, format text DEFAULT 'hdddmmss'::text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_AsMARC21$function$
;

-- Permissions

ALTER FUNCTION public.st_asmarc21(geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asmarc21(geometry, text) TO "admin";

-- DROP AGGREGATE public.st_asmvt(anyelement, text, int4, text, text);

-- Aggregate function public.st_asmvt(anyelement, text, int4, text, text)
-- ERROR: more than one function named "public.st_asmvt";

-- Permissions

ALTER AGGREGATE public.st_asmvt(anyelement, text, int4, text, text) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_asmvt(anyelement, text, int4, text, text) TO "admin";

-- DROP AGGREGATE public.st_asmvt(anyelement, text, int4, text);

-- Aggregate function public.st_asmvt(anyelement, text, int4, text)
-- ERROR: more than one function named "public.st_asmvt";

-- Permissions

ALTER AGGREGATE public.st_asmvt(anyelement, text, int4, text) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_asmvt(anyelement, text, int4, text) TO "admin";

-- DROP AGGREGATE public.st_asmvt(anyelement, text, int4);

-- Aggregate function public.st_asmvt(anyelement, text, int4)
-- ERROR: more than one function named "public.st_asmvt";

-- Permissions

ALTER AGGREGATE public.st_asmvt(anyelement, text, int4) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_asmvt(anyelement, text, int4) TO "admin";

-- DROP AGGREGATE public.st_asmvt(anyelement);

-- Aggregate function public.st_asmvt(anyelement)
-- ERROR: more than one function named "public.st_asmvt";

-- Permissions

ALTER AGGREGATE public.st_asmvt(anyelement) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_asmvt(anyelement) TO "admin";

-- DROP AGGREGATE public.st_asmvt(anyelement, text);

-- Aggregate function public.st_asmvt(anyelement, text)
-- ERROR: more than one function named "public.st_asmvt";

-- Permissions

ALTER AGGREGATE public.st_asmvt(anyelement, text) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_asmvt(anyelement, text) TO "admin";

-- DROP FUNCTION public.st_asmvtgeom(geometry, box2d, int4, int4, bool);

CREATE OR REPLACE FUNCTION public.st_asmvtgeom(geom geometry, bounds box2d, extent integer DEFAULT 4096, buffer integer DEFAULT 256, clip_geom boolean DEFAULT true)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$ST_AsMVTGeom$function$
;

-- Permissions

ALTER FUNCTION public.st_asmvtgeom(geometry, box2d, int4, int4, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asmvtgeom(geometry, box2d, int4, int4, bool) TO "admin";

-- DROP FUNCTION public.st_assvg(geometry, int4, int4);

CREATE OR REPLACE FUNCTION public.st_assvg(geom geometry, rel integer DEFAULT 0, maxdecimaldigits integer DEFAULT 15)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asSVG$function$
;

-- Permissions

ALTER FUNCTION public.st_assvg(geometry, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_assvg(geometry, int4, int4) TO "admin";

-- DROP FUNCTION public.st_assvg(geography, int4, int4);

CREATE OR REPLACE FUNCTION public.st_assvg(geog geography, rel integer DEFAULT 0, maxdecimaldigits integer DEFAULT 15)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_as_svg$function$
;

-- Permissions

ALTER FUNCTION public.st_assvg(geography, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_assvg(geography, int4, int4) TO "admin";

-- DROP FUNCTION public.st_assvg(text);

CREATE OR REPLACE FUNCTION public.st_assvg(text)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$ SELECT public.ST_AsSVG($1::public.geometry,0,15);  $function$
;

-- Permissions

ALTER FUNCTION public.st_assvg(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_assvg(text) TO "admin";

-- DROP FUNCTION public.st_astext(text);

CREATE OR REPLACE FUNCTION public.st_astext(text)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$ SELECT public.ST_AsText($1::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_astext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_astext(text) TO "admin";

-- DROP FUNCTION public.st_astext(geography, int4);

CREATE OR REPLACE FUNCTION public.st_astext(geography, integer)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asText$function$
;

-- Permissions

ALTER FUNCTION public.st_astext(geography, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_astext(geography, int4) TO "admin";

-- DROP FUNCTION public.st_astext(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_astext(geometry, integer)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asText$function$
;

-- Permissions

ALTER FUNCTION public.st_astext(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_astext(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_astext(geography);

CREATE OR REPLACE FUNCTION public.st_astext(geography)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asText$function$
;

-- Permissions

ALTER FUNCTION public.st_astext(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_astext(geography) TO "admin";

-- DROP FUNCTION public.st_astext(geometry);

CREATE OR REPLACE FUNCTION public.st_astext(geometry)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_asText$function$
;

-- Permissions

ALTER FUNCTION public.st_astext(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_astext(geometry) TO "admin";

-- DROP FUNCTION public.st_astwkb(_geometry, _int8, int4, int4, int4, bool, bool);

CREATE OR REPLACE FUNCTION public.st_astwkb(geom geometry[], ids bigint[], prec integer DEFAULT NULL::integer, prec_z integer DEFAULT NULL::integer, prec_m integer DEFAULT NULL::integer, with_sizes boolean DEFAULT NULL::boolean, with_boxes boolean DEFAULT NULL::boolean)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$TWKBFromLWGEOMArray$function$
;

-- Permissions

ALTER FUNCTION public.st_astwkb(_geometry, _int8, int4, int4, int4, bool, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_astwkb(_geometry, _int8, int4, int4, int4, bool, bool) TO "admin";

-- DROP FUNCTION public.st_astwkb(geometry, int4, int4, int4, bool, bool);

CREATE OR REPLACE FUNCTION public.st_astwkb(geom geometry, prec integer DEFAULT NULL::integer, prec_z integer DEFAULT NULL::integer, prec_m integer DEFAULT NULL::integer, with_sizes boolean DEFAULT NULL::boolean, with_boxes boolean DEFAULT NULL::boolean)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$TWKBFromLWGEOM$function$
;

-- Permissions

ALTER FUNCTION public.st_astwkb(geometry, int4, int4, int4, bool, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_astwkb(geometry, int4, int4, int4, bool, bool) TO "admin";

-- DROP FUNCTION public.st_asx3d(geometry, int4, int4);

CREATE OR REPLACE FUNCTION public.st_asx3d(geom geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE COST 250
AS $function$SELECT public._ST_AsX3D(3,$1,$2,$3,'');$function$
;

-- Permissions

ALTER FUNCTION public.st_asx3d(geometry, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_asx3d(geometry, int4, int4) TO "admin";

-- DROP FUNCTION public.st_azimuth(geography, geography);

CREATE OR REPLACE FUNCTION public.st_azimuth(geog1 geography, geog2 geography)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_azimuth$function$
;

-- Permissions

ALTER FUNCTION public.st_azimuth(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_azimuth(geography, geography) TO "admin";

-- DROP FUNCTION public.st_azimuth(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_azimuth(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_azimuth$function$
;

-- Permissions

ALTER FUNCTION public.st_azimuth(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_azimuth(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_bdmpolyfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_bdmpolyfromtext(text, integer)
 RETURNS geometry
 LANGUAGE plpgsql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline public.geometry;
	geom public.geometry;
BEGIN
	mline := public.ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := public.ST_Multi(public.ST_BuildArea(mline));

	RETURN geom;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.st_bdmpolyfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_bdmpolyfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_bdpolyfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_bdpolyfromtext(text, integer)
 RETURNS geometry
 LANGUAGE plpgsql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline public.geometry;
	geom public.geometry;
BEGIN
	mline := public.ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := public.ST_BuildArea(mline);

	IF public.GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.st_bdpolyfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_bdpolyfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_boundary(geometry);

CREATE OR REPLACE FUNCTION public.st_boundary(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$boundary$function$
;

-- Permissions

ALTER FUNCTION public.st_boundary(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_boundary(geometry) TO "admin";

-- DROP FUNCTION public.st_boundingdiagonal(geometry, bool);

CREATE OR REPLACE FUNCTION public.st_boundingdiagonal(geom geometry, fits boolean DEFAULT false)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$ST_BoundingDiagonal$function$
;

-- Permissions

ALTER FUNCTION public.st_boundingdiagonal(geometry, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_boundingdiagonal(geometry, bool) TO "admin";

-- DROP FUNCTION public.st_box2dfromgeohash(text, int4);

CREATE OR REPLACE FUNCTION public.st_box2dfromgeohash(text, integer DEFAULT NULL::integer)
 RETURNS box2d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$box2d_from_geohash$function$
;

-- Permissions

ALTER FUNCTION public.st_box2dfromgeohash(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_box2dfromgeohash(text, int4) TO "admin";

-- DROP FUNCTION public.st_buffer(geography, float8, text);

CREATE OR REPLACE FUNCTION public.st_buffer(geography, double precision, text)
 RETURNS geography
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$SELECT public.geography(public.ST_Transform(public.ST_Buffer(public.ST_Transform(public.geometry($1), public._ST_BestSRID($1)), $2, $3), public.ST_SRID($1)))$function$
;

-- Permissions

ALTER FUNCTION public.st_buffer(geography, float8, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_buffer(geography, float8, text) TO "admin";

-- DROP FUNCTION public.st_buffer(geography, float8);

CREATE OR REPLACE FUNCTION public.st_buffer(geography, double precision)
 RETURNS geography
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$SELECT public.geography(public.ST_Transform(public.ST_Buffer(public.ST_Transform(public.geometry($1), public._ST_BestSRID($1)), $2), public.ST_SRID($1)))$function$
;

-- Permissions

ALTER FUNCTION public.st_buffer(geography, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_buffer(geography, float8) TO "admin";

-- DROP FUNCTION public.st_buffer(text, float8);

CREATE OR REPLACE FUNCTION public.st_buffer(text, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ SELECT public.ST_Buffer($1::public.geometry, $2);  $function$
;

-- Permissions

ALTER FUNCTION public.st_buffer(text, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_buffer(text, float8) TO "admin";

-- DROP FUNCTION public.st_buffer(text, float8, text);

CREATE OR REPLACE FUNCTION public.st_buffer(text, double precision, text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ SELECT public.ST_Buffer($1::public.geometry, $2, $3);  $function$
;

-- Permissions

ALTER FUNCTION public.st_buffer(text, float8, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_buffer(text, float8, text) TO "admin";

-- DROP FUNCTION public.st_buffer(text, float8, int4);

CREATE OR REPLACE FUNCTION public.st_buffer(text, double precision, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ SELECT public.ST_Buffer($1::public.geometry, $2, $3);  $function$
;

-- Permissions

ALTER FUNCTION public.st_buffer(text, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_buffer(text, float8, int4) TO "admin";

-- DROP FUNCTION public.st_buffer(geometry, float8, text);

CREATE OR REPLACE FUNCTION public.st_buffer(geom geometry, radius double precision, options text DEFAULT ''::text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$buffer$function$
;

-- Permissions

ALTER FUNCTION public.st_buffer(geometry, float8, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_buffer(geometry, float8, text) TO "admin";

-- DROP FUNCTION public.st_buffer(geometry, float8, int4);

CREATE OR REPLACE FUNCTION public.st_buffer(geom geometry, radius double precision, quadsegs integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$ SELECT public.ST_Buffer($1, $2, CAST('quad_segs='||CAST($3 AS text) as text)) $function$
;

-- Permissions

ALTER FUNCTION public.st_buffer(geometry, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_buffer(geometry, float8, int4) TO "admin";

-- DROP FUNCTION public.st_buffer(geography, float8, int4);

CREATE OR REPLACE FUNCTION public.st_buffer(geography, double precision, integer)
 RETURNS geography
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$SELECT public.geography(public.ST_Transform(public.ST_Buffer(public.ST_Transform(public.geometry($1), public._ST_BestSRID($1)), $2, $3), public.ST_SRID($1)))$function$
;

-- Permissions

ALTER FUNCTION public.st_buffer(geography, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_buffer(geography, float8, int4) TO "admin";

-- DROP FUNCTION public.st_buildarea(geometry);

CREATE OR REPLACE FUNCTION public.st_buildarea(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_BuildArea$function$
;

-- Permissions

ALTER FUNCTION public.st_buildarea(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_buildarea(geometry) TO "admin";

-- DROP FUNCTION public.st_centroid(text);

CREATE OR REPLACE FUNCTION public.st_centroid(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ SELECT public.ST_Centroid($1::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_centroid(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_centroid(text) TO "admin";

-- DROP FUNCTION public.st_centroid(geography, bool);

CREATE OR REPLACE FUNCTION public.st_centroid(geography, use_spheroid boolean DEFAULT true)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_centroid$function$
;

-- Permissions

ALTER FUNCTION public.st_centroid(geography, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_centroid(geography, bool) TO "admin";

-- DROP FUNCTION public.st_centroid(geometry);

CREATE OR REPLACE FUNCTION public.st_centroid(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$centroid$function$
;

-- Permissions

ALTER FUNCTION public.st_centroid(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_centroid(geometry) TO "admin";

-- DROP FUNCTION public.st_chaikinsmoothing(geometry, int4, bool);

CREATE OR REPLACE FUNCTION public.st_chaikinsmoothing(geometry, integer DEFAULT 1, boolean DEFAULT false)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_ChaikinSmoothing$function$
;

-- Permissions

ALTER FUNCTION public.st_chaikinsmoothing(geometry, int4, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_chaikinsmoothing(geometry, int4, bool) TO "admin";

-- DROP FUNCTION public.st_cleangeometry(geometry);

CREATE OR REPLACE FUNCTION public.st_cleangeometry(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_CleanGeometry$function$
;

-- Permissions

ALTER FUNCTION public.st_cleangeometry(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_cleangeometry(geometry) TO "admin";

-- DROP FUNCTION public.st_clipbybox2d(geometry, box2d);

CREATE OR REPLACE FUNCTION public.st_clipbybox2d(geom geometry, box box2d)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_ClipByBox2d$function$
;

-- Permissions

ALTER FUNCTION public.st_clipbybox2d(geometry, box2d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_clipbybox2d(geometry, box2d) TO "admin";

-- DROP FUNCTION public.st_closestpoint(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_closestpoint(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_closestpoint$function$
;

-- Permissions

ALTER FUNCTION public.st_closestpoint(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_closestpoint(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_closestpoint(text, text);

CREATE OR REPLACE FUNCTION public.st_closestpoint(text, text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public.ST_ClosestPoint($1::public.geometry, $2::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_closestpoint(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_closestpoint(text, text) TO "admin";

-- DROP FUNCTION public.st_closestpoint(geography, geography, bool);

CREATE OR REPLACE FUNCTION public.st_closestpoint(geography, geography, use_spheroid boolean DEFAULT true)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_closestpoint$function$
;

-- Permissions

ALTER FUNCTION public.st_closestpoint(geography, geography, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_closestpoint(geography, geography, bool) TO "admin";

-- DROP FUNCTION public.st_closestpointofapproach(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_closestpointofapproach(geometry, geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_ClosestPointOfApproach$function$
;

-- Permissions

ALTER FUNCTION public.st_closestpointofapproach(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_closestpointofapproach(geometry, geometry) TO "admin";

-- DROP WINDOW public.st_clusterdbscan(geometry, float8, int4);

CREATE OR REPLACE FUNCTION public.st_clusterdbscan(geometry, eps double precision, minpoints integer)
 RETURNS integer
 LANGUAGE c
 WINDOW IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_ClusterDBSCAN$function$
;

-- Permissions

ALTER WINDOW public.st_clusterdbscan(geometry, float8, int4) OWNER TO "admin";
GRANT ALL ON WINDOW public.st_clusterdbscan(geometry, float8, int4) TO "admin";

-- DROP AGGREGATE public.st_clusterintersecting(geometry);

-- Aggregate function public.st_clusterintersecting(geometry)
-- ERROR: more than one function named "public.st_clusterintersecting";

-- Permissions

ALTER AGGREGATE public.st_clusterintersecting(geometry) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_clusterintersecting(geometry) TO "admin";

-- DROP FUNCTION public.st_clusterintersecting(_geometry);

CREATE OR REPLACE FUNCTION public.st_clusterintersecting(geometry[])
 RETURNS geometry[]
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$clusterintersecting_garray$function$
;

-- Permissions

ALTER FUNCTION public.st_clusterintersecting(_geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_clusterintersecting(_geometry) TO "admin";

-- DROP WINDOW public.st_clusterintersectingwin(geometry);

CREATE OR REPLACE FUNCTION public.st_clusterintersectingwin(geometry)
 RETURNS integer
 LANGUAGE c
 WINDOW IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_ClusterIntersectingWin$function$
;

-- Permissions

ALTER WINDOW public.st_clusterintersectingwin(geometry) OWNER TO "admin";
GRANT ALL ON WINDOW public.st_clusterintersectingwin(geometry) TO "admin";

-- DROP WINDOW public.st_clusterkmeans(geometry, int4, float8);

CREATE OR REPLACE FUNCTION public.st_clusterkmeans(geom geometry, k integer, max_radius double precision DEFAULT NULL::double precision)
 RETURNS integer
 LANGUAGE c
 WINDOW STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_ClusterKMeans$function$
;

-- Permissions

ALTER WINDOW public.st_clusterkmeans(geometry, int4, float8) OWNER TO "admin";
GRANT ALL ON WINDOW public.st_clusterkmeans(geometry, int4, float8) TO "admin";

-- DROP FUNCTION public.st_clusterwithin(_geometry, float8);

CREATE OR REPLACE FUNCTION public.st_clusterwithin(geometry[], double precision)
 RETURNS geometry[]
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$cluster_within_distance_garray$function$
;

-- Permissions

ALTER FUNCTION public.st_clusterwithin(_geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_clusterwithin(_geometry, float8) TO "admin";

-- DROP AGGREGATE public.st_clusterwithin(geometry, float8);

-- Aggregate function public.st_clusterwithin(geometry, float8)
-- ERROR: more than one function named "public.st_clusterwithin";

-- Permissions

ALTER AGGREGATE public.st_clusterwithin(geometry, float8) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_clusterwithin(geometry, float8) TO "admin";

-- DROP WINDOW public.st_clusterwithinwin(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_clusterwithinwin(geometry, distance double precision)
 RETURNS integer
 LANGUAGE c
 WINDOW IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_ClusterWithinWin$function$
;

-- Permissions

ALTER WINDOW public.st_clusterwithinwin(geometry, float8) OWNER TO "admin";
GRANT ALL ON WINDOW public.st_clusterwithinwin(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_collect(_geometry);

CREATE OR REPLACE FUNCTION public.st_collect(geometry[])
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_collect_garray$function$
;

-- Permissions

ALTER FUNCTION public.st_collect(_geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_collect(_geometry) TO "admin";

-- DROP FUNCTION public.st_collect(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_collect(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$LWGEOM_collect$function$
;

-- Permissions

ALTER FUNCTION public.st_collect(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_collect(geometry, geometry) TO "admin";

-- DROP AGGREGATE public.st_collect(geometry);

-- Aggregate function public.st_collect(geometry)
-- ERROR: more than one function named "public.st_collect";

-- Permissions

ALTER AGGREGATE public.st_collect(geometry) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_collect(geometry) TO "admin";

-- DROP FUNCTION public.st_collectionextract(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_collectionextract(geometry, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_CollectionExtract$function$
;

-- Permissions

ALTER FUNCTION public.st_collectionextract(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_collectionextract(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_collectionextract(geometry);

CREATE OR REPLACE FUNCTION public.st_collectionextract(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_CollectionExtract$function$
;

-- Permissions

ALTER FUNCTION public.st_collectionextract(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_collectionextract(geometry) TO "admin";

-- DROP FUNCTION public.st_collectionhomogenize(geometry);

CREATE OR REPLACE FUNCTION public.st_collectionhomogenize(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_CollectionHomogenize$function$
;

-- Permissions

ALTER FUNCTION public.st_collectionhomogenize(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_collectionhomogenize(geometry) TO "admin";

-- DROP FUNCTION public.st_combinebbox(box2d, geometry);

CREATE OR REPLACE FUNCTION public.st_combinebbox(box2d, geometry)
 RETURNS box2d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE
AS '$libdir/postgis-3', $function$BOX2D_combine$function$
;

-- Permissions

ALTER FUNCTION public.st_combinebbox(box2d, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_combinebbox(box2d, geometry) TO "admin";

-- DROP FUNCTION public.st_combinebbox(box3d, geometry);

CREATE OR REPLACE FUNCTION public.st_combinebbox(box3d, geometry)
 RETURNS box3d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$BOX3D_combine$function$
;

-- Permissions

ALTER FUNCTION public.st_combinebbox(box3d, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_combinebbox(box3d, geometry) TO "admin";

-- DROP FUNCTION public.st_combinebbox(box3d, box3d);

CREATE OR REPLACE FUNCTION public.st_combinebbox(box3d, box3d)
 RETURNS box3d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$BOX3D_combine_BOX3D$function$
;

-- Permissions

ALTER FUNCTION public.st_combinebbox(box3d, box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_combinebbox(box3d, box3d) TO "admin";

-- DROP FUNCTION public.st_concavehull(geometry, float8, bool);

CREATE OR REPLACE FUNCTION public.st_concavehull(param_geom geometry, param_pctconvex double precision, param_allow_holes boolean DEFAULT false)
 RETURNS geometry
 LANGUAGE plpgsql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$
	DECLARE
		var_convhull public.geometry := public.ST_ForceSFS(public.ST_ConvexHull(param_geom));
		var_param_geom public.geometry := public.ST_ForceSFS(param_geom);
		var_initarea float := public.ST_Area(var_convhull);
		var_newarea float := var_initarea;
		var_div integer := 6; 
		var_tempgeom public.geometry;
		var_tempgeom2 public.geometry;
		var_cent public.geometry;
		var_geoms public.geometry[4]; 
		var_enline public.geometry;
		var_resultgeom public.geometry;
		var_atempgeoms public.geometry[];
		var_buf float := 1; 
	BEGIN
		-- We start with convex hull as our base
		var_resultgeom := var_convhull;

		IF param_pctconvex = 1 THEN
			-- this is the same as asking for the convex hull
			return var_resultgeom;
		ELSIF public.ST_GeometryType(var_param_geom) = 'ST_Polygon' THEN -- it is as concave as it is going to get
			IF param_allow_holes THEN -- leave the holes
				RETURN var_param_geom;
			ELSE -- remove the holes
				var_resultgeom := public.ST_MakePolygon(public.ST_ExteriorRing(var_param_geom));
				RETURN var_resultgeom;
			END IF;
		END IF;
		IF public.ST_Dimension(var_resultgeom) > 1 AND param_pctconvex BETWEEN 0 and 0.99 THEN
		-- get linestring that forms envelope of geometry
			var_enline := public.ST_Boundary(public.ST_Envelope(var_param_geom));
			var_buf := public.ST_Length(var_enline)/1000.0;
			IF public.ST_GeometryType(var_param_geom) = 'ST_MultiPoint' AND public.ST_NumGeometries(var_param_geom) BETWEEN 4 and 200 THEN
			-- we make polygons out of points since they are easier to cave in.
			-- Note we limit to between 4 and 200 points because this process is slow and gets quadratically slow
				var_buf := sqrt(public.ST_Area(var_convhull)*0.8/(public.ST_NumGeometries(var_param_geom)*public.ST_NumGeometries(var_param_geom)));
				var_atempgeoms := ARRAY(SELECT geom FROM public.ST_DumpPoints(var_param_geom));
				-- 5 and 10 and just fudge factors
				var_tempgeom := public.ST_Union(ARRAY(SELECT geom
						FROM (
						-- fuse near neighbors together
						SELECT DISTINCT ON (i) i,  public.ST_Distance(var_atempgeoms[i],var_atempgeoms[j]), public.ST_Buffer(public.ST_MakeLine(var_atempgeoms[i], var_atempgeoms[j]) , var_buf*5, 'quad_segs=3') As geom
								FROM generate_series(1,array_upper(var_atempgeoms, 1)) As i
									INNER JOIN generate_series(1,array_upper(var_atempgeoms, 1)) As j
										ON (
								 NOT public.ST_Intersects(var_atempgeoms[i],var_atempgeoms[j])
									AND public.ST_DWithin(var_atempgeoms[i],var_atempgeoms[j], var_buf*10)
									)
								UNION ALL
						-- catch the ones with no near neighbors
								SELECT i, 0, public.ST_Buffer(var_atempgeoms[i] , var_buf*10, 'quad_segs=3') As geom
								FROM generate_series(1,array_upper(var_atempgeoms, 1)) As i
									LEFT JOIN generate_series(ceiling(array_upper(var_atempgeoms,1)/2)::integer,array_upper(var_atempgeoms, 1)) As j
										ON (
								 NOT public.ST_Intersects(var_atempgeoms[i],var_atempgeoms[j])
									AND public.ST_DWithin(var_atempgeoms[i],var_atempgeoms[j], var_buf*10)
									)
									WHERE j IS NULL
								ORDER BY 1, 2
							) As foo	) );
				IF public.ST_IsValid(var_tempgeom) AND public.ST_GeometryType(var_tempgeom) = 'ST_Polygon' THEN
					var_tempgeom := public.ST_ForceSFS(public.ST_Intersection(var_tempgeom, var_convhull));
					IF param_allow_holes THEN
						var_param_geom := var_tempgeom;
					ELSIF public.ST_GeometryType(var_tempgeom) = 'ST_Polygon' THEN
						var_param_geom := public.ST_ForceSFS(public.ST_MakePolygon(public.ST_ExteriorRing(var_tempgeom)));
					ELSE
						var_param_geom := public.ST_ForceSFS(public.ST_ConvexHull(var_param_geom));
					END IF;
					-- make sure result covers original (#3638)
					var_param_geom := public.ST_Union(param_geom, var_param_geom);
					return var_param_geom;
				ELSIF public.ST_IsValid(var_tempgeom) THEN
					var_param_geom := public.ST_ForceSFS(public.ST_Intersection(var_tempgeom, var_convhull));
				END IF;
			END IF;

			IF public.ST_GeometryType(var_param_geom) = 'ST_Polygon' THEN
				IF NOT param_allow_holes THEN
					var_param_geom := public.ST_ForceSFS(public.ST_MakePolygon(public.ST_ExteriorRing(var_param_geom)));
				END IF;
				-- make sure result covers original (#3638)
				--var_param_geom := public.ST_Union(param_geom, var_param_geom);
				return var_param_geom;
			END IF;
			var_cent := public.ST_Centroid(var_param_geom);
			IF (public.ST_XMax(var_enline) - public.ST_XMin(var_enline) ) > var_buf AND (public.ST_YMax(var_enline) - public.ST_YMin(var_enline) ) > var_buf THEN
					IF public.ST_Dwithin(public.ST_Centroid(var_convhull) , public.ST_Centroid(public.ST_Envelope(var_param_geom)), var_buf/2) THEN
				-- If the geometric dimension is > 1 and the object is symmetric (cutting at centroid will not work -- offset a bit)
						var_cent := public.ST_Translate(var_cent, (public.ST_XMax(var_enline) - public.ST_XMin(var_enline))/1000,  (public.ST_YMAX(var_enline) - public.ST_YMin(var_enline))/1000);
					ELSE
						-- uses closest point on geometry to centroid. I can't explain why we are doing this
						var_cent := public.ST_ClosestPoint(var_param_geom,var_cent);
					END IF;
					IF public.ST_DWithin(var_cent, var_enline,var_buf) THEN
						var_cent := public.ST_centroid(public.ST_Envelope(var_param_geom));
					END IF;
					-- break envelope into 4 triangles about the centroid of the geometry and returned the clipped geometry in each quadrant
					FOR i in 1 .. 4 LOOP
					   var_geoms[i] := public.ST_MakePolygon(public.ST_MakeLine(ARRAY[public.ST_PointN(var_enline,i), public.ST_PointN(var_enline,i+1), var_cent, public.ST_PointN(var_enline,i)]));
					   var_geoms[i] := public.ST_ForceSFS(public.ST_Intersection(var_param_geom, public.ST_Buffer(var_geoms[i],var_buf)));
					   IF public.ST_IsValid(var_geoms[i]) THEN

					   ELSE
							var_geoms[i] := public.ST_BuildArea(public.ST_MakeLine(ARRAY[public.ST_PointN(var_enline,i), public.ST_PointN(var_enline,i+1), var_cent, public.ST_PointN(var_enline,i)]));
					   END IF;
					END LOOP;
					var_tempgeom := public.ST_Union(ARRAY[public.ST_ConvexHull(var_geoms[1]), public.ST_ConvexHull(var_geoms[2]) , public.ST_ConvexHull(var_geoms[3]), public.ST_ConvexHull(var_geoms[4])]);
					--RAISE NOTICE 'Curr vex % ', public.ST_AsText(var_tempgeom);
					IF public.ST_Area(var_tempgeom) <= var_newarea AND public.ST_IsValid(var_tempgeom)  THEN --AND public.ST_GeometryType(var_tempgeom) ILIKE '%Polygon'

						var_tempgeom := public.ST_Buffer(public.ST_ConcaveHull(var_geoms[1],least(param_pctconvex + param_pctconvex/var_div),true),var_buf, 'quad_segs=2');
						FOR i IN 1 .. 4 LOOP
							var_geoms[i] := public.ST_Buffer(public.ST_ConcaveHull(var_geoms[i],least(param_pctconvex + param_pctconvex/var_div),true), var_buf, 'quad_segs=2');
							IF public.ST_IsValid(var_geoms[i]) Then
								var_tempgeom := public.ST_Union(var_tempgeom, var_geoms[i]);
							ELSE
								RAISE NOTICE 'Not valid % %', i, public.ST_AsText(var_tempgeom);
								var_tempgeom := public.ST_Union(var_tempgeom, public.ST_ConvexHull(var_geoms[i]));
							END IF;
						END LOOP;

						--RAISE NOTICE 'Curr concave % ', public.ST_AsText(var_tempgeom);
						IF public.ST_IsValid(var_tempgeom) THEN
							var_resultgeom := var_tempgeom;
						END IF;
						var_newarea := public.ST_Area(var_resultgeom);
					ELSIF public.ST_IsValid(var_tempgeom) THEN
						var_resultgeom := var_tempgeom;
					END IF;

					IF public.ST_NumGeometries(var_resultgeom) > 1  THEN
						var_tempgeom := public._ST_ConcaveHull(var_resultgeom);
						IF public.ST_IsValid(var_tempgeom) AND public.ST_GeometryType(var_tempgeom) ILIKE 'ST_Polygon' THEN
							var_resultgeom := var_tempgeom;
						ELSE
							var_resultgeom := public.ST_Buffer(var_tempgeom,var_buf, 'quad_segs=2');
						END IF;
					END IF;
					IF param_allow_holes = false THEN
					-- only keep exterior ring since we do not want holes
						var_resultgeom := public.ST_MakePolygon(public.ST_ExteriorRing(var_resultgeom));
					END IF;
				ELSE
					var_resultgeom := public.ST_Buffer(var_resultgeom,var_buf);
				END IF;
				var_resultgeom := public.ST_ForceSFS(public.ST_Intersection(var_resultgeom, public.ST_ConvexHull(var_param_geom)));
			ELSE
				-- dimensions are too small to cut
				var_resultgeom := public._ST_ConcaveHull(var_param_geom);
			END IF;

			RETURN var_resultgeom;
	END;
$function$
;

-- Permissions

ALTER FUNCTION public.st_concavehull(geometry, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_concavehull(geometry, float8, bool) TO "admin";

-- DROP FUNCTION public.st_contains(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_contains(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$contains$function$
;

-- Permissions

ALTER FUNCTION public.st_contains(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_contains(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_containsproperly(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_containsproperly(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$containsproperly$function$
;

-- Permissions

ALTER FUNCTION public.st_containsproperly(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_containsproperly(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_convexhull(geometry);

CREATE OR REPLACE FUNCTION public.st_convexhull(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$convexhull$function$
;

-- Permissions

ALTER FUNCTION public.st_convexhull(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_convexhull(geometry) TO "admin";

-- DROP FUNCTION public.st_coorddim(geometry);

CREATE OR REPLACE FUNCTION public.st_coorddim(geometry geometry)
 RETURNS smallint
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_ndims$function$
;

-- Permissions

ALTER FUNCTION public.st_coorddim(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_coorddim(geometry) TO "admin";

-- DROP WINDOW public.st_coverageinvalidedges(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_coverageinvalidedges(geom geometry, tolerance double precision DEFAULT 0.0)
 RETURNS geometry
 LANGUAGE c
 WINDOW IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_CoverageInvalidEdges$function$
;

-- Permissions

ALTER WINDOW public.st_coverageinvalidedges(geometry, float8) OWNER TO "admin";
GRANT ALL ON WINDOW public.st_coverageinvalidedges(geometry, float8) TO "admin";

-- DROP WINDOW public.st_coveragesimplify(geometry, float8, bool);

CREATE OR REPLACE FUNCTION public.st_coveragesimplify(geom geometry, tolerance double precision, simplifyboundary boolean DEFAULT true)
 RETURNS geometry
 LANGUAGE c
 WINDOW IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_CoverageSimplify$function$
;

-- Permissions

ALTER WINDOW public.st_coveragesimplify(geometry, float8, bool) OWNER TO "admin";
GRANT ALL ON WINDOW public.st_coveragesimplify(geometry, float8, bool) TO "admin";

-- DROP AGGREGATE public.st_coverageunion(geometry);

-- Aggregate function public.st_coverageunion(geometry)
-- ERROR: more than one function named "public.st_coverageunion";

-- Permissions

ALTER AGGREGATE public.st_coverageunion(geometry) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_coverageunion(geometry) TO "admin";

-- DROP FUNCTION public.st_coverageunion(_geometry);

CREATE OR REPLACE FUNCTION public.st_coverageunion(geometry[])
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_CoverageUnion$function$
;

-- Permissions

ALTER FUNCTION public.st_coverageunion(_geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_coverageunion(_geometry) TO "admin";

-- DROP FUNCTION public.st_coveredby(text, text);

CREATE OR REPLACE FUNCTION public.st_coveredby(text, text)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public.ST_CoveredBy($1::public.geometry, $2::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_coveredby(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_coveredby(text, text) TO "admin";

-- DROP FUNCTION public.st_coveredby(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_coveredby(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$coveredby$function$
;

-- Permissions

ALTER FUNCTION public.st_coveredby(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_coveredby(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_coveredby(geography, geography);

CREATE OR REPLACE FUNCTION public.st_coveredby(geog1 geography, geog2 geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$geography_coveredby$function$
;

-- Permissions

ALTER FUNCTION public.st_coveredby(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_coveredby(geography, geography) TO "admin";

-- DROP FUNCTION public.st_covers(geography, geography);

CREATE OR REPLACE FUNCTION public.st_covers(geog1 geography, geog2 geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$geography_covers$function$
;

-- Permissions

ALTER FUNCTION public.st_covers(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_covers(geography, geography) TO "admin";

-- DROP FUNCTION public.st_covers(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_covers(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$covers$function$
;

-- Permissions

ALTER FUNCTION public.st_covers(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_covers(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_covers(text, text);

CREATE OR REPLACE FUNCTION public.st_covers(text, text)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public.ST_Covers($1::public.geometry, $2::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_covers(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_covers(text, text) TO "admin";

-- DROP FUNCTION public.st_cpawithin(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_cpawithin(geometry, geometry, double precision)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_CPAWithin$function$
;

-- Permissions

ALTER FUNCTION public.st_cpawithin(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_cpawithin(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_crosses(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_crosses(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$crosses$function$
;

-- Permissions

ALTER FUNCTION public.st_crosses(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_crosses(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_curven(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_curven(geometry geometry, i integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_CurveN$function$
;

-- Permissions

ALTER FUNCTION public.st_curven(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_curven(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_curvetoline(geometry, float8, int4, int4);

CREATE OR REPLACE FUNCTION public.st_curvetoline(geom geometry, tol double precision DEFAULT 32, toltype integer DEFAULT 0, flags integer DEFAULT 0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_CurveToLine$function$
;

-- Permissions

ALTER FUNCTION public.st_curvetoline(geometry, float8, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_curvetoline(geometry, float8, int4, int4) TO "admin";

-- DROP FUNCTION public.st_delaunaytriangles(geometry, float8, int4);

CREATE OR REPLACE FUNCTION public.st_delaunaytriangles(g1 geometry, tolerance double precision DEFAULT 0.0, flags integer DEFAULT 0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_DelaunayTriangles$function$
;

-- Permissions

ALTER FUNCTION public.st_delaunaytriangles(geometry, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_delaunaytriangles(geometry, float8, int4) TO "admin";

-- DROP FUNCTION public.st_dfullywithin(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_dfullywithin(geom1 geometry, geom2 geometry, double precision)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$LWGEOM_dfullywithin$function$
;

-- Permissions

ALTER FUNCTION public.st_dfullywithin(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_dfullywithin(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_difference(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_difference(geom1 geometry, geom2 geometry, gridsize double precision DEFAULT '-1.0'::numeric)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Difference$function$
;

-- Permissions

ALTER FUNCTION public.st_difference(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_difference(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_dimension(geometry);

CREATE OR REPLACE FUNCTION public.st_dimension(geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_dimension$function$
;

-- Permissions

ALTER FUNCTION public.st_dimension(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_dimension(geometry) TO "admin";

-- DROP FUNCTION public.st_disjoint(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_disjoint(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$disjoint$function$
;

-- Permissions

ALTER FUNCTION public.st_disjoint(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_disjoint(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_distance(geography, geography, bool);

CREATE OR REPLACE FUNCTION public.st_distance(geog1 geography, geog2 geography, use_spheroid boolean DEFAULT true)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$geography_distance$function$
;

-- Permissions

ALTER FUNCTION public.st_distance(geography, geography, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_distance(geography, geography, bool) TO "admin";

-- DROP FUNCTION public.st_distance(text, text);

CREATE OR REPLACE FUNCTION public.st_distance(text, text)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ SELECT public.ST_Distance($1::public.geometry, $2::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_distance(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_distance(text, text) TO "admin";

-- DROP FUNCTION public.st_distance(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_distance(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Distance$function$
;

-- Permissions

ALTER FUNCTION public.st_distance(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_distance(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_distancecpa(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_distancecpa(geometry, geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_DistanceCPA$function$
;

-- Permissions

ALTER FUNCTION public.st_distancecpa(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_distancecpa(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_distancesphere(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_distancesphere(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$select public.ST_distance( public.geography($1), public.geography($2),false)$function$
;

-- Permissions

ALTER FUNCTION public.st_distancesphere(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_distancesphere(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_distancesphere(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_distancesphere(geom1 geometry, geom2 geometry, radius double precision)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_distance_sphere$function$
;

-- Permissions

ALTER FUNCTION public.st_distancesphere(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_distancesphere(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_distancespheroid(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_distancespheroid(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_distance_ellipsoid$function$
;

-- Permissions

ALTER FUNCTION public.st_distancespheroid(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_distancespheroid(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_distancespheroid(geometry, geometry, spheroid);

CREATE OR REPLACE FUNCTION public.st_distancespheroid(geom1 geometry, geom2 geometry, spheroid)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_distance_ellipsoid$function$
;

-- Permissions

ALTER FUNCTION public.st_distancespheroid(geometry, geometry, spheroid) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_distancespheroid(geometry, geometry, spheroid) TO "admin";

-- DROP FUNCTION public.st_dump(geometry);

CREATE OR REPLACE FUNCTION public.st_dump(geometry)
 RETURNS SETOF geometry_dump
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_dump$function$
;

-- Permissions

ALTER FUNCTION public.st_dump(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_dump(geometry) TO "admin";

-- DROP FUNCTION public.st_dumppoints(geometry);

CREATE OR REPLACE FUNCTION public.st_dumppoints(geometry)
 RETURNS SETOF geometry_dump
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_dumppoints$function$
;

-- Permissions

ALTER FUNCTION public.st_dumppoints(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_dumppoints(geometry) TO "admin";

-- DROP FUNCTION public.st_dumprings(geometry);

CREATE OR REPLACE FUNCTION public.st_dumprings(geometry)
 RETURNS SETOF geometry_dump
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_dump_rings$function$
;

-- Permissions

ALTER FUNCTION public.st_dumprings(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_dumprings(geometry) TO "admin";

-- DROP FUNCTION public.st_dumpsegments(geometry);

CREATE OR REPLACE FUNCTION public.st_dumpsegments(geometry)
 RETURNS SETOF geometry_dump
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_dumpsegments$function$
;

-- Permissions

ALTER FUNCTION public.st_dumpsegments(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_dumpsegments(geometry) TO "admin";

-- DROP FUNCTION public.st_dwithin(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_dwithin(geom1 geometry, geom2 geometry, double precision)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$LWGEOM_dwithin$function$
;

-- Permissions

ALTER FUNCTION public.st_dwithin(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_dwithin(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_dwithin(geography, geography, float8, bool);

CREATE OR REPLACE FUNCTION public.st_dwithin(geog1 geography, geog2 geography, tolerance double precision, use_spheroid boolean DEFAULT true)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$geography_dwithin$function$
;

-- Permissions

ALTER FUNCTION public.st_dwithin(geography, geography, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_dwithin(geography, geography, float8, bool) TO "admin";

-- DROP FUNCTION public.st_dwithin(text, text, float8);

CREATE OR REPLACE FUNCTION public.st_dwithin(text, text, double precision)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public.ST_DWithin($1::public.geometry, $2::public.geometry, $3);  $function$
;

-- Permissions

ALTER FUNCTION public.st_dwithin(text, text, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_dwithin(text, text, float8) TO "admin";

-- DROP FUNCTION public.st_endpoint(geometry);

CREATE OR REPLACE FUNCTION public.st_endpoint(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_endpoint_linestring$function$
;

-- Permissions

ALTER FUNCTION public.st_endpoint(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_endpoint(geometry) TO "admin";

-- DROP FUNCTION public.st_envelope(geometry);

CREATE OR REPLACE FUNCTION public.st_envelope(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_envelope$function$
;

-- Permissions

ALTER FUNCTION public.st_envelope(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_envelope(geometry) TO "admin";

-- DROP FUNCTION public.st_equals(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_equals(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$ST_Equals$function$
;

-- Permissions

ALTER FUNCTION public.st_equals(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_equals(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_estimatedextent(text, text, text, bool);

CREATE OR REPLACE FUNCTION public.st_estimatedextent(text, text, text, boolean)
 RETURNS box2d
 LANGUAGE c
 STABLE STRICT
AS '$libdir/postgis-3', $function$gserialized_estimated_extent$function$
;

-- Permissions

ALTER FUNCTION public.st_estimatedextent(text, text, text, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_estimatedextent(text, text, text, bool) TO "admin";

-- DROP FUNCTION public.st_estimatedextent(text, text);

CREATE OR REPLACE FUNCTION public.st_estimatedextent(text, text)
 RETURNS box2d
 LANGUAGE c
 STABLE STRICT
AS '$libdir/postgis-3', $function$gserialized_estimated_extent$function$
;

-- Permissions

ALTER FUNCTION public.st_estimatedextent(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_estimatedextent(text, text) TO "admin";

-- DROP FUNCTION public.st_estimatedextent(text, text, text);

CREATE OR REPLACE FUNCTION public.st_estimatedextent(text, text, text)
 RETURNS box2d
 LANGUAGE c
 STABLE STRICT
AS '$libdir/postgis-3', $function$gserialized_estimated_extent$function$
;

-- Permissions

ALTER FUNCTION public.st_estimatedextent(text, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_estimatedextent(text, text, text) TO "admin";

-- DROP FUNCTION public.st_expand(box3d, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_expand(box box3d, dx double precision, dy double precision, dz double precision DEFAULT 0)
 RETURNS box3d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$BOX3D_expand$function$
;

-- Permissions

ALTER FUNCTION public.st_expand(box3d, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_expand(box3d, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_expand(geometry, float8, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_expand(geom geometry, dx double precision, dy double precision, dz double precision DEFAULT 0, dm double precision DEFAULT 0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_expand$function$
;

-- Permissions

ALTER FUNCTION public.st_expand(geometry, float8, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_expand(geometry, float8, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_expand(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_expand(geometry, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_expand$function$
;

-- Permissions

ALTER FUNCTION public.st_expand(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_expand(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_expand(box3d, float8);

CREATE OR REPLACE FUNCTION public.st_expand(box3d, double precision)
 RETURNS box3d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$BOX3D_expand$function$
;

-- Permissions

ALTER FUNCTION public.st_expand(box3d, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_expand(box3d, float8) TO "admin";

-- DROP FUNCTION public.st_expand(box2d, float8);

CREATE OR REPLACE FUNCTION public.st_expand(box2d, double precision)
 RETURNS box2d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX2D_expand$function$
;

-- Permissions

ALTER FUNCTION public.st_expand(box2d, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_expand(box2d, float8) TO "admin";

-- DROP FUNCTION public.st_expand(box2d, float8, float8);

CREATE OR REPLACE FUNCTION public.st_expand(box box2d, dx double precision, dy double precision)
 RETURNS box2d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX2D_expand$function$
;

-- Permissions

ALTER FUNCTION public.st_expand(box2d, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_expand(box2d, float8, float8) TO "admin";

-- DROP AGGREGATE public.st_extent(geometry);

CREATE OR REPLACE AGGREGATE public.st_extent(public.geometry) (
	SFUNC = public.st_combinebbox,
	STYPE = box3d,
	FINALFUNC = public.box2d,
	FINALFUNC_MODIFY = READ_ONLY
);

-- Permissions

ALTER AGGREGATE public.st_extent(geometry) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_extent(geometry) TO "admin";

-- DROP FUNCTION public.st_exteriorring(geometry);

CREATE OR REPLACE FUNCTION public.st_exteriorring(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_exteriorring_polygon$function$
;

-- Permissions

ALTER FUNCTION public.st_exteriorring(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_exteriorring(geometry) TO "admin";

-- DROP FUNCTION public.st_filterbym(geometry, float8, float8, bool);

CREATE OR REPLACE FUNCTION public.st_filterbym(geometry, double precision, double precision DEFAULT NULL::double precision, boolean DEFAULT false)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$LWGEOM_FilterByM$function$
;

-- Permissions

ALTER FUNCTION public.st_filterbym(geometry, float8, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_filterbym(geometry, float8, float8, bool) TO "admin";

-- DROP FUNCTION public.st_findextent(text, text, text);

CREATE OR REPLACE FUNCTION public.st_findextent(text, text, text)
 RETURNS box2d
 LANGUAGE plpgsql
 STABLE PARALLEL SAFE STRICT
AS $function$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;
BEGIN
	FOR myrec IN EXECUTE 'SELECT public.ST_Extent("' || columnname || '") As extent FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.st_findextent(text, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_findextent(text, text, text) TO "admin";

-- DROP FUNCTION public.st_findextent(text, text);

CREATE OR REPLACE FUNCTION public.st_findextent(text, text)
 RETURNS box2d
 LANGUAGE plpgsql
 STABLE PARALLEL SAFE STRICT
AS $function$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT public.ST_Extent("' || columnname || '") As extent FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.st_findextent(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_findextent(text, text) TO "admin";

-- DROP FUNCTION public.st_flipcoordinates(geometry);

CREATE OR REPLACE FUNCTION public.st_flipcoordinates(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_FlipCoordinates$function$
;

-- Permissions

ALTER FUNCTION public.st_flipcoordinates(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_flipcoordinates(geometry) TO "admin";

-- DROP FUNCTION public.st_force2d(geometry);

CREATE OR REPLACE FUNCTION public.st_force2d(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_force_2d$function$
;

-- Permissions

ALTER FUNCTION public.st_force2d(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_force2d(geometry) TO "admin";

-- DROP FUNCTION public.st_force3d(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_force3d(geom geometry, zvalue double precision DEFAULT 0.0)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Force3DZ($1, $2)$function$
;

-- Permissions

ALTER FUNCTION public.st_force3d(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_force3d(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_force3dm(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_force3dm(geom geometry, mvalue double precision DEFAULT 0.0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_force_3dm$function$
;

-- Permissions

ALTER FUNCTION public.st_force3dm(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_force3dm(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_force3dz(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_force3dz(geom geometry, zvalue double precision DEFAULT 0.0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_force_3dz$function$
;

-- Permissions

ALTER FUNCTION public.st_force3dz(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_force3dz(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_force4d(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_force4d(geom geometry, zvalue double precision DEFAULT 0.0, mvalue double precision DEFAULT 0.0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_force_4d$function$
;

-- Permissions

ALTER FUNCTION public.st_force4d(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_force4d(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_forcecollection(geometry);

CREATE OR REPLACE FUNCTION public.st_forcecollection(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_force_collection$function$
;

-- Permissions

ALTER FUNCTION public.st_forcecollection(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_forcecollection(geometry) TO "admin";

-- DROP FUNCTION public.st_forcecurve(geometry);

CREATE OR REPLACE FUNCTION public.st_forcecurve(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_force_curve$function$
;

-- Permissions

ALTER FUNCTION public.st_forcecurve(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_forcecurve(geometry) TO "admin";

-- DROP FUNCTION public.st_forcepolygonccw(geometry);

CREATE OR REPLACE FUNCTION public.st_forcepolygonccw(geometry)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$ SELECT public.ST_Reverse(public.ST_ForcePolygonCW($1)) $function$
;

-- Permissions

ALTER FUNCTION public.st_forcepolygonccw(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_forcepolygonccw(geometry) TO "admin";

-- DROP FUNCTION public.st_forcepolygoncw(geometry);

CREATE OR REPLACE FUNCTION public.st_forcepolygoncw(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_force_clockwise_poly$function$
;

-- Permissions

ALTER FUNCTION public.st_forcepolygoncw(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_forcepolygoncw(geometry) TO "admin";

-- DROP FUNCTION public.st_forcerhr(geometry);

CREATE OR REPLACE FUNCTION public.st_forcerhr(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_force_clockwise_poly$function$
;

-- Permissions

ALTER FUNCTION public.st_forcerhr(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_forcerhr(geometry) TO "admin";

-- DROP FUNCTION public.st_forcesfs(geometry);

CREATE OR REPLACE FUNCTION public.st_forcesfs(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_force_sfs$function$
;

-- Permissions

ALTER FUNCTION public.st_forcesfs(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_forcesfs(geometry) TO "admin";

-- DROP FUNCTION public.st_forcesfs(geometry, text);

CREATE OR REPLACE FUNCTION public.st_forcesfs(geometry, version text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_force_sfs$function$
;

-- Permissions

ALTER FUNCTION public.st_forcesfs(geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_forcesfs(geometry, text) TO "admin";

-- DROP FUNCTION public.st_frechetdistance(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_frechetdistance(geom1 geometry, geom2 geometry, double precision DEFAULT '-1'::integer)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_FrechetDistance$function$
;

-- Permissions

ALTER FUNCTION public.st_frechetdistance(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_frechetdistance(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_fromflatgeobuf(anyelement, bytea);

CREATE OR REPLACE FUNCTION public.st_fromflatgeobuf(anyelement, bytea)
 RETURNS SETOF anyelement
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$pgis_fromflatgeobuf$function$
;

-- Permissions

ALTER FUNCTION public.st_fromflatgeobuf(anyelement, bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_fromflatgeobuf(anyelement, bytea) TO "admin";

-- DROP FUNCTION public.st_fromflatgeobuftotable(text, text, bytea);

CREATE OR REPLACE FUNCTION public.st_fromflatgeobuftotable(text, text, bytea)
 RETURNS void
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$pgis_tablefromflatgeobuf$function$
;

-- Permissions

ALTER FUNCTION public.st_fromflatgeobuftotable(text, text, bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_fromflatgeobuftotable(text, text, bytea) TO "admin";

-- DROP FUNCTION public.st_generatepoints(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_generatepoints(area geometry, npoints integer)
 RETURNS geometry
 LANGUAGE c
 PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_GeneratePoints$function$
;

-- Permissions

ALTER FUNCTION public.st_generatepoints(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_generatepoints(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_generatepoints(geometry, int4, int4);

CREATE OR REPLACE FUNCTION public.st_generatepoints(area geometry, npoints integer, seed integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_GeneratePoints$function$
;

-- Permissions

ALTER FUNCTION public.st_generatepoints(geometry, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_generatepoints(geometry, int4, int4) TO "admin";

-- DROP FUNCTION public.st_geogfromtext(text);

CREATE OR REPLACE FUNCTION public.st_geogfromtext(text)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_from_text$function$
;

-- Permissions

ALTER FUNCTION public.st_geogfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geogfromtext(text) TO "admin";

-- DROP FUNCTION public.st_geogfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_geogfromwkb(bytea)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$geography_from_binary$function$
;

-- Permissions

ALTER FUNCTION public.st_geogfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geogfromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_geographyfromtext(text);

CREATE OR REPLACE FUNCTION public.st_geographyfromtext(text)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_from_text$function$
;

-- Permissions

ALTER FUNCTION public.st_geographyfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geographyfromtext(text) TO "admin";

-- DROP FUNCTION public.st_geohash(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_geohash(geom geometry, maxchars integer DEFAULT 0)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_GeoHash$function$
;

-- Permissions

ALTER FUNCTION public.st_geohash(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geohash(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_geohash(geography, int4);

CREATE OR REPLACE FUNCTION public.st_geohash(geog geography, maxchars integer DEFAULT 0)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_GeoHash$function$
;

-- Permissions

ALTER FUNCTION public.st_geohash(geography, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geohash(geography, int4) TO "admin";

-- DROP FUNCTION public.st_geomcollfromtext(text);

CREATE OR REPLACE FUNCTION public.st_geomcollfromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE
	WHEN public.geometrytype(public.ST_GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN public.ST_GeomFromText($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_geomcollfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomcollfromtext(text) TO "admin";

-- DROP FUNCTION public.st_geomcollfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_geomcollfromtext(text, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE
	WHEN public.geometrytype(public.ST_GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN public.ST_GeomFromText($1,$2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_geomcollfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomcollfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_geomcollfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_geomcollfromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE
	WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_geomcollfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomcollfromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_geomcollfromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_geomcollfromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE
	WHEN public.geometrytype(public.ST_GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_geomcollfromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomcollfromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_geometricmedian(geometry, float8, int4, bool);

CREATE OR REPLACE FUNCTION public.st_geometricmedian(g geometry, tolerance double precision DEFAULT NULL::double precision, max_iter integer DEFAULT 10000, fail_if_not_converged boolean DEFAULT false)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 5000
AS '$libdir/postgis-3', $function$ST_GeometricMedian$function$
;

-- Permissions

ALTER FUNCTION public.st_geometricmedian(geometry, float8, int4, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geometricmedian(geometry, float8, int4, bool) TO "admin";

-- DROP FUNCTION public.st_geometryfromtext(text);

CREATE OR REPLACE FUNCTION public.st_geometryfromtext(text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_from_text$function$
;

-- Permissions

ALTER FUNCTION public.st_geometryfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geometryfromtext(text) TO "admin";

-- DROP FUNCTION public.st_geometryfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_geometryfromtext(text, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_from_text$function$
;

-- Permissions

ALTER FUNCTION public.st_geometryfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geometryfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_geometryn(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_geometryn(geometry, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_geometryn_collection$function$
;

-- Permissions

ALTER FUNCTION public.st_geometryn(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geometryn(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_geometrytype(geometry);

CREATE OR REPLACE FUNCTION public.st_geometrytype(geometry)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geometry_geometrytype$function$
;

-- Permissions

ALTER FUNCTION public.st_geometrytype(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geometrytype(geometry) TO "admin";

-- DROP FUNCTION public.st_geomfromewkb(bytea);

CREATE OR REPLACE FUNCTION public.st_geomfromewkb(bytea)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOMFromEWKB$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromewkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromewkb(bytea) TO "admin";

-- DROP FUNCTION public.st_geomfromewkt(text);

CREATE OR REPLACE FUNCTION public.st_geomfromewkt(text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$parse_WKT_lwgeom$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromewkt(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromewkt(text) TO "admin";

-- DROP FUNCTION public.st_geomfromgeohash(text, int4);

CREATE OR REPLACE FUNCTION public.st_geomfromgeohash(text, integer DEFAULT NULL::integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE COST 50
AS $function$ SELECT CAST(public.ST_Box2dFromGeoHash($1, $2) AS geometry); $function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromgeohash(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromgeohash(text, int4) TO "admin";

-- DROP FUNCTION public.st_geomfromgeojson(jsonb);

CREATE OR REPLACE FUNCTION public.st_geomfromgeojson(jsonb)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public.ST_GeomFromGeoJson($1::text)$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromgeojson(jsonb) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromgeojson(jsonb) TO "admin";

-- DROP FUNCTION public.st_geomfromgeojson(json);

CREATE OR REPLACE FUNCTION public.st_geomfromgeojson(json)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public.ST_GeomFromGeoJson($1::text)$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromgeojson(json) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromgeojson(json) TO "admin";

-- DROP FUNCTION public.st_geomfromgeojson(text);

CREATE OR REPLACE FUNCTION public.st_geomfromgeojson(text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geom_from_geojson$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromgeojson(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromgeojson(text) TO "admin";

-- DROP FUNCTION public.st_geomfromgml(text);

CREATE OR REPLACE FUNCTION public.st_geomfromgml(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public._ST_GeomFromGML($1, 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromgml(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromgml(text) TO "admin";

-- DROP FUNCTION public.st_geomfromgml(text, int4);

CREATE OR REPLACE FUNCTION public.st_geomfromgml(text, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geom_from_gml$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromgml(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromgml(text, int4) TO "admin";

-- DROP FUNCTION public.st_geomfromkml(text);

CREATE OR REPLACE FUNCTION public.st_geomfromkml(text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geom_from_kml$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromkml(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromkml(text) TO "admin";

-- DROP FUNCTION public.st_geomfrommarc21(text);

CREATE OR REPLACE FUNCTION public.st_geomfrommarc21(marc21xml text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 500
AS '$libdir/postgis-3', $function$ST_GeomFromMARC21$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfrommarc21(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfrommarc21(text) TO "admin";

-- DROP FUNCTION public.st_geomfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_geomfromtext(text, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_from_text$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_geomfromtext(text);

CREATE OR REPLACE FUNCTION public.st_geomfromtext(text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_from_text$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromtext(text) TO "admin";

-- DROP FUNCTION public.st_geomfromtwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_geomfromtwkb(bytea)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOMFromTWKB$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromtwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromtwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_geomfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_geomfromwkb(bytea)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_from_WKB$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_geomfromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_geomfromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_SetSRID(public.ST_GeomFromWKB($1), $2)$function$
;

-- Permissions

ALTER FUNCTION public.st_geomfromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_geomfromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_gmltosql(text);

CREATE OR REPLACE FUNCTION public.st_gmltosql(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public._ST_GeomFromGML($1, 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_gmltosql(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_gmltosql(text) TO "admin";

-- DROP FUNCTION public.st_gmltosql(text, int4);

CREATE OR REPLACE FUNCTION public.st_gmltosql(text, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geom_from_gml$function$
;

-- Permissions

ALTER FUNCTION public.st_gmltosql(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_gmltosql(text, int4) TO "admin";

-- DROP FUNCTION public.st_hasarc(geometry);

CREATE OR REPLACE FUNCTION public.st_hasarc(geometry geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_has_arc$function$
;

-- Permissions

ALTER FUNCTION public.st_hasarc(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_hasarc(geometry) TO "admin";

-- DROP FUNCTION public.st_hasm(geometry);

CREATE OR REPLACE FUNCTION public.st_hasm(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_hasm$function$
;

-- Permissions

ALTER FUNCTION public.st_hasm(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_hasm(geometry) TO "admin";

-- DROP FUNCTION public.st_hasz(geometry);

CREATE OR REPLACE FUNCTION public.st_hasz(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_hasz$function$
;

-- Permissions

ALTER FUNCTION public.st_hasz(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_hasz(geometry) TO "admin";

-- DROP FUNCTION public.st_hausdorffdistance(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_hausdorffdistance(geom1 geometry, geom2 geometry, double precision)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$hausdorffdistancedensify$function$
;

-- Permissions

ALTER FUNCTION public.st_hausdorffdistance(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_hausdorffdistance(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_hausdorffdistance(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_hausdorffdistance(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$hausdorffdistance$function$
;

-- Permissions

ALTER FUNCTION public.st_hausdorffdistance(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_hausdorffdistance(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_hexagon(float8, int4, int4, geometry);

CREATE OR REPLACE FUNCTION public.st_hexagon(size double precision, cell_i integer, cell_j integer, origin geometry DEFAULT '010100000000000000000000000000000000000000'::geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_Hexagon$function$
;

-- Permissions

ALTER FUNCTION public.st_hexagon(float8, int4, int4, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_hexagon(float8, int4, int4, geometry) TO "admin";

-- DROP FUNCTION public.st_hexagongrid(in float8, in geometry, out geometry, out int4, out int4);

CREATE OR REPLACE FUNCTION public.st_hexagongrid(size double precision, bounds geometry, OUT geom geometry, OUT i integer, OUT j integer)
 RETURNS SETOF record
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_ShapeGrid$function$
;

-- Permissions

ALTER FUNCTION public.st_hexagongrid(in float8, in geometry, out geometry, out int4, out int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_hexagongrid(in float8, in geometry, out geometry, out int4, out int4) TO "admin";

-- DROP FUNCTION public.st_interiorringn(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_interiorringn(geometry, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_interiorringn_polygon$function$
;

-- Permissions

ALTER FUNCTION public.st_interiorringn(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_interiorringn(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_interpolatepoint(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_interpolatepoint(line geometry, point geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_InterpolatePoint$function$
;

-- Permissions

ALTER FUNCTION public.st_interpolatepoint(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_interpolatepoint(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_intersection(text, text);

CREATE OR REPLACE FUNCTION public.st_intersection(text, text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$ SELECT public.ST_Intersection($1::public.geometry, $2::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_intersection(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_intersection(text, text) TO "admin";

-- DROP FUNCTION public.st_intersection(geography, geography);

CREATE OR REPLACE FUNCTION public.st_intersection(geography, geography)
 RETURNS geography
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$SELECT public.geography(public.ST_Transform(public.ST_Intersection(public.ST_Transform(public.geometry($1), public._ST_BestSRID($1, $2)), public.ST_Transform(public.geometry($2), public._ST_BestSRID($1, $2))), public.ST_SRID($1)))$function$
;

-- Permissions

ALTER FUNCTION public.st_intersection(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_intersection(geography, geography) TO "admin";

-- DROP FUNCTION public.st_intersection(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_intersection(geom1 geometry, geom2 geometry, gridsize double precision DEFAULT '-1'::integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Intersection$function$
;

-- Permissions

ALTER FUNCTION public.st_intersection(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_intersection(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_intersects(geography, geography);

CREATE OR REPLACE FUNCTION public.st_intersects(geog1 geography, geog2 geography)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$geography_intersects$function$
;

-- Permissions

ALTER FUNCTION public.st_intersects(geography, geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_intersects(geography, geography) TO "admin";

-- DROP FUNCTION public.st_intersects(text, text);

CREATE OR REPLACE FUNCTION public.st_intersects(text, text)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public.ST_Intersects($1::public.geometry, $2::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_intersects(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_intersects(text, text) TO "admin";

-- DROP FUNCTION public.st_intersects(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_intersects(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$ST_Intersects$function$
;

-- Permissions

ALTER FUNCTION public.st_intersects(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_intersects(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_inversetransformpipeline(geometry, text, int4);

CREATE OR REPLACE FUNCTION public.st_inversetransformpipeline(geom geometry, pipeline text, to_srid integer DEFAULT 0)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$SELECT public.postgis_transform_pipeline_geometry($1, $2, FALSE, $3)$function$
;

-- Permissions

ALTER FUNCTION public.st_inversetransformpipeline(geometry, text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_inversetransformpipeline(geometry, text, int4) TO "admin";

-- DROP FUNCTION public.st_isclosed(geometry);

CREATE OR REPLACE FUNCTION public.st_isclosed(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_isclosed$function$
;

-- Permissions

ALTER FUNCTION public.st_isclosed(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_isclosed(geometry) TO "admin";

-- DROP FUNCTION public.st_iscollection(geometry);

CREATE OR REPLACE FUNCTION public.st_iscollection(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$ST_IsCollection$function$
;

-- Permissions

ALTER FUNCTION public.st_iscollection(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_iscollection(geometry) TO "admin";

-- DROP FUNCTION public.st_isempty(geometry);

CREATE OR REPLACE FUNCTION public.st_isempty(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_isempty$function$
;

-- Permissions

ALTER FUNCTION public.st_isempty(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_isempty(geometry) TO "admin";

-- DROP FUNCTION public.st_ispolygonccw(geometry);

CREATE OR REPLACE FUNCTION public.st_ispolygonccw(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_IsPolygonCCW$function$
;

-- Permissions

ALTER FUNCTION public.st_ispolygonccw(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_ispolygonccw(geometry) TO "admin";

-- DROP FUNCTION public.st_ispolygoncw(geometry);

CREATE OR REPLACE FUNCTION public.st_ispolygoncw(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_IsPolygonCW$function$
;

-- Permissions

ALTER FUNCTION public.st_ispolygoncw(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_ispolygoncw(geometry) TO "admin";

-- DROP FUNCTION public.st_isring(geometry);

CREATE OR REPLACE FUNCTION public.st_isring(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$isring$function$
;

-- Permissions

ALTER FUNCTION public.st_isring(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_isring(geometry) TO "admin";

-- DROP FUNCTION public.st_issimple(geometry);

CREATE OR REPLACE FUNCTION public.st_issimple(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$issimple$function$
;

-- Permissions

ALTER FUNCTION public.st_issimple(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_issimple(geometry) TO "admin";

-- DROP FUNCTION public.st_isvalid(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_isvalid(geometry, integer)
 RETURNS boolean
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$SELECT (public.ST_isValidDetail($1, $2)).valid$function$
;

-- Permissions

ALTER FUNCTION public.st_isvalid(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_isvalid(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_isvalid(geometry);

CREATE OR REPLACE FUNCTION public.st_isvalid(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$isvalid$function$
;

-- Permissions

ALTER FUNCTION public.st_isvalid(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_isvalid(geometry) TO "admin";

-- DROP FUNCTION public.st_isvaliddetail(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_isvaliddetail(geom geometry, flags integer DEFAULT 0)
 RETURNS valid_detail
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$isvaliddetail$function$
;

-- Permissions

ALTER FUNCTION public.st_isvaliddetail(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_isvaliddetail(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_isvalidreason(geometry);

CREATE OR REPLACE FUNCTION public.st_isvalidreason(geometry)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$isvalidreason$function$
;

-- Permissions

ALTER FUNCTION public.st_isvalidreason(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_isvalidreason(geometry) TO "admin";

-- DROP FUNCTION public.st_isvalidreason(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_isvalidreason(geometry, integer)
 RETURNS text
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$
	SELECT CASE WHEN valid THEN 'Valid Geometry' ELSE reason END FROM (
		SELECT (public.ST_isValidDetail($1, $2)).*
	) foo
	$function$
;

-- Permissions

ALTER FUNCTION public.st_isvalidreason(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_isvalidreason(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_isvalidtrajectory(geometry);

CREATE OR REPLACE FUNCTION public.st_isvalidtrajectory(geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_IsValidTrajectory$function$
;

-- Permissions

ALTER FUNCTION public.st_isvalidtrajectory(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_isvalidtrajectory(geometry) TO "admin";

-- DROP FUNCTION public.st_largestemptycircle(in geometry, in float8, in geometry, out geometry, out geometry, out float8);

CREATE OR REPLACE FUNCTION public.st_largestemptycircle(geom geometry, tolerance double precision DEFAULT 0.0, boundary geometry DEFAULT '0101000000000000000000F87F000000000000F87F'::geometry, OUT center geometry, OUT nearest geometry, OUT radius double precision)
 RETURNS record
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_LargestEmptyCircle$function$
;

-- Permissions

ALTER FUNCTION public.st_largestemptycircle(in geometry, in float8, in geometry, out geometry, out geometry, out float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_largestemptycircle(in geometry, in float8, in geometry, out geometry, out geometry, out float8) TO "admin";

-- DROP FUNCTION public.st_length(geometry);

CREATE OR REPLACE FUNCTION public.st_length(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_length2d_linestring$function$
;

-- Permissions

ALTER FUNCTION public.st_length(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_length(geometry) TO "admin";

-- DROP FUNCTION public.st_length(geography, bool);

CREATE OR REPLACE FUNCTION public.st_length(geog geography, use_spheroid boolean DEFAULT true)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_length$function$
;

-- Permissions

ALTER FUNCTION public.st_length(geography, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_length(geography, bool) TO "admin";

-- DROP FUNCTION public.st_length(text);

CREATE OR REPLACE FUNCTION public.st_length(text)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$ SELECT public.ST_Length($1::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_length(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_length(text) TO "admin";

-- DROP FUNCTION public.st_length2d(geometry);

CREATE OR REPLACE FUNCTION public.st_length2d(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_length2d_linestring$function$
;

-- Permissions

ALTER FUNCTION public.st_length2d(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_length2d(geometry) TO "admin";

-- DROP FUNCTION public.st_length2dspheroid(geometry, spheroid);

CREATE OR REPLACE FUNCTION public.st_length2dspheroid(geometry, spheroid)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_length2d_ellipsoid$function$
;

-- Permissions

ALTER FUNCTION public.st_length2dspheroid(geometry, spheroid) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_length2dspheroid(geometry, spheroid) TO "admin";

-- DROP FUNCTION public.st_lengthspheroid(geometry, spheroid);

CREATE OR REPLACE FUNCTION public.st_lengthspheroid(geometry, spheroid)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_length_ellipsoid_linestring$function$
;

-- Permissions

ALTER FUNCTION public.st_lengthspheroid(geometry, spheroid) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_lengthspheroid(geometry, spheroid) TO "admin";

-- DROP FUNCTION public.st_letters(text, json);

CREATE OR REPLACE FUNCTION public.st_letters(letters text, font json DEFAULT NULL::json)
 RETURNS geometry
 LANGUAGE plpgsql
 IMMUTABLE PARALLEL SAFE COST 250
 SET standard_conforming_strings TO 'on'
AS $function$
DECLARE
  letterarray text[];
  letter text;
  geom geometry;
  prevgeom geometry = NULL;
  adjustment float8 = 0.0;
  position float8 = 0.0;
  text_height float8 = 100.0;
  width float8;
  m_width float8;
  spacing float8;
  dist float8;
  wordarr geometry[];
  wordgeom geometry;
  -- geometry has been run through replace(encode(st_astwkb(geom),'base64'), E'\n', '')
  font_default_height float8 = 1000.0;
  font_default json = '{
  "!":"BgACAQhUrgsTFOQCABQAExELiwi5AgAJiggBYQmJCgAOAg4CDAIOBAoEDAYKBgoGCggICAgICAgGCgYKBgoGCgQMBAoECgQMAgoADAIKAAoADAEKAAwBCgMKAQwDCgMKAwoFCAUKBwgHBgcIBwYJBgkECwYJBAsCDQILAg0CDQANAQ0BCwELAwsDCwUJBQkFCQcHBwcHBwcFCQUJBQkFCQMLAwkDCQMLAQkACwEJAAkACwIJAAsCCQQJAgsECQQJBAkGBwYJCAcIBQgHCAUKBQoDDAUKAQwDDgEMAQ4BDg==",
  "&":"BgABAskBygP+BowEAACZAmcAANsCAw0FDwUNBQ0FDQcLBw0HCwcLCQsJCwkLCQkJCwsJCwkLCQ0HCwcNBw8HDQUPBQ8DDwMRAw8DEQERAREBEQERABcAFQIXAhUCEwQVBBMGEwYTBhEIEQgPChEKDwoPDA0MDQwNDgsOCRAJEAkQBxAHEgUSBRQFFAMUAxQBFgEWARgAigEAFAISABICEgQQAhAEEAQQBg4GEAoOCg4MDg4ODgwSDgsMCwoJDAcMBwwFDgUMAw4DDgEOARABDgEQARIBEAASAHgAIAQeBB4GHAgaChoMGA4WDhYQFBISEhISDhQQFAwWDBYKFgoYBhgIGAQYBBgCGgAaABgBGAMYAxYHFgUWCRYJFAsUCxIPEg0SERARDhMOFQwVDBcIGQYbBhsCHQIfAR+dAgAADAAKAQoBCgEIAwgFBgUGBQYHBAUEBwQHAgcCBwIHAAcABwAHAQcBBwMHAwUDBwUFBQUHBQUBBwMJAQkBCQAJAJcBAAUCBQAFAgUEBQIDBAUEAwQDBgMEAQYDBgEGAAgBBgAKSeECAJ8BFi84HUQDQCAAmAKNAQAvExMx",
  "\"":"BgACAQUmwguEAgAAkwSDAgAAlAQBBfACAIACAACTBP8BAACUBA==",
  "''":"BgABAQUmwguEAgAAkwSDAgAAlAQ=",
  "(":"BgABAUOQBNwLDScNKw0rCysLLwsxCTEJMwc1BzcHNwM7AzsDPwE/AEEANwI1AjMEMwIzBjEGLwYvCC0ILQgrCCkKKQonCicMJbkCAAkqCSoHLAksBywFLgcuBS4FMAMwAzADMgEwATQBMgA0ADwCOgI6BDoEOAY4BjYINgg2CjQKMgoyCjIMMAwwDi7AAgA=",
  ")":"BgABAUMQ3Au6AgAOLQwvDC8KMQoxCjEKMwg1CDUGNQY3BDcEOQI5AjkAOwAzATEBMQExAy8DLwMvBS8FLQctBS0HKwktBykJKwkpswIADCYKKAooCioIKggsCC4ILgYwBjAGMgQ0AjQCNAI2ADgAQgFAAz4DPAM8BzgHOAc2CTQJMgsyCzALLg0sDSoNKg==",
  "+":"BgABAQ3IBOwGALcBuAEAANUBtwEAALcB0wEAALgBtwEAANYBuAEAALgB1AEA",
  "/":"BgABAQVCAoIDwAuyAgCFA78LrQIA",
  "4":"BgABAhDkBr4EkgEAEREApwJ/AADxARIR5QIAEhIA9AHdAwAA7ALIA9AG6gIAEREA8QYFqwIAAIIDwwH/AgABxAEA",
  "v":"BgABASDmA5AEPu4CROwBExb6AgAZFdMC0wgUFaECABIU0wLWCBcW+AIAExVE6wEEFQQXBBUEFwQVBBUEFwQVBBUEFwQVBBUEFwQXBBUEFwYA",
  ",":"BgABAWMYpAEADgIOAgwCDgQMBAoGDAYKBgoICAgICAgICAoGCgYKBAoEDAQKBAoCDAIKAgwCCgAKAAwACgEMAQoBCgMMAwoDCgUKBQgFCgUIBwYJCAcGCQYJBAsGCQQLAg0CCwINAg0AAwABAAMAAwADAQMAAwADAAMBBQAFAQcBBwEHAwcBCQMJAQsDCwMLAw0FDQMNBQ8FDwURBxMFEwkTBxcJFwkXswEAIMgBCQYJBgkGBwYJCAcIBQgHCgUKBQoFDAEMAwwBDgEOABA=",
  "-":"BgABAQUq0AMArALEBAAAqwLDBAA=",
  ".":"BgABAWFOrAEADgIOAg4CDgQMBAoGDAYKBgoICAgKCAgIBgoGCgYKBgoEDAQKBAwECgIMAAwCDAAMAAwBCgAMAQoDDAMKAwoDCgUKBQgFCgUIBwgJBgcICQYJBgsGCQQLAg0CDQINAA0ADQENAQ0BCwMNAwkFCwUJBQkHBwcJBwUHBwkFCQUJBQkDCwMJAwsDCQELAAsBCwALAAsCCQALAgkECwQJBAkECQYJBgcGBwgJBgcKBQgHCgUKBQwFCgEOAwwBDgEOAA4=",
  "0":"BgABAoMB+APaCxwAHAEaARoDFgMYBRYFFAcUBxIJEgkQCRALEAsOCwwNDA0MDQoPCg0IDwgPBhEGDwYRBA8EEQIRAhMCEQITABMA4QUAEQETAREBEQMRAxEFEQURBREHDwkPBw8JDwsNCw0LDQ0NDQsNCw8JEQkRCREJEwcTBxUFFQUVAxUDFwEXARkAGQAZAhcCFwQXBBUGEwYTCBMIEQoRCg8KDwoPDA0MDQ4NDgsOCQ4JEAkQBxAHEAUSBRIDEgMSAxIDEgESARQAEgDiBQASAhQCEgISBBIEEgYSBhIGEggQChAIEAoQDBAMDgwODg4ODA4MEgwQChIKEggUCBQIFgYWBBYGGAQYAhgCGgILZIcDHTZBEkMRHTUA4QUeOUITRBIePADiBQ==",
  "2":"BgABAWpUwALUA44GAAoBCAEKAQgDBgMGBQYFBgUEBwQFBAUCBwIHAgUABwAHAAUBBwMFAQcFBQMHBQUHBQcFBwMJAwkBCQELAQsAC68CAAAUAhIAFAISBBQCEgQUBBIEEgYUCBIGEAgSChAKEAoQDBAMDg4ODgwQDBIMEgoSChQIFggWCBgGGAQaAhwCHAIWABQBFgEUARQDFAMSAxQFEgUSBxIHEAkQCRALDgsODQ4NDA8KDwwRCBMKEwgTBhUGFwQXBBcEGwAbABsAHQEftwPJBdIDAACpAhIPzwYAFBIArgI=",
  "1":"BgABARCsBLALAJ0LEhERADcA2QEANwATABQSAOYIpwEAALgCERKEBAASABER",
  "3":"BgABAZ0B/gbEC/sB0QQOAwwBDAMMAwwFCgMKBQoFCgUIBwoFCAcICQgJBgkICQYLCAsECwYLBA0GDwINBA8CDwQRAhECEQITABUCFQAVAH0AEQETAREBEQETAxEDEQURBREFDwcRBw8JDwkNCQ8LDQsNDQsNCw0LDwsPCREJEQcRBxMFFQUVBRUDFwEXARkAGQAZAhkCFwQVBBUEEwYTCBEIEQgRCg0MDwoNDA0OCw4LDgkQCRAHEAkQBRAFEgUSAxIDFAMSAxYBFAEWARYAFqQCAAALAgkCCQQHAgcGBwYHBgUIBQYDCAMIAwYDCAEIAQgACAAIAAgCCAIIAgYCCAQIBAgGBgYEBgQIBAoCCgAKAAwAvAEABgEIAAYBBgMGAwQDBgMEBQQDBAUCBQQFAgUABwIFAJkBAACmAaIB3ALbAgAREQDmAhIRggYA",
  "5":"BgABAaAB0APgBxIAFAESABIBEgMSARADEgMQAxIFEAcOBRAHDgkOCQ4JDgsMCwwLCgsKDQoPCA0IDwgPBhEEEwYTAhMEFwIXABcAiQIAEwETABEBEQMTAxEDDwMRBQ8FDwUPBw8JDQcNCQ0LDQsLCwsNCw0JDwkPCREHEQcTBxMFEwMVAxcDGQEZARkAFwAVAhUCFQQTBBMGEwYRCBEIDwoPCg8KDQwNDA0MCw4LDgkOCRAJEAcOBxAHEgUQBRIDEAMSAxIBEgEUARIAFLgCAAAFAgUABQIFBAUCBQQDBAUEAwYDBgMIAwgBCAEIAQoACAAIAgYACAQGAgQEBgQEBAQGBAQCBgIGAgYCBgIIAAYA4AEABgEIAAYBBgMGAQQDBgMEAwQFBAMCBQQFAgUABwIFAPkBAG+OAQCCBRESAgAAAuYFABMRAK8CjQMAAJ8BNgA=",
  "7":"BgABAQrQBsILhQOvCxQR7wIAEhK+AvYIiwMAAKgCERKwBgA=",
  "6":"BgABAsYBnAOqBxgGFgYYBBYEFgIWABQBFgEUAxQDFAUUBRIFEAcSCRAJEAkOCw4NDgsMDQoPCg8KDwgRCBEGEQYRBBMCEwITAhUAkwIBAAERAREBEQEPAxEFEQMPBREFDwcPBw8HDwkNCQ0LDQsNCwsNCw0LDQkPCQ8JDwcRBxEHEwUTAxMFFQEXAxcBGQAVABUCEwIVBBMEEQYTBhEIEQgPChEKDQoPDA0MDQwNDgsOCxALDgkQCRAHEgcQBxIFEgUSBRIBFAMSARIBFAASAOIFABACEgIQAhIEEAQQBhIGEAYQCBAKEAgOChAMDgwMDA4ODA4MDgwODBAKEAoQChIIEggSBhQGFgYUAhYCGAIYABoAGAEYARYBFgMUBRQFEgUSBxAHEAcQCQ4LDgkMCwwNDA0KDQgPCg0GEQgPBhEEEQQRBBMEEwITAhMCFQIVABWrAgAACgEIAQoBCAEGAwYDBgUGBQQFBAUEBQQFAgUABwIFAAUABwEFAAUBBQMFAwUDBQMFBQMFAwUBBQEHAQkBBwAJAJcBDUbpBDASFi4A4AETLC8SBQAvERUrAN8BFC0yEQQA",
  "8":"BgABA9gB6gPYCxYAFAEUARYBEgMUBRQFEgUSBxIHEAcSCQ4JEAkOCw4LDgsMDQwNCg0KDQoPCg8IDwgPBhEGEQQPBBMCEQIRABMAQwAxAA8BEQEPAREDDwMRAw8FEQUPBxEJDwkPCQ8NDw0PDQ8IBwYHCAcGBwgHBgkGBwYJBgcECQYJBAkGCQQJBAsECwQLBA0CCwINAg8CDwIPAA8AaQATAREBEwERAxEFEQURBREHEQcPBw8JDwkPCw8LDQsNDQ0LCw0LDwsNCQ8JDwcPBw8HEQURAxEFEQMRARMBEwFDABEAEwIRAhEEEQQRBg8GEQgPCA8KDwoPCg0MDQwNDAsOCw4LDgkQCRAJDgkQBxIHEAcSBRADEgMUAxIBFAEUABQAagAOAhAADgIOAg4EDAIOBAwEDAQMBgwECgYMBAoGCAYKBgoGCggKBgoICgYICAoICA0MCwwLDgsOCRAHEAcQBxIFEgUSAxIDEgMSARABEgASADIARAASAhICEgQSAhIGEAYSBhAIEAgQCBAKDgoODA4MDgwMDgwODA4KEAwQCBIKEggSCBQIFAYUBBQEFgQWAhYCGAANT78EFis0EwYANBIYLgC0ARcsMRQFADERGS0AswELogHtAhcuNxA3DRkvALMBGjE6ETYSGDIAtAE=",
  "9":"BgABAsYBpASeBBcFFQUXAxUDFQEVABMCFQITBBMEEwYRBhMGDwgRCg8KDwoNDA0OCwwNDgkQCRAJEAcSBxIFEgUSAxQBFAEUARYAlAICAAISAhICEgQSAhAGEgQQBhIGEAgSCA4IEAoOChAMDAwODAwODA4MEAoOChAKEAgSCBIIFAYUBBQGFgIYBBgCGgAWABYBFAEWAxQDEgUUBRIHEgcQCRIJEAkOCw4LDgsODQwNDA0MDwoPCg8IDwgRCBEGEQYRBhEEEQITAhECEwARAOEFAA8BEQEPAREDDwMPBREFDwUPBw8JDwcNCQ8LDQsLCw0NCw0LDQsNCw8JEQkPCREHEQcTBRMFEwUTARUBFQEXABkAFwIXAhcCFQQTBhMGEQYRCA8IDwgNCg8MCwoLDAsOCQ4JDgkQBxAHEAUQBRIFEgMSAxQDFAEUAxQAFgEWABamAgAACwIJAgkCCQIHBAcEBwYFBgUGAwYDBgMGAQgBBgEIAAgABgIIAgYCBgQGBAYEBgYGBgQIBAgECAIKAgoCCgAMAJgBDUXqBC8RFS0A3wEUKzARBgAwEhYsAOABEy4xEgMA",
  ":":"BgACAWE0rAEADgIOAg4CDgQMBAoGDAYKBgoICAgKCAgIBgoGCgYKBgoEDAQKBAwECgIMAAwCDAAMAAwBCgAMAQoDDAMKAwoDCgUKBQgFCgUIBwgJBgcICQYJBgsGCQQLAg0CDQINAA0ADQENAQ0BCwMNAwkFCwUJBQkHBwcJBwUHBwkFCQUJBQkDCwMJAwsDCQELAAsBCwALAAsCCQALAgkECwQJBAkECQYJBgcGBwgJBgcKBQgHCgUKBQwFCgEOAwwBDgEOAA4BYQDqBAAOAg4CDgIOBAwECgYMBgoGCggICAoICAgGCgYKBgoGCgQMBAoEDAQKAgwADAIMAAwADAEKAAwBCgMMAwoDCgMKBQoFCAUKBQgHCAkGBwgJBgkGCwYJBAsCDQINAg0ADQANAQ0BDQELAw0DCQULBQkFCQcHBwkHBQcHCQUJBQkFCQMLAwkDCwEJAwsACwELAAsACwIJAAsECQILBAkECQQJBgkGBwYHCAkGBwoFCAcKBQoFDAUKAQ4DDAEOAQ4ADg==",
  "x":"BgABARHmAoAJMIMBNLUBNrYBMIQB1AIA9QG/BI4CvwTVAgA5hgFBwAFFxwE1fdUCAI4CwATzAcAE1AIA",
  ";":"BgACAWEslgYADgIOAg4CDgQMBAoGDAYKBgoICAgKCAgIBgoGCgYKBgoEDAQKBAwECgIMAAwCDAAMAAwBCgAMAQoDDAMKAwoDCgUKBQgFCgUIBwgJBgcICQYJBgsGCQQLAg0CDQINAA0ADQENAQ0BCwMNAwkFCwUJBQkHBwcJBwUHBwkFCQUJBQkDCwMJAwsBCQMLAAsBCwALAAsCCQALBAkCCwQJBAkECQYJBgcGBwgJBgcKBQgHCgUKBQwFCgEOAwwBDgEOAA4BYwjxBAAOAg4CDAIOBAwECgYMBgoGCggICAgICAgICgYKBgoECgQMBAoECgIMAgoCDAIKAAoADAAKAQwBCgEKAwwDCgMKBQoFCAUKBQgHBgkIBwYJBgkECwYJBAsCDQILAg0CDQADAAEAAwADAAMBAwADAAMAAwEFAAUBBwEHAQcDBwEJAwkBCwMLAwsDDQUNAw0FDwUPBREHEwUTCRMHFwkXCRezAQAgyAEJBgkGCQYHBgkIBwgFCAcKBQoFCgUMAQwDDAEOAQ4AEA==",
  "=":"BgACAQUawAUA5gHEBAAA5QHDBAABBQC5AgDsAcQEAADrAcMEAA==",
  "B":"BgABA2e2BMQLFgAUARQBFAEUAxIDEgUSBRIFEAcQBxAJDgkOCQ4LDgsMCwwNDA0KDQgNCg0IDwYPBg8GDwQRBBEEEQIRAhMAEwAHAAkABwEHAAkBCQAHAQkBCQEHAQkBCQMJAwcDCQMJAwkFBwUJAwkHCQUHBQkHCQcJBwcHBwkHBwcJBwsHCQUQBQ4FDgcOCQ4JDAkMCwoNCg0IDwgRBhMEFQQXAhcCGwDJAQEvAysFJwklDSMPHREbFRkXFRsTHw8fCyUJJwcrAy0B6wMAEhIAoAsREuYDAAiRAYEElgEAKioSSA1EOR6JAQAA0wEJkAGPBSwSEiwAzAETKikSjwEAAMUCkAEA",
  "A":"BgABAg/KBfIBqQIAN98BEhHzAgAWEuwCngsREvwCABMR8gKdCxIR8QIAFBI54AEFlwGCBk3TA6ABAE3UAwMA",
  "?":"BgACAe4BsgaYCAAZABkBFwEXBRUDEwUTBxEHEQcPCQ8JDQkNCQ0LCwsLCwsLCQsJCwcNBwsHDQcLBQsFDQULAwkFCwMLAwkDCQMBAAABAQABAAEBAQABAAEAAQABAAABAQAAAQEAEwcBAQABAAMBAwADAAUABQAFAAcABwAFAAcABwAFAgcABQAHAAUAW7cCAABcABgBFgAUAhQAFAISAhACEAIQBA4EDgQMBgwGDAYMBgoICgYKCAgKCggICAgKBgoICgYMCAwGDAgOBg4GEAYQBgIAAgIEAAICBAACAgQCBAIKBAoGCAQKBggIBgYICAYIBggGCgQIBAoECAQKAggCCgIKAAgACgAKAAgBCAEKAwgDCAMIAwgFBgMIBQYHBAUGBQQFBAcCBQQHAgcCCQIHAgkCBwAJAgkACQAJAAkBCQAJAQsACQELAQsDCwELAwsDCwMLAwsDCwULAwsFCwMLBV2YAgYECAQKBAwGDAQMBhAIEAYSBhIIEgYUBhIEFgYUBBYEFgQWAhgCFgIYABYAGAAYARgBGAMWBRYHFgcWCRYLFA0IBQYDCAUIBwYFCAcGBwgHBgcICQYJCAkGCQYJCAsGCwYLBgsGDQYNBA0GDQQNBA8EDwQPAg8EEQIRAhEAEQITAWGpBesGAA4CDgIOAg4EDAQKBgwGCgYKCAgICggICAYKBgoGCgYKBAwECgQMBAoCDAAMAgwADAAMAQoADAEKAwwDCgMKAwoFCgUIBQoFCAcICQYHCAkGCQYLBgkECwINAg0CDQANAA0BDQENAQsDDQMJBQsFCQUJBwcHCQcFBwcJBQkFCQUJAwsDCQMLAwkBCwALAQsACwALAgkACwIJBAsECQQJBAkGCQYHBgcICQYHCgUIBwoFCgUMBQoBDgMMAQ4BDgAO",
  "C":"BgABAWmmA4ADAAUCBQAFAgUEBQIDBAUEAwQDBgMEAQYDBgEGAAgBBgDWAgAAwQLVAgATABMCEQITBBEEEQQRBhEIEQgPCA8KDwoNCg0MDQwNDAsOCw4LDgkOCxAHEAkQBxIHEgUSBRIDEgEUARIBFAAUAMIFABQCFAISBBQEEgQSBhIIEggSCBAKEAoQCg4MDgwODA4ODA4MDgwQDA4KEggQChIIEggSBhIGFAQSAhQCEgIUAMYCAADBAsUCAAUABwEFAAUBBQMDAQUDAwMDAwMFAQMDBQEFAAUBBwAFAMEF",
  "L":"BgABAQmcBhISEdkFABIQALQLwgIAAIEJ9AIAAK8C",
  "D":"BgABAkeyBMQLFAAUARIBFAESAxIDEgMSBRIFEAcQBxAHDgkOCQ4LDgsMCwwNDA0KDwoPCg8IDwgRCBEGEwQTBBMEEwIVAhUAFwDBBQAXARcBFwMTAxUDEwUTBxEHEQcPCQ8JDwkNCw0LCwsLDQsNCQ0JDQcPBw8HDwcRBREFEQMRAxEDEwERARMBEwDfAwASEgCgCxES4AMACT6BAxEuKxKLAQAAvwaMAQAsEhIsAMIF",
  "F":"BgABARGABoIJ2QIAAIECsgIAEhIA4QIRErECAACvBBIR5QIAEhIAsgucBQASEgDlAhES",
  "E":"BgABARRkxAuWBQAQEgDlAhES0QIAAP0BtgIAEhIA5wIRFLUCAAD/AfACABISAOUCERLDBQASEgCyCw==",
  "G":"BgABAZsBjgeIAgMNBQ8FDQUNBQ0HCwcNBwsHCwkLCQsJCwsJCwsLCQsJDQkLBw0HDwcNBw8FDwUPAw8DEQMPAxEBEQERARMBEQAXABUCFwIVAhMEFQQTBhMGEwYRCBEIDwoRCg8KDwwNDA0MDQ4LDgkQCRAJEAcQBxIFEgUUBRQDFAMUARYBFgEYAMoFABQCFAASBBQCEgQSBBIEEgYSBhAGEAgQCBAKDgoOCg4MDgwMDgwOChAKEAoSCBIIFAgUBhQEGAYWAhgEGAIaAOoCAAC3AukCAAcABwEFAQUBBQMFAwMFAwUDBQEFAQcBBQEFAQUABwAFAMUFAAUCBwIFAgUCBQQFBAMGBQYDBgUGAwgDBgMIAQgDCAEIAQoBCAEIAAgACgAIAAgCCAIIAggECgQGBAgECAYIBgC6AnEAAJwCmAMAAJcF",
  "H":"BgABARbSB7ILAQAAnwsSEeUCABISAOAE5QEAAN8EEhHlAgASEgCiCxEQ5gIAEREA/QPmAQAAgAQPEOYCABER",
  "I":"BgABAQmuA7ILAJ8LFBHtAgAUEgCgCxMS7gIAExE=",
  "J":"BgABAWuqB7ILALEIABEBEwERAREDEwMRAxEFEQURBw8HEQcPCQ0LDwsNCw0NDQ0LDwsPCxEJEQkTCRMJFQcVBxcFFwMZAxsBGwEbAB8AHQIbAhsEGQYXBhcGFQgTCBMKEwoRDA8KDwwNDA0OCw4LDgkQCRAJEAcQBRIFEgUSAxQDEgESARIBFAESABIAgAEREtoCABERAn8ACQIHBAcEBwYHBgUIBQoDCgMKAwoDDAEKAQwBCgEMAAwACgAMAgoCDAIKBAoECgYKBggGBgYGCAQGBAgCCgAIALIIERLmAgAREQ==",
  "M":"BgACAQRm1gsUABMAAAABE5wIAQDBCxIR5QIAEhIA6gIK5gLVAe0B1wHuAQztAgDhAhIR5QIAEhIAxAsUAPoDtwT4A7YEFgA=",
  "K":"BgABAVXMCRoLBQsDCQMLAwsDCwMLAwsBCwELAQsBCwELAQ0ACwELAAsADQALAg0ACwILAA0CCwILAgsCDQQLBAsECwYNBAsGCwYLCAsGCwgJCgsICQoJCgkMCQwJDAkOCRALEAkQCRKZAdICUQAAiwQSEecCABQSAKALExLoAgAREQC3BEIA+AG4BAEAERKCAwAREdkCzQXGAYUDCA0KDQgJCgkMBwoFDAUMAQwBDgAMAg4CDAQOBAwGDghmlQI=",
  "O":"BgABAoMBsATaCxwAHAEaARoDGgMYBRYFFgcWBxQJEgkSCRILEAsODQ4NDg0MDwoNDA8KDwgPCBEIDwYRBg8GEQQRAhMCEQITABMA0QUAEQETAREBEQMTBREFEQURBxEHDwcRCQ8LDQsPCw0NDQ0NDwsPCw8LEQkTCRMJEwkVBxUHFwUXAxkDGQEbARsAGwAZAhkCGQQXBhcGFQYVCBUIEwoRChEMEQoRDA8MDQ4NDg0OCxAJEAsQCRAHEgcSBxIFFAMSAxIDEgEUARIAEgDSBQASAhQCEgISBBIEEgYSBhIIEggQCBAKEgwODBAMEA4ODg4QDhIMEAwSChQKFAgUCBYIFgYYBBoGGgQcAh4CHgILggGLAylCWxZbFSlBANEFKklcGVwYKkwA0gU=",
  "N":"BgABAQ+YA/oEAOUEEhHVAgASEgC+CxQAwATnBQDIBRMS2AIAExEAzQsRAL8ElgU=",
  "P":"BgABAkqoB5AGABcBFQEVAxMDEwMTBREHEQcRBw8JDwkNCQ0LDQsNCwsNCw0JDQkNCQ8HDwcPBxEFEQURAxEDEQMTAREBEwETAH8AAIMDEhHlAgASEgCgCxES1AMAFAAUARIAFAESAxIDEgMSAxIFEAUQBRAHDgkOCQ4JDgsMCwwNDA0KDQoNCg8IDwgRCBEGEwQTBBUEFQIXAhkAGQCzAgnBAsoCESwrEn8AANUDgAEALBISLgDYAg==",
  "R":"BgABAj9msgsREvYDABQAFAESARQBEgESAxIDEgUSBRAFEAcQBw4JDgkOCQ4LDAsMDQwLCg0KDwoNCA8IDwgPBhEEEwYTAhMEFQIXABcAowIAEwEVARMDEwMTBRMFEQcTBxELEQsRDQ8PDREPEQ0VC8QB/QMSEfkCABQSiQGyA3EAALEDFBHnAgASEgCgCwnCAscFogEALhISLACqAhEsLRKhAQAApQM=",
  "Q":"BgABA4YBvAniAbkB8wGZAYABBQUFAwUFBQUHBQUDBwUFBQcFBQMHBQcDBwUJAwcDCQMJAwkDCQMJAQsDCwMLAQsDCwENAw0BDQEPAA8BDwAPABsAGwIZAhcEGQQXBBUGFQgVCBMIEQoTChEKDwwPDA8ODQ4NDgsQCxAJEAkQBxIHEgUSBRQFFAMUARQDFAEWABYAxgUAEgIUAhICEgQSBBIGEgYSCBIIEAgQChIMDgwQDBAODg4OEA4SDBAMEgoUChQIFAgWCBYGGAQaBhoEHAIeAh4CHAAcARoBGgMaAxgFFgUWBxYHFAkSCRIJEgsQCw4NDg0ODQwPCg0MDwoPCA8IEQgPBhEGDwYRBBECEwIRAhMAEwC7BdgBrwEImQSyAwC6AylAWxZbFSk/AP0BjAK7AQeLAoMCGEc4J0wHVBbvAaYBAEM=",
  "S":"BgABAYMC8gOEBxIFEgUQBxIFEgcSBxIJEgcSCRIJEAkQCRALEAsOCw4NDg0MDQ4PDA0KEQoPChEKEQgRCBMGFQQTBBcCFQAXABkBEwARAREBEQMPAQ8DDwMPAw0DDQUNAw0FCwULBwsFCwUJBwsFCQcHBQkHCQUHBwcHBwUHBwUFBQcHBwUHAwcFEQsRCxMJEwkTBxMFEwUVBRUDFQMVARMBFwEVABUAFQIVAhUCFQQVBBUEEwYVBhMIEwgTCBMIEwgRCBMKEQgRCmK6AgwFDgUMAw4FEAUOBRAFEAUQBRAFEAMSAw4DEAMQAxABEAEOAQ4AEAIMAg4CDgQMBAwGCggKCAoKBgwGDgYQBBACCgAMAAoBCAMKBQgFCAcIBwgJCAsGCQgLCA0IDQgNCA8IDQgPCA8IDwgPChEIDwgPCBEKDwoPDBEMDwwPDg8ODw4NEA0QCxALEgsSCRIHEgcUBRQFGAUYAxgBGgEcAR4CJAYkBiAIIAweDBwQHBAYEhgUFBYUFhQWEBoQGg4aDBwKHAoeBh4GIAQgAiACIgEiASIFIgUiBSAJIgkgCyINZ58CBwQJAgkECwQLAgsECwINBA0CDQQNAg0CDQALAg0ADQANAAsBCwELAQsDCwULBQkFCQcHBwcJBwkFCwMLAw0BDQENAAsCCwQLBAkGCQgJCAkKBwoJCgcMBQoHDAcMBQwF",
  "V":"BgABARG2BM4DXrYEbKwDERL0AgAVEesCnQsSEfsCABQS8QKeCxES8gIAExFuqwNgtQQEAA==",
  "T":"BgABAQskxAv0BgAAtQKVAgAA+wgSEeUCABISAPwImwIAALYC",
  "U":"BgABAW76B7ALAKMIABcBFwMXARUFFQUTBxMHEwkRCREJEQsPDQ0LDw0NDwsPCw8LEQkPCRMJEQcTBxMFEwUVBRUDEwMXARUBFQEXABUAEwIVAhMCFQQTBBUEEwYTBhMIEwgRChEIEQwRDA8MDw4PDg0OCxANEAsSCRIJEgcUBxQHFAMWBRYBGAEYARgApggBAREU9AIAExMAAgClCAALAgkECQQHBAcIBwgHCAUKBQoDCgMKAwwBCgEMAQwADAAMAgoCDAIKAgoECgQKBggGCAYICAYKBAgCCgIMAgwApggAARMU9AIAExM=",
  "X":"BgABARmsCBISEYkDABQSS54BWYICXYkCRZUBEhGJAwAUEtYCzgXVAtIFExKIAwATEVClAVj3AVb0AVKqAREShgMAERHXAtEF2ALNBQ==",
  "W":"BgABARuODcQLERHpAp8LFBHlAgASEnW8A2+7AxIR6wIAFBKNA6ALERKSAwATEdQB7wZigARZ8AIREugCAA8RaKsDYsMDXsoDaqYDExLqAgA=",
  "Y":"BgABARK4BcQLhgMAERHnAvMGAKsEEhHnAgAUEgCsBOkC9AYREoYDABERWOEBUJsCUqICVtwBERI=",
  "Z":"BgABAQmAB8QLnwOBCaADAADBAusGAMgDggmhAwAAwgLGBgA=",
  "`":"BgABAQfqAd4JkQHmAQAOlgJCiAGpAgALiwIA",
  "c":"BgABAW3UA84GBQAFAQUABQEFAwMBBQMDAwMDAwUBAwMFAQUABQEHAAUAnQMABQIFAAUCBQQFAgMEBQQDBAMGAwQBBgMGAQYABgEGAPABABoMAMsCGw7tAQATABMCEwARAhMEEQIPBBEEDwQPBg8IDwYNCA0KDQoNCgsMCwwLDAkOCRAHDgcQBxIFEgUUBRQDFAEWAxgBGAAYAKQDABQCFAISBBQCEgYSBhAGEggQCBAIEAoQCg4MDAwODAwODAwKDgwQCg4IEAgQCBAIEAYSBhIGEgQSAhQCFAIUAOABABwOAM0CGQzbAQA=",
  "a":"BgABApoB8AYCxwF+BwkHCQcJCQkHBwkHBwcJBQkFBwUJBQkFCQMHBQkDCQMJAwcDCQEHAQkBBwEJAQcABwAHAQcABQAHAAUBBQAFABMAEwITAhEEEwQPBBEGDwgPCA0IDwoLCg0KCwwLDAsMCQ4JDgkOBw4HEAcQBRAFEAUSAxADEgESAxIBFAESABQAFAISAhQCEgQSBBIEEgYSBhIIEAgQChAIDgwODA4MDg4MDgwODBAMEAoSCBIKEggUCBQGFgYWBBgEGAIaAhoAcgAADgEMAQoBCgEIAwgDBgUEBQQFBAcCBwIHAgkCCQAJAKsCABcPAMwCHAvCAgAUABYBEgAUARIDFAMQAxIDEAUSBQ4FEAcOCRAJDAkOCwwLDA0MCwoNCg8IDwgPCA8GEQYRBhMEEwIXAhUCFwAZAIMGFwAKmQLqA38ATxchQwgnGiMwD1AMUDYAdg==",
  "b":"BgABAkqmBIIJGAAYARYBFgEUAxQDEgUSBRIFEAcQCQ4HDgkOCw4LDAsMDQoNCg0KDQgPBg8GDwYRBBEEEQQTBBECEwIVAhMAFQD/AgAZARcBFwEXAxUDEwUTBREFEQcPBw8JDwkNCQ0LDQsLCwsNCQ0JDQcPBw8HDwURAxEDEQMTAxMBEwMVARUAFQHPAwAUEgCWCxEY5gIAERkAowKCAQAJOvECESwrEn8AAJsEgAEALBISLgCeAw==",
  "d":"BgABAkryBgDLAXAREQ8NEQ0PDREJDwkRBw8FDwURAw8DDwERAw8BEQEPACMCHwQfCB0MGw4bEhcUFxgVGhEeDSANJAkmBSgDKgEuAIADABYCFAIUAhQCFAQUBBIGEgYSBhAIEAgQCBAKDgoODAwMDAwMDgoOCg4KEAgQCBIGEgYSBhQEFgQWBBYCGAIYAHwAAKQCERrmAgARFwCnCxcADOsCugJGMgDmA3sAKxERLQCfAwolHBUmBSQKBAA=",
  "e":"BgABAqMBigP+AgAJAgkCCQQHBAcGBwYFCAUIBQgDCgMIAQoDCAEKAQoACgAKAAoCCAIKAggECgQIBAgGCAYGBgQIBAoECAIKAAyiAgAAGQEXARcBFwMVBRMFEwURBxEHDwcPCQ8LDQkNCwsNCw0LDQkNBw8JDwcPBQ8FEQURAxEDEwMTAxMBFQAVARcALwIrBCkIJwwlDiESHxQbGBkaFR4TIA0iCyQJKAMqASwAggMAFAIUABIEFAISBBIEEgQSBhIGEAgQCBAIEAoODA4MDgwODgwQDBAKEAoSChIIFAgUCBYGGAQYBhoCGgQcAh4ALgEqAygFJgkkDSANHhEaFRgXFBsSHQ4fDCUIJwQpAi0AGQEXAxcDFQcTBRMJEQkPCw8LDQ0PDQsNDQ8LEQsRCxEJEwkTCRMJEwcTBxUHFQUVBRUHFQUVBRUHFwcVBRUHCs4BkAMfOEUURxEfMwBvbBhAGBwaBiA=",
  "h":"BgABAUHYBJAGAAYBBgAGAQYDBgEEAwYDBAMEBQQDAgUEBQIFAAUCBQB1AAC5BhIT5wIAFhQAlAsRGOYCABEZAKMCeAAYABgBFgEWARQDFAMSBRIFEgUQBxAJDgcOCQ4LDgsMCwwNCg0KDQoNCA8GDwYPBhEEEQQRBBMEEQITAhUCEwAVAO0FFhPnAgAUEgD+BQ==",
  "g":"BgABArkBkAeACQCNCw8ZERkRFxEVExMVERUPFQ8XDRcLGQkZBxsFGwUdAR0BDQALAA0ADQINAAsCDQANAg0CDQILAg0EDQINBA0GDQQNBg0EDQYNCA0GDwgNCA0IDQgPCg0KDwwNDA8MDw4PDqIB7gEQDRALEAkQCQ4JEAcOBw4FDgUOAwwFDgMMAQwBDAEMAQwACgEKAAoACAIIAAgCCAIGAggCBgIGBAYCBgQEAgYEAqIBAQADAAEBAwADAAMABQADAAUAAwAFAAMABQAFAAMABQA3ABMAEwIRAhMCEQQRBBEEEQYRBg8IDwgPCA0KDQoNCg0MCwwLDgsOCQ4JDgkQBxAHEgcSBRIDFAMWAxQBFgEYABgA/gIAFgIWAhQEFgQUBBIGFAgSCBIIEAoSChAKDgwODA4MDg4MDgwODA4KEAgQCBAIEgYSBhIEEgYSBBQCEgIUAhQCOgAQABABDgEQAQ4BEAMOAw4FDgUOBQwFDgcMBQ4HDAkMB4oBUBgACbsCzQYAnAR/AC0RES0AnQMSKy4RgAEA",
  "f":"BgABAUH8A6QJBwAHAAUABwEFAQcBBQEFAwUDBQMDAwMDAwUDAwMFAQUAwQHCAQAWEgDZAhUUwQEAAOMEFhftAgAWFADKCQoSChIKEAoQCg4KDgwOCgwMDAoKDAwMCgwIDAgMCAwIDAYOCAwEDgYMBA4GDAIOBA4CDgQOAg4CDgAOAg4ADgC2AQAcDgDRAhkQowEA",
  "i":"BgACAQlQABISALoIERLqAgAREQC5CBIR6QIAAWELyAoADgIOAgwEDgIKBgwGCgYKCAoGCAgICggIBggGCgYKBAoECgQMBAoCDAIMAgwCDAAMAAwADAEMAQoBDAMKAwoDCgUKBQgFCgUIBwgHCAcICQgJBgkECwQJBA0CCwANAA0ADQELAQ0BCwMJBQsFCQUJBwkFBwcHBwcJBQcFCQUJBQkDCQMLAwkBCwELAQsACwALAAsCCwILAgkCCwIJBAkECQQJBgcGCQYHCAcIBwgHCgUKBQwFCgMMAQwBDgEMAA4=",
  "j":"BgACAWFKyAoADgIOAgwEDgIKBgwGCgYKCAoGCAgICggIBggGCgYKBAoECgQMBAoCDAIMAgwCDAAMAAwADAEMAQoBDAMKAwoDCgUKBQgFCgUIBwgHCAcICQgJBgkECwQJBA0CCwANAA0ADQELAQ0BCwMJBQsFCQUJBwkFBwcHBwcJBQcFCQUJBQkDCQMLAwkBCwELAQsACwALAAsCCwILAgkCCwIJBAkECQQJBgcGCQYHCAcIBwgHCgUKBQwFCgMMAQwBDgEMAA4BO+YCnwwJEQkRCQ8JDwsNCQ0LDQkLCwsJCQsLCQkLBwsHCwcLBwsFCwcNAwsFDQMLBQ0BDQMNAQ0DDQENAQ0ADQENAA0AVwAbDQDSAhoPQgAIAAgABgAIAgYCCAIGAgYEBgQGBAQEBAQEBgQEBAYCBgC4CRES6gIAEREAowo=",
  "k":"BgABARKoA/QFIAC0AYoD5gIAjwK5BJICwwTfAgDDAbIDFwAAnwMSEeUCABISAJILERLmAgAREQCvBQ==",
  "n":"BgABAW1yggmQAU8GBAgEBgQGBgYCCAQGBAYEBgQIAgYECAQGAggEBgIIBAgCCAQIAggCCAIIAgoACAIKAAgCCgAKAgoADAAKAgwAFgAWARQAFAEUAxQDFAMSAxIFEgUQBRIHEAkOBxAJDgsOCwwLDA0MDQoPCA8IEQgRBhEGEwYVBBUEFQIXAhkCGQDtBRQR5QIAFBAA/AUACAEIAQYBCAMGBQQFBgUEBwQFBAcCBwIHAgcCCQIHAAcACQAHAQcABwMHAQUDBwMFAwUFBQUDBQEFAwcBBwAHAPkFEhHjAgASEgDwCBAA",
  "m":"BgABAZoBfoIJigFbDAwMCg4KDggOCA4IDgYQBhAGEAQQBBAEEAISAhACEgAmASQDJAciCyANHhEcFRwXDg4QDBAKEAwQCBAKEggSBhIGEgYSBBQEEgIUAhICFAAUABQBEgEUARIDEgMSAxIFEgUQBxAHEAcQBw4JDgkOCw4LDAsMDQoNCg8KDwgPCBEIEQYRBBMEEwQTAhMCFQAVAP0FEhHlAgASEgCCBgAIAQgBBgEGAwYFBgUEBQQHBAUEBwIHAgcCBwIJAAcABwAJAAcBBwEHAQUBBwMFAwUDBQMDBQMFAwUBBQEHAQcAgQYSEeUCABISAIIGAAgBCAEGAQYDBgUGBQQFBAcEBQQHAgcCBwIHAgkABwAHAAkABwEHAQcBBQEHAwUDBQMFAwMFAwUDBQEFAQcBBwCBBhIR5QIAEhIA8AgYAA==",
  "l":"BgABAQnAAwDrAgASFgDWCxEa6gIAERkA0wsUFw==",
  "y":"BgABAZ8BogeNAg8ZERkRFxEVExMVERUPFQ8XDRcLGQkZBxsFGwUdAR0BDQALAA0ADQINAAsCDQANAg0CDQILAg0EDQINBA0GDQQNBg0EDQYNCA0GDwgNCA0IDQgPCg0KDwwNDA8MDw4PDqIB7gEQDRALEAkQCQ4JEAcOBw4FDgUOAwwFDgMMAQwBDAEMAQwACgEKAAoACAIIAAgCCAIGAggCBgIGBAYCBgQEAgYEAqIBAQADAAEBAwADAAMABQADAAUAAwAFAAMABQAFAAMABQA3ABMAEwIRABECEwQRAg8EEQQPBBEGDwgNCA8IDQgNCg0MDQwLDAkOCw4JDgcQBxAHEgUSBRQFFAMWARgDGAEaABwA9AUTEuQCABEPAP8FAAUCBQAFAgUEBQIDBAUEAwQDBgMEAQYDBgEGAAgBBgCAAQAAvAYREuICABMPAP0K",
  "q":"BgABAmj0A4YJFgAWARQAEgESAxADEAMOAw4FDgUMBQ4HDgcOBwwJDgmeAU4A2QwWGesCABYaAN4DAwADAAMBAwADAAUAAwADAAMABQAFAAUABwAHAQcACQAVABUCFQATAhUCEwQRAhMEEQQRBhEGDwgPCA8IDQoNDA0MCwwLDgkOCRAJEAkQBxIHEgUUBRYDFgMYARoBGgAcAP4CABYCFgIWBBYEFAQSBhQIEggSCBAKEgoQDA4MDgwODg4ODBAMDgwQChIIEAoSCBIGEgYUBhQEFAQWAhYCFgIWAApbkQYSKy4ReAAAjARTEjkRHykJMwDvAg==",
  "p":"BgABAmiCBIYJFgAWARYBFAEWAxQDEgUUBRIFEgcSBxAJEAkQCQ4LDgsOCwwNDA0KDwoPCg8IEQgRCBEGEwQTBhMCFQQVAhUAFQD9AgAbARkBFwMXAxcDEwUTBxMHEQcRCQ8JDQsNCw0LCw0LDQkPCQ0JDwURBxEFEQURAxMDEQMTARUBEwEVARUBFQAJAAcABwAFAAcABQAFAAMAAwADAAUAAwIDAAMAAwIDAADdAxYZ6wIAFhoA2gyeAU0OCgwIDgoMCA4GDgYMBg4GDgQQBBAEEgQUAhQCFgIWAApcoQMJNB8qNxJVEQCLBHgALhISLADwAg==",
  "o":"BgABAoMB8gOICRYAFgEWARQBFgMUAxIDFAUSBRIHEgcQBxAJEAkOCw4LDgsMDQwNCg8KDwoPCg8IEQgRBhMGEwQTBBMCFQIVABcAiwMAFwEVARUDEwMTAxMFEwcRBxEHDwkPCQ8LDQsNCw0NCw0LDwkNCw8HEQkPBxEHEQcRBRMFEwMTAxUDFQEVABUAFQAVAhUCFQITBBMEEwYTBhEGEQgRCA8KDwoPCg0KDQwNDAsOCw4JDgkQCRAJEgcSBxIFFAUUAxQDFgEWARYAFgCMAwAYAhYCFgQUBBQEFAYUCBIIEggQChAKEAwODA4MDg4MDgwQCg4KEgoQChIIEggSBhQGEgYUBBYEFAIWAhYCFgALYv0CHTZBFEMRHTcAjwMcNUITQhIiOACQAw==",
  "r":"BgACAQRigAkQAA8AAAABShAAhAFXDAwODAwKDgoOCBAIDgYQBhAEEAQQBBAEEAISABACEAAQAA4BEAAQARADEAEQAxADEAUSBRIHFAcUCxQLFA0WDVJFsQHzAQsMDQwLCgkICwgLCAkGCQYJBAkGBwIJBAcCBwQHAAcCBwAFAgcABQAHAQUABQEFAQUBBQEDAQUBAwMDAQMDAwEAmwYSEeMCABISAO4IEAA=",
  "u":"BgABAV2KBwGPAVANCQsHDQcNBw0FCwUNBQ0FDQMPAw8DEQMTARMBFQEVABUAFQITABMEEwITBBMEEQQRBhEGDwYRCA8KDQgPCg0MDQwLDAsOCRALDgcQBxIHEgUUBRQFFAMWAxgBGAEYARoA7gUTEuYCABMPAPsFAAcCBwIFBAcCBQYDBgUGAwgDBgMIAQgBCAEIAQoBCAAIAAoACAIIAggCCAIGBAgEBgQGBgYGBAYCBgQIAggACAD6BRES5AIAEREA7wgPAA==",
  "s":"BgABAasC/gLwBQoDCgMMBQ4DDgUOBRAFEAUSBRAHEgcQCRIJEAkSCxALEAsQDRANDg0ODw4PDA8MDwoRChEIEwYTBBcCFQIXABkBGQEXAxcFFQUTBRMHEwcRCREJDwkNCQ8LDQ0LCwsNCw0JDQkPBw8HDwUPBREDEQMRAREDEQETABEBEwARABMADwIRABECEQIRBBMCEwQVBBUEFQYVBhMIFwgVChUKFQxgsAIIAwYDCAMKAQgDCAMKAQoDCgEKAwoBCgMKAQwDCgEKAwoBDAMKAQoBCgEMAQoACgEKAAoBCgAKAQgACgAIAQgABgoECAIKAgoCCgAMAQoBDAUEBwIHBAcEBwIHBAkECQQJBAkECQYLBAkGCwYJBgsGCwYJCAsGCwgJBgsICQgLCAkICwgJCgkKCQoJCgcKCQwHDAcMBwwFDAcMAw4FDAMOAw4BDgMQARAAEAESABIAEgIQAg4CDgIOBA4CDgQMBAwEDAQMBgoECgYKBgoGCgYIBggGCAgIBggGBgYIBgYGBgYGBgYGBAgGBgQIBAYECAQQChIIEggSBhIEEgQSBBQCFAISABQAEgASABIAEgESARIBEAEQAxIDDgMQAxADDgUOBQwDDAMMAwoDCAMIAQYBe6cCAwIDAgUAAwIFAgUCBwIFAgcCBQIHAgUCBwIHAAUCBwIHAgUABwIHAgcABQIHAAcCBwAFAgUABQIFAAUABQIDAAEAAQABAQEAAQEBAQEBAQEBAQEDAQEAAwEBAQMAAwEDAAMBAwADAQMAAwABAQMAAwADAAEAAwIBAAMCAQQDAgE=",
  "t":"BgABAUe8BLACWAAaEADRAhsOaQANAA0ADwINAA0CDQANAg0CDQINBA0CCwYNBA0GCwYNBgsIDQgLCAsKCwgJDAsKCQwJDAkOCQ4HEAcSBxIHEgUUAOAEawAVEQDWAhYTbAAAygIVFOYCABUXAMUCogEAFhQA1QIVEqEBAADzAwIFBAMEBQQDBAMEAwYDBgMGAwYBCAEGAQgBBgEIAAgA",
  "w":"BgABARz8BsAEINYCKNgBERLuAgARD+8B3QgSEc0CABQSW7YCV7UCFBHJAgASEpMC3AgREvACABERmAHxBDDaAVeYAxES7gIAEREo1QE81wIIAA==",
  "z":"BgABAQ6cA9AGuQIAFw8AzAIaC9QFAAAr9wKjBuACABYQAMsCGQyZBgCaA9AG"
   }';
BEGIN

  IF font IS NULL THEN
    font := font_default;
  END IF;

  -- For character spacing, use m as guide size
  geom := ST_GeomFromTWKB(decode(font->>'m', 'base64'));
  m_width := ST_XMax(geom) - ST_XMin(geom);
  spacing := m_width / 12;

  letterarray := regexp_split_to_array(replace(letters, ' ', E'\t'), E'');
  FOREACH letter IN ARRAY letterarray
  LOOP
    geom := ST_GeomFromTWKB(decode(font->>(letter), 'base64'));
    -- Chars are not already zeroed out, so do it now
    geom := ST_Translate(geom, -1 * ST_XMin(geom), 0.0);
    -- unknown characters are treated as spaces
    IF geom IS NULL THEN
      -- spaces are a "quarter m" in width
      width := m_width / 3.5;
    ELSE
      width := (ST_XMax(geom) - ST_XMin(geom));
    END IF;
    geom := ST_Translate(geom, position, 0.0);
    -- Tighten up spacing when characters have a large gap
    -- between them like Yo or To
    adjustment := 0.0;
    IF prevgeom IS NOT NULL AND geom IS NOT NULL THEN
      dist = ST_Distance(prevgeom, geom);
      IF dist > spacing THEN
        adjustment = spacing - dist;
        geom := ST_Translate(geom, adjustment, 0.0);
      END IF;
    END IF;
    prevgeom := geom;
    position := position + width + spacing + adjustment;
    wordarr := array_append(wordarr, geom);
  END LOOP;
  -- apply the start point and scaling options
  wordgeom := ST_CollectionExtract(ST_Collect(wordarr));
  wordgeom := ST_Scale(wordgeom,
                text_height/font_default_height,
                text_height/font_default_height);
  return wordgeom;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.st_letters(text, json) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_letters(text, json) TO "admin";

-- DROP FUNCTION public.st_linecrossingdirection(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_linecrossingdirection(line1 geometry, line2 geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$ST_LineCrossingDirection$function$
;

-- Permissions

ALTER FUNCTION public.st_linecrossingdirection(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linecrossingdirection(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_lineextend(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_lineextend(geom geometry, distance_forward double precision, distance_backward double precision DEFAULT 0.0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$geometry_line_extend$function$
;

-- Permissions

ALTER FUNCTION public.st_lineextend(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_lineextend(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_linefromencodedpolyline(text, int4);

CREATE OR REPLACE FUNCTION public.st_linefromencodedpolyline(txtin text, nprecision integer DEFAULT 5)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$line_from_encoded_polyline$function$
;

-- Permissions

ALTER FUNCTION public.st_linefromencodedpolyline(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linefromencodedpolyline(text, int4) TO "admin";

-- DROP FUNCTION public.st_linefrommultipoint(geometry);

CREATE OR REPLACE FUNCTION public.st_linefrommultipoint(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_line_from_mpoint$function$
;

-- Permissions

ALTER FUNCTION public.st_linefrommultipoint(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linefrommultipoint(geometry) TO "admin";

-- DROP FUNCTION public.st_linefromtext(text);

CREATE OR REPLACE FUNCTION public.st_linefromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1)) = 'LINESTRING'
	THEN public.ST_GeomFromText($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_linefromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linefromtext(text) TO "admin";

-- DROP FUNCTION public.st_linefromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_linefromtext(text, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1, $2)) = 'LINESTRING'
	THEN public.ST_GeomFromText($1,$2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_linefromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linefromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_linefromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_linefromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_linefromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linefromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_linefromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_linefromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_linefromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linefromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_lineinterpolatepoint(geography, float8, bool);

CREATE OR REPLACE FUNCTION public.st_lineinterpolatepoint(geography, double precision, use_spheroid boolean DEFAULT true)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_line_interpolate_point$function$
;

-- Permissions

ALTER FUNCTION public.st_lineinterpolatepoint(geography, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_lineinterpolatepoint(geography, float8, bool) TO "admin";

-- DROP FUNCTION public.st_lineinterpolatepoint(text, float8);

CREATE OR REPLACE FUNCTION public.st_lineinterpolatepoint(text, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public.ST_LineInterpolatePoint($1::public.geometry, $2);  $function$
;

-- Permissions

ALTER FUNCTION public.st_lineinterpolatepoint(text, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_lineinterpolatepoint(text, float8) TO "admin";

-- DROP FUNCTION public.st_lineinterpolatepoint(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_lineinterpolatepoint(geometry, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_line_interpolate_point$function$
;

-- Permissions

ALTER FUNCTION public.st_lineinterpolatepoint(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_lineinterpolatepoint(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_lineinterpolatepoints(text, float8);

CREATE OR REPLACE FUNCTION public.st_lineinterpolatepoints(text, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public.ST_LineInterpolatePoints($1::public.geometry, $2);  $function$
;

-- Permissions

ALTER FUNCTION public.st_lineinterpolatepoints(text, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_lineinterpolatepoints(text, float8) TO "admin";

-- DROP FUNCTION public.st_lineinterpolatepoints(geometry, float8, bool);

CREATE OR REPLACE FUNCTION public.st_lineinterpolatepoints(geometry, double precision, repeat boolean DEFAULT true)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_line_interpolate_point$function$
;

-- Permissions

ALTER FUNCTION public.st_lineinterpolatepoints(geometry, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_lineinterpolatepoints(geometry, float8, bool) TO "admin";

-- DROP FUNCTION public.st_lineinterpolatepoints(geography, float8, bool, bool);

CREATE OR REPLACE FUNCTION public.st_lineinterpolatepoints(geography, double precision, use_spheroid boolean DEFAULT true, repeat boolean DEFAULT true)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_line_interpolate_point$function$
;

-- Permissions

ALTER FUNCTION public.st_lineinterpolatepoints(geography, float8, bool, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_lineinterpolatepoints(geography, float8, bool, bool) TO "admin";

-- DROP FUNCTION public.st_linelocatepoint(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_linelocatepoint(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_line_locate_point$function$
;

-- Permissions

ALTER FUNCTION public.st_linelocatepoint(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linelocatepoint(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_linelocatepoint(text, text);

CREATE OR REPLACE FUNCTION public.st_linelocatepoint(text, text)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public.ST_LineLocatePoint($1::public.geometry, $2::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_linelocatepoint(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linelocatepoint(text, text) TO "admin";

-- DROP FUNCTION public.st_linelocatepoint(geography, geography, bool);

CREATE OR REPLACE FUNCTION public.st_linelocatepoint(geography, geography, use_spheroid boolean DEFAULT true)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_line_locate_point$function$
;

-- Permissions

ALTER FUNCTION public.st_linelocatepoint(geography, geography, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linelocatepoint(geography, geography, bool) TO "admin";

-- DROP FUNCTION public.st_linemerge(geometry);

CREATE OR REPLACE FUNCTION public.st_linemerge(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$linemerge$function$
;

-- Permissions

ALTER FUNCTION public.st_linemerge(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linemerge(geometry) TO "admin";

-- DROP FUNCTION public.st_linemerge(geometry, bool);

CREATE OR REPLACE FUNCTION public.st_linemerge(geometry, boolean)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$linemerge$function$
;

-- Permissions

ALTER FUNCTION public.st_linemerge(geometry, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linemerge(geometry, bool) TO "admin";

-- DROP FUNCTION public.st_linestringfromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_linestringfromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_linestringfromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linestringfromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_linestringfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_linestringfromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_linestringfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linestringfromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_linesubstring(geography, float8, float8);

CREATE OR REPLACE FUNCTION public.st_linesubstring(geography, double precision, double precision)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_line_substring$function$
;

-- Permissions

ALTER FUNCTION public.st_linesubstring(geography, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linesubstring(geography, float8, float8) TO "admin";

-- DROP FUNCTION public.st_linesubstring(text, float8, float8);

CREATE OR REPLACE FUNCTION public.st_linesubstring(text, double precision, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public.ST_LineSubstring($1::public.geometry, $2, $3);  $function$
;

-- Permissions

ALTER FUNCTION public.st_linesubstring(text, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linesubstring(text, float8, float8) TO "admin";

-- DROP FUNCTION public.st_linesubstring(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_linesubstring(geometry, double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_line_substring$function$
;

-- Permissions

ALTER FUNCTION public.st_linesubstring(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linesubstring(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_linetocurve(geometry);

CREATE OR REPLACE FUNCTION public.st_linetocurve(geometry geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_line_desegmentize$function$
;

-- Permissions

ALTER FUNCTION public.st_linetocurve(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_linetocurve(geometry) TO "admin";

-- DROP FUNCTION public.st_locatealong(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_locatealong(geometry geometry, measure double precision, leftrightoffset double precision DEFAULT 0.0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_LocateAlong$function$
;

-- Permissions

ALTER FUNCTION public.st_locatealong(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_locatealong(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_locatebetween(geometry, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_locatebetween(geometry geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision DEFAULT 0.0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_LocateBetween$function$
;

-- Permissions

ALTER FUNCTION public.st_locatebetween(geometry, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_locatebetween(geometry, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_locatebetweenelevations(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_locatebetweenelevations(geometry geometry, fromelevation double precision, toelevation double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_LocateBetweenElevations$function$
;

-- Permissions

ALTER FUNCTION public.st_locatebetweenelevations(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_locatebetweenelevations(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_longestline(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_longestline(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$SELECT public._ST_LongestLine(public.ST_ConvexHull($1), public.ST_ConvexHull($2))$function$
;

-- Permissions

ALTER FUNCTION public.st_longestline(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_longestline(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_m(geometry);

CREATE OR REPLACE FUNCTION public.st_m(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_m_point$function$
;

-- Permissions

ALTER FUNCTION public.st_m(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_m(geometry) TO "admin";

-- DROP FUNCTION public.st_makebox2d(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_makebox2d(geom1 geometry, geom2 geometry)
 RETURNS box2d
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX2D_construct$function$
;

-- Permissions

ALTER FUNCTION public.st_makebox2d(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makebox2d(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_makeenvelope(float8, float8, float8, float8, int4);

CREATE OR REPLACE FUNCTION public.st_makeenvelope(double precision, double precision, double precision, double precision, integer DEFAULT 0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_MakeEnvelope$function$
;

-- Permissions

ALTER FUNCTION public.st_makeenvelope(float8, float8, float8, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makeenvelope(float8, float8, float8, float8, int4) TO "admin";

-- DROP FUNCTION public.st_makeline(_geometry);

CREATE OR REPLACE FUNCTION public.st_makeline(geometry[])
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_makeline_garray$function$
;

-- Permissions

ALTER FUNCTION public.st_makeline(_geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makeline(_geometry) TO "admin";

-- DROP AGGREGATE public.st_makeline(geometry);

-- Aggregate function public.st_makeline(geometry)
-- ERROR: more than one function named "public.st_makeline";

-- Permissions

ALTER AGGREGATE public.st_makeline(geometry) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_makeline(geometry) TO "admin";

-- DROP FUNCTION public.st_makeline(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_makeline(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_makeline$function$
;

-- Permissions

ALTER FUNCTION public.st_makeline(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makeline(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_makepoint(float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_makepoint(double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_makepoint$function$
;

-- Permissions

ALTER FUNCTION public.st_makepoint(float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makepoint(float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_makepoint(float8, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_makepoint(double precision, double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_makepoint$function$
;

-- Permissions

ALTER FUNCTION public.st_makepoint(float8, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makepoint(float8, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_makepoint(float8, float8);

CREATE OR REPLACE FUNCTION public.st_makepoint(double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_makepoint$function$
;

-- Permissions

ALTER FUNCTION public.st_makepoint(float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makepoint(float8, float8) TO "admin";

-- DROP FUNCTION public.st_makepointm(float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_makepointm(double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_makepoint3dm$function$
;

-- Permissions

ALTER FUNCTION public.st_makepointm(float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makepointm(float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_makepolygon(geometry, _geometry);

CREATE OR REPLACE FUNCTION public.st_makepolygon(geometry, geometry[])
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_makepoly$function$
;

-- Permissions

ALTER FUNCTION public.st_makepolygon(geometry, _geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makepolygon(geometry, _geometry) TO "admin";

-- DROP FUNCTION public.st_makepolygon(geometry);

CREATE OR REPLACE FUNCTION public.st_makepolygon(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_makepoly$function$
;

-- Permissions

ALTER FUNCTION public.st_makepolygon(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makepolygon(geometry) TO "admin";

-- DROP FUNCTION public.st_makevalid(geometry);

CREATE OR REPLACE FUNCTION public.st_makevalid(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_MakeValid$function$
;

-- Permissions

ALTER FUNCTION public.st_makevalid(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makevalid(geometry) TO "admin";

-- DROP FUNCTION public.st_makevalid(geometry, text);

CREATE OR REPLACE FUNCTION public.st_makevalid(geom geometry, params text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_MakeValid$function$
;

-- Permissions

ALTER FUNCTION public.st_makevalid(geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_makevalid(geometry, text) TO "admin";

-- DROP FUNCTION public.st_maxdistance(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_maxdistance(geom1 geometry, geom2 geometry)
 RETURNS double precision
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$SELECT public._ST_MaxDistance(public.ST_ConvexHull($1), public.ST_ConvexHull($2))$function$
;

-- Permissions

ALTER FUNCTION public.st_maxdistance(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_maxdistance(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_maximuminscribedcircle(in geometry, out geometry, out geometry, out float8);

CREATE OR REPLACE FUNCTION public.st_maximuminscribedcircle(geometry, OUT center geometry, OUT nearest geometry, OUT radius double precision)
 RETURNS record
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_MaximumInscribedCircle$function$
;

-- Permissions

ALTER FUNCTION public.st_maximuminscribedcircle(in geometry, out geometry, out geometry, out float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_maximuminscribedcircle(in geometry, out geometry, out geometry, out float8) TO "admin";

-- DROP AGGREGATE public.st_memcollect(geometry);

CREATE OR REPLACE AGGREGATE public.st_memcollect(public.geometry) (
	SFUNC = public.st_collect,
	STYPE = geometry
);

-- Permissions

ALTER AGGREGATE public.st_memcollect(geometry) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_memcollect(geometry) TO "admin";

-- DROP FUNCTION public.st_memsize(geometry);

CREATE OR REPLACE FUNCTION public.st_memsize(geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_mem_size$function$
;

-- Permissions

ALTER FUNCTION public.st_memsize(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_memsize(geometry) TO "admin";

-- DROP AGGREGATE public.st_memunion(geometry);

CREATE OR REPLACE AGGREGATE public.st_memunion(public.geometry) (
	SFUNC = public.st_union,
	STYPE = geometry
);

-- Permissions

ALTER AGGREGATE public.st_memunion(geometry) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_memunion(geometry) TO "admin";

-- DROP FUNCTION public.st_minimumboundingcircle(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer DEFAULT 48)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_MinimumBoundingCircle$function$
;

-- Permissions

ALTER FUNCTION public.st_minimumboundingcircle(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_minimumboundingcircle(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_minimumboundingradius(in geometry, out geometry, out float8);

CREATE OR REPLACE FUNCTION public.st_minimumboundingradius(geometry, OUT center geometry, OUT radius double precision)
 RETURNS record
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_MinimumBoundingRadius$function$
;

-- Permissions

ALTER FUNCTION public.st_minimumboundingradius(in geometry, out geometry, out float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_minimumboundingradius(in geometry, out geometry, out float8) TO "admin";

-- DROP FUNCTION public.st_minimumclearance(geometry);

CREATE OR REPLACE FUNCTION public.st_minimumclearance(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_MinimumClearance$function$
;

-- Permissions

ALTER FUNCTION public.st_minimumclearance(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_minimumclearance(geometry) TO "admin";

-- DROP FUNCTION public.st_minimumclearanceline(geometry);

CREATE OR REPLACE FUNCTION public.st_minimumclearanceline(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_MinimumClearanceLine$function$
;

-- Permissions

ALTER FUNCTION public.st_minimumclearanceline(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_minimumclearanceline(geometry) TO "admin";

-- DROP FUNCTION public.st_mlinefromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_mlinefromtext(text, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE
	WHEN public.geometrytype(public.ST_GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN public.ST_GeomFromText($1,$2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mlinefromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mlinefromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_mlinefromtext(text);

CREATE OR REPLACE FUNCTION public.st_mlinefromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1)) = 'MULTILINESTRING'
	THEN public.ST_GeomFromText($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mlinefromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mlinefromtext(text) TO "admin";

-- DROP FUNCTION public.st_mlinefromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_mlinefromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mlinefromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mlinefromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_mlinefromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_mlinefromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mlinefromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mlinefromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_mpointfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_mpointfromtext(text, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1, $2)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mpointfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mpointfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_mpointfromtext(text);

CREATE OR REPLACE FUNCTION public.st_mpointfromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1)) = 'MULTIPOINT'
	THEN public.ST_GeomFromText($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mpointfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mpointfromtext(text) TO "admin";

-- DROP FUNCTION public.st_mpointfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_mpointfromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mpointfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mpointfromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_mpointfromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_mpointfromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1, $2)) = 'MULTIPOINT'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mpointfromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mpointfromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_mpolyfromtext(text);

CREATE OR REPLACE FUNCTION public.st_mpolyfromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1)) = 'MULTIPOLYGON'
	THEN public.ST_GeomFromText($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mpolyfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mpolyfromtext(text) TO "admin";

-- DROP FUNCTION public.st_mpolyfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_mpolyfromtext(text, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN public.ST_GeomFromText($1,$2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mpolyfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mpolyfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_mpolyfromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_mpolyfromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mpolyfromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mpolyfromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_mpolyfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_mpolyfromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_mpolyfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_mpolyfromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_multi(geometry);

CREATE OR REPLACE FUNCTION public.st_multi(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_force_multi$function$
;

-- Permissions

ALTER FUNCTION public.st_multi(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multi(geometry) TO "admin";

-- DROP FUNCTION public.st_multilinefromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_multilinefromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_multilinefromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multilinefromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_multilinestringfromtext(text);

CREATE OR REPLACE FUNCTION public.st_multilinestringfromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public.ST_MLineFromText($1)$function$
;

-- Permissions

ALTER FUNCTION public.st_multilinestringfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multilinestringfromtext(text) TO "admin";

-- DROP FUNCTION public.st_multilinestringfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_multilinestringfromtext(text, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public.ST_MLineFromText($1, $2)$function$
;

-- Permissions

ALTER FUNCTION public.st_multilinestringfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multilinestringfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_multipointfromtext(text);

CREATE OR REPLACE FUNCTION public.st_multipointfromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public.ST_MPointFromText($1)$function$
;

-- Permissions

ALTER FUNCTION public.st_multipointfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multipointfromtext(text) TO "admin";

-- DROP FUNCTION public.st_multipointfromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_multipointfromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_multipointfromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multipointfromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_multipointfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_multipointfromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_multipointfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multipointfromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_multipolyfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_multipolyfromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_multipolyfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multipolyfromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_multipolyfromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_multipolyfromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_multipolyfromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multipolyfromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_multipolygonfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_multipolygonfromtext(text, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public.ST_MPolyFromText($1, $2)$function$
;

-- Permissions

ALTER FUNCTION public.st_multipolygonfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multipolygonfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_multipolygonfromtext(text);

CREATE OR REPLACE FUNCTION public.st_multipolygonfromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public.ST_MPolyFromText($1)$function$
;

-- Permissions

ALTER FUNCTION public.st_multipolygonfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_multipolygonfromtext(text) TO "admin";

-- DROP FUNCTION public.st_ndims(geometry);

CREATE OR REPLACE FUNCTION public.st_ndims(geometry)
 RETURNS smallint
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_ndims$function$
;

-- Permissions

ALTER FUNCTION public.st_ndims(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_ndims(geometry) TO "admin";

-- DROP FUNCTION public.st_node(geometry);

CREATE OR REPLACE FUNCTION public.st_node(g geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Node$function$
;

-- Permissions

ALTER FUNCTION public.st_node(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_node(geometry) TO "admin";

-- DROP FUNCTION public.st_normalize(geometry);

CREATE OR REPLACE FUNCTION public.st_normalize(geom geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_Normalize$function$
;

-- Permissions

ALTER FUNCTION public.st_normalize(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_normalize(geometry) TO "admin";

-- DROP FUNCTION public.st_npoints(geometry);

CREATE OR REPLACE FUNCTION public.st_npoints(geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_npoints$function$
;

-- Permissions

ALTER FUNCTION public.st_npoints(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_npoints(geometry) TO "admin";

-- DROP FUNCTION public.st_nrings(geometry);

CREATE OR REPLACE FUNCTION public.st_nrings(geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_nrings$function$
;

-- Permissions

ALTER FUNCTION public.st_nrings(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_nrings(geometry) TO "admin";

-- DROP FUNCTION public.st_numcurves(geometry);

CREATE OR REPLACE FUNCTION public.st_numcurves(geometry geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_NumCurves$function$
;

-- Permissions

ALTER FUNCTION public.st_numcurves(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_numcurves(geometry) TO "admin";

-- DROP FUNCTION public.st_numgeometries(geometry);

CREATE OR REPLACE FUNCTION public.st_numgeometries(geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_numgeometries_collection$function$
;

-- Permissions

ALTER FUNCTION public.st_numgeometries(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_numgeometries(geometry) TO "admin";

-- DROP FUNCTION public.st_numinteriorring(geometry);

CREATE OR REPLACE FUNCTION public.st_numinteriorring(geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_numinteriorrings_polygon$function$
;

-- Permissions

ALTER FUNCTION public.st_numinteriorring(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_numinteriorring(geometry) TO "admin";

-- DROP FUNCTION public.st_numinteriorrings(geometry);

CREATE OR REPLACE FUNCTION public.st_numinteriorrings(geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_numinteriorrings_polygon$function$
;

-- Permissions

ALTER FUNCTION public.st_numinteriorrings(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_numinteriorrings(geometry) TO "admin";

-- DROP FUNCTION public.st_numpatches(geometry);

CREATE OR REPLACE FUNCTION public.st_numpatches(geometry)
 RETURNS integer
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.ST_GeometryType($1) = 'ST_PolyhedralSurface'
	THEN public.ST_NumGeometries($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_numpatches(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_numpatches(geometry) TO "admin";

-- DROP FUNCTION public.st_numpoints(geometry);

CREATE OR REPLACE FUNCTION public.st_numpoints(geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_numpoints_linestring$function$
;

-- Permissions

ALTER FUNCTION public.st_numpoints(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_numpoints(geometry) TO "admin";

-- DROP FUNCTION public.st_offsetcurve(geometry, float8, text);

CREATE OR REPLACE FUNCTION public.st_offsetcurve(line geometry, distance double precision, params text DEFAULT ''::text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_OffsetCurve$function$
;

-- Permissions

ALTER FUNCTION public.st_offsetcurve(geometry, float8, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_offsetcurve(geometry, float8, text) TO "admin";

-- DROP FUNCTION public.st_orderingequals(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_orderingequals(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$LWGEOM_same$function$
;

-- Permissions

ALTER FUNCTION public.st_orderingequals(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_orderingequals(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_orientedenvelope(geometry);

CREATE OR REPLACE FUNCTION public.st_orientedenvelope(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_OrientedEnvelope$function$
;

-- Permissions

ALTER FUNCTION public.st_orientedenvelope(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_orientedenvelope(geometry) TO "admin";

-- DROP FUNCTION public.st_overlaps(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_overlaps(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$overlaps$function$
;

-- Permissions

ALTER FUNCTION public.st_overlaps(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_overlaps(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_patchn(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_patchn(geometry, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.ST_GeometryType($1) = 'ST_PolyhedralSurface'
	THEN public.ST_GeometryN($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_patchn(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_patchn(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_perimeter(geography, bool);

CREATE OR REPLACE FUNCTION public.st_perimeter(geog geography, use_spheroid boolean DEFAULT true)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_perimeter$function$
;

-- Permissions

ALTER FUNCTION public.st_perimeter(geography, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_perimeter(geography, bool) TO "admin";

-- DROP FUNCTION public.st_perimeter(geometry);

CREATE OR REPLACE FUNCTION public.st_perimeter(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_perimeter2d_poly$function$
;

-- Permissions

ALTER FUNCTION public.st_perimeter(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_perimeter(geometry) TO "admin";

-- DROP FUNCTION public.st_perimeter2d(geometry);

CREATE OR REPLACE FUNCTION public.st_perimeter2d(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_perimeter2d_poly$function$
;

-- Permissions

ALTER FUNCTION public.st_perimeter2d(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_perimeter2d(geometry) TO "admin";

-- DROP FUNCTION public.st_point(float8, float8, int4);

CREATE OR REPLACE FUNCTION public.st_point(double precision, double precision, srid integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_Point$function$
;

-- Permissions

ALTER FUNCTION public.st_point(float8, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_point(float8, float8, int4) TO "admin";

-- DROP FUNCTION public.st_point(float8, float8);

CREATE OR REPLACE FUNCTION public.st_point(double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_makepoint$function$
;

-- Permissions

ALTER FUNCTION public.st_point(float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_point(float8, float8) TO "admin";

-- DROP FUNCTION public.st_pointfromgeohash(text, int4);

CREATE OR REPLACE FUNCTION public.st_pointfromgeohash(text, integer DEFAULT NULL::integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 50
AS '$libdir/postgis-3', $function$point_from_geohash$function$
;

-- Permissions

ALTER FUNCTION public.st_pointfromgeohash(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointfromgeohash(text, int4) TO "admin";

-- DROP FUNCTION public.st_pointfromtext(text);

CREATE OR REPLACE FUNCTION public.st_pointfromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1)) = 'POINT'
	THEN public.ST_GeomFromText($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_pointfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointfromtext(text) TO "admin";

-- DROP FUNCTION public.st_pointfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_pointfromtext(text, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1, $2)) = 'POINT'
	THEN public.ST_GeomFromText($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_pointfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_pointfromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_pointfromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_pointfromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointfromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_pointfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_pointfromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'POINT'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_pointfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointfromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_pointinsidecircle(geometry, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_pointinsidecircle(geometry, double precision, double precision, double precision)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_inside_circle_point$function$
;

-- Permissions

ALTER FUNCTION public.st_pointinsidecircle(geometry, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointinsidecircle(geometry, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_pointm(float8, float8, float8, int4);

CREATE OR REPLACE FUNCTION public.st_pointm(xcoordinate double precision, ycoordinate double precision, mcoordinate double precision, srid integer DEFAULT 0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_PointM$function$
;

-- Permissions

ALTER FUNCTION public.st_pointm(float8, float8, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointm(float8, float8, float8, int4) TO "admin";

-- DROP FUNCTION public.st_pointn(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_pointn(geometry, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_pointn_linestring$function$
;

-- Permissions

ALTER FUNCTION public.st_pointn(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointn(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_pointonsurface(geometry);

CREATE OR REPLACE FUNCTION public.st_pointonsurface(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$pointonsurface$function$
;

-- Permissions

ALTER FUNCTION public.st_pointonsurface(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointonsurface(geometry) TO "admin";

-- DROP FUNCTION public.st_points(geometry);

CREATE OR REPLACE FUNCTION public.st_points(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_Points$function$
;

-- Permissions

ALTER FUNCTION public.st_points(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_points(geometry) TO "admin";

-- DROP FUNCTION public.st_pointz(float8, float8, float8, int4);

CREATE OR REPLACE FUNCTION public.st_pointz(xcoordinate double precision, ycoordinate double precision, zcoordinate double precision, srid integer DEFAULT 0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_PointZ$function$
;

-- Permissions

ALTER FUNCTION public.st_pointz(float8, float8, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointz(float8, float8, float8, int4) TO "admin";

-- DROP FUNCTION public.st_pointzm(float8, float8, float8, float8, int4);

CREATE OR REPLACE FUNCTION public.st_pointzm(xcoordinate double precision, ycoordinate double precision, zcoordinate double precision, mcoordinate double precision, srid integer DEFAULT 0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_PointZM$function$
;

-- Permissions

ALTER FUNCTION public.st_pointzm(float8, float8, float8, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_pointzm(float8, float8, float8, float8, int4) TO "admin";

-- DROP FUNCTION public.st_polyfromtext(text);

CREATE OR REPLACE FUNCTION public.st_polyfromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1)) = 'POLYGON'
	THEN public.ST_GeomFromText($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_polyfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_polyfromtext(text) TO "admin";

-- DROP FUNCTION public.st_polyfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_polyfromtext(text, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromText($1, $2)) = 'POLYGON'
	THEN public.ST_GeomFromText($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_polyfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_polyfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_polyfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_polyfromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'POLYGON'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_polyfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_polyfromwkb(bytea) TO "admin";

-- DROP FUNCTION public.st_polyfromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_polyfromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1, $2)) = 'POLYGON'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_polyfromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_polyfromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_polygon(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_polygon(geometry, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT public.ST_SetSRID(public.ST_MakePolygon($1), $2)
	$function$
;

-- Permissions

ALTER FUNCTION public.st_polygon(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_polygon(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_polygonfromtext(text);

CREATE OR REPLACE FUNCTION public.st_polygonfromtext(text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public.ST_PolyFromText($1)$function$
;

-- Permissions

ALTER FUNCTION public.st_polygonfromtext(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_polygonfromtext(text) TO "admin";

-- DROP FUNCTION public.st_polygonfromtext(text, int4);

CREATE OR REPLACE FUNCTION public.st_polygonfromtext(text, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS $function$SELECT public.ST_PolyFromText($1, $2)$function$
;

-- Permissions

ALTER FUNCTION public.st_polygonfromtext(text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_polygonfromtext(text, int4) TO "admin";

-- DROP FUNCTION public.st_polygonfromwkb(bytea, int4);

CREATE OR REPLACE FUNCTION public.st_polygonfromwkb(bytea, integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1,$2)) = 'POLYGON'
	THEN public.ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_polygonfromwkb(bytea, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_polygonfromwkb(bytea, int4) TO "admin";

-- DROP FUNCTION public.st_polygonfromwkb(bytea);

CREATE OR REPLACE FUNCTION public.st_polygonfromwkb(bytea)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$
	SELECT CASE WHEN public.geometrytype(public.ST_GeomFromWKB($1)) = 'POLYGON'
	THEN public.ST_GeomFromWKB($1)
	ELSE NULL END
	$function$
;

-- Permissions

ALTER FUNCTION public.st_polygonfromwkb(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_polygonfromwkb(bytea) TO "admin";

-- DROP AGGREGATE public.st_polygonize(geometry);

-- Aggregate function public.st_polygonize(geometry)
-- ERROR: more than one function named "public.st_polygonize";

-- Permissions

ALTER AGGREGATE public.st_polygonize(geometry) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_polygonize(geometry) TO "admin";

-- DROP FUNCTION public.st_polygonize(_geometry);

CREATE OR REPLACE FUNCTION public.st_polygonize(geometry[])
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$polygonize_garray$function$
;

-- Permissions

ALTER FUNCTION public.st_polygonize(_geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_polygonize(_geometry) TO "admin";

-- DROP FUNCTION public.st_project(geography, geography, float8);

CREATE OR REPLACE FUNCTION public.st_project(geog_from geography, geog_to geography, distance double precision)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_project_geography$function$
;

-- Permissions

ALTER FUNCTION public.st_project(geography, geography, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_project(geography, geography, float8) TO "admin";

-- DROP FUNCTION public.st_project(geography, float8, float8);

CREATE OR REPLACE FUNCTION public.st_project(geog geography, distance double precision, azimuth double precision)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$geography_project$function$
;

-- Permissions

ALTER FUNCTION public.st_project(geography, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_project(geography, float8, float8) TO "admin";

-- DROP FUNCTION public.st_project(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_project(geom1 geometry, distance double precision, azimuth double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$geometry_project_direction$function$
;

-- Permissions

ALTER FUNCTION public.st_project(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_project(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_project(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_project(geom1 geometry, geom2 geometry, distance double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$geometry_project_geometry$function$
;

-- Permissions

ALTER FUNCTION public.st_project(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_project(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_quantizecoordinates(geometry, int4, int4, int4, int4);

CREATE OR REPLACE FUNCTION public.st_quantizecoordinates(g geometry, prec_x integer, prec_y integer DEFAULT NULL::integer, prec_z integer DEFAULT NULL::integer, prec_m integer DEFAULT NULL::integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE COST 250
AS '$libdir/postgis-3', $function$ST_QuantizeCoordinates$function$
;

-- Permissions

ALTER FUNCTION public.st_quantizecoordinates(geometry, int4, int4, int4, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_quantizecoordinates(geometry, int4, int4, int4, int4) TO "admin";

-- DROP FUNCTION public.st_reduceprecision(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_reduceprecision(geom geometry, gridsize double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_ReducePrecision$function$
;

-- Permissions

ALTER FUNCTION public.st_reduceprecision(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_reduceprecision(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_relate(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_relate(geom1 geometry, geom2 geometry)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$relate_full$function$
;

-- Permissions

ALTER FUNCTION public.st_relate(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_relate(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_relate(geometry, geometry, int4);

CREATE OR REPLACE FUNCTION public.st_relate(geom1 geometry, geom2 geometry, integer)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$relate_full$function$
;

-- Permissions

ALTER FUNCTION public.st_relate(geometry, geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_relate(geometry, geometry, int4) TO "admin";

-- DROP FUNCTION public.st_relate(geometry, geometry, text);

CREATE OR REPLACE FUNCTION public.st_relate(geom1 geometry, geom2 geometry, text)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$relate_pattern$function$
;

-- Permissions

ALTER FUNCTION public.st_relate(geometry, geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_relate(geometry, geometry, text) TO "admin";

-- DROP FUNCTION public.st_relatematch(text, text);

CREATE OR REPLACE FUNCTION public.st_relatematch(text, text)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_RelateMatch$function$
;

-- Permissions

ALTER FUNCTION public.st_relatematch(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_relatematch(text, text) TO "admin";

-- DROP FUNCTION public.st_removeirrelevantpointsforview(geometry, box2d, bool);

CREATE OR REPLACE FUNCTION public.st_removeirrelevantpointsforview(geometry, box2d, boolean DEFAULT false)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_RemoveIrrelevantPointsForView$function$
;

-- Permissions

ALTER FUNCTION public.st_removeirrelevantpointsforview(geometry, box2d, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_removeirrelevantpointsforview(geometry, box2d, bool) TO "admin";

-- DROP FUNCTION public.st_removepoint(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_removepoint(geometry, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_removepoint$function$
;

-- Permissions

ALTER FUNCTION public.st_removepoint(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_removepoint(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_removerepeatedpoints(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_removerepeatedpoints(geom geometry, tolerance double precision DEFAULT 0.0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_RemoveRepeatedPoints$function$
;

-- Permissions

ALTER FUNCTION public.st_removerepeatedpoints(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_removerepeatedpoints(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_removesmallparts(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_removesmallparts(geometry, double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_RemoveSmallParts$function$
;

-- Permissions

ALTER FUNCTION public.st_removesmallparts(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_removesmallparts(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_reverse(geometry);

CREATE OR REPLACE FUNCTION public.st_reverse(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_reverse$function$
;

-- Permissions

ALTER FUNCTION public.st_reverse(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_reverse(geometry) TO "admin";

-- DROP FUNCTION public.st_rotate(geometry, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_rotate(geometry, double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Affine($1,  cos($2), -sin($2), 0,  sin($2),  cos($2), 0, 0, 0, 1,	$3 - cos($2) * $3 + sin($2) * $4, $4 - sin($2) * $3 - cos($2) * $4, 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_rotate(geometry, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_rotate(geometry, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_rotate(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_rotate(geometry, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_rotate(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_rotate(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_rotate(geometry, float8, geometry);

CREATE OR REPLACE FUNCTION public.st_rotate(geometry, double precision, geometry)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Affine($1,  cos($2), -sin($2), 0,  sin($2),  cos($2), 0, 0, 0, 1, public.ST_X($3) - cos($2) * public.ST_X($3) + sin($2) * public.ST_Y($3), public.ST_Y($3) - sin($2) * public.ST_X($3) - cos($2) * public.ST_Y($3), 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_rotate(geometry, float8, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_rotate(geometry, float8, geometry) TO "admin";

-- DROP FUNCTION public.st_rotatex(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_rotatex(geometry, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_rotatex(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_rotatex(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_rotatey(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_rotatey(geometry, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_rotatey(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_rotatey(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_rotatez(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_rotatez(geometry, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Rotate($1, $2)$function$
;

-- Permissions

ALTER FUNCTION public.st_rotatez(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_rotatez(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_scale(geometry, geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_scale(geometry, geometry, origin geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_Scale$function$
;

-- Permissions

ALTER FUNCTION public.st_scale(geometry, geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_scale(geometry, geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_scale(geometry, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_scale(geometry, double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Scale($1, public.ST_MakePoint($2, $3, $4))$function$
;

-- Permissions

ALTER FUNCTION public.st_scale(geometry, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_scale(geometry, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_scale(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_scale(geometry, double precision, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Scale($1, $2, $3, 1)$function$
;

-- Permissions

ALTER FUNCTION public.st_scale(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_scale(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_scale(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_scale(geometry, geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_Scale$function$
;

-- Permissions

ALTER FUNCTION public.st_scale(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_scale(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_scroll(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_scroll(geometry, geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_Scroll$function$
;

-- Permissions

ALTER FUNCTION public.st_scroll(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_scroll(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_segmentize(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_segmentize(geometry, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_segmentize2d$function$
;

-- Permissions

ALTER FUNCTION public.st_segmentize(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_segmentize(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_segmentize(geography, float8);

CREATE OR REPLACE FUNCTION public.st_segmentize(geog geography, max_segment_length double precision)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$geography_segmentize$function$
;

-- Permissions

ALTER FUNCTION public.st_segmentize(geography, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_segmentize(geography, float8) TO "admin";

-- DROP FUNCTION public.st_seteffectivearea(geometry, float8, int4);

CREATE OR REPLACE FUNCTION public.st_seteffectivearea(geometry, double precision DEFAULT '-1'::integer, integer DEFAULT 1)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_SetEffectiveArea$function$
;

-- Permissions

ALTER FUNCTION public.st_seteffectivearea(geometry, float8, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_seteffectivearea(geometry, float8, int4) TO "admin";

-- DROP FUNCTION public.st_setpoint(geometry, int4, geometry);

CREATE OR REPLACE FUNCTION public.st_setpoint(geometry, integer, geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_setpoint_linestring$function$
;

-- Permissions

ALTER FUNCTION public.st_setpoint(geometry, int4, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_setpoint(geometry, int4, geometry) TO "admin";

-- DROP FUNCTION public.st_setsrid(geography, int4);

CREATE OR REPLACE FUNCTION public.st_setsrid(geog geography, srid integer)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_set_srid$function$
;

-- Permissions

ALTER FUNCTION public.st_setsrid(geography, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_setsrid(geography, int4) TO "admin";

-- DROP FUNCTION public.st_setsrid(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_setsrid(geom geometry, srid integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_set_srid$function$
;

-- Permissions

ALTER FUNCTION public.st_setsrid(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_setsrid(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_sharedpaths(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_sharedpaths(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_SharedPaths$function$
;

-- Permissions

ALTER FUNCTION public.st_sharedpaths(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_sharedpaths(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_shiftlongitude(geometry);

CREATE OR REPLACE FUNCTION public.st_shiftlongitude(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_longitude_shift$function$
;

-- Permissions

ALTER FUNCTION public.st_shiftlongitude(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_shiftlongitude(geometry) TO "admin";

-- DROP FUNCTION public.st_shortestline(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_shortestline(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_shortestline2d$function$
;

-- Permissions

ALTER FUNCTION public.st_shortestline(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_shortestline(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_shortestline(text, text);

CREATE OR REPLACE FUNCTION public.st_shortestline(text, text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public.ST_ShortestLine($1::public.geometry, $2::public.geometry);  $function$
;

-- Permissions

ALTER FUNCTION public.st_shortestline(text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_shortestline(text, text) TO "admin";

-- DROP FUNCTION public.st_shortestline(geography, geography, bool);

CREATE OR REPLACE FUNCTION public.st_shortestline(geography, geography, use_spheroid boolean DEFAULT true)
 RETURNS geography
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$geography_shortestline$function$
;

-- Permissions

ALTER FUNCTION public.st_shortestline(geography, geography, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_shortestline(geography, geography, bool) TO "admin";

-- DROP FUNCTION public.st_simplify(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_simplify(geometry, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_simplify2d$function$
;

-- Permissions

ALTER FUNCTION public.st_simplify(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_simplify(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_simplify(geometry, float8, bool);

CREATE OR REPLACE FUNCTION public.st_simplify(geometry, double precision, boolean)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_simplify2d$function$
;

-- Permissions

ALTER FUNCTION public.st_simplify(geometry, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_simplify(geometry, float8, bool) TO "admin";

-- DROP FUNCTION public.st_simplifypolygonhull(geometry, float8, bool);

CREATE OR REPLACE FUNCTION public.st_simplifypolygonhull(geom geometry, vertex_fraction double precision, is_outer boolean DEFAULT true)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_SimplifyPolygonHull$function$
;

-- Permissions

ALTER FUNCTION public.st_simplifypolygonhull(geometry, float8, bool) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_simplifypolygonhull(geometry, float8, bool) TO "admin";

-- DROP FUNCTION public.st_simplifypreservetopology(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_simplifypreservetopology(geometry, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$topologypreservesimplify$function$
;

-- Permissions

ALTER FUNCTION public.st_simplifypreservetopology(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_simplifypreservetopology(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_simplifyvw(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_simplifyvw(geometry, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$LWGEOM_SetEffectiveArea$function$
;

-- Permissions

ALTER FUNCTION public.st_simplifyvw(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_simplifyvw(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_snap(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_snap(geom1 geometry, geom2 geometry, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Snap$function$
;

-- Permissions

ALTER FUNCTION public.st_snap(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_snap(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_snaptogrid(geometry, geometry, float8, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_snaptogrid(geom1 geometry, geom2 geometry, double precision, double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_snaptogrid_pointoff$function$
;

-- Permissions

ALTER FUNCTION public.st_snaptogrid(geometry, geometry, float8, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_snaptogrid(geometry, geometry, float8, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_snaptogrid(geometry, float8, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_snaptogrid(geometry, double precision, double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_snaptogrid$function$
;

-- Permissions

ALTER FUNCTION public.st_snaptogrid(geometry, float8, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_snaptogrid(geometry, float8, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_snaptogrid(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_snaptogrid(geometry, double precision, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_SnapToGrid($1, 0, 0, $2, $3)$function$
;

-- Permissions

ALTER FUNCTION public.st_snaptogrid(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_snaptogrid(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_snaptogrid(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_snaptogrid(geometry, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_SnapToGrid($1, 0, 0, $2, $2)$function$
;

-- Permissions

ALTER FUNCTION public.st_snaptogrid(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_snaptogrid(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_split(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_split(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Split$function$
;

-- Permissions

ALTER FUNCTION public.st_split(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_split(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_square(float8, int4, int4, geometry);

CREATE OR REPLACE FUNCTION public.st_square(size double precision, cell_i integer, cell_j integer, origin geometry DEFAULT '010100000000000000000000000000000000000000'::geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_Square$function$
;

-- Permissions

ALTER FUNCTION public.st_square(float8, int4, int4, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_square(float8, int4, int4, geometry) TO "admin";

-- DROP FUNCTION public.st_squaregrid(in float8, in geometry, out geometry, out int4, out int4);

CREATE OR REPLACE FUNCTION public.st_squaregrid(size double precision, bounds geometry, OUT geom geometry, OUT i integer, OUT j integer)
 RETURNS SETOF record
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$ST_ShapeGrid$function$
;

-- Permissions

ALTER FUNCTION public.st_squaregrid(in float8, in geometry, out geometry, out int4, out int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_squaregrid(in float8, in geometry, out geometry, out int4, out int4) TO "admin";

-- DROP FUNCTION public.st_srid(geography);

CREATE OR REPLACE FUNCTION public.st_srid(geog geography)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_get_srid$function$
;

-- Permissions

ALTER FUNCTION public.st_srid(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_srid(geography) TO "admin";

-- DROP FUNCTION public.st_srid(geometry);

CREATE OR REPLACE FUNCTION public.st_srid(geom geometry)
 RETURNS integer
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_get_srid$function$
;

-- Permissions

ALTER FUNCTION public.st_srid(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_srid(geometry) TO "admin";

-- DROP FUNCTION public.st_startpoint(geometry);

CREATE OR REPLACE FUNCTION public.st_startpoint(geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_startpoint_linestring$function$
;

-- Permissions

ALTER FUNCTION public.st_startpoint(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_startpoint(geometry) TO "admin";

-- DROP FUNCTION public.st_subdivide(geometry, int4, float8);

CREATE OR REPLACE FUNCTION public.st_subdivide(geom geometry, maxvertices integer DEFAULT 256, gridsize double precision DEFAULT '-1.0'::numeric)
 RETURNS SETOF geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Subdivide$function$
;

-- Permissions

ALTER FUNCTION public.st_subdivide(geometry, int4, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_subdivide(geometry, int4, float8) TO "admin";

-- DROP FUNCTION public.st_summary(geometry);

CREATE OR REPLACE FUNCTION public.st_summary(geometry)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_summary$function$
;

-- Permissions

ALTER FUNCTION public.st_summary(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_summary(geometry) TO "admin";

-- DROP FUNCTION public.st_summary(geography);

CREATE OR REPLACE FUNCTION public.st_summary(geography)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_summary$function$
;

-- Permissions

ALTER FUNCTION public.st_summary(geography) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_summary(geography) TO "admin";

-- DROP FUNCTION public.st_swapordinates(geometry, cstring);

CREATE OR REPLACE FUNCTION public.st_swapordinates(geom geometry, ords cstring)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_SwapOrdinates$function$
;

-- Permissions

ALTER FUNCTION public.st_swapordinates(geometry, cstring) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_swapordinates(geometry, cstring) TO "admin";

-- DROP FUNCTION public.st_symdifference(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_symdifference(geom1 geometry, geom2 geometry, gridsize double precision DEFAULT '-1.0'::numeric)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_SymDifference$function$
;

-- Permissions

ALTER FUNCTION public.st_symdifference(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_symdifference(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_symmetricdifference(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_symmetricdifference(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE sql
AS $function$SELECT public.ST_SymDifference(geom1, geom2, -1.0);$function$
;

-- Permissions

ALTER FUNCTION public.st_symmetricdifference(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_symmetricdifference(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_tileenvelope(int4, int4, int4, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_tileenvelope(zoom integer, x integer, y integer, bounds geometry DEFAULT '0102000020110F00000200000093107C45F81B73C193107C45F81B73C193107C45F81B734193107C45F81B7341'::geometry, margin double precision DEFAULT 0.0)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_TileEnvelope$function$
;

-- Permissions

ALTER FUNCTION public.st_tileenvelope(int4, int4, int4, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_tileenvelope(int4, int4, int4, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_touches(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_touches(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$touches$function$
;

-- Permissions

ALTER FUNCTION public.st_touches(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_touches(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_transform(geometry, text, int4);

CREATE OR REPLACE FUNCTION public.st_transform(geom geometry, from_proj text, to_srid integer)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$SELECT public.postgis_transform_geometry($1, $2, proj4text, $3)
	FROM public.spatial_ref_sys WHERE srid=$3;$function$
;

-- Permissions

ALTER FUNCTION public.st_transform(geometry, text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_transform(geometry, text, int4) TO "admin";

-- DROP FUNCTION public.st_transform(geometry, text, text);

CREATE OR REPLACE FUNCTION public.st_transform(geom geometry, from_proj text, to_proj text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$SELECT public.postgis_transform_geometry($1, $2, $3, 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_transform(geometry, text, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_transform(geometry, text, text) TO "admin";

-- DROP FUNCTION public.st_transform(geometry, text);

CREATE OR REPLACE FUNCTION public.st_transform(geom geometry, to_proj text)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$SELECT public.postgis_transform_geometry($1, proj4text, $2, 0)
	FROM public.spatial_ref_sys WHERE srid=public.ST_SRID($1);$function$
;

-- Permissions

ALTER FUNCTION public.st_transform(geometry, text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_transform(geometry, text) TO "admin";

-- DROP FUNCTION public.st_transform(geometry, int4);

CREATE OR REPLACE FUNCTION public.st_transform(geometry, integer)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$transform$function$
;

-- Permissions

ALTER FUNCTION public.st_transform(geometry, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_transform(geometry, int4) TO "admin";

-- DROP FUNCTION public.st_transformpipeline(geometry, text, int4);

CREATE OR REPLACE FUNCTION public.st_transformpipeline(geom geometry, pipeline text, to_srid integer DEFAULT 0)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS $function$SELECT public.postgis_transform_pipeline_geometry($1, $2, TRUE, $3)$function$
;

-- Permissions

ALTER FUNCTION public.st_transformpipeline(geometry, text, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_transformpipeline(geometry, text, int4) TO "admin";

-- DROP FUNCTION public.st_translate(geometry, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_translate(geometry, double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$function$
;

-- Permissions

ALTER FUNCTION public.st_translate(geometry, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_translate(geometry, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_translate(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_translate(geometry, double precision, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Translate($1, $2, $3, 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_translate(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_translate(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_transscale(geometry, float8, float8, float8, float8);

CREATE OR REPLACE FUNCTION public.st_transscale(geometry, double precision, double precision, double precision, double precision)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS $function$SELECT public.ST_Affine($1,  $4, 0, 0,  0, $5, 0,
		0, 0, 1,  $2 * $4, $3 * $5, 0)$function$
;

-- Permissions

ALTER FUNCTION public.st_transscale(geometry, float8, float8, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_transscale(geometry, float8, float8, float8, float8) TO "admin";

-- DROP FUNCTION public.st_triangulatepolygon(geometry);

CREATE OR REPLACE FUNCTION public.st_triangulatepolygon(g1 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_TriangulatePolygon$function$
;

-- Permissions

ALTER FUNCTION public.st_triangulatepolygon(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_triangulatepolygon(geometry) TO "admin";

-- DROP FUNCTION public.st_unaryunion(geometry, float8);

CREATE OR REPLACE FUNCTION public.st_unaryunion(geometry, gridsize double precision DEFAULT '-1.0'::numeric)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_UnaryUnion$function$
;

-- Permissions

ALTER FUNCTION public.st_unaryunion(geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_unaryunion(geometry, float8) TO "admin";

-- DROP AGGREGATE public.st_union(geometry);

-- Aggregate function public.st_union(geometry)
-- ERROR: more than one function named "public.st_union";

-- Permissions

ALTER AGGREGATE public.st_union(geometry) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_union(geometry) TO "admin";

-- DROP FUNCTION public.st_union(_geometry);

CREATE OR REPLACE FUNCTION public.st_union(geometry[])
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$pgis_union_geometry_array$function$
;

-- Permissions

ALTER FUNCTION public.st_union(_geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_union(_geometry) TO "admin";

-- DROP AGGREGATE public.st_union(geometry, float8);

-- Aggregate function public.st_union(geometry, float8)
-- ERROR: more than one function named "public.st_union";

-- Permissions

ALTER AGGREGATE public.st_union(geometry, float8) OWNER TO "admin";
GRANT ALL ON AGGREGATE public.st_union(geometry, float8) TO "admin";

-- DROP FUNCTION public.st_union(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_union(geom1 geometry, geom2 geometry)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Union$function$
;

-- Permissions

ALTER FUNCTION public.st_union(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_union(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_union(geometry, geometry, float8);

CREATE OR REPLACE FUNCTION public.st_union(geom1 geometry, geom2 geometry, gridsize double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000
AS '$libdir/postgis-3', $function$ST_Union$function$
;

-- Permissions

ALTER FUNCTION public.st_union(geometry, geometry, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_union(geometry, geometry, float8) TO "admin";

-- DROP FUNCTION public.st_voronoilines(geometry, float8, geometry);

CREATE OR REPLACE FUNCTION public.st_voronoilines(g1 geometry, tolerance double precision DEFAULT 0.0, extend_to geometry DEFAULT NULL::geometry)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public._ST_Voronoi(g1, extend_to, tolerance, false) $function$
;

-- Permissions

ALTER FUNCTION public.st_voronoilines(geometry, float8, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_voronoilines(geometry, float8, geometry) TO "admin";

-- DROP FUNCTION public.st_voronoipolygons(geometry, float8, geometry);

CREATE OR REPLACE FUNCTION public.st_voronoipolygons(g1 geometry, tolerance double precision DEFAULT 0.0, extend_to geometry DEFAULT NULL::geometry)
 RETURNS geometry
 LANGUAGE sql
 IMMUTABLE PARALLEL SAFE
AS $function$ SELECT public._ST_Voronoi(g1, extend_to, tolerance, true) $function$
;

-- Permissions

ALTER FUNCTION public.st_voronoipolygons(geometry, float8, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_voronoipolygons(geometry, float8, geometry) TO "admin";

-- DROP FUNCTION public.st_within(geometry, geometry);

CREATE OR REPLACE FUNCTION public.st_within(geom1 geometry, geom2 geometry)
 RETURNS boolean
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 5000 SUPPORT postgis_index_supportfn
AS '$libdir/postgis-3', $function$within$function$
;

-- Permissions

ALTER FUNCTION public.st_within(geometry, geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_within(geometry, geometry) TO "admin";

-- DROP FUNCTION public.st_wkbtosql(bytea);

CREATE OR REPLACE FUNCTION public.st_wkbtosql(wkb bytea)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_from_WKB$function$
;

-- Permissions

ALTER FUNCTION public.st_wkbtosql(bytea) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_wkbtosql(bytea) TO "admin";

-- DROP FUNCTION public.st_wkttosql(text);

CREATE OR REPLACE FUNCTION public.st_wkttosql(text)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 250
AS '$libdir/postgis-3', $function$LWGEOM_from_text$function$
;

-- Permissions

ALTER FUNCTION public.st_wkttosql(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_wkttosql(text) TO "admin";

-- DROP FUNCTION public.st_wrapx(geometry, float8, float8);

CREATE OR REPLACE FUNCTION public.st_wrapx(geom geometry, wrap double precision, move double precision)
 RETURNS geometry
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$ST_WrapX$function$
;

-- Permissions

ALTER FUNCTION public.st_wrapx(geometry, float8, float8) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_wrapx(geometry, float8, float8) TO "admin";

-- DROP FUNCTION public.st_x(geometry);

CREATE OR REPLACE FUNCTION public.st_x(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_x_point$function$
;

-- Permissions

ALTER FUNCTION public.st_x(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_x(geometry) TO "admin";

-- DROP FUNCTION public.st_xmax(box3d);

CREATE OR REPLACE FUNCTION public.st_xmax(box3d)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX3D_xmax$function$
;

-- Permissions

ALTER FUNCTION public.st_xmax(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_xmax(box3d) TO "admin";

-- DROP FUNCTION public.st_xmin(box3d);

CREATE OR REPLACE FUNCTION public.st_xmin(box3d)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX3D_xmin$function$
;

-- Permissions

ALTER FUNCTION public.st_xmin(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_xmin(box3d) TO "admin";

-- DROP FUNCTION public.st_y(geometry);

CREATE OR REPLACE FUNCTION public.st_y(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_y_point$function$
;

-- Permissions

ALTER FUNCTION public.st_y(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_y(geometry) TO "admin";

-- DROP FUNCTION public.st_ymax(box3d);

CREATE OR REPLACE FUNCTION public.st_ymax(box3d)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX3D_ymax$function$
;

-- Permissions

ALTER FUNCTION public.st_ymax(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_ymax(box3d) TO "admin";

-- DROP FUNCTION public.st_ymin(box3d);

CREATE OR REPLACE FUNCTION public.st_ymin(box3d)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX3D_ymin$function$
;

-- Permissions

ALTER FUNCTION public.st_ymin(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_ymin(box3d) TO "admin";

-- DROP FUNCTION public.st_z(geometry);

CREATE OR REPLACE FUNCTION public.st_z(geometry)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_z_point$function$
;

-- Permissions

ALTER FUNCTION public.st_z(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_z(geometry) TO "admin";

-- DROP FUNCTION public.st_zmax(box3d);

CREATE OR REPLACE FUNCTION public.st_zmax(box3d)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX3D_zmax$function$
;

-- Permissions

ALTER FUNCTION public.st_zmax(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_zmax(box3d) TO "admin";

-- DROP FUNCTION public.st_zmflag(geometry);

CREATE OR REPLACE FUNCTION public.st_zmflag(geometry)
 RETURNS smallint
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$LWGEOM_zmflag$function$
;

-- Permissions

ALTER FUNCTION public.st_zmflag(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_zmflag(geometry) TO "admin";

-- DROP FUNCTION public.st_zmin(box3d);

CREATE OR REPLACE FUNCTION public.st_zmin(box3d)
 RETURNS double precision
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/postgis-3', $function$BOX3D_zmin$function$
;

-- Permissions

ALTER FUNCTION public.st_zmin(box3d) OWNER TO "admin";
GRANT ALL ON FUNCTION public.st_zmin(box3d) TO "admin";

-- DROP FUNCTION public."text"(geometry);

CREATE OR REPLACE FUNCTION public.text(geometry)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT COST 50
AS '$libdir/postgis-3', $function$LWGEOM_to_text$function$
;

-- Permissions

ALTER FUNCTION public."text"(geometry) OWNER TO "admin";
GRANT ALL ON FUNCTION public."text"(geometry) TO "admin";

-- DROP FUNCTION public.text_soundex(text);

CREATE OR REPLACE FUNCTION public.text_soundex(text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/fuzzystrmatch', $function$soundex$function$
;

-- Permissions

ALTER FUNCTION public.text_soundex(text) OWNER TO "admin";
GRANT ALL ON FUNCTION public.text_soundex(text) TO "admin";

-- DROP FUNCTION public.updategeometrysrid(varchar, varchar, varchar, varchar, int4);

CREATE OR REPLACE FUNCTION public.updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer)
 RETURNS text
 LANGUAGE plpgsql
 STRICT
AS $function$
DECLARE
	myrec RECORD;
	okay boolean;
	cname varchar;
	real_schema name;
	unknown_srid integer;
	new_srid integer := new_srid_in;

BEGIN

	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = false;

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := true;
		END LOOP;

		IF ( okay <> true ) THEN
			RAISE EXCEPTION 'Invalid schema name';
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT INTO real_schema current_schema()::text;
	END IF;

	-- Ensure that column_name is in geometry_columns
	okay = false;
	FOR myrec IN SELECT type, coord_dimension FROM public.geometry_columns WHERE f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := true;
	END LOOP;
	IF (NOT okay) THEN
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN false;
	END IF;

	-- Ensure that new_srid is valid
	IF ( new_srid > 0 ) THEN
		IF ( SELECT count(*) = 0 from public.spatial_ref_sys where srid = new_srid ) THEN
			RAISE EXCEPTION 'invalid SRID: % not found in spatial_ref_sys', new_srid;
			RETURN false;
		END IF;
	ELSE
		unknown_srid := public.ST_SRID('POINT EMPTY'::public.geometry);
		IF ( new_srid != unknown_srid ) THEN
			new_srid := unknown_srid;
			RAISE NOTICE 'SRID value % converted to the officially unknown SRID value %', new_srid_in, new_srid;
		END IF;
	END IF;

	IF postgis_constraint_srid(real_schema, table_name, column_name) IS NOT NULL THEN
	-- srid was enforced with constraints before, keep it that way.
		-- Make up constraint name
		cname = 'enforce_srid_'  || column_name;

		-- Drop enforce_srid constraint
		EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
			'.' || quote_ident(table_name) ||
			' DROP constraint ' || quote_ident(cname);

		-- Update geometries SRID
		EXECUTE 'UPDATE ' || quote_ident(real_schema) ||
			'.' || quote_ident(table_name) ||
			' SET ' || quote_ident(column_name) ||
			' = public.ST_SetSRID(' || quote_ident(column_name) ||
			', ' || new_srid::text || ')';

		-- Reset enforce_srid constraint
		EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
			'.' || quote_ident(table_name) ||
			' ADD constraint ' || quote_ident(cname) ||
			' CHECK (st_srid(' || quote_ident(column_name) ||
			') = ' || new_srid::text || ')';
	ELSE
		-- We will use typmod to enforce if no srid constraints
		-- We are using postgis_type_name to lookup the new name
		-- (in case Paul changes his mind and flips geometry_columns to return old upper case name)
		EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' || quote_ident(table_name) ||
		' ALTER COLUMN ' || quote_ident(column_name) || ' TYPE  geometry(' || public.postgis_type_name(myrec.type, myrec.coord_dimension, true) || ', ' || new_srid::text || ') USING public.ST_SetSRID(' || quote_ident(column_name) || ',' || new_srid::text || ');' ;
	END IF;

	RETURN real_schema || '.' || table_name || '.' || column_name ||' SRID changed to ' || new_srid::text;

END;
$function$
;

-- Permissions

ALTER FUNCTION public.updategeometrysrid(varchar, varchar, varchar, varchar, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.updategeometrysrid(varchar, varchar, varchar, varchar, int4) TO "admin";

-- DROP FUNCTION public.updategeometrysrid(varchar, varchar, int4);

CREATE OR REPLACE FUNCTION public.updategeometrysrid(character varying, character varying, integer)
 RETURNS text
 LANGUAGE plpgsql
 STRICT
AS $function$
DECLARE
	ret  text;
BEGIN
	SELECT public.UpdateGeometrySRID('','',$1,$2,$3) into ret;
	RETURN ret;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.updategeometrysrid(varchar, varchar, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.updategeometrysrid(varchar, varchar, int4) TO "admin";

-- DROP FUNCTION public.updategeometrysrid(varchar, varchar, varchar, int4);

CREATE OR REPLACE FUNCTION public.updategeometrysrid(character varying, character varying, character varying, integer)
 RETURNS text
 LANGUAGE plpgsql
 STRICT
AS $function$
DECLARE
	ret  text;
BEGIN
	SELECT public.UpdateGeometrySRID('',$1,$2,$3,$4) into ret;
	RETURN ret;
END;
$function$
;

-- Permissions

ALTER FUNCTION public.updategeometrysrid(varchar, varchar, varchar, int4) OWNER TO "admin";
GRANT ALL ON FUNCTION public.updategeometrysrid(varchar, varchar, varchar, int4) TO "admin";


-- Permissions;