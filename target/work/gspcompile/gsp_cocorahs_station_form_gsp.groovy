import cocorahs.Station
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_cocorahs_station_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/station/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: stationInstance, field: 'latitude', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("station.latitude.label"),'default':("Latitude")],-1)
printHtmlPart(2)
invokeTag('field','g',10,['name':("latitude"),'type':("text"),'value':(fieldValue(bean: stationInstance, field: 'latitude')),'required':("")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: stationInstance, field: 'longitude', 'error'))
printHtmlPart(4)
invokeTag('message','g',16,['code':("station.longitude.label"),'default':("Longitude")],-1)
printHtmlPart(2)
invokeTag('field','g',19,['name':("longitude"),'type':("text"),'value':(fieldValue(bean: stationInstance, field: 'longitude')),'required':("")],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: stationInstance, field: 'posts', 'error'))
printHtmlPart(5)
invokeTag('message','g',25,['code':("station.posts.label"),'default':("Posts")],-1)
printHtmlPart(6)
for( p in (stationInstance?.posts) ) {
printHtmlPart(7)
createTagBody(2, {->
expressionOut.print(p?.encodeAsHTML())
})
invokeTag('link','g',31,['controller':("post"),'action':("show"),'id':(p.id)],2)
printHtmlPart(8)
}
printHtmlPart(9)
createTagBody(1, {->
expressionOut.print(message(code: 'default.add.label', args: [message(code: 'post.label', default: 'Post')]))
})
invokeTag('link','g',34,['controller':("post"),'action':("create"),'params':(['station.id': stationInstance?.id])],1)
printHtmlPart(10)
expressionOut.print(hasErrors(bean: stationInstance, field: 'stationId', 'error'))
printHtmlPart(11)
invokeTag('message','g',43,['code':("station.stationId.label"),'default':("Station Id")],-1)
printHtmlPart(2)
invokeTag('textField','g',46,['name':("stationId"),'required':(""),'value':(stationInstance?.stationId)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: stationInstance, field: 'user', 'error'))
printHtmlPart(12)
invokeTag('message','g',52,['code':("station.user.label"),'default':("User")],-1)
printHtmlPart(2)
invokeTag('select','g',55,['id':("user"),'name':("user.id"),'from':(cocorahs.CocoUser.list()),'optionKey':("id"),'required':(""),'value':(stationInstance?.user?.id),'class':("many-to-one")],-1)
printHtmlPart(13)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1428297510000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
