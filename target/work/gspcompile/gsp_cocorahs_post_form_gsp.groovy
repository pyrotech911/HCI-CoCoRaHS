import cocorahs.Post
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_cocorahs_post_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/post/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
invokeTag('stylesheet','asset',3,['src':("application.css")],-1)
printHtmlPart(1)
invokeTag('stylesheet','asset',4,['src':("mystyle.css")],-1)
printHtmlPart(2)
expressionOut.print(hasErrors(bean: postInstance, field: 'photos', 'error'))
printHtmlPart(3)
createClosureForHtmlPart(4, 1)
invokeTag('link','g',9,['controller':("photo"),'action':("create"),'params':(['post.id': postInstance?.id])],1)
printHtmlPart(5)
createClosureForHtmlPart(6, 1)
invokeTag('link','g',13,['controller':("photo"),'action':("create"),'params':(['post.id': postInstance?.id])],1)
printHtmlPart(7)
createClosureForHtmlPart(8, 1)
invokeTag('link','g',17,['controller':("photo"),'action':("create"),'params':(['post.id': postInstance?.id])],1)
printHtmlPart(5)
createClosureForHtmlPart(9, 1)
invokeTag('link','g',18,['controller':("photo"),'action':("create"),'params':(['post.id': postInstance?.id])],1)
printHtmlPart(10)
if(true && (postInstance.comment == null)) {
printHtmlPart(11)
invokeTag('textArea','g',25,['name':("comment"),'placeholder':("Location Notes"),'rows':("5"),'cols':("50")],-1)
printHtmlPart(12)
}
printHtmlPart(12)
if(true && (postInstance.comment != null)) {
printHtmlPart(11)
invokeTag('textArea','g',32,['name':("comment"),'value':(postInstance.comment),'rows':("5"),'cols':("40")],-1)
printHtmlPart(12)
}
printHtmlPart(13)
invokeTag('submitButton','g',36,['name':("Submit"),'value':("Post"),'style':("background-color: #838384;border: none; height:40px; width:250px")],-1)
printHtmlPart(14)
expressionOut.print(hasErrors(bean: postInstance, field: 'station', 'error'))
printHtmlPart(15)
invokeTag('select','g',45,['id':("station"),'name':("station.id"),'from':(cocorahs.Station.list()),'optionKey':("id"),'required':(""),'value':(postInstance?.station?.id),'class':("many-to-one")],-1)
printHtmlPart(16)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1428936773000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
