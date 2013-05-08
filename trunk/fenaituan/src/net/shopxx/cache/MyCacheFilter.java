package net.shopxx.cache;

import java.util.Enumeration;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.oscache.base.Cache;
import com.opensymphony.oscache.web.ServletCacheAdministrator;
import com.opensymphony.oscache.web.filter.CacheFilter;

public class MyCacheFilter extends CacheFilter {

	@Override
	public String createCacheKey(HttpServletRequest httpRequest,
			ServletCacheAdministrator scAdmin, Cache cache) {
		
		return httpRequest.getRequestURL()+httpRequest.getQueryString();
		//return super.createCacheKey(httpRequest, scAdmin, cache);
	}

}
