{resource type="js" src="/system/liquidsoap_settings_manager.js" depends="mpeditor"}
{onready method="last"}
	LSMPManager.initialize({$liquidsoap_formats_fields});
{/onready}

	{include "autodj_mountpoint_lang.tpl"}
	
	<fieldset id="autodj_tab">
		<legend>{="AutoDJ Settings"}</legend>
		<table cellspacing="1" cellpadding="0" border="0">
		<tr>
			<td width="130">{="Use autoDJ"}:</td>
			<td><select name="mountpoints_field[useautodj]" class="list_editor_field" size="1" id="useautodj"><option value="0">{="No"}</option><option value="1">{="Yes"}</option></select></td>
		</tr>
		<tr>
			<td>{if $mpsinglemount}{="Stream name"}{else}{="Mount point name"}{/if}:&nbsp;</td>
			<td colspan="3"><input type="text" name="mountpoints_field[liqname]" class="list_editor_field" size="32" maxlength="64" value="{$config.mountpoints.liqname|htmlentities}" /></td>
		</tr>
		{if $config.servertype!="ShoutCast2"}
		<tr>
			<td>{="Description"}:&nbsp;</td>
			<td colspan="3"><input type="text" id="liq-description" name="mountpoints_field[liqdescription]" class="list_editor_field" size="32" maxlength="64" value="{$config.mountpoints.liqdescription|htmlentities}" /></td>
		</tr>
		{/if}
		<tr>
			<td>{="Public"}:&nbsp;</td>
			<td colspan="3">
				<select name="mountpoints_field[liqpublic]" class="list_editor_field" size="1">
				<option value="false"{if $config.mountpoints.liqpublic!="true"} selected="selected"{/if}>{="No"}</option>
				<option value="true"{if $config.mountpoints.liqpublic=="true"} selected="selected"{/if}>{="Yes"}</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>{="Audio encoder"}:&nbsp;</td>
			<td>
				<select name="mountpoints_field[liqencoder]" class="list_editor_field" size="1" id="liq_encoder">
				{loop $liquidsoap_format=$liquidsoap_formats}
				{if ($liquidsoap_format=="mp3")}<option value="mp3">{="MP3"}</option>{/if}
				{if ($liquidsoap_format=="vorbis")}<option value="vorbis">{="Ogg/Vorbis"}</option>{/if}
				{if ($liquidsoap_format=="opus")}<option value="opus">{="Ogg/Opus"}</option>{/if}
				{if ($liquidsoap_format=="aac")}<option value="aac">{="AAC"}</option>{/if}
				{if ($liquidsoap_format=="aacplus")}<option value="aacplus">{="AAC+"}</option>{/if}
				{if ($liquidsoap_format=="fdkaac")}<option value="fdkaac">{="FDK-AAC"}</option>{/if}
				{/loop}
				</select>
			</td>
		</tr>
		<tr>
			<td>{="Encoding type"}:&nbsp;</td>
			<td>
				<select name="mountpoints_field[liqencodingtype]" class="list_editor_field{check $modify_encoder_settings==0} not_modifiable{/check}" size="1" id="liq_encoding">
				<option value="cbr">{="Constant bitrate encoding (CBR)"}</option>
				<option value="vbr">{="Variable bitrate encoding (VBR)"}</option>
				<option value="abr">{="Average bitrate based encoding (ABR)"}</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>{="Bit rate"}:&nbsp;</td>
			<td>{bitrate_field name="mountpoints_field[liqbitrate]" size="1" class="list_editor_field mpbitrate" value=$config.liqbitrate} {$errors.maxbitrate|checkerror}</td>
		</tr>
		<tr>
			<td>{="Bit rate"}:&nbsp;</td>
			<td>{bitrate_field name="mountpoints_field[liqopusbitrate]" size="1" class="list_editor_field mpbitrate" value=$config.liqopusbitrate min=8 max=512} {$errors.maxbitrate|checkerror}</td>
		</tr>
		<tr>
			<td>{="Minimum bit rate"}:&nbsp;</td>
			<td>{bitrate_field name="mountpoints_field[liqmin_bitrate]" size="1" class="list_editor_field mpbitrate mptiplessbitrate" value=$config.liqmin_bitrate} {$errors.maxbitrate|checkerror}</td>
		</tr>
		<tr>
			<td>{="Maximum bit rate"}:&nbsp;</td>
			<td>{bitrate_field name="mountpoints_field[liqmax_bitrate]" size="1" class="list_editor_field mpbitrate mptiplessbitrate" value=$config.liqmax_bitrate} {$errors.maxbitrate|checkerror}</td>
		</tr>

		{check $modify_encoder_settings>0}
		<tr>
			<td>{="Channels"}:&nbsp;</td>
			<td>
				<select name="mountpoints_field[liqchannels]" class="list_editor_field" size="1">
				<option value="2">{="Stereo"}</option>
				<option value="1">{="Mono"}</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>{="Channels"}:&nbsp;</td>
			<td>
				<select name="mountpoints_field[liqstereo]" class="list_editor_field" size="1">
				<option value="true">{="Stereo"}</option>
				<option value="false">{="Mono"}</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>{="Sample rate"}:&nbsp;</td>
			<td>
				{* Note: Opus ONLY supports these specific sample rates *}
				{set $opussamplerates}8000,12000,16000,24000,48000{/set}

				<select name="mountpoints_field[liqopussamplerate]" class="list_editor_field" size="1">
				{loop $samplerate=$opussamplerates|explode:",":1000}
				<option value="{$samplerate}">{="%s Hz",$samplerate}</option>
				{/loop}
				</select>
			</td>
		</tr>
		<tr>
			<td>{="Sample rate"}:&nbsp;</td>
			<td>
				{* Note: You can add custom sample rates by simply appending them to *}
				{* this list, separated by commas as shown. *}
				{set $samplerates}8000,11025,22050,32000,44100,48000,88200,96000{/set}

				<select name="mountpoints_field[liqsamplerate]" class="list_editor_field" size="1">
				{loop $samplerate=$samplerates|explode:",":1000}
				<option value="{$samplerate}">{="%s Hz",$samplerate}</option>
				{/loop}
				</select>
			</td>
		</tr>
		{/check}
		</table>

		{check $modify_encoder_settings>0}
		<div id="advancedbtn" class="advancedbtn">{="Advanced settings"}</div>
		<div id="liqadvanced" style="display: none">
			<table cellspacing="1" cellpadding="0" border="0">
			<tr><td width="130" style="font-size: 1px">&nbsp;</td><td></td></tr>
			<tr>
				<td>{="Stereo mode"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqstereo_mode]" class="list_editor_field" size="1">
					<option value="default">{="Default"}</option>
					<option value="stereo">{="Stereo"}</option>
					<option value="joint_stereo">{="Joint Stereo"}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>{="Maximum bandwidth"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqopusmax_bandwidth]" class="list_editor_field" size="1">
					<option value="full_band">{="Full band"}</option>
					<option value="super_wide_band">{="Super wide band"}</option>
					<option value="wide_band">{="Wide band"}</option>
					<option value="medium_band">{="Medium band"}</option>
					<option value="narrow_band">{="Narrow band"}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>{="VBR mode"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqopusvbr]" class="list_editor_field" size="1">
					<option value="none">{="None"}</option>
					<option value="constrained">{="Constrained"}</option>
					<option value="unconstrained">{="Unconstrained"}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>{="Complexity"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqopuscomplexity]" class="list_editor_field" size="1">
					{loop $comp=$_|range:0:10}
					<option value="{$comp}">{$comp}</option>
					{/loop}
					</select>
				</td>
			</tr>
			<tr>
				<td>{="Application"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqopusapplication]" class="list_editor_field" size="1">
					<option value="audio">{="Audio"}</option>
					<option value="voip">{="VOIP"}</option>
					<option value="restricted_lowdelay">{="Restricted/Low Delay"}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>{="Signal"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqopussignal]" class="list_editor_field" size="1">
					<option value="music">{="Music"}</option>
					<option value="voice">{="Voice"}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>{="ADTS"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqaacadts]" class="list_editor_field" size="1">
					<option value="true">{="Yes"}</option>
					<option value="false">{="No"}</option>
					</select>
				</td>
			</tr>

			<tr>
				<td>{="Afterburner"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqfdkafterburner]" class="list_editor_field" size="1">
					<option value="false">{="No"}</option>
					<option value="true">{="Yes"}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>{="Audio object type"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqfdkaot]" class="list_editor_field" size="1">
					<option value="mpeg4_he_aac_v2">MPEG4 HE-AAC v2 (MPEG-4 AAC Low Complexity with Spectral Band Replication and Parametric Stereo)</option>
					<option value="mpeg4_he_aac">MPEG4 HE-AAC (MPEG-4 AAC Low Complexity with Spectral Band Replication)</option>
					<option value="mpeg4_aac_lc">MPEG-4 AAC Low Complexity</option>
					<option value="mpeg4_aac_ld">MPEG-4 AAC Low-Delay</option>
					<option value="mpeg4_aac_eld">MPEG-4 AAC Enhanced Low-Delay</option>
	<!--
					<option value="mpeg2_he_aac_v2">MPEG2 HE-AAC v2 (MPEG-2 AAC Low Complexity with Spectral Band Replication and Parametric Stereo)</option>
					<option value="mpeg2_he_aac">MPEG2 HE-AAC (MPEG-2 AAC Low Complexity with Spectral Band Replication)</option>
					<option value="mpeg2_aac_lc">MPEG-2 AAC Low Complexity</option>
	-->
					</select>
				</td>
			</tr>
			<tr>
				<td>{="Transport type"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqfdktransmux]" class="list_editor_field" size="1">
					<option value="adts">{="ADTS bitstream format"}</option>
					<option value="adif">{="ADIF bitstream format"}</option>
					<option value="raw">{="Raw"}</option>
					<option value="latm">{="Audio mux elements (LATM)"}</option>
					<option value="latm_out_of_band">{="Audio mux elements (LATM), out-of-band"}</option>
					<option value="loas">{="Audio sync stream (LOAS)"}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>{="SBR mode"}:&nbsp;</td>
				<td>
					<select name="mountpoints_field[liqfdksbr_mode]" class="list_editor_field" size="1">
					<option value="false">{="No"}</option>
					<option value="true">{="Yes"}</option>
					</select>
				</td>
			</tr>
			</table>
		</div>
		{/check}
	</fieldset>
