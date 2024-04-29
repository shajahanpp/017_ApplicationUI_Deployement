#!/bin/bash
source displayScript.sh
source actionScript.sh

# projectName  projectPath    docker image and container name
ustBackendProjectDetail=("UST Backend" "../resources/ust-backend/" "ust-backend" "9090")
ust01ProjectDetail=("UST Create RunId" "../resources/01CreateRunId_JAR/" "ust-create-runid" "8082")
ust02ProjectDetail=("UST ReponseValidation" "../resources/02ReponseValidation_JAR/" "ust-reponse-validation"  "8080")
ust03ProjectDetail=("UST Result Update" "../resources/03ResultUpdate_JAR/" "ust-result-update"  "8083")
ust04ProjectDetail=("UST Report MS" "../resources/04_ReportMS_JAR/" "ust-report-ms"  "8085")
ust05ProjectDetail=("UST Report Comparison Service" "../resources/05_reportcomparisonservice/" "ust-report-comparison"  "8088")
ust06ProjectDetail=("UST Get Projectname Service" "../resources/06_getprojectname/" "ust-get-projectname"  "8086")
ust07ProjectDetail=("UST Table Validation Sql" "../resources/07_tablevalidationsql/" "ust-table-validationsql"  "8089")
ust08ProjectDetail=("UST Automation Report Status" "../resources/08_automationreportStatus/" "ust-automation-report-status"  "8087")
# ustFrontendProjectDetail=("UST Frontend" "ust-frontend/" "/var/www/html/ust-web/" "80")


projectList=(ustBackendProjectDetail[@] ust01ProjectDetail[@] ust02ProjectDetail[@] ust03ProjectDetail[@] 
ust04ProjectDetail[@] ust05ProjectDetail[@] ust06ProjectDetail[@] ust07ProjectDetail[@]  ust08ProjectDetail[@])
# ustFrontendProjectDetail[@]
projectFunctionList=("Config" "Installation" "Update" "Remove" "Start" "Stop" "Restart" "Logs")
# ustBackendProjectFunction=("Config" "Installation" "Update" "Remove" "Start" "Stop" "Restart" "Logs")
# ustFrontendProjectFunction=("Installation" "Update")



echo "Welcome to UST script world"
# Now script begain
displayProjectList
echo "select project No: " 
read projectId
echo "selected No $projectId"
displayProjectFuntcion $projectId

#   projectName=${!projectList[$projectId]:0:1} 
#   echo "projectName =${projectName}"
#   projectDir=${!projectList[$projectId]:1:1}
#   echo "projectDir = ${projectDir}"
#   projectDockerName=${!projectList[$projectId]:2:1}
#   echo "projectDockerName = ${projectDockerName}"
#   projectPortNo=${!projectList[$projectId]:3:3}
#   echo "projectPortNo = ${projectPortNo}"

echo "select project Action No: " 
read actionId
actionSelection $actionId

