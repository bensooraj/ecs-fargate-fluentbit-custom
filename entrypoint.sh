tput setaf 5;
tput bold;
echo -n "AWS for Fluent Bit Container Image Version "
# cat /AWS_FOR_FLUENT_BIT_VERSION
tput sgr0;
exec /fluent-bit/bin/fluent-bit -e /fluent-bit/firehose.so -e /fluent-bit/cloudwatch.so -e /fluent-bit/kinesis.so -c /fluent-bit/configs/tail-file-to-datadog.conf