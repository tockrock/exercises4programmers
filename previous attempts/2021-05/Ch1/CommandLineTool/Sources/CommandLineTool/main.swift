import CommandLineToolCore

let tool = CommandLineTool()

do {
    try tool.run()
} catch {
    print("some kind of error occured: \(error)")
}
