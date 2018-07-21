#!/bin/bash

numTasks=$(task +PENDING count)
echo "$numTasks to consider"

allTasks=()

for ((i=1;i<=numTasks;i++))
do
    # TODO: save this task's project, annotations, and tags to a single line in
    # a temp file to reference later.

    allTasks+=("$(task _get $i.description)")

    # TODO: if it's already in the array, delete it
done

for task in "${allTasks[@]}"
do
    echo "$task"
done

numTasksDeleted=$(expr $numTasks - $(task +PENDING count))
echo "Deleted $numTasksDeleted"
