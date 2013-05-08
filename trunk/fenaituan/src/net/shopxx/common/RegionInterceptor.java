package net.shopxx.common;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import net.shopxx.service.RegionService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class RegionInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6045401923950415202L;
	@Resource
	private RegionService regionService;
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String regionData = (String) session.get("regionData");
		if (regionData == null) {
			regionData=regionService.getJsonArrayAll().toString();
			session.put("regionData", regionData);
			ServletActionContext.getRequest().setAttribute("regionData", regionData);
		}
		return invocation.invoke();
	}

}
