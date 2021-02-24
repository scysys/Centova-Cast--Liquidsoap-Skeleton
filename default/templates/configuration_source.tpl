<table cellspacing="1" cellpadding="0" border="0">
{check $icy_options==0}
{otherwisecheck ($actual_admin>0) or ($client_encoder_settings>0)}
<tr>
	<td>{="Crossfade fade-in"}:&nbsp;</td>
	<td><input type="text" name="config[crossfade_fadein]" size="5" value="{$config.crossfade_fadein|htmlentities}" /> {="second(s)"} {$errors.crossfade_fadein|checkerror}</td>
</tr>
<tr>
	<td>{="Crossfade fade-out"}:&nbsp;</td>
	<td><input type="text" name="config[crossfade_fadeout]" size="5" value="{$config.crossfade_fadeout|htmlentities}" /> {="second(s)"} {$errors.crossfade_fadeout|checkerror}</td>
</tr>
<tr>
	<td>{="Crossfade mode"}:&nbsp;</td>
	<td>
		<select name="config[crossfade_mode]" size="1">
		<option value="normal"{if $config.crossfade_mode=="normal"} selected="selected"{/if}>{="Normal"}</option>
		<option value="smart"{if $config.crossfade_mode=="smart"} selected="selected"{/if}>{="Smart"}</option>
		</select> {$errors.crossfade_mode|checkerror}
	</td>
</tr>
{/check}
<tr>
	<td width="140">{="Apply replay gain"}:&nbsp;</td>
	<td>
		<select name="config[replay_gain]" size="1">
		<option value="1"{if $config.replay_gain!="0"} selected="selected"{/if}>{="Yes"}</option>
		<option value="0"{if $config.replay_gain=="0"} selected="selected"{/if}>{="No"}</option>
		</select> {$errors.replay_gain|checkerror}
	</td>
</tr>
<!--
<tr>
	<td>{="Resume track after live"}:&nbsp;</td>
	<td>
		<select name="config[live_to_autodj_skip]" size="1">
		<option value="0"{if $config.live_to_autodj_skip=="0"} selected="selected"{/if}>{="Yes"}</option>
		<option value="1"{if $config.live_to_autodj_skip=="1"} selected="selected"{/if}>{="No"}</option>
		</select> {$errors.live_to_autodj_skip|checkerror} {tip type="icon"}{="Determines which track listeners will hear when transitioning back to the autoDJ after a live broadcast"}:<br/><br/><strong>{="No"}</strong>: {="the autoDJ will start a new track after the live broadcast"}<br/><strong>{="Yes"}</strong>: {="the autoDJ will resume playing the track that was in progress when the live broadcast began"}{/tip}
	</td>
</tr>
-->

</table>

<br />
{="Tip: Use the %sMount Points%s tab to configure settings for your individual autoDJ encoders.","<a href='#' onclick='go_mp_tab(); return false'>","</a>"}
