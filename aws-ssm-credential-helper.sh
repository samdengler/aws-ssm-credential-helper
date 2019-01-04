#!/bin/env bash

PROG=$(basename $0)
USAGE="usage: $PROG ssm_username_key ssm_password_key"

if [[ $# -lt 2 ]]; then
  echo "$USAGE"; exit 1
fi
SSM_USERNAME_KEY=$1
SSM_PASSWORD_KEY=$2

SSM_USERNAME_VALUE=$(aws ssm get-parameter --with-decryption --name "$SSM_USERNAME_KEY" --output text --query Parameter.Value 2>/dev/null)
if [[ -z "$SSM_USERNAME_VALUE" ]]; then
  echo -e "invalid ssm_username_key: $SSM_USERNAME_KEY\naws ssm get-parameter --with-decryption --name \"$SSM_USERNAME_KEY\" --output text --query Parameter.Value"; exit 1
fi

SSM_PASSWORD_VALUE=$(aws ssm get-parameter --with-decryption --name "$SSM_PASSWORD_KEY" --output text --query Parameter.Value 2>/dev/null)
if [[ -z "$SSM_PASSWORD_VALUE" ]]; then
  echo -e "invalid ssm_password_key: $SSM_PASSWORD_KEY\naws ssm get-parameter --with-decryption --name \"$SSM_PASSWORD_KEY\" --output text --query Parameter.Value"; exit 1
fi

echo username=$SSM_USERNAME_VALUE
echo password=$SSM_PASSWORD_VALUE