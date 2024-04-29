#!/bin/bash
actionSelection(){
  case $actionId in 
        0)
      echo "Config is selected"
      actionConfig $projectId
      ;; 
        1)
      echo "Installation is selected"
      actionInstallation $projectId
      ;;
        2)
      echo "Update is selected"
      actionUpdate $projectId
      ;;
        3)
      echo "Remove is selected"
      actionRemove $projectId
      ;;
      4)
      echo "Start is selected"
      actionStart $projectId
      ;;
      5)
      echo "Stop is selected"
      actionStop $projectId
      ;;
      6)
      echo "Restart is selected"
      actionRestart $projectId
      ;;
      7)
      echo "Logs is selected"
      actionLogs $projectId
      ;;
  esac 
}

#Below are project operation function
actionConfig(){
echo "Right now this function under construction"
# projectDir=${!projectList[$projectId]:1:1}
# projectDockerName=${!projectList[$projectId]:2:2}
# echo $projectDir
# echo $projectDockerName 
}

actionInstallation(){
  projectName=${!projectList[$projectId]:0:1} 
  echo "projectName =${projectName}"
  projectDir=${!projectList[$projectId]:1:1}
  echo "projectDir = ${projectDir}"
  projectDockerName=${!projectList[$projectId]:2:1}
  echo "projectDockerName = ${projectDockerName}"
  projectPortNo=${!projectList[$projectId]:3:3}
  echo "projectPortNo = ${projectPortNo}"
  echo $projectId
  if [ $projectId -eq 9 ];then
  echo "Frontend"
  echo ${!projectList[$projectId]:0:1}
  cd $projectDir
  # projectDestinationPath=${!projectList[$projectId]:1:2}
  sudo cp -r "build/" $projectDockerName
  else
  echo "backend"
  # projectDockerName=${!projectList[$projectId]:2:2}
  # projectPortNo=${!projectList[$projectId]:3:3}
  # echo "projectPortNo = $projectPortNo"
  # echo "projectDockerName = $projectDockerName"

  IMAGE_STATUS=$(sudo docker image inspect $projectDockerName:latest>/dev/null 2>&1 && echo true || echo false)
   if [ $IMAGE_STATUS == false ];then 
    echo "projectDir = $projectDir"
    cd $projectDir
    sudo docker build -t $projectDockerName .
    sudo docker run -p $projectPortNo:$projectPortNo --name=$projectDockerName -i -d $projectDockerName
    # sudo docker container start $projectDockerName
   else
    echo -e "project is already install \n please just start the project"
   fi
  fi
}

actionUpdate(){
echo "Before execute this action please replace jar in project folder"
  projectName=${!projectList[$projectId]:0:1} 
  # echo "projectName =${projectName}"
  projectDir=${!projectList[$projectId]:1:1}
  # echo "projectDir = ${projectDir}"
  projectDockerName=${!projectList[$projectId]:2:1}
  # echo "projectDockerName = ${projectDockerName}"
  projectPortNo=${!projectList[$projectId]:3:3}
  # echo "projectPortNo = ${projectPortNo}"

IMAGE_STATUS=$(sudo docker image inspect $projectDockerName:latest>/dev/null 2>&1 && echo true || echo false)
if [ $IMAGE_STATUS == false ]; 
then 
  # echo "projectDir = $projectDir"
  cd $projectDir
  sudo docker build -t $projectDockerName .
  sudo docker run --name=$projectDockerName -p $projectPortNo:$projectPortNo -i -d $projectDockerName
    echo "project new build is added"
else
  cd $projectDir
  sudo docker container stop $projectDockerName
  sudo docker container rm -f $projectDockerName
  sudo docker image rm -f $projectDockerName

  sudo docker build -t $projectDockerName .
  sudo docker run --name=$projectDockerName -p $projectPortNo:$projectPortNo -i -d $projectDockerName
  sudo docker container start $projectDockerName
  echo "project old build is remove and new is added"
fi
}

actionRemove(){
  projectName=${!projectList[$projectId]:0:1} 
  # echo "projectName =${projectName}"
  projectDir=${!projectList[$projectId]:1:1}
  # echo "projectDir = ${projectDir}"
  projectDockerName=${!projectList[$projectId]:2:1}
  # echo "projectDockerName = ${projectDockerName}"
  projectPortNo=${!projectList[$projectId]:3:3}
  # echo "projectPortNo = ${projectPortNo}"

IMAGE_STATUS=$(sudo docker image inspect $projectDockerName:latest>/dev/null 2>&1 && echo true || echo false)
if [ $IMAGE_STATUS == true ]; 
then 
  echo "projectDir = $projectDir"
  cd $projectDir
  sudo docker container stop $projectDockerName
  sudo docker container rm -f $projectDockerName
  sudo docker image rm -f $projectDockerName
else
  echo -e "project is not install"
fi

}
actionStart(){
  projectName=${!projectList[$projectId]:0:1} 
  # echo "projectName =${projectName}"
  projectDir=${!projectList[$projectId]:1:1}
  # echo "projectDir = ${projectDir}"
  projectDockerName=${!projectList[$projectId]:2:1}
  # echo "projectDockerName = ${projectDockerName}"
  projectPortNo=${!projectList[$projectId]:3:3}

IMAGE_STATUS=$(sudo docker image inspect $projectDockerName:latest>/dev/null 2>&1 && echo true || echo false)
if [ $IMAGE_STATUS == true ]; 
then 
  cd $projectDir
  sudo docker container start $projectDockerName
else
  echo -e "project is not install"
fi

}
actionStop(){
  projectName=${!projectList[$projectId]:0:1} 
  # echo "projectName =${projectName}"
  projectDir=${!projectList[$projectId]:1:1}
  # echo "projectDir = ${projectDir}"
  projectDockerName=${!projectList[$projectId]:2:1}
  # echo "projectDockerName = ${projectDockerName}"
  projectPortNo=${!projectList[$projectId]:3:3}

IMAGE_STATUS=$(sudo docker image inspect $projectDockerName:latest>/dev/null 2>&1 && echo true || echo false)
if [ $IMAGE_STATUS == true ]; 
then 
  echo "projectDir = $projectDir"
  cd $projectDir
  sudo docker container stop $projectDockerName
else
  echo -e "project is not install"
fi
}

actionRestart(){
  projectName=${!projectList[$projectId]:0:1} 
  # echo "projectName =${projectName}"
  projectDir=${!projectList[$projectId]:1:1}
  # echo "projectDir = ${projectDir}"
  projectDockerName=${!projectList[$projectId]:2:1}
  # echo "projectDockerName = ${projectDockerName}"
  projectPortNo=${!projectList[$projectId]:3:3}

IMAGE_STATUS=$(sudo docker image inspect $projectDockerName:latest>/dev/null 2>&1 && echo true || echo false)
if [ $IMAGE_STATUS == true ]; 
then 
  cd $projectDir
  sudo docker container restart $projectDockerName
else
  echo -e "project is not install"
fi
}

actionLogs(){
  projectName=${!projectList[$projectId]:0:1} 
  # echo "projectName =${projectName}"
  projectDir=${!projectList[$projectId]:1:1}
  # echo "projectDir = ${projectDir}"
  projectDockerName=${!projectList[$projectId]:2:1}
  # echo "projectDockerName = ${projectDockerName}"
  projectPortNo=${!projectList[$projectId]:3:3}

IMAGE_STATUS=$(sudo docker image inspect $projectDockerName:latest>/dev/null 2>&1 && echo true || echo false)
if [ $IMAGE_STATUS == true ]; 
then 
  cd $projectDir
  sudo docker container logs $projectDockerName
else
  echo -e "project is not install"
fi
}