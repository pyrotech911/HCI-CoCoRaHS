<%@ page import="cocorahs.Photo" %>



<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'post', 'error')} required">
	<label for="post">
		<g:message code="photo.post.label" default="Post" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="post" name="post.id" from="${cocorahs.Post.list()}" optionKey="id" required="" value="${photoInstance?.post?.id}" class="many-to-one"/>

</div>

