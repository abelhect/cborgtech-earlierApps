/*
 * Copyright (C) 2016 The ToastHub Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.toasthub.core.general.filter;

import java.io.IOException;
//import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.toasthub.core.general.model.UserContext;

/**
 * Servlet Filter implementation class AdminAuthenticationFilter
 */
public class SysAdminAuthFilter implements Filter {
	
	//@Inject
	//private transient Logger logger;
	
	@Inject
	private UserContext login;
    /**
     * Default constructor. 
     */
    public SysAdminAuthFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//HttpServletRequest myRequest = (HttpServletRequest) request;
		//logger.info("testing " + myRequest.getSession().getId());
		if (login.isLoggedIn()) {
			if (login.hasAccess("ROLE_SYSADMIN","PRM_SYSADMIN_AREA", "APP_CBORGCUST")){
				//logger.info("Logged in ");
				chain.doFilter(request, response); // User is logged in, just continue request.
			} else {
				((HttpServletResponse) response).sendRedirect(request.getServletContext().getContextPath()+"/accessDenied.html");
			}
		} else {
			//logger.info("Not Logged in ");
		    ((HttpServletResponse) response).sendRedirect(request.getServletContext().getContextPath()+"/login/login.html"); // Not logged in, show login page. You can eventually show the error page instead.
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
