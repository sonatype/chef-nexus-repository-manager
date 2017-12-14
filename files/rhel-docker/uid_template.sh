# arbitrary uid recognition at runtime - for OpenShift deployments
sed "s@${USER_NAME}:x:${USER_UID}:@${USER_NAME}:x:\${USER_ID}:@g" /etc/passwd > /etc/passwd.template
