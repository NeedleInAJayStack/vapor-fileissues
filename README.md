# Vapor File Serving Issues

This is a recreator for observed issues with Vapor's FileMiddleware when serving static files from a server with response compression enabled.

## Process

The reproducer requires two computers (A & B) on the same network:

1. On computer A: Clone and build this repo. Start the server using `vapor run serve`
2. On computer B:
   1. Open Google Chrome and open developer tools
   2. Go to `<computer_a_ip>:8080/7_files`. It should load successfully.
   3. Reload the page. The first 6 files should get a `304: Not Modified` response, and the 7th file should get a `(failed) net::ERR_INVALID_HTTP_RESPONSE`.

## Observations

- It does not always occur. Sometimes a machine will be able to successfully load all the files many times.
- One a client fails, other clients do not necessarily fail. You can have a working and not-working client at the same time on the same network.
- Issues are never seen until at least 1 page reload, and issues are only seen on resources that should receive a `304`.
- We have been unable to recreate this in Firefox (so far)