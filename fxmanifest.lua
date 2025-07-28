fx_version 'cerulean'

use_experimental_fxv2_oal 'yes'

lua54 'yes'

game 'gta5'

name 'stark_harness_v3'

author 'Adama Stark'

version '3.0.0'

repository 'https://github.com/AdamaStark-N7/stark_harness_v3'

description 'A Vehicle Harness Resource For FiveM'

ox_lib 'locale'

shared_script {
    'config.lua',
    '@ox_lib/init.lua',
}

client_script {
    'client/*.lua'
}

server_scripts {
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua'
}

files {
    'locales/*.json',
}

dependencies {
    'oxmysql',
    'ox_lib'
}