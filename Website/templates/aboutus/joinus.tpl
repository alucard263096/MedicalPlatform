<{include file="$smarty_root/header.tpl" }>


	<!-- Start page head -->
		<section class="page-head contain-head">
			<div class="container">
				<div class="row">
					<div class="span9 head-text">
						<h3><i class="icon-plus-sign-alt"></i>雷德睦华诚邀您的加盟！</h3>
						<p>
						公司拥有稳定成熟的产品销售市场，经营的产品为同领域中的优秀产品，公司负责德国骨水泥产品在大陆地区的渠道销售管理及市场技术支持服务。
						</p>
					</div>
					<div class="span3">
						<i class="icon icon-plus-sign-alt"></i>
					</div>
				</div>
			</div>			
		</section>
		<!-- End page head -->


<!-- Start contain -->
		<section class="page-contain">
			<div class="container">
				<div class="row">
						<div class="span12">
						  	<div class='span7'>
						  		<div class="contact-form-wrapper">
						  		<div class="contact-form">
								<h4>申请表格</h4>
						  		<p class="tip">请您准确填写下列加盟信息，以便我们能及时与您联系，达成合作！</p>
								<form id="contactform" action="joinus.action.php" method="post" class="validateform" name="leaveContact">	
									<ul class="listForm">
										<li>
											<label>姓名:<span>&#40; 必填 &#41;</span></label>
											<input class="input-block-level contact-input" type="text" name="name" data-rule="maxlen:2" data-msg="至少输入两位字符" value="<{$name}>" />									
											<div class="validation"></div>
										</li>
										<li>
											<label>职务<span>&#40; 必填 &#41;</span></label>
											<input class="input-block-level contact-input" type="text" name="position" data-rule="maxlen:2" data-msg="至少输入两位字符"  />										
											<div class="validation"></div>
										</li>
										<li>
											<label>E-mail<span>&#40; 必填 &#41;</span></label>
											<input class="input-block-level contact-input" type="text" name="email" data-rule="email" data-msg="请输入有效的邮件地址"  />										
											<div class="validation"></div>
										</li>
										<li>
											<label>联系电话<span>&#40; 必填 &#41;</span></label>
											<input class="input-block-level contact-input" type="text" name="phone" data-rule="digits" data-msg="请输入有效的联系电话"  value="<{$phone}>" />										
											<div class="validation"></div>
										</li>
										<li>
											<label>QQ<span>&#40; 必填 &#41;</span></label>
											<input class="input-block-level contact-input" type="text" name="qq" data-rule="digits" data-msg="请输入有效的QQ号码"  />										
											<div class="validation"></div>
										</li>
										<li>
											<h5>您的公司信息:</h5>
										</li>
										<li>
											<label>公司名称<span>&#40; 必填 &#41;</span></label>
											<input class="input-block-level contact-input" type="text" name="company_name" data-rule="maxlen:2" data-msg="至少输入两位字符"  value="<{$company_name}>" />										
											<div class="validation"></div>
										</li>
										<li>
											<label>公司所在地<span>&#40; 必填 &#41;</span></label>
											<input class="input-block-level contact-input" type="text" name="company_city" data-rule="maxlen:2" data-msg="至少输入两位字符"  />										
											<div class="validation"></div>
										</li>
										<li>
											<label>公司地址<span>&#40; 必填 &#41;</span></label>
											<input class="input-block-level contact-input" type="text" name="company_address" data-rule="maxlen:2" data-msg="至少输入两位字符"  value="<{$company_address}>" />										
											<div class="validation"></div>
										</li>
										<li>
											<label>公司电话<span>&#40; 必填 &#41;</span></label>
											<input class="input-block-level contact-input" type="text" name="company_phone" data-rule="digits" data-msg="请输入有效的联系电话"  />										
											<div class="validation"></div>
										</li>
										<li>
											<label>您是否已初步了解合作方式？
											<input name="knew" type="radio" checked="" value="Y"><span>是</span>
						        			<input name="knew" type="radio" value="N"><span>否</span>
						        			</label>
										</li>
										<li>
											<label>我的留言</label>
											<textarea class="input-block-level contact-input" rows="9" name="message" ><{$message}></textarea>
										</li>
										<li>
											<label>您希望进一步了解的信息是</label>
											<textarea class="input-block-level contact-input" rows="9" name="question" ></textarea>
										</li>
										<li>
											<input id='formsubmit' type="submit" value="提交信息" class="btn btn-large btn-primary" name="Submit" />
										</li>
									</ul>
									<div id="errormessage"></div>
									<div id="sendmessage">申请成功，请等待我们专人为你联系。</div>
								</form>
								</div>
								</div>
							</div>
						  	<div class='span3'>
							  <div class="col-2 thanksword">
							   <span>感谢您选择加盟雷德睦华！除在线申请外您还可以通过如下方式联系我们或了解相关信息：</span>
							    <p><a href="<{$rootpath}>/aboutus/contactus.php" target="_blank">联系当地机构 &gt;</a></p>
							    <p><a href="<{$rootpath}>/aboutus/contactus.php">微信关注我们 &gt;</a></p>
							    <p><a href="<{$rootpath}>/index.php" target="_blank">在线了解产品 &gt;</a></p>
							  </div>
						   </div>
						</div>
						
						
				</div>
			</div>
		</section>


	<script src="<{$rootpath}>/themes/lm/rinna/js/validation.js"></script>
	
<{include file="$smarty_root/footer.tpl" }>
