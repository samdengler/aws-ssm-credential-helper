# aws-ssm-credential-helper

## Description

This is a git credential helper that fetches the username and password from AWS SSM Parameter Store Keys.

Super raw.  No optimization effort.  Minimal error handling.  Use at your own risk.  PRs welcome.


## Usage

git config credential.helper '!/bin/env bash PATH/aws-ssm-credential-helper.sh AWS_SSM_GIT_USERNAME_KEY AWS_SSM_GIT_PASSWORD_KEY


## Notes

Assumes username and passwords are encrypted values in SSM Parameter Store using default SSM KMS key.  Control access to SSM Parameter Store values using IAM Policies.


## TODO

1. Combine 2x SSM calls into 1
2. Allow optional KMS key for decryption