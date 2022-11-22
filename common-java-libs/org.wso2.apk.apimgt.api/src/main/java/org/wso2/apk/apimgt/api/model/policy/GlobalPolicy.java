/*
*  Copyright (c) 2016, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
*
*  WSO2 LLC. licenses this file to you under the Apache License,
*  Version 2.0 (the "License"); you may not use this file except
*  in compliance with the License.
*  You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,
* software distributed under the License is distributed on an
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
* KIND, either express or implied.  See the License for the
* specific language governing permissions and limitations
* under the License.
*/

package org.wso2.apk.apimgt.api.model.policy;

public class GlobalPolicy extends Policy {
    private String siddhiQuery;
    private String keyTemplate;

    public GlobalPolicy(String name) {
        super(name);
    }

    public String getSiddhiQuery() {
        return siddhiQuery;
    }

    public void setSiddhiQuery(String siddhiQuery) {
        this.siddhiQuery = siddhiQuery;
    }

    public String getKeyTemplate() {
        return this.keyTemplate;
    }

    public void setKeyTemplate(String keyTemplate) {
        this.keyTemplate = keyTemplate;
    }

    @Override
    public String toString() {
        return "GlobalPolicy [policyName=" + getPolicyName() + ", description=" + getDescription() + ", quotaPolicy=" + getDefaultQuotaPolicy() +
                 ", siddhiQuery=" + getSiddhiQuery() + "]";
    }
}