package net.shopxx.common;

import java.util.Map;

import javax.annotation.Resource;

import net.shopxx.entity.Admin;
import net.shopxx.service.AdminService;
import net.shopxx.service.RegionService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AdminInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = -240575966111111073L;

	@Resource
	private RegionService regionService;
	@Resource
	private AdminService adminService;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String regionData = (String) session.get("adminRegionData");
		if (regionData == null) {
			String loginUsername = (String) session
					.get("SPRING_SECURITY_LAST_USERNAME");
			if (loginUsername != null) {
				Admin admin = adminService.get("username",
						loginUsername.toLowerCase());
				if (admin != null) {
					regionData = regionService.getJsonArrayByAdminId(
							admin.getId()).toString();
					session.put("adminRegionData", regionData);
				}
			}
		}
		return invocation.invoke();
	}

}
