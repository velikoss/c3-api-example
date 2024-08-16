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

    routes::add_route("/example/config", &file_no_controller);
    routes::add_tag("/example/config", "file", "config.json"); //adding @File tag

    routes::add_route("/example/src", &folder_no_controller);
    routes::add_tag("/example/src", "folder", "."); //adding @Folder tag

    server::startServer(config)!!;
	return 0;
}
