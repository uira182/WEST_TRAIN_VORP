fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game 'rdr3'

author 'SeuNome'
description 'Script de Teletransporte'
version '1.0.0'

client_scripts {
    'cl_teleport.lua'
}

server_scripts {
    'sv_teleport.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}
