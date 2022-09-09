# Launch

    mainClass (required) - The fully qualified class name (for example [java module name/]com.xyz.MainApp) or the java file path of the program entry.
    args - The command-line arguments passed to the program. Use "${command:SpecifyProgramArgs}" to prompt for program arguments. It accepts a string or an array of string.
    sourcePaths - The extra source directories of the program. The debugger looks for source code from project settings by default. This option allows the debugger to look for source code in extra directories.
    modulePaths - The modulepaths for launching the JVM. If not specified, the debugger will automatically resolve from current project.
        $Auto - Automatically resolve the modulepaths of current project.
        $Runtime - The modulepaths within 'runtime' scope of current project.
        $Test - The modulepaths within 'test' scope of current project.
        !/path/to/exclude - Exclude the specified path from modulepaths.
        /path/to/append - Append the specified path to the modulepaths.
    classPaths - The classpaths for launching the JVM. If not specified, the debugger will automatically resolve from current project.
        $Auto - Automatically resolve the classpaths of current project.
        $Runtime - The classpaths within 'runtime' scope of current project.
        $Test - The classpaths within 'test' scope of current project.
        !/path/to/exclude - Exclude the specified path from classpaths.
        /path/to/append - Append the specified path to the classpaths.
    encoding - The file.encoding setting for the JVM. If not specified, 'UTF-8' will be used. Possible values can be found in Supported Encodings.
    vmArgs - The extra options and system properties for the JVM (for example -Xms<size> -Xmx<size> -D<name>=<value>), it accepts a string or an array of string.
    projectName - The preferred project in which the debugger searches for classes. There could be duplicated class names in different projects. This setting also works when the debugger looks for the specified main class when launching a program. It is required when the workspace has multiple Java projects, otherwise the expression evaluation and conditional breakpoint may not work.
    cwd - The working directory of the program. Defaults to ${workspaceFolder}.
    env - The extra environment variables for the program.
    envFile - Absolute path to a file containing environment variable definitions.
    stopOnEntry - Automatically pause the program after launching.
    console - The specified console to launch the program. If not specified, use the console specified by the java.debug.settings.console user setting.
        internalConsole - VS Code Debug Console (input stream not supported).
        integratedTerminal - VS Code Integrated Terminal.
        externalTerminal - External terminal that can be configured in user settings.
    shortenCommandLine - When the project has long classpath or big VM arguments, the command line to launch the program may exceed the maximum command-line string limitation allowed by the OS. This configuration item provides multiple approaches to shorten the command line. Defaults to auto.
        none - Launch the program with the standard command line 'java {options} classname {args}'.
        jarmanifest - Generate the classpath parameters to a temporary classpath.jar file, and launch the program with the command line 'java -cp classpath.jar classname {args}'.
        argfile - Generate the classpath parameters to a temporary argument file, and launch the program with the command line 'java @argfile {args}'. This value only applies to Java 9 and higher.
        auto - Automatically detect the command-line length and determine whether to shorten the command line via an appropriate approach.
    stepFilters - Skip specified classes or methods when stepping.
        classNameFilters - [Deprecated - replaced by skipClasses] Skip the specified classes when stepping. Class names should be fully qualified. Wildcard is supported.
        skipClasses - Skip the specified classes when stepping. You could use the built-in variables such as '$JDK' and '$Libraries' to skip a group of classes, or add a specific class name expression, for example java.*, *.Foo.
        skipSynthetics - Skip synthetic methods when stepping.
        skipStaticInitializers - Skip static initializer methods when stepping.
        skipConstructors - Skip constructor methods when stepping.

# Attach

    hostName (required) - The host name or IP address of remote debuggee.
    port (required) - The debug port of remote debuggee.
    processId - Use process picker to select a process to attach, or Process ID as integer.
        ${command:PickJavaProcess} - Use process picker to select a process to attach.
        An integer PID - Attach to the specified local process.
    timeout - Time out value before reconnecting, in milliseconds (default to 30000 ms).
    sourcePaths - The extra source directories of the program. The debugger looks for source code from project settings by default. This option allows the debugger to look for source code in extra directories.
    projectName - The preferred project in which the debugger searches for classes. There could be duplicated class names in different projects. It is required when the workspace has multiple Java projects, otherwise the expression evaluation and conditional breakpoint may not work.
    stepFilters - Skip specified classes or methods when stepping.
        classNameFilters - [Deprecated - replaced by skipClasses] Skip the specified classes when stepping. Class names should be fully qualified. Wildcard is supported.
        skipClasses - Skip the specified classes when stepping. You could use the built-in variables such as '$JDK' and '$Libraries' to skip a group of classes, or add a specific class name expression, for example java.*, *.Foo.
        skipSynthetics - Skip synthetic methods when stepping.
        skipStaticInitializers - Skip static initializer methods when stepping.
        skipConstructors - Skip constructor methods when stepping.

# User settings

    java.debug.logLevel: Minimum level of debugger logs that are sent to VS Code, defaults to warn.
    java.debug.settings.showHex: Show numbers in hex format in Variables, defaults to false.
    java.debug.settings.showStaticVariables: Show static variables in Variables, defaults to false.
    java.debug.settings.showQualifiedNames: Show fully qualified class names in Variables, defaults to false.
    java.debug.settings.showLogicalStructure: Show the logical structure for the Collection and Map classes in Variables, defaults to true.
    java.debug.settings.showToString: Show 'toString()' value for all classes that override 'toString' method in Variables, defaults to true.
    java.debug.settings.maxStringLength: The maximum length of strings displayed in Variables or Debug Console. Strings longer than this limit will be trimmed. The default is 0, which means no trim is performed.
    java.debug.settings.hotCodeReplace: Reload the changed Java classes during debugging, defaults to manual. Make sure java.autobuild.enabled is not disabled for the Java Language Support extension. See the Hot Code Replace wiki page for more information about usages and limitations.
        manual - Click the toolbar to apply the changes.
        auto - Automatically apply the changes after compilation.
        never - Never apply the changes.
    java.debug.settings.enableHotCodeReplace: Enable Hot Code Replace for Java code. Make sure the auto build is not disabled for VS Code Java. See the Hot Code Replace wiki page for more information about usages and limitations.
    java.debug.settings.enableRunDebugCodeLens: Enable the CodeLens provider for the run and debug buttons over main entry points, defaults to true.
    java.debug.settings.forceBuildBeforeLaunch: Force building the workspace before launching java program, defaults to true.
    java.debug.settings.console: The specified console to launch a Java program, defaults to integratedTerminal. If you want to customize the console for a specific debug session, please modify the console configuration in launch.json.
        internalConsole - VS Code Debug Console (input stream not supported).
        integratedTerminal - VS Code Integrated Terminal.
        externalTerminal - External terminal that can be configured in user settings.
    java.debug.settings.exceptionBreakpoint.skipClasses: Skip the specified classes when breaking on exception. You could use the built-in variables such as '$JDK' and '$Libraries' to skip a group of classes, or add a specific class name expression, for example java.*, *.Foo.
    java.debug.settings.stepping.skipClasses: Skip the specified classes when stepping. You could use the built-in variables such as '$JDK' and '$Libraries' to skip a group of classes, or add a specific class name expression, for example java.*, *.Foo.
    java.debug.settings.stepping.skipSynthetics: Skip synthetic methods when stepping.
    java.debug.settings.stepping.skipStaticInitializers: Skip static initializer methods when stepping.
    java.debug.settings.stepping.skipConstructors: Skip constructor methods when stepping.
    java.debug.settings.jdwp.limitOfVariablesPerJdwpRequest: The maximum number of variables or fields that can be requested in one JDWP request. The higher the value, the less frequently debuggee will be requested when expanding the variable view. Also a large number can cause JDWP request timeout. Defaults to 100.
    java.debug.settings.jdwp.requestTimeout: The timeout (ms) of JDWP request when the debugger communicates with the target JVM. Defaults to 3000.
    java.debug.settings.vmArgs: The default VM arguments to launch the Java program. For example, use '-Xmx1G -ea' to increase the heap size to 1 GB and enable assertions. If you want to customize the VM arguments for a specific debug session, you can modify the 'vmArgs' config in launch.json.
    java.silentNotification: Controls whether notifications can be used to report progress. If true, use status bar to report progress instead. Defaults to false.