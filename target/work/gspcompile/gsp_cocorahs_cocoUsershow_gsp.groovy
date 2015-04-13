import cocorahs.CocoUser
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_cocorahs_cocoUsershow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/cocoUser/show.gsp" }
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
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'cocoUser.label', default: 'CocoUser'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("default.show.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',8,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',8,[:],2)
printHtmlPart(3)
})
invokeTag('captureHead','sitemesh',9,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
invokeTag('message','g',11,['code':("default.link.skip.label"),'default':("Skip to content&hellip;")],-1)
printHtmlPart(5)
expressionOut.print(createLink(uri: '/'))
printHtmlPart(6)
invokeTag('message','g',14,['code':("default.home.label")],-1)
printHtmlPart(7)
createTagBody(2, {->
invokeTag('message','g',15,['code':("default.list.label"),'args':([entityName])],-1)
})
invokeTag('link','g',15,['class':("list"),'action':("index")],2)
printHtmlPart(8)
createTagBody(2, {->
invokeTag('message','g',16,['code':("default.new.label"),'args':([entityName])],-1)
})
invokeTag('link','g',16,['class':("create"),'action':("create")],2)
printHtmlPart(9)
invokeTag('message','g',20,['code':("default.show.label"),'args':([entityName])],-1)
printHtmlPart(10)
if(true && (flash.message)) {
printHtmlPart(11)
expressionOut.print(flash.message)
printHtmlPart(12)
}
printHtmlPart(13)
if(true && (cocoUserInstance?.username)) {
printHtmlPart(14)
invokeTag('message','g',28,['code':("cocoUser.username.label"),'default':("Username")],-1)
printHtmlPart(15)
invokeTag('fieldValue','g',30,['bean':(cocoUserInstance),'field':("username")],-1)
printHtmlPart(16)
}
printHtmlPart(17)
if(true && (cocoUserInstance?.password)) {
printHtmlPart(18)
invokeTag('message','g',37,['code':("cocoUser.password.label"),'default':("Password")],-1)
printHtmlPart(19)
invokeTag('fieldValue','g',39,['bean':(cocoUserInstance),'field':("password")],-1)
printHtmlPart(16)
}
printHtmlPart(17)
if(true && (cocoUserInstance?.accountExpired)) {
printHtmlPart(20)
invokeTag('message','g',46,['code':("cocoUser.accountExpired.label"),'default':("Account Expired")],-1)
printHtmlPart(21)
invokeTag('formatBoolean','g',48,['boolean':(cocoUserInstance?.accountExpired)],-1)
printHtmlPart(16)
}
printHtmlPart(17)
if(true && (cocoUserInstance?.accountLocked)) {
printHtmlPart(22)
invokeTag('message','g',55,['code':("cocoUser.accountLocked.label"),'default':("Account Locked")],-1)
printHtmlPart(23)
invokeTag('formatBoolean','g',57,['boolean':(cocoUserInstance?.accountLocked)],-1)
printHtmlPart(16)
}
printHtmlPart(17)
if(true && (cocoUserInstance?.enabled)) {
printHtmlPart(24)
invokeTag('message','g',64,['code':("cocoUser.enabled.label"),'default':("Enabled")],-1)
printHtmlPart(25)
invokeTag('formatBoolean','g',66,['boolean':(cocoUserInstance?.enabled)],-1)
printHtmlPart(16)
}
printHtmlPart(17)
if(true && (cocoUserInstance?.passwordExpired)) {
printHtmlPart(26)
invokeTag('message','g',73,['code':("cocoUser.passwordExpired.label"),'default':("Password Expired")],-1)
printHtmlPart(27)
invokeTag('formatBoolean','g',75,['boolean':(cocoUserInstance?.passwordExpired)],-1)
printHtmlPart(16)
}
printHtmlPart(28)
createTagBody(2, {->
printHtmlPart(29)
createTagBody(3, {->
invokeTag('message','g',83,['code':("default.button.edit.label"),'default':("Edit")],-1)
})
invokeTag('link','g',83,['class':("edit"),'action':("edit"),'resource':(cocoUserInstance)],3)
printHtmlPart(30)
invokeTag('actionSubmit','g',84,['class':("delete"),'action':("delete"),'value':(message(code: 'default.button.delete.label', default: 'Delete')),'onclick':("return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');")],-1)
printHtmlPart(31)
})
invokeTag('form','g',86,['url':([resource:cocoUserInstance, action:'delete']),'method':("DELETE")],2)
printHtmlPart(32)
})
invokeTag('captureBody','sitemesh',88,[:],1)
printHtmlPart(33)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1427985451000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
