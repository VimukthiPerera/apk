/*
 *  Copyright (c) 2022, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

package config

import (
	"fmt"
	"io/ioutil"
	"os"
	"reflect"
	"sync"

	toml "github.com/pelletier/go-toml"
	pkgconf "github.com/wso2/apk/adapter/pkg/config"
	"github.com/wso2/apk/adapter/pkg/logging"
)

var (
	onceConfigRead sync.Once
	apkHome        string
	logConfigPath  string
	adapterConfig  *Config
	envVariableMap map[string]string
)

const (
	// The environtmental variable which represents the path of the distribution in host machine.
	apkHomeEnvVariable = "APK_HOME"
	// The environtmental variable which represents the path of the log_config.toml in host machine.
	logConfigPathEnvVariable = "LOG_CONFIG_PATH"
	// RelativeLogConfigPath is the relative file path where the log configuration file is.
	relativeLogConfigPath = "/conf/log_config.toml"
	// EnvConfigPrefix is used when configs should be read from environment variables.
	EnvConfigPrefix = "$env"
	// envVariableForCCPrefix is the prefix used for APK specific environmental variables.
	envVariablePrefix = "APK_"
	// envVariableEntrySeparator is used as the separator used to denote nested structured properties.
	envVariableEntrySeparator = "_"
)

const (
	// RelativeConfigPath is the relative file path where the configuration file is.
	relativeConfigPath = "/conf/config.toml"
)

func ReadConfigs() *Config {
	onceConfigRead.Do(func() {
		adapterConfig = defaultConfig
		_, err := os.Stat(pkgconf.GetApkHome() + relativeConfigPath)
		if err != nil {
			loggerConfig.ErrorC(logging.ErrorDetails{
				Message:   fmt.Sprintf("Configuration file not found : %s", err.Error()),
				Severity:  logging.BLOCKER,
				ErrorCode: 1000,
			})
		}
		content, readErr := ioutil.ReadFile(pkgconf.GetApkHome() + relativeConfigPath)
		if readErr != nil {
			loggerConfig.ErrorC(logging.ErrorDetails{
				Message:   fmt.Sprintf("Error reading configurations : %s", readErr.Error()),
				Severity:  logging.BLOCKER,
				ErrorCode: 1001,
			})
			return
		}
		parseErr := toml.Unmarshal(content, adapterConfig)
		if parseErr != nil {
			loggerConfig.ErrorC(logging.ErrorDetails{
				Message:   fmt.Sprintf("Error parsing the configurations : %s", parseErr.Error()),
				Severity:  logging.BLOCKER,
				ErrorCode: 1002,
			})
			return
		}

		pkgconf.ResolveConfigEnvValues(reflect.ValueOf(&(adapterConfig.CommonAdapter)).Elem(), "CommonAdapter", true)
	})
	return adapterConfig
}
