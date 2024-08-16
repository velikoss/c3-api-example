module c3apitest;

import c3api;
import c3api::routes;
import c3api::server;
import c3api::config;

import std::io;

fn int main(String[] args) {
	config::Config config = config::readFromFile();

    routes::init_route_map();
    defer routes::destroy_route_map();

    ControllerParadise paradise;
    paradise.init();

    routes::add_route("/example/{name}", &no_controller);

    server::startServer(config)!!;
	return 0;
}
