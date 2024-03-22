
if exists('g:loaded_az_nvim') | finish | endif
let g:loaded_az_nvim = 1

command! -nargs=? AzStartAzurite call azurite#Start(<args>)
command! AzStopAzurite call azurite#Stop()
command! AzCleanAzurite call azurite#Clean()

