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

package org.toasthub.core.general.utils;

import java.util.HashMap;

public class SessionHolder {
	private static String defaultHost = "cborghome.ddns.net";
	//private static final ThreadLocal<String> dsName = new ThreadLocal<String>();
    private static final ThreadLocal<String> hostname = new ThreadLocal<String>();
    private static final ThreadLocal<String> contextPath = new ThreadLocal<String>();
    private static final ThreadLocal<String> userAgent = new ThreadLocal<String>();
    private static final ThreadLocal<String> clientName = new ThreadLocal<String>();
    private static final ThreadLocal<String> templateName = new ThreadLocal<String>();
    private static final ThreadLocal<HashMap<String,Object>> daProperties = new ThreadLocal<HashMap<String,Object>>();
	
   /* public static ThreadLocal<String> getDsname() {
		return dsName;
	}
    public static void setDsName(String name){
        dsName.set(name);
    }*/

    public static String getURLDomain(){
    	String host = hostname.get();
    	// if ip address use a default 
    	/*Pattern p = Pattern.compile("^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$");
        Matcher m = p.matcher(host);
        if (m.find()){
        	host = defaultHost;
        }*/
        return host;
    }
    public static void setURLDomain(String name){
        hostname.set(name);
    }

    public static String getUserAgent(){
        return userAgent.get();
    }
    public static void setUserAgent(String name){
        userAgent.set(name);
    }

    public static String getClientName(){
        return clientName.get();
    }
    public static void setClientName(String name){
        clientName.set(name);
    }

    public static String getTemplateName(){
        return templateName.get();
    }
    public static void setTemplateName(String name){
        templateName.set(name);
    }

    public static HashMap<String,Object> getDaProperties(){
        return daProperties.get();
    }
    public static void setDaProperties(HashMap<String,Object> props){
        daProperties.set(props);
    }
    
	public static String getContextpath() {
		return contextPath.get();
	}
	public static void setContextPath(String name){
		contextPath.set(name);
	}
    
}
