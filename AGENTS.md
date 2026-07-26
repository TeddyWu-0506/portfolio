# Portfolio Server

## Start / Restart Server

Run this every time before opening the page:

```bash
kill $(cat /tmp/portfolio-server.pid) 2>/dev/null
cd /Users/teddywu/Documents/01_Coding_Project/Porfolio && nohup python3 -m http.server 3000 > /tmp/portfolio-server.log 2>&1 &
echo $! > /tmp/portfolio-server.pid
disown
```

Then open: http://localhost:3000/index.html
