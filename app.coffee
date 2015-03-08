http = require "http"
url = require "url"

server = http.createServer (req, res) ->
    query = url.parse(req.url, true).query
    
    iframeSrc = query.e
    if query.i?
        iframeSrc += '#' + query.i
    
    res.writeHead 200
    res.write "
        <html><body style='margin:0'>
        <div id='cover-up' style='position: absolute; z-index: 20; width: 100%; height: 3000px;' onclick='window.open(\"#{query.t}\", \"_top\")'></div>
        <div id='container' style='z-index:10; overflow:hidden;'>
           <iframe height='3000px' width='100%' scrolling='no' seamless='seamless' style='border: none;' src='#{iframeSrc}'></iframe>
        </div>
        </body></html>
    "
    res.end()

port = process.env.PORT ? 5000
server.listen port, ->
    console.log "Server started on #{port}"