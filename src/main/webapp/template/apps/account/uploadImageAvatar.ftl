	<div id="crop-avatar" class="item-box" style="box-shadow: 0px 0px 0px; margin-bottom: 10px; padding: 5px 5px 5px 5px;">

		<!-- Current avatar -->
	    <div class="avatar-view thumbnail-hover" title="Change the avatar">
	      <img id="myImgAvatarId" src="${myImgAvatar?if_exists}" alt="Avatar">
	    </div>

	    <!-- Cropping modal -->
	    <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
	      <div class="modal-dialog modal-md">
	        <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal">&times;</button>
	              <h4 class="modal-title" id="avatar-modal-label">Change Avatar</h4>
	            </div>
	            <div class="modal-body">
	              <div class="avatar-body">

	                <!-- Upload image and data -->
	                <div class="avatar-upload">
	                  <input type="hidden" class="avatar-src" name="avatar_src">
	                  <input type="hidden" class="avatar-data" name="avatar_data">
	                  <label for="avatarInput">Local upload</label>
	                  <input type="file" class="avatar-input" id="avatarInput" name="avatar_file">
	                </div>

	                <!-- Crop and preview -->
	                <div class="row">
	                  <div class="col-md-12">
	                    <div class="avatar-wrapper">
	                    <#if myImgAvatar??>
	                    	<img id="profileImg" src="${myImgAvatar?if_exists}" style="width: 50%; margin-left: auto;margin-right: auto">
	                    <#else>
	                    	<img id="profileImg" src="${configBean.contextPath?if_exists}/static/apps/img/defaultBg01.png">
	                    </#if>
	                    </div>
	                  </div>
	                </div>

	                <div class="row avatar-btns">
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
	                    	<button type="button" class="btn btn-primary btn-block avatar-save" data-dismiss="modal" onclick="javascript: uploadImg();">
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
<!-- end - model windows -->