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

    echo g:templates_dir


    " Copy the templates directory to the notes directory
    " Using system command for copying, adapt if necessary based on your operating system
    call system('cp -r ' . shellescape(templates_dir) . ' ' . shellescape(notes_dir))

    " Initialize a Git repository if .git directory does not exist
    if !isdirectory(notes_dir . '/.git')
        " Change directory to the notes directory
        call system('cd ' . shellescape(notes_dir) . ' && git init')
        " Check if the Git URL is defined
        if exists('g:noterius_git_url')
            let git_url = g:noterius_git_url
            call system('cd ' . shellescape(notes_dir) . ' && git remote add origin ' . shellescape(git_url) . ' && git branch -M main && git push -u origin main')
        else
            echo "g:noterius_git_url is not defined. Initialized an empty git repository."
        endif
    endif

    echo "Noterius notes setup completed."
endfunction

" Expose the function as a command
command! SetupNoteriusNotes call SetupNoteriusNotes()
