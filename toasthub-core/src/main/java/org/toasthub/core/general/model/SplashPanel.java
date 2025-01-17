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

public class SplashPanel {

	private Long newActivityCount;
	private String bgColor;
	private String imageName;
	
	public SplashPanel(){}
	public SplashPanel(Long newActivityCount,String bgColor, String imageName){
		this.setNewActivityCount(newActivityCount);
		this.setBgColor(bgColor);
		this.setImageName(imageName);
	}

	public Long getNewActivityCount() {
		return newActivityCount;
	}
	public void setNewActivityCount(Long newActivityCount) {
		this.newActivityCount = newActivityCount;
	}

	public String getBgColor() {
		return bgColor;
	}
	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}

	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	
	
}
