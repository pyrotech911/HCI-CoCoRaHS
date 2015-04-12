<%@ page import="cocorahs.Photo" %>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'post', 'error')} required">
    <div class="postList">
	    <label for="post">
		    %{--<g:message code="photo.post.label" default="Post" />--}%
 		    <span class="required-indicator">*</span>
	    </label>
	    <g:select id="post" name="post.id" from="${cocorahs.Post.list()}" optionKey="id" required="" value="${photoInstance?.post?.id}" class="many-to-one"/>

        <div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'photo', 'error')} ">
            <input style="display:inline" type="file" name="photo" accept="image/*" capture "/>
        </div>
    </div>
</div>

