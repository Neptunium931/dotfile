#!/bin/env bash

get_commit_info() {
    local branch_name=$(git rev-parse --abbrev-ref HEAD)
    local author_name=$(git config user.name)
    local changes=$(git diff --shortstat)
    local last_commit_msg=$(git log --format=%B -n 1)
    local diff=$(git diff)
    local newFile=$(git ls-files --others --exclude-standard)
    local deletedFile=$(git ls-files --deleted)
    local newFileContent=""
    for file in $newFile
    do
        newFileContent+="$file:\n$(cat $file)\n\n"
    done

    local commit_message="Automatic commit on branch $branch_name by $author_name\n"
    commit_message+="Last commit message: $last_commit_msg\n"
    commit_message+="Changes: $changes\n\n"
    commit_message+="New files:\n$newFileContent\n"
    commit_message+="Diff:\n$diff\n"
    commit_message+="Deleted files:\n$deletedFile\n"

    echo "$commit_message"
}

call_ollama_api() {
    local commit_message="$1"
    local response=$(ollama run mixtral "$commit_message")
    echo "$response"
}

commit_info=$(get_commit_info)
generated_commit_message=$(call_ollama_api "$commit_info")

echo "$generated_commit_message"
# git commit -am "$generated_commit_message"

# git push
