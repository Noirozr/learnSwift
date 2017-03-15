import Foundation
import CommandLineKit
import Rainbow
import LearnSwiftKit

let cli = CommandLineKit.CommandLine()

let excludePahtsOption = MultiStringOption(shortFlag: "e", longFlag: "exclude",
                                     helpMessage: "Excluded paths which should not search in.")
let projectOption = StringOption(shortFlag: "p", longFlag: "project",
                               helpMessage: "Path to the project.")
let resourceExtensionOption = MultiStringOption(shortFlag: "r", longFlag: "resource-extensions",
                          helpMessage: "Extensions to search.")

let fileExtensionsOption = MultiStringOption(shortFlag: "f", longFlag: "file-extensions", helpMessage: "file-extensions to search")
let help = BoolOption(shortFlag: "h", longFlag: "help",
                      helpMessage: "Prints a help message.")

cli.addOptions(projectOption, resourceExtensionOption, fileExtensionsOption, help)

cli.formatOutput = { s, type in
    var str: String
    switch(type) {
    case .error:
        str = s.red.bold
    case .optionFlag:
        str = s.green.underline
    case .optionHelp:
        str = s.lightGreen
    default:
        str = s
    }
    
    return cli.defaultFormat(s:str, type: type)
}

do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

if help.value {
    cli.printUsage()
    exit(EX_OK)
}

let project = projectOption.value ?? "."
let resourceExtensions = resourceExtensionOption.value ?? ["jpg", "png", "iamgeset"]
let fileExtensions = fileExtensionsOption.value ?? ["swfit", "m", "mm", "xib", "storyboard"]
let excludePaths = excludePahtsOption.value ?? []




















