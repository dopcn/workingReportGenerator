# workingReportGenerator
日报周报月报生成脚本 generate report by extracting git log of last week last month

# Usage

## First set up your work directory path in script

```
#!/bin/bash

GIT_DIR="your git directory"
AUTHOR_NAME="your committer name"
...

```

## Yesterday

`sh generate_report.sh -yd`

## Last week (if today is Fri. Sat. Sun. this script'll extract log of this week from Mon. to Fri. Otherwise extract log of last week)

`sh generate_report.sh -lw`

## Last month

`sh generate_report.sh -lm`

## Before 2016-12-19 after 2016-12-01

`sh generate_report.sh -b 2016-12-19 -a 2016-12-01`

### The extracted log will be copied to system pasteboard. Paste it anywhere you want.

### Write better git commit message becasue you can do it once for all