config.load_autoconfig(False)

c.tabs.indicator.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 0}
c.tabs.indicator.width = 0
c.tabs.padding = {'top': 1, 'bottom': 1, 'left': 1, 'right': 1}
c.tabs.position = 'left'
c.tabs.width = 17

c.colors.tabs.selected.even.bg = 'red'
c.colors.tabs.selected.odd.bg = 'red'

c.downloads.location.directory = "$HOME/dwnlds/"

c.auto_save.session = True


c.content.autoplay = False 

c.content.blocking.method = 'both'
c.content.blocking.adblock.lists = [
    'https://easylist.to/easylist/easylist.txt',
    'https://easylist.to/easylist/easyprivacy.txt',
    'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt',
    'https://www.i-dont-care-about-cookies.eu/abp/',
    'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt',
    'https://raw.github.com/rbrito/easylist-ptbr/master/adblock-rules.txt',
    'https://easylist-downloads.adblockplus.org/easylistdutch.txt'
]

c.content.geolocation = False

c.content.notifications.enabled = False

c.content.pdfjs = True

config.set('content.javascript.enabled', False, 'https://*.abril.com.br/*')

c.content.javascript.clipboard = 'access-paste'

config.set('content.register_protocol_handler', True, 'https://mail.google.com?extsrc=mailto&url=%25s')
