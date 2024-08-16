module c3apitest;

import c3api;
import std::collections::map;

fn HttpResponse no_controller(c3api::Cref self = null, HttpRequest req, HashMap(<String,String>) args) {
    @pool() { // Using pool because of dstring::temp_new();
        HttpResponse res;
        res.status = HttpStatus.OK;
        DString greetings = dstring::temp_new();
        greetings.appendf("Look, %s, no controllers!\n", args["name"]!!);
        res.body = string::new_format(greetings.tcopy_str(), req.method, req.uri);
        return res;
    };
}

fn HttpResponse file_no_controller(c3api::Cref self = null, HttpRequest req, HashMap(<String,String>) args) {
    return {.body = "200"};
}

fn HttpResponse folder_no_controller(c3api::Cref self = null, HttpRequest req, HashMap(<String,String>) args) {
    return {.body = "200"};
}