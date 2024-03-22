let s:azurite_job = 0
let s:azurite_workspace = expand('~/.azurite')

function! azurite#Start(...) abort
    if s:azurite_job != 0
        echohl WarningMsg | echomsg "Azurite is already running" | echohl None
        return
    endif

    let l:azurite_backend = get(a:, 1, 'docker')
    if l:azurite_backend ==# 'docker'
        let l:cmd = 'docker run -d -p 10000:10000 -p 10001:10001 -p 10002:10002 -v ' . s:azurite_workspace . ':/data mcr.microsoft.com/azure-storage/azurite'
    else
        let l:cmd = 'azurite -l ' . s:azurite_workspace
    endif

    let s:azurite_job = jobstart(l:cmd, {'pty': 1, 'exit_cb': function('s:AzuriteExitHandler')})
    if s:azurite_job == 0
        echohl ErrorMsg | echomsg "Failed to start Azurite" | echohl None
    else
        echohl SuccessMsg | echomsg "Azurite started" | echohl None
    endif
endfunction

function! azurite#Stop() abort
    if s:azurite_job == 0
        echohl WarningMsg | echomsg "Azurite is not running" | echohl None
        return
    endif

    call jobstop(s:azurite_job)
    let s:azurite_job = 0
    echohl SuccessMsg | echomsg "Azurite stopped" | echohl None
endfunction

function! azurite#Clean() abort
    if s:azurite_job != 0
        echohl WarningMsg | echomsg "Stop Azurite before cleaning" | echohl None
        return
    endif

    call delete(s:azurite_workspace, 'rf')
    echohl SuccessMsg | echomsg "Azurite workspace cleaned" | echohl None
endfunction

function! s:AzuriteExitHandler(job_id, data, event)
    if a:event == 'exit'
        let s:azurite_job = 0
        echohl WarningMsg | echomsg "Azurite exited" | echohl None
    endif
endfunction
