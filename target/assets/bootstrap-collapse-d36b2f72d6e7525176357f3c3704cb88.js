+function(e){"use strict";var t=function(n,r){this.$element=e(n);this.options=e.extend({},t.DEFAULTS,r);this.transitioning=null;if(this.options.parent)this.$parent=e(this.options.parent);if(this.options.toggle)this.toggle()};t.DEFAULTS={toggle:true};t.prototype.dimension=function(){var e=this.$element.hasClass("width");return e?"width":"height"};t.prototype.show=function(){if(this.transitioning||this.$element.hasClass("in"))return;var t=e.Event("show.bs.collapse");this.$element.trigger(t);if(t.isDefaultPrevented())return;var n=this.$parent&&this.$parent.find("> .panel > .in");if(n&&n.length){var r=n.data("bs.collapse");if(r&&r.transitioning)return;n.collapse("hide");r||n.data("bs.collapse",null)}var i=this.dimension();this.$element.removeClass("collapse").addClass("collapsing")[i](0);this.transitioning=1;var s=function(){this.$element.removeClass("collapsing").addClass("collapse in")[i]("auto");this.transitioning=0;this.$element.trigger("shown.bs.collapse")};if(!e.support.transition)return s.call(this);var o=e.camelCase(["scroll",i].join("-"));this.$element.one(e.support.transition.end,e.proxy(s,this)).emulateTransitionEnd(350)[i](this.$element[0][o])};t.prototype.hide=function(){if(this.transitioning||!this.$element.hasClass("in"))return;var t=e.Event("hide.bs.collapse");this.$element.trigger(t);if(t.isDefaultPrevented())return;var n=this.dimension();this.$element[n](this.$element[n]())[0].offsetHeight;this.$element.addClass("collapsing").removeClass("collapse").removeClass("in");this.transitioning=1;var r=function(){this.transitioning=0;this.$element.trigger("hidden.bs.collapse").removeClass("collapsing").addClass("collapse")};if(!e.support.transition)return r.call(this);this.$element[n](0).one(e.support.transition.end,e.proxy(r,this)).emulateTransitionEnd(350)};t.prototype.toggle=function(){this[this.$element.hasClass("in")?"hide":"show"]()};var n=e.fn.collapse;e.fn.collapse=function(n){return this.each(function(){var r=e(this);var i=r.data("bs.collapse");var s=e.extend({},t.DEFAULTS,r.data(),typeof n=="object"&&n);if(!i&&s.toggle&&n=="show")n=!n;if(!i)r.data("bs.collapse",i=new t(this,s));if(typeof n=="string")i[n]()})};e.fn.collapse.Constructor=t;e.fn.collapse.noConflict=function(){e.fn.collapse=n;return this};e(document).on("click.bs.collapse.data-api","[data-toggle=collapse]",function(t){var n=e(this),r;var i=n.attr("data-target")||t.preventDefault()||(r=n.attr("href"))&&r.replace(/.*(?=#[^\s]+$)/,"");var s=e(i);var o=s.data("bs.collapse");var u=o?"toggle":n.data();var a=n.attr("data-parent");var f=a&&e(a);if(!o||!o.transitioning){if(f)f.find('[data-toggle=collapse][data-parent="'+a+'"]').not(n).addClass("collapsed");n[s.hasClass("in")?"addClass":"removeClass"]("collapsed")}s.collapse(u)})}(jQuery)