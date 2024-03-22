if exists('g:loaded_az_nvim') | finish | endif
let g:loaded_az_nvim = 1

command! -nargs=? AzStartAzurite call az_nvim#StartAzurite(<args>)
command! AzStopAzurite call az_nvim#StopAzurite()
command! AzCleanAzurite call az_nvim#CleanAzurite()
