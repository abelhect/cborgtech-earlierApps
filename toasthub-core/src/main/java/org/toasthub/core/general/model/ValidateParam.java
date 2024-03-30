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

package org.toasthub.core.general.model;

public class ValidateParam {

	private Integer minLength = null;
	private Integer maxLength = null;
	private Boolean allowNull = true;
	private String pattern = null; 
	
	// Constructors
	public ValidateParam() {}

	// Validate
	public Boolean validateMinLength(Object value) {
		Boolean result = false;
		
		
		return result;
	}
	
	
	// Setters and Getters
	public Integer getMinLength() {
		return minLength;
	}
	public void setMinLength(Integer minLength) {
		this.minLength = minLength;
	}

	public Integer getMaxLength() {
		return maxLength;
	}
	public void setMaxLength(Integer maxLength) {
		this.maxLength = maxLength;
	}

	public Boolean getAllowNull() {
		return allowNull;
	}
	public void setAllowNull(Boolean allowNull) {
		this.allowNull = allowNull;
	}

	public String getPattern() {
		return pattern;
	}
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

}
