config.load_autoconfig(False)

c.downloads.location.directory = "$HOME/dwnlds/"

c.confirm_quit = ['always']

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

config.set('content.javascript.enabled', False, 'https://veja.abril.com.br/*')

c.content.javascript.clipboard = 'access-paste'

c.tabs.indicator.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 0}
c.tabs.indicator.width = 0
c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 0, 'right': 0}
c.tabs.position = 'left'
c.tabs.width = 17

c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'wp':    'https://www.wikipedia.org/search-redirect.php?family=wikipedia&language=en&search={}&language=en&go=Go',
    'wt':   'https://en.wiktionary.org/?search={}',
    'wr':   'https://www.wordreference.com/enpt/{}',
    'au':   'https://www.aulete.com.br/{}',
    'et':   'https://etymonline.com/index.php?allowed_in_frame=0&search={}',
    'aw':   'https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}',
    'ddi':  'https://duckduckgo.com/?q={}&iar=images&iax=images&ia=images',
    'g':    'https://www.google.com/search?q={}',
    'yt':   'https://www.youtube.com/results?search_query={}',
    'tw':   'https://twitter.com/{}',
    'tws':  'https://twitter.com/search?q={}',
    'x':    'https://x.com/{}',
    'xs':   'https://x.com/search?q={}',
    'ais':  'https://archive.is/search/?q={}',
    'wms':  'https://web.archive.org/web/*/{}', # wayback machine
    'wm':   'https://web.archive.org/web/{}',   # wayback machine search
    'a':    'https://archive.org/search/?query={}',
    'scr':  'https://scribd.com/search?query={}',
    #'sh':  'https://sci-hub.st/"{}"',
    'pb':   'https://thepiratebay.zone/search/{}'
}
