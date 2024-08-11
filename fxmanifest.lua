fx_version "adamant"
games {"gta5", "rdr3"}
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

author 'SeuNome'
description 'Script para viagem rápida de trem'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/video/train.mp4',
    'html/video/train2.mp4',
    'html/images/ticket.png',
    'html/images/background.jpg'
}

client_scripts {
    'cl_train.lua'
}

server_scripts {
    'sv_train.lua'
}
