// Copyright (c) HashiCorp, Inc.
// SPDX-License-Identifier: MPL-2.0

package subcommand

import (
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/aws/external"
)

func AWSConfig(region string) (aws.Config, error) {
	cfg, err := external.LoadDefaultAWSConfig()
	if err != nil {
		return aws.Config{}, err
	}
	cfg.Region = region
	return cfg, nil
}
