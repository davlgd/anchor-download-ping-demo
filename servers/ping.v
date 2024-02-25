import net.http
import time
import os

struct Handler {
	error_opening_file string = 'Error during file write opening'
	error_writing_file string = 'Error during file write operation'
   mut: 
	counter int
	log_file string
}

fn (mut handler Handler) handle(req http.Request) http.Response {
	handler.counter += 1

	mut res := http.Response{
		header: http.new_header_from_map({
			http.CommonHeader.content_type: 'text/plain'
			http.CommonHeader.server:       'davlgd log server'
		})
	}

	mut logs := os.open_append(handler.log_file) or {
		res.status_code = 500
		res.body = '${handler.error_opening_file}: ${err}'
		return res
	}

	logs.writeln('${time.now().format_rfc3339()} from "${req.url}" (${handler.counter})') or {
		res.status_code = 500
		res.body = '${handler.error_writing_file}: ${err}'
		return res
	}
	logs.close()

	res.status_code = 200
	res.body = 'OK'

	return res
}

fn main() {
	host := '0.0.0.0:4242'
	handler := Handler{
		log_file: 'www/assets/logs.txt'
	}

	mut server := http.Server{
		addr: host
		handler: handler
	}

	mut file := os.open_append(handler.log_file) or {
		println('${handler.error_opening_file}: ${err}')
		return
	}

	file.writeln('${time.now().format_rfc3339()} - Server started on port 4242') or {
		println('${handler.error_writing_file}: ${err}')
		return
	}
	file.close()

	server.listen_and_serve()
}