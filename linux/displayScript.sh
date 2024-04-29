# Below are display function
displayProjectList(){
for (( i=0; i<${#projectList[@]}; i++ ));
do
  projectName=${!projectList[i]:0:1}
  echo "[$i]:${projectName}"
done
# echo ${!projectList[0]:2:2}
}

displayProjectFuntcion() {
    echo "Project Available Actions"
    projectFunction=${projectFunctionList[$projectId]}
     k=1
    # if [ $projectId -eq 9 ];then
    #  echo "frontend function"
    #   for (( i=0; i<3; i++ ));
    #   do
    #   # projectName=${!projectFunctionList[i]:0:1}
    #   echo "[$i]:${projectFunctionList[i]}"
    #   done
    # else
     for  j in ${!projectFunctionList[@]}; 
     do
      echo "[$j]:${projectFunctionList[j]}"
     done
    # fi 
}