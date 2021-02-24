<div class="m-portlet m-portlet--mobile m-portlet--rounded m-portlet--head-solid-bg">
<div class="m-portlet__head sp-box-table">
<div class="m-portlet__head-caption">
<div class="m-portlet__head-title">
<h3 class="m-portlet__head-text sp-box-table"> {="AutoDJ: Extra"} </h3>
</div>
</div>
</div>
<div class="m-portlet__body">

{check $icy_options==0}
{otherwisecheck ($actual_admin>0) or ($client_encoder_settings>0)}

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Crossfade fade-in"}</span>
</div>
<input type="text" name="config[crossfade_fadein]" class="form-control" value="{$config.crossfade_fadein|htmlentities}" /> {$errors.crossfade_fadein|checkerror}
<div class="input-group-append">
<span class="input-group-text">{="second(s)"}</span>
</div>
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Crossfade fade-out"}</span>
</div>
<input type="text" name="config[crossfade_fadeout]" class="form-control" value="{$config.crossfade_fadeout|htmlentities}" /> {$errors.crossfade_fadeout|checkerror}
<div class="input-group-append">
<span class="input-group-text">{="second(s)"}</span>
</div>
</div>

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Crossfade fade-out"}</span>
</div>
<select name="config[crossfade_mode]" class="form-control">
<option value="normal"{if $config.crossfade_mode=="normal"} selected="selected"{/if}>{="Normal"}</option>
<option value="smart"{if $config.crossfade_mode=="smart"} selected="selected"{/if}>{="Smart"}</option>
</select> {$errors.crossfade_mode|checkerror}
</div>
{/check}

<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text">{="Apply replay gain"}</span>
</div>
<select name="config[replay_gain]" class="form-control">
<option value="1"{if $config.replay_gain!="0"} selected="selected"{/if}>{="Yes"}</option>
<option value="0"{if $config.replay_gain=="0"} selected="selected"{/if}>{="No"}</option>
</select> {$errors.replay_gain|checkerror}
</div>

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

<p>{="Tip: Use the %sMount Points%s tab to configure settings for your individual autoDJ encoders.","<a href='#' onclick='go_mp_tab(); return false'>","</a>"}</p>

</div>
</div>
