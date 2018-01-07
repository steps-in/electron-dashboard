<template>
	<div class="device-control">
		<div class="control-status session-status">
			<div class="row">
				<div class="col">
					<h4>Session<span style="display: none;"> value {{sessionSize}}</span></h4>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="session-count form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">-</span>
							</div>
							<input type="text" class="form-control" v-model="sessionSize">
							<div class="input-group-append">
								<span class="input-group-text">+</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="control-status file-status">
			<div class="row">
				<div class="col">
					<h4>File Size<span style="display: none;"> value {{fileSize}}</span></h4>
				</div>
			</div>
			<div class="row">
				<div class="col-auto">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-secondary">
							<input type="checkbox" autocomplete="off">
							<span class="oi oi-loop"></span> Automatic Size
						</label>
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<select class="form-control" v-model="fileSize">
							<option value="4096">4 KB</option>
							<option value="512">512 KB</option>
							<option value="1">1 MB</option>
							<option value="16">16 MB</option>
							<option value="128">128 MB</option>
							<option value="256">256 MB</option>
							<option value="1024">1024 MB</option>
							<option value="0">Auto</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="control-status common-status">
			<div class="row">
				<div class="col">
					<h4>Common Value<span style="display: none;"> value {{commonValue}}</span></h4>
				</div>
			</div>
			<div class="row">
				<div class="col-8 form-slider">
					<vue-slider v-model="commonValue" v-bind="commonValueOption"></vue-slider>
				</div>
				<div class="col-4">
					<div class="form-group">
						<select class="form-control" v-model="commonValue">
							<option value="256">256</option>
							<option value="512">512</option>
							<option value="1024">1024</option>
							<option value="2048">2048</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="control-status core-status">
			<div class="row">
				<div class="col">
					<h4>Dedicated CPU Cores</h4>
				</div>
			</div>
			<div class="row form-inline">
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						0
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						1
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						2
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						3
					</label>
				</div>
				<div class="col-auto">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-secondary">
							<input type="checkbox" autocomplete="off">
							<span class="oi oi-loop-square"></span>
						</label>
					</div>
				</div>
			</div>
			<div class="row form-inline">
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						4
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						5
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						6
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						7
					</label>
				</div>
				<div class="col-auto">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-secondary">
							<input type="checkbox" autocomplete="off">
							<span class="oi oi-loop-square"></span>
						</label>
					</div>
				</div>
			</div>
			<div class="row form-inline">
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						8
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						9
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						10
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						11
					</label>
				</div>
				<div class="col-auto">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn">
							<input type="checkbox" autocomplete="off">
							<span class="oi oi-loop-square"></span>
						</label>
					</div>
				</div>
			</div>
			<div class="row form-inline">
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						12
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						13
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						14
					</label>
				</div>
				<div class="col form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input">
						15
					</label>
				</div>
				<div class="col-auto">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-secondary active">
							<input type="checkbox" autocomplete="off">
							<span class="oi oi-loop-square"></span>
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="control-status save-action">
			<div class="row">
				<div class="col mt-5">
					<button type="button" class="btn btn-outline-success btn-block">Save Settings</button>
				</div>
			</div>
		</div>
	</div>
</template>

<style lang="stylus">
	.device-control
		margin 2em 10px

	.control-status
		h4
			font-size: 1em
			color: #A6A6A6
		.form-control
			border 1px solid #ABABAB
			padding: 2px 4px
			font-size: 0.9em
		.form-slider
			padding-right: 0
			padding-top: 1em
	.core-status
		.form-inline
			padding: 2px 0
			font-family: Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace
			.form-check
				justify-content left
				font-size: 0.9em
			.col-auto
				.btn
					padding: 2px 6px 4px
					font-size: 0.9em
					border-radius 1px
</style>

<script lang="coffee">
	vueSlider = require 'vue-slider-component'
	sessionSize = 10
	fileSize = 1
	commonValue = 2048
	commonValueOption =
		max: 2048

	module.exports =
		components: { vueSlider }
		data: () -> { sessionSize, fileSize, commonValue, commonValueOption }
</script>
