import Vapor

// configures your application
public func configure(_ app: Application) throws {
    app.http.server.configuration.hostname = "0.0.0.0"
    app.http.server.configuration.responseCompression = .enabled
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory, defaultFile: "index.html"))
}
