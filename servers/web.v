import x.vweb

pub struct Context {
	vweb.Context
}

pub struct App {
	vweb.StaticHandler
}

fn main() {
	mut app := &App{}
	app.handle_static('www', true)!
	vweb.run[App, Context](mut app, 8080)
}