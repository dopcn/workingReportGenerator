# workingReportGenerator
日报周报月报生成脚本 generate report by extracting git log of last week last month

# usage

yesterday

`sh generate_report.sh -yd`

last week

`sh generate_report.sh -lw`

last month

`sh generate_report.sh -lm`

before 2016-12-19 after 2016-12-01

`sh generate_report.sh -b 2016-12-19 -a 2016-12-01`