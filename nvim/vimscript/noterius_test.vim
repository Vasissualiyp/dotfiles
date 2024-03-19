" Set a global variable to the directory of this script
let g:templates_dir = expand('<sfile>:p:h') . '/templates'

function! SetupNoteriusNotes()
    " Ensure the global variable for notes directory is defined
    if !exists('g:noterius_notes_dir')
        echo "Noterius notes directory is not set. Please define g:noterius_notes_dir."
        return
    endif

    " Expand the user variable to handle paths like '~/notes'
    let notes_dir = expand(g:noterius_notes_dir)
    
    " Check if the directory exists
    if isdirectory(notes_dir)
        echo "Directory already exists. Please clean the directory or choose a different one."
        return
    endif

    " Create the notes directory
    call mkdir(notes_dir, "p")
    " Define the path to the templates directory within the plugin's directory structure
    "let templates_dir = expand('<sfile>:p:h') . '/../templates'


    " Initialize a Git repository if .git directory does not exist
    if !isdirectory(notes_dir . '/.git')
        " Change directory to the notes directory
        call system('cd ' . shellescape(notes_dir) . ' && git init')
        " Check if the Git URL is defined
        if exists('g:noterius_git_url')
            let git_url = g:noterius_git_url
            call system('cd ' . shellescape(notes_dir) . ' && git remote add origin ' . shellescape(git_url) . ' && git branch -M main')
			call NoteriusSyncWithRemoteRepo(notes_dir)
			
        else
            " Copy the templates directory to the notes directory
            " Using system command for copying, adapt if necessary based on your operating system
            echo g:templates_dir
            call system('cp -r ' . shellescape(g:templates_dir) . ' ' . shellescape(notes_dir))
            echo "g:noterius_git_url is not defined. Initialized an empty git repository."
        endif
    endif

    echo "Noterius notes setup completed."
endfunction

function! NoteriusSyncWithRemoteRepo(gitDir)
    " Save the current working directory
    let l:originalDir = getcwd()

    " Change to the directory specified by the function's argument
    execute 'cd' a:gitDir

    " Check if there are any commits in the remote repository
    let l:remoteCommits = system('git ls-remote --heads origin')

    " Check for errors or empty output indicating no commits
    if v:shell_error || empty(l:remoteCommits)
        " No commits in the remote, so proceed to add, commit, and push
        echo "No commits found in remote. Initializing with first commit."

        " Add the templates directory
        call system('git add templates')

        " Commit the changes
        call system('git commit -m "First commit"')

        " Push the commit to the remote repository
        call system('git push -u origin main')
    else
        " Commits exist, so just pull the latest changes
        echo "Commits found in remote. Pulling changes."
        call system('git pull origin main')
    endif

    " Change back to the original directory
    execute 'cd' l:originalDir
endfunction

" Expose the function as a command
command! SetupNoteriusNotes call SetupNoteriusNotes()
