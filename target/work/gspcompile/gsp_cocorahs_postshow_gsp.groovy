import cocorahs.Post
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_cocorahs_postshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/post/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'name':("layout"),'content':("main")],-1)
printHtmlPart(2)
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'post.label', default: 'Post'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("default.show.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',8,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',8,[:],2)
printHtmlPart(3)
invokeTag('stylesheet','asset',9,['src':("mystyle.css")],-1)
printHtmlPart(4)
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(4)
createTagBody(1, {->
printHtmlPart(5)
invokeTag('message','g',12,['code':("default.link.skip.label"),'default':("Skip to content&hellip;")],-1)
printHtmlPart(6)
invokeTag('render','g',13,['template':("/navbar")],-1)
printHtmlPart(7)
invokeTag('message','g',15,['code':("default.show.label"),'args':([entityName])],-1)
printHtmlPart(8)
if(true && (flash.message)) {
printHtmlPart(9)
expressionOut.print(flash.message)
printHtmlPart(10)
}
printHtmlPart(11)
if(true && (postInstance?.comment)) {
printHtmlPart(12)
invokeTag('message','g',23,['code':("post.comment.label"),'default':("Comment")],-1)
printHtmlPart(13)
invokeTag('fieldValue','g',25,['bean':(postInstance),'field':("comment")],-1)
printHtmlPart(14)
}
printHtmlPart(15)
if(true && (postInstance?.photos)) {
printHtmlPart(16)
invokeTag('message','g',32,['code':("post.photos.label"),'default':("Photos")],-1)
printHtmlPart(17)
for( p in (postInstance.photos) ) {
printHtmlPart(18)
createTagBody(4, {->
expressionOut.print(p?.encodeAsHTML())
})
invokeTag('link','g',35,['controller':("photo"),'action':("show"),'id':(p.id)],4)
printHtmlPart(19)
}
printHtmlPart(20)
}
printHtmlPart(21)
if(true && (postInstance?.station)) {
printHtmlPart(22)
invokeTag('message','g',44,['code':("post.station.label"),'default':("Station")],-1)
printHtmlPart(23)
createTagBody(3, {->
expressionOut.print(postInstance?.station?.encodeAsHTML())
})
invokeTag('link','g',46,['controller':("station"),'action':("show"),'id':(postInstance?.station?.id)],3)
printHtmlPart(14)
}
printHtmlPart(24)
if(true && (postInstance?.photos)) {
printHtmlPart(25)
expressionOut.print(createLink(controller:'post', action:'showPhoto', id:"${postInstance.id}"))
printHtmlPart(26)
}
printHtmlPart(27)
})
invokeTag('captureBody','sitemesh',55,[:],1)
printHtmlPart(28)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1428872904000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
