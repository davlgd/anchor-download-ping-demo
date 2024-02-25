# HTML Anchor: download and ping attributes demo

This repository contains a simple HTML website in `www` that demonstrates `download` and `ping` attributes of the HTML `<a>` element. It contains:

* A web server to serve the HTML page and static assets
* A ping server to receive ping requests and logs them in the `www/assets/logs.txt` file

Both servers are developed using [V language](https://vlang.io/), it's downloaded and compiled if needed. The `./start` script is compatible with UNIX based systems and shells such as `bash`, `zsh`, etc.

## How to run the demo

To start the servers, run the following command:

```bash
./start
```

Then, open your browser and navigate to `http://localhost:8080` to see the website.

You'll just need to press a key to shut down both servers. If there is a problem, you can always kill them through their PID:

```bash
kill PID
```

## References

I've published a blog post about this demo, you can read it [here](https://labs.davlgd.fr/posts/2024-02-anchor-download-ping-attributes/).

* Learn more about the [download](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#download) attribute
* Learn more about the [ping](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#ping) attribute