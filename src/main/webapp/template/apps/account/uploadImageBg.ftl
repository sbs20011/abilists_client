	<div id="crop-avatar-bg" class="item-box" style="box-shadow: 0px 0px 0px; margin-bottom: 10px; padding: 5px 5px 5px 5px;">
	    <!-- Current avatar -->
	    <div class="avatar-view-bg thumbnail-hover" title="Change the back ground">
	      <img id="myImgBgId" src="${myImgBg?if_exists}" alt="backGround" style="width: 100%; padding: 35px;">
	    </div>

	    <!-- Cropping modal -->
	    <div class="modal fade" id="avatar-modal-bg" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
	      <div class="modal-dialog modal-md">
	        <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal">&times;</button>
	              <h4 class="modal-title" id="avatar-modal-label">Change your image</h4>
	            </div>
	            <div class="modal-body">
	              <div class="avatar-body">

	                <!-- Upload image and data -->
	                <div class="avatar-upload-bg">
	                  <input type="hidden" class="avatar-src-bg" name="avatar_src">
	                  <input type="hidden" class="avatar-data-bg" name="avatar_data">
	                  <label for="avatarInputBg">Local upload</label>
	                  <input type="file" class="avatar-input-bg" id="avatarInputBg" name="avatar_file">
	                </div>

	                <!-- Crop and preview -->
	                <div class="row">
	                  <div class="col-md-12">
	                    <div class="avatar-wrapper-bg">
	                    <#if myImgBg??>
	                    	<img id="profileImgBg" src="${myImgBg?if_exists}" style="width: 100%; margin-left: auto;margin-right: auto">
	                    <#else>
	                    	<img id="profileImgBg" src="${configBean.contextPath?if_exists}/static/apps/img/defaultBg01.png">
	                    </#if>
	                    </div>
	                  </div>
	                </div>

	                <div class="row avatar-btns-bg">
	                  <div class="col-md-12">
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-primary" data-method="rotate" data-option="-15" title="Rotate -15 degrees">-15deg</button>
	                    </div>
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-primary" data-method="rotate" data-option="15" title="Rotate 15 degrees">15deg</button>
	                    </div>
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-primary" data-method="zoom" data-option="0.1" title="Zoom In">Zoom In</button>
	                    </div>
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-primary" data-method="zoom" data-option="-0.1" title="Zoom Out">Zoom Out</button>
	                    </div>
	                    <div class="btn-group">
	                    	<button type="button" class="btn btn-primary btn-block avatar-save-bg" data-dismiss="modal" onclick="javascript: uploadImgBg();">
	                    		<span class="glyphicon glyphicon-picture"></span> <@spring.message "picture.button.upload"/>
	                    	</button>
	                    </div>
	                  </div>
	                </div>

	              </div>
	            </div>

	        </div>
	      </div>
	    </div><!-- /.modal -->
	    <!-- Loading state -->
	    <div class="${configBean.contextPath?if_exists}/static/apps/img/loading" aria-label="Loading" role="img" tabindex="-1"></div>
	</div><!-- /item-box-->
