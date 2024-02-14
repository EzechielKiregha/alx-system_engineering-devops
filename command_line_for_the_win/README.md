# COMMAND LINE CHALLENGE

A great game, usefull of course for DevOps Devs but mastering at their fingertips all of daily and necessary, CMD-CHALLENGE is the right place.

# THE USE OF SFTP IN UPLOADING MY COMPLETION PROOFS

For starting, I make sure I have ftp running my windows machine
by running the `ftp` command if it does exist then you'll get this `ftp>` as prompt and I exit it with `ftp> quit` command.

Second, I connect my remote sandbox using my creditials once prompted. Actually there is no many steps to go through
I just make sure I am in the right directory where the screenshots are saved so that I won't have to include the path to .png files/images

Alright,
to upload these files this command is enough
`sftp> put *.png` this mean all available .png pictures in the current directory will get uploaded to the remote if and only if the current working dir is `/root/alx-system_engineering-devops/command_line_for_the_win/`. 

I got confirmation of my successful upload. 
`sftp> exit` to exit and close the connection.
