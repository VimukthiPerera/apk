import ballerina/jballerina.java;
import runtime_domain_service.java.util as javautil;
import runtime_domain_service.java.lang as javalang;

# Ballerina class mapping for the Java `org.wso2.apk.runtime.model.API` class.
@java:Binding {'class: "org.wso2.apk.runtime.model.API"}
public distinct class API {

    *java:JObject;
    *javalang:Object;

    # The `handle` field that stores the reference to the `org.wso2.apk.runtime.model.API` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `org.wso2.apk.runtime.model.API` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `org.wso2.apk.runtime.model.API` Java class.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "null";
    }
    # The function that maps to the `equals` method of `org.wso2.apk.runtime.model.API`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function 'equals(javalang:Object arg0) returns boolean {
        return org_wso2_apk_runtime_model_API_equals(self.jObj, arg0.jObj);
    }

    # The function that maps to the `getClass` method of `org.wso2.apk.runtime.model.API`.
    #
    # + return - The `javalang:Class` value returning from the Java mapping.
    public function getClass() returns javalang:Class {
        handle externalObj = org_wso2_apk_runtime_model_API_getClass(self.jObj);
        javalang:Class newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getName` method of `org.wso2.apk.runtime.model.API`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function getName() returns string? {
        return java:toString(org_wso2_apk_runtime_model_API_getName(self.jObj));
    }

    # The function that maps to the `getType` method of `org.wso2.apk.runtime.model.API`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function getType() returns string? {
        return java:toString(org_wso2_apk_runtime_model_API_getType(self.jObj));
    }

    # The function that maps to the `getUriTemplates` method of `org.wso2.apk.runtime.model.API`.
    #
    # + return - The `javautil:Set` value returning from the Java mapping.
    public function getUriTemplates() returns javautil:Set {
        handle externalObj = org_wso2_apk_runtime_model_API_getUriTemplates(self.jObj);
        javautil:Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getVersion` method of `org.wso2.apk.runtime.model.API`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function getVersion() returns string? {
        return java:toString(org_wso2_apk_runtime_model_API_getVersion(self.jObj));
    }

    # The function that maps to the `hashCode` method of `org.wso2.apk.runtime.model.API`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function hashCode() returns int {
        return org_wso2_apk_runtime_model_API_hashCode(self.jObj);
    }

    # The function that maps to the `notify` method of `org.wso2.apk.runtime.model.API`.
    public function notify() {
        org_wso2_apk_runtime_model_API_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `org.wso2.apk.runtime.model.API`.
    public function notifyAll() {
        org_wso2_apk_runtime_model_API_notifyAll(self.jObj);
    }

    # The function that maps to the `setName` method of `org.wso2.apk.runtime.model.API`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    public function setName(string arg0) {
        org_wso2_apk_runtime_model_API_setName(self.jObj, java:fromString(arg0));
    }

    # The function that maps to the `setType` method of `org.wso2.apk.runtime.model.API`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    public function setType(string arg0) {
        org_wso2_apk_runtime_model_API_setType(self.jObj, java:fromString(arg0));
    }

    # The function that maps to the `setUriTemplates` method of `org.wso2.apk.runtime.model.API`.
    #
    # + arg0 - The `javautil:Set` value required to map with the Java method parameter.
    public function setUriTemplates(javautil:Set arg0) {
        org_wso2_apk_runtime_model_API_setUriTemplates(self.jObj, arg0.jObj);
    }

    # The function that maps to the `setVersion` method of `org.wso2.apk.runtime.model.API`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    public function setVersion(string arg0) {
        org_wso2_apk_runtime_model_API_setVersion(self.jObj, java:fromString(arg0));
    }

    # The function that maps to the `wait` method of `org.wso2.apk.runtime.model.API`.
    #
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function 'wait() returns javalang:InterruptedException? {
        error|() externalObj = org_wso2_apk_runtime_model_API_wait(self.jObj);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `org.wso2.apk.runtime.model.API`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function wait2(int arg0) returns javalang:InterruptedException? {
        error|() externalObj = org_wso2_apk_runtime_model_API_wait2(self.jObj, arg0);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `org.wso2.apk.runtime.model.API`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function wait3(int arg0, int arg1) returns javalang:InterruptedException? {
        error|() externalObj = org_wso2_apk_runtime_model_API_wait3(self.jObj, arg0, arg1);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

}

# The constructor function to generate an object of `org.wso2.apk.runtime.model.API`.
#
# + return - The new `API` class generated.
public function newAPI1() returns API {
    handle externalObj = org_wso2_apk_runtime_model_API_newAPI1();
    API newObj = new (externalObj);
    return newObj;
}

# The constructor function to generate an object of `org.wso2.apk.runtime.model.API`.
#
# + arg0 - The `string` value required to map with the Java constructor parameter.
# + arg1 - The `string` value required to map with the Java constructor parameter.
# + arg2 - The `javautil:Set` value required to map with the Java constructor parameter.
# + return - The new `API` class generated.
public function newAPI2(string arg0, string arg1, javautil:Set arg2) returns API {
    handle externalObj = org_wso2_apk_runtime_model_API_newAPI2(java:fromString(arg0), java:fromString(arg1), arg2.jObj);
    API newObj = new (externalObj);
    return newObj;
}

function org_wso2_apk_runtime_model_API_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: ["java.lang.Object"]
} external;

function org_wso2_apk_runtime_model_API_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: []
} external;

function org_wso2_apk_runtime_model_API_getName(handle receiver) returns handle = @java:Method {
    name: "getName",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: []
} external;

function org_wso2_apk_runtime_model_API_getType(handle receiver) returns handle = @java:Method {
    name: "getType",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: []
} external;

function org_wso2_apk_runtime_model_API_getUriTemplates(handle receiver) returns handle = @java:Method {
    name: "getUriTemplates",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: []
} external;

function org_wso2_apk_runtime_model_API_getVersion(handle receiver) returns handle = @java:Method {
    name: "getVersion",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: []
} external;

function org_wso2_apk_runtime_model_API_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: []
} external;

function org_wso2_apk_runtime_model_API_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: []
} external;

function org_wso2_apk_runtime_model_API_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: []
} external;

function org_wso2_apk_runtime_model_API_setName(handle receiver, handle arg0) = @java:Method {
    name: "setName",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: ["java.lang.String"]
} external;

function org_wso2_apk_runtime_model_API_setType(handle receiver, handle arg0) = @java:Method {
    name: "setType",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: ["java.lang.String"]
} external;

function org_wso2_apk_runtime_model_API_setUriTemplates(handle receiver, handle arg0) = @java:Method {
    name: "setUriTemplates",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: ["java.util.Set"]
} external;

function org_wso2_apk_runtime_model_API_setVersion(handle receiver, handle arg0) = @java:Method {
    name: "setVersion",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: ["java.lang.String"]
} external;

function org_wso2_apk_runtime_model_API_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: []
} external;

function org_wso2_apk_runtime_model_API_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: ["long"]
} external;

function org_wso2_apk_runtime_model_API_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: ["long", "int"]
} external;

function org_wso2_apk_runtime_model_API_newAPI1() returns handle = @java:Constructor {
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: []
} external;

function org_wso2_apk_runtime_model_API_newAPI2(handle arg0, handle arg1, handle arg2) returns handle = @java:Constructor {
    'class: "org.wso2.apk.runtime.model.API",
    paramTypes: ["java.lang.String", "java.lang.String", "java.util.Set"]
} external;

