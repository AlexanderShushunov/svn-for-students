Set of scripts to create a docker image with prepared SVN repo.

Prepared means:
- add a user for each student; a login is a student name, the password is the same
- add a user `admin` with the password `admin`; he has a full access
- add a folder for each student
- a student has access to their folder and to the folder of the previous student (in the list)

How to use it:
- fill in `students-list` (do not forget add an empty string in the end)
- change the remote address in `task.txt`
- run `node ./create-svn-conf-files.js` (Node.js is required)
- run `build-image.sh` (do not forget to change an image name)
- run `run-local.sh` or `run-remote.sh` to start a container (do not forget to change the remote address)
