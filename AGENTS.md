# Portfolio Server

## Start / Restart Server

Run this every time before opening the page:

```bash
kill $(cat /tmp/portfolio-server.pid) 2>/dev/null; sleep 1
cd /Users/teddywu/Documents/01_Coding_Project/Porfolio && nohup python3 -m http.server 9000 > /tmp/portfolio-server.log 2>&1 &
echo $! > /tmp/portfolio-server.pid
disown
```

Then open: http://localhost:9000/index.html
