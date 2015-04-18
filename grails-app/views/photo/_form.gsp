<%@ page import="cocorahs.Photo" %>

<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'post', 'error')} required">
    <div class="postList">
        <label for="post">
            <span class="required-indicator">*</span>
        </label>

        <g:select id="post" name="post.id" from="${cocorahs.Post.list()}" optionKey="id" required="" value="${photoInstance?.post?.id}" class="many-to-one"/>
    </div>
</div>



<div class="fieldcontain ${hasErrors(bean: photoInstance, field: 'photo', 'error')} ">
    <label for="photo">
        <input style="display:inline"  type="file" name="photo" accept="image/*" capture "/>
    </label>
</div>


