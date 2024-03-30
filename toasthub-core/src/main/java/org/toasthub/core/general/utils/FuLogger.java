package org.toasthub.core.general.utils;

import javax.annotation.Priority;
import javax.interceptor.AroundInvoke;
import javax.interceptor.Interceptor;
import javax.interceptor.InvocationContext;

@FuLog
@Interceptor
@Priority(Interceptor.Priority.APPLICATION)
public class FuLogger {

	public static final Integer TRACE = 3;
    public static final Integer DEBUG = 2;
    public static final Integer INFO = 1;
    public static final Integer SILENT = 0;
    private static Integer outLocation = 0;
    private static Integer logLevel = 3;
    
    public static void setLogLevel(Integer l){
        logLevel = l;
    }
    
    @AroundInvoke
	public Object logMethod(InvocationContext ctx) throws Exception {

      
        System.out.println(ctx.getMethod().getDeclaringClass().getName() + " " + ctx.getMethod().getName());

        return ctx.proceed();
    }
}
