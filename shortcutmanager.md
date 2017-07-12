// ==UserScript==
// @ShortcutManager
// @name Save to Pinboard
// @namespace vUcZbW4DiEkk
// @key Alt+s
// @include *
// ==/UserScript==
javascript:q=location.href;if(document.getSelection){d=document.getSelection();}else{d='';};p=document.title;void(open('https://pinboard.in/add?url='+encodeURIComponent(q)+'&description='+encodeURIComponent(d)+'&title='+encodeURIComponent(p),'Pinboard','toolbar=no,width=700,height=350')); 





// ==UserScript==
// @ShortcutManager
// @name Read later to Pinboard
// @namespace vUcZbW4DiEkk
// @key Alt+a
// @include *
// ==/UserScript==
javascript:q=location.href;p=document.title;void(t=open('https://pinboard.in/add?later=yes&noui=yes&jump=close&url='+encodeURIComponent(q)+'&title='+encodeURIComponent(p),'Pinboard','toolbar=no,width=100,height=100'));t.blur(); 





// ==UserScript==
// @ShortcutManager
// @name My Pinboard
// @namespace vUcZbW4DiEkk
// @key Alt+h
// @include *
// @execute OpenAPage(["https://pinboard.in/u:ruiehq"])
// ==/UserScript==

// ==UserScript==
// @ShortcutManager
// @name Github
// @namespace vUcZbW4DiEkk
// @key Alt+g
// @include *
// @execute OpenAPage(["https://github.com/ruiehq"])
// ==/UserScript==

// ==UserScript==
// @ShortcutManager
// @name Youtube
// @namespace vUcZbW4DiEkk
// @key Alt+w
// @include *
// @execute OpenAPage(["https://www.youtube.com/feed/subscriptions"])
// ==/UserScript==

// ==UserScript==
// @ShortcutManager
// @name Google Drive
// @namespace RaifTppBdJDR
// @key Alt+d
// @include *
// @execute OpenAPage(["https://drive.google.com/"])
// ==/UserScript==