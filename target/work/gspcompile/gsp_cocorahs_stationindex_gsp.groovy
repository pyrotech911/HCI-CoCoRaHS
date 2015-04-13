import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_cocorahs_stationindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/station/index.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',4,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("site")],-1)
printHtmlPart(1)
createTagBody(2, {->
createClosureForHtmlPart(2, 3)
invokeTag('captureTitle','sitemesh',5,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',5,[:],2)
printHtmlPart(3)
invokeTag('stylesheet','asset',13,['src':("application.css")],-1)
printHtmlPart(1)
invokeTag('stylesheet','asset',14,['src':("mystyle.css")],-1)
printHtmlPart(1)
invokeTag('javascript','asset',15,['src':("geolocation.js")],-1)
printHtmlPart(4)
})
invokeTag('captureHead','sitemesh',16,[:],1)
printHtmlPart(4)
createTagBody(1, {->
printHtmlPart(5)
for( _it764877083 in (stationList) ) {
changeItVariable(_it764877083)
printHtmlPart(6)
createTagBody(3, {->
expressionOut.print(it.stationId)
printHtmlPart(7)
expressionOut.print(it.longitude)
printHtmlPart(8)
expressionOut.print(it.latitude)
printHtmlPart(9)
})
invokeTag('link','g',23,['controller':("post"),'action':("index"),'params':([stID: "${it.id}"])],3)
printHtmlPart(10)
expressionOut.print(it.latitude)
printHtmlPart(11)
expressionOut.print(it.longitude)
printHtmlPart(12)
expressionOut.print(it.stationId)
printHtmlPart(13)
expressionOut.print(it.id)
printHtmlPart(14)
}
printHtmlPart(15)
})
invokeTag('captureBody','sitemesh',36,[:],1)
printHtmlPart(16)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1428877149000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
